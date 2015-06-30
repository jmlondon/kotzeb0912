## ----setup,include=FALSE-------------------------------------------------
# opts_chunk$set()

## ----libs,include=FALSE--------------------------------------------------
library(kotzeb0912)
library(dplyr)
library(ggmap)

## ----echo=FALSE,fig.width=5,out.extra='style="float: right;"',fig.cap='Tracklines derived from all Argos and GPS location estimates',warning=FALSE,message=FALSE----
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

