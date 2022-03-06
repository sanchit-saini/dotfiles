#!/bin/sh
# Download x release version from svn.r-project.org/R
# And build it
#
# Reference src : https://www.r-bloggers.com/2015/07/r-devel-in-parallel-to-regular-r-installation/

# checkout r src 
svn co https://svn.r-project.org/R/trunk src -r 80146

# current working path
PWD=$(pwd)

# run rsync recommended and downloads required files
$PWD/src/tools/rsync-recommended

# delete directory, if exists
if [ -d "bin" ]; then
    rm -rf "bin"
fi

# for bin directory
mkdir "bin"

# change build directory
cd $PWD/bin/

# run config
$PWD/src/configure

# build R
make -j

# copy paste and run the following in R
#
# install.packages(c("knitr", "devtools", "ellipse", "Rcpp", "extrafont", "RColorBrewer", "beeswarm", "testthat", "XML", "rmarkdown", "BiocManager"))
# BiocManager::install(c("limma", "org.Hs.eg.db"))

