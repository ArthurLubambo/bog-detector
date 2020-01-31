install.packages("getlandsat")
library("getlandsat")
res <- getlandsat::lsat_scenes() 
lsat_scene_files(x = res$download_url[1])

lsat_image("LC80101172015002LGN00_B1.TIF")

library("raster")
x <- lsat_cache_details()
x
img <- raster(x[[1]]$file)
plot(img)
