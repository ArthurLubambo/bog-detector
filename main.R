install.packages("sf")
install.packages("raster")
install.packages("spData")
install.packages("getlandsat")
install.packages("rgdal")
install.packages("rgeos")
install.packages("dismo")
install.packages("RgoogleMaps")

library(rgdal)
library(sp)
library(raster)
library(rgeos)
library(dismo)

library(RgoogleMaps)
TA = GetMap(center =c(lat = 53.3773385, lon = -6.270401),zoom=13,maptype="satellite")
PlotOnStaticMap(TA)
image = brick("LC08_L1TP_043027_20150330_20170228_01_T1.tif")
plotRGB(image)

library(getlandsat)
library(raster)
res <- lsat_scenes()
res
# read only N rows
lsat_scenes(n_max = 10)
## End(Not run)

lsat_image(x = "LC80101172015002LGN00_B5.TIF")
## Visualize
if (requireNamespace("raster")) {
  library("raster")
  x <- lsat_cache_details()[[1]]
  img <- raster(x$file)
  plot(img)
}
## E


