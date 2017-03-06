#!/usr/bin/env bash

mkdir ~/mml/
cd ~/mml/

rsync -arPv tiedostot.kartat.kapsi.fi::mml/taustakarttasarja/taustakartta_8m/1000m/etrs89/ gt8000/
rsync -arPv tiedostot.kartat.kapsi.fi::mml/taustakarttasarja/taustakartta_4m/500m/etrs89/ gt4000/
rsync -arPv tiedostot.kartat.kapsi.fi::mml/taustakarttasarja/taustakartta_2m/250m/etrs89/ gt2000/
rsync -arPv tiedostot.kartat.kapsi.fi::mml/taustakarttasarja/taustakartta_800/100m/etrs89/ gt800/
rsync -arPv tiedostot.kartat.kapsi.fi::mml/taustakarttasarja/taustakartta_320/25m/etrs89/ gt320/
rsync -arPv tiedostot.kartat.kapsi.fi::mml/taustakarttasarja/taustakartta_160/12_5m/etrs89/ gt160/
rsync -arPv tiedostot.kartat.kapsi.fi::mml/taustakarttasarja/taustakartta_80/5m/etrs89/ gt80/
rsync -arPv tiedostot.kartat.kapsi.fi::mml/taustakarttasarja/taustakartta_40/2_5m/etrs89/ gt40/
rsync -arPv tiedostot.kartat.kapsi.fi::mml/taustakarttasarja/taustakartta_20/2_5m/etrs89/ gt20/
rsync -arPv tiedostot.kartat.kapsi.fi::mml/taustakarttasarja/taustakartta_10/1m/etrs89/ gt10/
rsync -arPv tiedostot.kartat.kapsi.fi::mml/taustakarttasarja/taustakartta_5/0_5m/etrs89/ gt5/



find gt8000 -iname "*.png" -print0 | xargs -0 -n100 gdaltindex gt8000.shp
find gt4000 -iname "*.png" -print0 | xargs -0 -n100 gdaltindex gt4000.shp
find gt2000 -iname "*.png" -print0 | xargs -0 -n100 gdaltindex gt2000.shp
find gt800 -iname "*.png" -print0 | xargs -0 -n100 gdaltindex gt800.shp
find gt320 -iname "*.png" -print0 | xargs -0 -n100 gdaltindex gt320.shp
find gt160 -iname "*.png" -print0 | xargs -0 -n100 gdaltindex gt160.shp
find gt80 -iname "*.png" -print0 | xargs -0 -n100 gdaltindex gt80.shp
find gt40 -iname "*.png" -print0 | xargs -0 -n100 gdaltindex gt40.shp
find gt20 -iname "*.png" -print0 | xargs -0 -n100 gdaltindex gt20.shp
find gt10 -iname "*.png" -print0 | xargs -0 -n100 gdaltindex gt10.shp
find gt5 -iname "*.png" -print0 | xargs -0 -n100 gdaltindex gt5.shp



shptree gt8000.shp
shptree gt4000.shp
shptree gt2000.shp
shptree gt800.shp
shptree gt320.shp
shptree gt160.shp
shptree gt80.shp
shptree gt40.shp
shptree gt20.shp
shptree gt10.shp
shptree gt5.shp



gdalbuildvrt -srcnodata 255 -vrtnodata 255 gt8000.vrt gt8000.shp && \
	gdal_translate -of GTiff -a_srs EPSG:3067 -co BLOCKXSIZE=256 -co BLOCKYSIZE=256 -co COMPRESS=DEFLATE -co TILED=yes -co BIGTIFF=IF_NEEDED -a_nodata 255 gt8000.vrt gt8000.tiff && \
	gdaladdo gt8000.tiff -r gauss --config NUM_THREADS 4 --config COMPRESS_OVERVIEW DEFLATE --config INTERLEAVE_OVERVIEW PIXEL --config PHOTOMETRIC_OVERVIEW YCBCR 2 4 8 16 32 64 128 256 512 1024 2048 &

gdalbuildvrt -srcnodata 255 -vrtnodata 255 gt4000.vrt gt4000.shp && \
	gdal_translate -of GTiff -a_srs EPSG:3067 -co BLOCKXSIZE=256 -co BLOCKYSIZE=256 -co COMPRESS=DEFLATE -co TILED=yes -co BIGTIFF=IF_NEEDED -a_nodata 255 gt4000.vrt gt4000.tiff && \
	gdaladdo gt4000.tiff -r gauss --config NUM_THREADS 4 --config COMPRESS_OVERVIEW DEFLATE --config INTERLEAVE_OVERVIEW PIXEL --config PHOTOMETRIC_OVERVIEW YCBCR 2 4 8 16 32 64 128 256 512 1024 2048 4096 &

gdalbuildvrt -srcnodata 255 -vrtnodata 255 gt2000.vrt gt2000.shp && \
	gdal_translate -of GTiff -a_srs EPSG:3067 -co BLOCKXSIZE=256 -co BLOCKYSIZE=256 -co COMPRESS=DEFLATE -co TILED=yes -co BIGTIFF=YES -a_nodata 255 gt2000.vrt gt2000.tiff && \
	gdaladdo gt2000.tiff -r gauss --config NUM_THREADS 4 --config COMPRESS_OVERVIEW DEFLATE --config INTERLEAVE_OVERVIEW PIXEL --config PHOTOMETRIC_OVERVIEW YCBCR 2 4 8 16 32 64 128 256 512 1024 2048 4096 &

