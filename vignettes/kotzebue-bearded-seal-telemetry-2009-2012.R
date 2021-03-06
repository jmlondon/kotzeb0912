## ----libs,include=FALSE--------------------------------------------------
library(kotzeb0912)
library(dplyr)
library(ggmap)
library(knitr)

## ----knitr_init, echo=FALSE, cache=FALSE---------------------------------
## Global options
options(max.print="75")
opts_chunk$set(echo=FALSE,
               prompt=FALSE,
               tidy=TRUE,
               comment=NA,
               message=FALSE,
               warning=FALSE)
opts_knit$set(width=75)

## ----echo=FALSE,fig.width=3.5,out.extra='style="float: right;"',fig.cap='Tracklines derived from all Argos and GPS location estimates',warning=FALSE,message=FALSE----
data("kotzeb0912_locs")

locs <- kotzeb0912_locs %>% 
  dplyr::select(deployid,date_time,latitude,longitude) %>% 
  dplyr::filter(!is.na(latitude)) %>% 
  dplyr::arrange(deployid,date_time) %>% 
  data.frame()

med_lng <- median(locs$longitude)
med_lat <- median(locs$latitude) -3

map <- get_map(location=c(med_lng,med_lat),
                     zoom=4,source="google",maptype='terrain',color="bw")
gg <- ggmap(map) + geom_point(data=locs,mapping=aes(x=longitude,y=latitude),
                              alpha=0.25,size=0.75)
gg

## ----deploy-table,echo=FALSE---------------------------------------------
data('kotzeb0912_deployments')
d <- dplyr::arrange(kotzeb0912_deployments,speno,deployid) %>% 
  dplyr::select(-ptt)
hdrs <- c("Speno","Capture Time (UTC)","Age","Sex","DeployID","Tag Location")
knitr::kable(d,col.names = hdrs)

## ----data-locs-----------------------------------------------------------
data("kotzeb0912_locs")
dplyr::glimpse(kotzeb0912_locs)

## ----unique-instr--------------------------------------------------------
unique(kotzeb0912_locs$instr)

## ----range-datetime------------------------------------------------------
range(kotzeb0912_locs$date_time)

## ----unique-type---------------------------------------------------------
unique(kotzeb0912_locs$type)

## ----unique_quality------------------------------------------------------
unique(kotzeb0912_locs$quality)

## ----data-gps------------------------------------------------------------
data("kotzeb0912_gps")
dplyr::glimpse(kotzeb0912_gps)

## ----range-gps-datetime--------------------------------------------------
range(kotzeb0912_gps$date_time)

## ----data-status---------------------------------------------------------
data("kotzeb0912_status")
dplyr::glimpse(kotzeb0912_status)

## ----data-depths---------------------------------------------------------
data("kotzeb0912_depths")
dplyr::glimpse(kotzeb0912_depths)

## ----data-durations------------------------------------------------------
data("kotzeb0912_durations")
dplyr::glimpse(kotzeb0912_durations)

## ----data-tad------------------------------------------------------------
data("kotzeb0912_tad")
dplyr::glimpse(kotzeb0912_tad)

## ----data-timelines------------------------------------------------------
data("kotzeb0912_timelines")
dplyr::glimpse(kotzeb0912_timelines)

## ----data-deployments----------------------------------------------------
data("kotzeb0912_deployments")
dplyr::glimpse(kotzeb0912_deployments)

