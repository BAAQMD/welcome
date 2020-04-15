#' packageTimestamp
#'
#' Extract the "Built" timestamp from a package's description.
#'
#' @param pkgname (character) package name
#'
#' @importFrom lubridate ymd_hms with_tz
#' @importFrom stringr str_extract
#' @importFrom utils packageDescription
#'
#' @export
packageTimestamp <- function (
  pkgname
) {

  pkg_description <-
    utils::packageDescription(pkgname)

  if("Built" %in% names(pkg_description)) {

    timestamp_pattern <-
      "[0-9]{4}-[0-9]{2}-[0-9]{2} [0-9]{2}:[0-9]{2}:[0-9]{2} UTC"

    pkg_built <-
      pkg_description[["Built"]]

    pkg_built_timestamp <-
      stringr::str_extract(
        pkg_built,
        timestamp_pattern)

    pkg_timestamp <-
      lubridate::with_tz(
        ymd_hms(pkg_built_timestamp),
        tzone = "UTC")

  } else {

    pkg_timestamp <-
      invisible(NULL)

  }

  return(pkg_timestamp)

}
