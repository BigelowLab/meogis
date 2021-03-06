% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/io.R
\name{fetch_twp24}
\alias{fetch_twp24}
\title{Fetch the Maine Town Boundaries and save to the MEOGIS directory}
\usage{

  fetch_twp24(uri = "https://gis2.maine.gov/arcgis/rest/services/Boundaries/Maine_Boundaries_Town_Townships/MapServer/2",
  dest = meogis_path("METWP24.geojson"))
}
\arguments{
\item{uri}{the uri to fetch}

\item{dest}{the destination path and file (will be overwritten if present)}
}
\value{
sf-tibble or NULL
}
\description{
Fetch the Maine Town Boundaries and save to the MEOGIS directory
}
