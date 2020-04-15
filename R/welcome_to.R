#' welcome_to
#'
#' Print welcome message and package version/timestamp.
#'
#' @param pkgname (character) package name
#'
#' @importFrom utils packageVersion
#'
#' @export
welcome_to <- function (pkgname) {

  pkg_ver <-
    utils::packageVersion(
      pkgname)

  pkg_ts <-
    packageTimestamp(
      pkgname)

  pkg_msg <-
    sprintf(
      "This is %s v%s (%s)",
      pkgname,
      pkg_ver,
      pkg_ts)

  utils::timestamp(
    pkg_msg,
    prefix = "##------ [welcome] ",
    quiet = TRUE)

  packageStartupMessage(pkg_msg)

}
