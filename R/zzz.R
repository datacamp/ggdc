# This is copied from hrbrthemes
# Link: https://github.com/hrbrmstr/hrbrthemes/blob/master/R/zzz.r

.onAttach <- function(libname, pkgname) {

  if (.Platform$OS.type == "windows")  {
    if (interactive()) packageStartupMessage(
      "Registering Windows fonts with R"
    )
    extrafont::loadfonts("win", quiet = TRUE)
  }

  if (getOption("ggdc.loadfonts", default = FALSE)) {
    if (interactive()) {
      packageStartupMessage("Registering PDF & PostScript fonts with R")
    }
    extrafont::loadfonts("pdf", quiet = TRUE)
    extrafont::loadfonts("postscript", quiet = TRUE)
  }
}
