.onAttach <- function (
  libname,
  pkgname
) {

  today_is <-
    paste0(
      "Today is ",
      base::date())

  utils::timestamp(
    today_is,
    prefix = "##------ [welcome] ",
    quiet = TRUE)

  packageStartupMessage(
    today_is)

  return(TRUE)

}
