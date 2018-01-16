#' Test if the root path can be found.
#'
#' The function attempts to retrieve this from option("MEOGIS_PATH") which can be
#' set at the begining of the R session or placed in the users \code{~\.Rprofile}
#'
#' @export
#' @param x subdirectory (ala "lowtide2013" etc)
#' @param root the path to the various MEOGIS datasets
#' @return named logical, TRUE if the path exists
has_meogis <- function(x, root = options("MEOGIS_PATH")){
    if (is.null(root)) {
        warning("root path to MEOGIS data is NULL")
        return(FALSE)
    }
    path <- if(!missing(x)) file.path(root, x) else root
    x <- sapply(path[1], dir.exists)
    if (!x[1]){
        warning("path to MEOGIS data not found:", path[1])
    }
    x
}

#' Retrieve the MEOGIS path
#'
#' @export
#' @param ... further arguments for \code{has_nsspme}
#' @return the known MEOGIS path
meogis_path <- function(...){
    names(has_meogis(...))
}

#' Read the Maine Township 24k Polygons
#'
#' @export
#' @param filename the name of the file, defaults to \code{METWP24.geojson}
#' @param path the path to the data file, defaults to MEOGIS_PATH
#' @param ... further arguments for \code{sf::read_sf()}
#' @return sf-tibble or NULL
read_twp24 <- function(filename = 'METWP24.geojson',
                       path = meogis_path(), ...){

    f = file.path(path[1], filename[1])
    if (!file.exists(f)){
        warning("file not found:", f)
        return(NULL)
    }
    sf::read_sf(f, ...)
}

#' Fetch the Maine Town Boundaries and save to the MEOGIS directory
#'
#' @export
#' @param uri the uri to fetch
#' @param dest the destination path and file (will be overwritten if present)
#' @return sf-tibble or NULL
fetch_twp24 = function(
    uri = "https://gis2.maine.gov/arcgis/rest/services/Boundaries/Maine_Boundaries_Town_Townships/MapServer/2",
    dest = meogis_path("METWP24.geojson")){

    x <- try(esri2sf::esri2sf(uri))
    if (inherits(x, 'try-error')){
        warning("unable to download uri:", uri)
        return(NULL)
    }
    x <- try(sf::write_sf(x, dest))
    if (inherits(x, 'try-error')){
        warning("unable to save geojson:", dest)
    }
    invisible(x)
}