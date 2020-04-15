#' Welcome message and version/timestamp info
#'
#' @include packageTimestamp.R
#'
#' @importFrom utils packageVersion
#'
#' @export
welcome_to <- function (pkg_name) {

  pkg_ver <- utils::packageVersion(pkg_name)
  pkg_ts <- packageTimestamp(pkg_name)
  pkg_msg <- sprintf("This is %s v%s (%s)", pkg_name, pkg_ver, pkg_ts)

  utils::timestamp(pkg_msg, prefix = "##------ [welcome] ", quiet = TRUE)

  packageStartupMessage(pkg_msg)

}
