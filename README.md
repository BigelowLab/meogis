# meogis

Access local and online resources from [Maine Office of GIS](https://www.maine.gov/megis/catalog/) with R.

### Requirements:

 + [sf](https://cran.r-project.org/package=sf)
 
 + [esri2sf](https://github.com/yonghah/esri2sf)
 
### Global path

Data files are stored in a directory of your chosing.  I like to define that directory path in my ~/.Rprofile file. That way whenever R starts (and reads that file - be careful when invoking R or Rscript in a way that doesn't read `~/.Rprofile`).  For example...

```r
options(MEOGIS_PATH = "/Users/Shared/data/meogis")
```

### Installation

```r
devtools::install_github("BigelowLab/meogis", dependencies = FALSE, upgrade = FALSE)
```

### Getting started

First you need to have some data from [Maine Office of GIS](https://www.maine.gov/megis/catalog/).  

```r
library(meogis)
x <- fetch_twp24()
```

Once you have the data stored lcoally, then you can read the local copy.

```
library(meogis)
library(sf)
x <- read_twp24()
plot(x %>% dplyr::filter(TOWN %in% c("Yarmouth", "Freeport")))
```
