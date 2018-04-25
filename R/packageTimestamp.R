#' @importFrom lubridate ymd_hms with_tz
#' @importFrom stringr str_extract
#' @export
packageTimestamp <- function (pkgname) {

  pkg_desc <- packageDescription(pkgname)

  pkg_timestamp <-

    if("Built" %in% names(pkg_desc)) {

      pkg_built <- pkg_desc[["Built"]]
      locale_tz <- Sys.timezone()

      timestamp_pattern <- "[0-9]{4}-[0-9]{2}-[0-9]{2} [0-9]{2}:[0-9]{2}:[0-9]{2} UTC"
      pkg_built_timestamp <- str_extract(pkg_built, timestamp_pattern)

      with_tz(ymd_hms(pkg_built_timestamp), tz = "UTC")


    } else {

      invisible(NULL)

    }

  return(pkg_timestamp)

}
