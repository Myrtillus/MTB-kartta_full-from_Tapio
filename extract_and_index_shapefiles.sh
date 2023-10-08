#!/bin/bash
set -e -u

UNZIP_OPTS=-qqu

# create and populate data dir
# mkdir -p data/world_boundaries
# mkdir -p data/ne_110m_admin_0_boundary_lines_land
# mkdir -p data/ne_10m_populated_places

# simplified-land-polygons-complete-3857
echo "expanding simplified-land-polygons-complete-3857..."
#unzip $UNZIP_OPTS data/simplified-land-polygons-complete-3857.zip simplified-land-polygons-complete-3857/simplified_land_polygons.{shp,shx,prj,dbf,cpg} -d data/
unzip $UNZIP_OPTS data/simplified-land-polygons-complete-3857.zip -d data/

# land-polygons-split-3857
echo "expanding land-polygons-split-3857..."
unzip $UNZIP_OPTS data/land-polygons-split-3857.zip -d data/

#index
echo "indexing shapefiles"
shapeindex --shape_files \
data/simplified-land-polygons-complete-3857/simplified_land_polygons.shp \
data/land-polygons-split-3857/land_polygons.shp \

echo "...done!"
