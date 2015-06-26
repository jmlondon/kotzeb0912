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


# create our data products and save the RData files
kotzeb0912_locs <- kotz_data$locations
kotzeb0912_status <- kotz_data$status
save(kotzeb0912_locs,file='data/kotzeb0912_locs.RData')
save(kotzeb0912_status,file='data/kotzeb0912_status.RData')

# create open JSON formats and save to data-open
json.out <- toJSON(kotzeb0912_locs,pretty=TRUE)
file.output <- file("data-open/kotzeb0912_locs.json")
writeLines(json.out, file.output)
close(file.output)

json.out <- toJSON(kotzeb0912_status,pretty=TRUE)
file.output <- file("data-open/kotzeb0912_status.json")
writeLines(json.out, file.output)
close(file.output)

