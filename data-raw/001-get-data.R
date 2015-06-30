library(wcUtils)
library(dplyr)
library(jsonlite)

# first thing, get deployment data from WCDP
r <- wcPOST()

# get KotzEb09 ids and download the data
kotz_ids <- wcGetProjectIDs(r,project='KotzEB09')

# we'll store the returned list of data frames in a list
data_list <- vector("list",length(kotz_ids))

for(i in 1:length(kotz_ids)) {
  data_list[[i]] <- wcGetDownload(kotz_ids[i])
}

# now we'll bind all the like data frames from each deployment for
# locations and status
kotz_data <- vector("list")

kotz_data$locations <-
  dplyr::rbind_all(plyr::llply(data_list,function (x) x$locations))

date_unique <-
  group_by(kotz_data$locations,deployid) %>%
  do(unique_date = xts::make.time.unique(.$date_time,eps=1)) %>%
  tidyr::unnest(unique_date) %>%
  mutate(unique_posix = as.POSIXct(.$unique_date,origin='1970-01-01 00:00:00',tz='UTC')) %>%
  dplyr::arrange(deployid,unique_posix) %>% dplyr::select(unique_posix)

kotz_data$locations <- arrange(kotz_data$locations,deployid,date_time) %>%
  bind_cols(date_unique)

kotz_data$status <-
  dplyr::rbind_all(plyr::llply(data_list,function (x) x$status))

# we need to now address all the histo data
# first, we'll find all the histos with identified limits
limits_idx <- unlist(lapply(data_list,function(x) !is.null(x$histos$limits)))
sub_dat <- data_list[limits_idx]
sub_dat <- lapply(sub_dat,function(x) x$histos)

# now create a function to extract the limit values
get_limits <- function(histo_list,limittype) {
  dd_lmts <- dplyr::filter(histo_list$limits,histtype==limittype) %>%
    tidyr::gather(key=bin,value=limits,bin1:bin14) %>%
    dplyr::select(-histtype)
}

# first up, dive depths
dd_dat <- lapply(sub_dat,function(x) wcUtils::tidyDiveDepths(x))
dd_limits <- lapply(sub_dat,function(x) get_limits(x,'DiveDepthLIMITS'))

dd_list <- vector("list",length=length(dd_dat))

for(i in 1:length(dd_dat)) {
  dd_list[[i]] <- dplyr::left_join(dd_dat[[i]],dd_limits[[i]])
}

dd_dat <- dplyr::bind_rows(dd_list)
kotzeb0912_depths <- dd_dat

# next, dive duration
dd_dat <- lapply(sub_dat,function(x) wcUtils::tidyDiveDurations(x))
dd_limits <- lapply(sub_dat,function(x) get_limits(x,'DiveDurationLIMITS'))

dd_list <- vector("list",length=length(dd_dat))

for(i in 1:length(dd_dat)) {
  dd_list[[i]] <- dplyr::left_join(dd_dat[[i]],dd_limits[[i]])
}

dd_dat <- dplyr::bind_rows(dd_list)
kotzeb0912_durations <- dd_dat

# next, time-at-depth
tad_dat <- lapply(sub_dat,function(x) wcUtils::tidyTimeAtDepth(x))
tad_limits <- lapply(sub_dat,function(x) get_limits(x,'TADLIMITS'))

tad_list <- vector("list",length=length(tad_dat))

for(i in 1:length(tad_dat)) {
  tad_list[[i]] <- dplyr::left_join(tad_dat[[i]],tad_limits[[i]])
}

tad_dat <- dplyr::bind_rows(tad_list)
kotzeb0912_tad <- tad_dat

# create our data products and save the RData files
kotzeb0912_locs <- kotz_data$locations
kotzeb0912_status <- kotz_data$status
save(kotzeb0912_locs,file='data/kotzeb0912_locs.RData')
save(kotzeb0912_status,file='data/kotzeb0912_status.RData')

save(kotzeb0912_depths,file='data/kotzeb0912_depths.RData')
save(kotzeb0912_durations,file='data/kotzeb0912_durations.RData')
save(kotzeb0912_tad,file='data/kotzeb0912_tad.RData')

# create open JSON formats and save to data-open
json.out <- toJSON(kotzeb0912_locs,pretty=TRUE)
file.output <- file("data-open/kotzeb0912_locs.json")
writeLines(json.out, file.output)
close(file.output)

json.out <- toJSON(kotzeb0912_status,pretty=TRUE)
file.output <- file("data-open/kotzeb0912_status.json")
writeLines(json.out, file.output)
close(file.output)

json.out <- toJSON(kotzeb0912_depths,pretty=TRUE)
file.output <- file("data-open/kotzeb0912_depths.json")
writeLines(json.out, file.output)
close(file.output)

json.out <- toJSON(kotzeb0912_durations,pretty=TRUE)
file.output <- file("data-open/kotzeb0912_durations.json")
writeLines(json.out, file.output)
close(file.output)

json.out <- toJSON(kotzeb0912_tad,pretty=TRUE)
file.output <- file("data-open/kotzeb0912_tad.json")
writeLines(json.out, file.output)
close(file.output)
