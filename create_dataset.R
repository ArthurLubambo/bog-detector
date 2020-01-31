library(rgdal)
library(sp)
library(raster)
library(rgeos)
library(dismo)
# 
# clc <- raster("data/clc2018.tif")
# clscroped <- projectRaster(clc, crs = "+init=epsg:2157 +proj=tmerc +lat_0=53.5 +lon_0=-8 +k=0.99982 +x_0=600000 +y_0=750000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs")
# cropbox <-c(593850,623400,698850,729150)
# clccropie <- crop(clscroped, cropbox)
# unique(clccropie)
# #plot(clc)
#crop the raster
# clccropie <- crop(clc, cropbox)
# #plot cropped DEM
# clccrsie <- projectRaster(clccropie, crs = "+init=epsg:2157 +proj=tmerc +lat_0=53.5 +lon_0=-8 +k=0.99982 +x_0=600000 +y_0=750000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs")
# # mapview(clccrsie)
# plot(clccrsie)
landsat1 <- raster("data/LC8_2016201_G07.dat", band =1)
landsat2 <- raster("data/LC8_2016201_G07.dat", band = 2)
landsat3 <- raster("data/LC8_2016201_G07.dat", band =2)
landsat3[] <- 0
landsat3[100,100] <-1
landsat3[101,101] <-1
landsat3[102,102] <-1

landsat <- brick(landsat1,landsat2,landsat3)
plot(landsat)


landsatcrsie <- projectRaster(landsat, crs = "+init=epsg:2157 +proj=tmerc +lat_0=53.5 +lon_0=-8 +k=0.99982 +x_0=600000 +y_0=750000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs")
landsatcrsie@extent
cropboxsmall <-c(593850,623400,698850,729150)
clccropedcrsedsmallie <- crop(clccrsie, cropboxsmall)
mapview(clccropedcrsedsmallie)+mapview(landsatcrsie)
unique(clccropedcrsedsmallie)
id=cellFromXY(clccropedcrsedsmallie,xy=c(593850,698850))
clccropedcrsedsmallie[id]
id2=cellFromXY(landsatcrsie,xy=c(594851,699851))
landsatcrsie[id2]