gdalbuildvrt -srcnodata 255 -vrtnodata 255 gt800.vrt gt800.shp && \
	gdal_translate -of GTiff -a_srs EPSG:3067 -co BLOCKXSIZE=256 -co BLOCKYSIZE=256 -co COMPRESS=DEFLATE -co TILED=yes -co BIGTIFF=YES -a_nodata 255 gt800.vrt gt800.tiff && \
	gdaladdo gt800.tiff -r gauss --config NUM_THREADS 4 --config COMPRESS_OVERVIEW DEFLATE --config INTERLEAVE_OVERVIEW PIXEL --config PHOTOMETRIC_OVERVIEW YCBCR 2 4 8 16 32 64 128 256 512 1024 2048 4096 &

gdalbuildvrt -srcnodata 255 -vrtnodata 255 gt320.vrt gt320.shp && \
	gdal_translate -of GTiff -a_srs EPSG:3067 -co BLOCKXSIZE=256 -co BLOCKYSIZE=256 -co COMPRESS=DEFLATE -co TILED=yes -co BIGTIFF=YES -a_nodata 255 gt320.vrt gt320.tiff && \
	gdaladdo gt320.tiff -r gauss --config NUM_THREADS 4 --config COMPRESS_OVERVIEW DEFLATE --config INTERLEAVE_OVERVIEW PIXEL --config PHOTOMETRIC_OVERVIEW YCBCR 2 4 8 16 32 64 128 256 512 1024 2048 4096 &

gdalbuildvrt -srcnodata 255 -vrtnodata 255 gt160.vrt gt160.shp && \
	gdal_translate -of GTiff -a_srs EPSG:3067 -co BLOCKXSIZE=256 -co BLOCKYSIZE=256 -co COMPRESS=DEFLATE -co TILED=yes -co BIGTIFF=YES -a_nodata 255 gt160.vrt gt160.tiff && \
	gdaladdo gt160.tiff -r gauss --config NUM_THREADS 4 --config COMPRESS_OVERVIEW DEFLATE --config INTERLEAVE_OVERVIEW PIXEL --config PHOTOMETRIC_OVERVIEW YCBCR 2 4 8 16 32 64 128 256 512 1024 2048 4096 &

gdalbuildvrt -srcnodata 255 -vrtnodata 255 gt80.vrt gt80.shp && \
	gdal_translate -of GTiff -a_srs EPSG:3067 -co BLOCKXSIZE=256 -co BLOCKYSIZE=256 -co COMPRESS=DEFLATE -co TILED=yes -co BIGTIFF=YES -a_nodata 255 gt80.vrt gt80.tiff && \
	gdaladdo gt80.tiff -r gauss --config NUM_THREADS 4 --config COMPRESS_OVERVIEW DEFLATE --config INTERLEAVE_OVERVIEW PIXEL --config PHOTOMETRIC_OVERVIEW YCBCR 2 4 8 16 32 64 128 256 512 1024 2048 4096 &


gdalbuildvrt -srcnodata 255 -vrtnodata 255 gt40.vrt gt40.shp && \
	gdal_translate -of GTiff -a_srs EPSG:3067 -co BLOCKXSIZE=256 -co BLOCKYSIZE=256 -co COMPRESS=DEFLATE -co TILED=yes -co BIGTIFF=YES -a_nodata 255 gt40.vrt gt40.tiff && \
	gdaladdo gt40.tiff -r gauss --config NUM_THREADS 4 --config COMPRESS_OVERVIEW DEFLATE --config INTERLEAVE_OVERVIEW PIXEL --config PHOTOMETRIC_OVERVIEW YCBCR 2 4 8 16 32 64 128 256 512 1024 2048 4096 &



gdalbuildvrt -srcnodata 255 -vrtnodata 255 gt20.vrt gt20.shp && \
	gdal_translate -of GTiff -a_srs EPSG:3067 -co BLOCKXSIZE=256 -co BLOCKYSIZE=256 -co COMPRESS=DEFLATE -co TILED=yes -co BIGTIFF=YES -a_nodata 255 gt20.vrt gt20.tiff && \
	gdaladdo gt20.tiff -r gauss --config NUM_THREADS 4 --config COMPRESS_OVERVIEW DEFLATE --config INTERLEAVE_OVERVIEW PIXEL --config PHOTOMETRIC_OVERVIEW YCBCR 2 4 8 16 32 64 128 256 512 1024 2048 4096 &


gdalbuildvrt -srcnodata 255 -vrtnodata 255 gt10.vrt gt10.shp && \
	gdal_translate -of GTiff -a_srs EPSG:3067 -co BLOCKXSIZE=256 -co BLOCKYSIZE=256 -co COMPRESS=DEFLATE -co TILED=yes -co BIGTIFF=YES -a_nodata 255 gt10.vrt gt10.tiff && \
	gdaladdo gt10.tiff -r gauss --config NUM_THREADS 4 --config COMPRESS_OVERVIEW DEFLATE --config INTERLEAVE_OVERVIEW PIXEL --config PHOTOMETRIC_OVERVIEW YCBCR 2 4 8 16 32 64 128 256 512 1024 2048 4096 &


gdalbuildvrt -srcnodata 255 -vrtnodata 255 gt5.vrt gt5.shp && \
	gdal_translate -of GTiff -a_srs EPSG:3067 -co BLOCKXSIZE=256 -co BLOCKYSIZE=256 -co COMPRESS=DEFLATE -co TILED=yes -co BIGTIFF=YES -a_nodata 255 gt5.vrt gt5.tiff && \
	gdaladdo gt5.tiff -r gauss --config NUM_THREADS 4 --config COMPRESS_OVERVIEW DEFLATE --config INTERLEAVE_OVERVIEW PIXEL --config PHOTOMETRIC_OVERVIEW YCBCR 2 4 8 16 32 64 128 256 512 1024 2048 4096 &







