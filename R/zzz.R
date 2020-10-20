# This is copied from hrbrthemes
# Link: https://github.com/hrbrmstr/hrbrthemes/blob/master/R/zzz.r

.onAttach <- function(libname, pkgname) {
  use_poppins()
  if (.Platform$OS.type == "windows")  {
    if (interactive()) packageStartupMessage(
      "Registering Windows fonts with R"
    )
    extrafont::loadfonts("win", quiet = TRUE)
  }

  if (getOption("ggdc.loadfonts", default = TRUE)) {
    if (interactive()) {
      packageStartupMessage("Registering PDF & PostScript fonts with R")
    }
    extrafont::loadfonts("pdf", quiet = TRUE)
    extrafont::loadfonts("postscript", quiet = TRUE)
  }
  ggplot2::theme_set(ggdc::theme_datacamp_light())
}
