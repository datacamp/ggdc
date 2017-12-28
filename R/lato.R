#' Import Lato fonts for use in charts
#'
#' Lato is a trademark of Google.
#'
#' There is an option `ggdc.loadfonts` which -- if set to `TRUE` -- will
#' call `extrafont::loadfonts()` to register non-core fonts with R PDF &
#' PostScript devices. If you are running under Windows, the package calls the
#' same function to register non-core fonts with the Windows graphics device.
#'
#' @md
#' @note This will take care of ensuring PDF/PostScript usage. The location of
#'   the font directory is displayed after the base import is complete. It is
#'   highly recommended that you install them on your system the same way you
#'   would any other font you wish to use in other programs.
#' @export
#' @import extrafont
import_lato <- function() {

  lato_font_dir <- system.file("fonts", "lato", package="ggdc")

  suppressWarnings(suppressMessages(
    extrafont::font_import(rc_font_dir, prompt=FALSE))
  )

  message(
    sprintf(
      "You will likely need to install these fonts on your system as well.\n\nYou can find them in [%s]",
      rc_font_dir
    )
  )
}

#' Install Lato Fonts
#'
#' @export
install_lato <- function(){
  if (.Platform$OS.type != "windows"){
    font_dir_system <- '~/Library/Fonts'
  }

  font_dir <- system.file("fonts", "lato", package = "ggdc")
  font_files <- list.files(font_dir, full.names = TRUE)

  message("Copying Lato font files to ", font_dir_system)
  for (font_file in font_files){
    file.copy(font_file, font_dir_system)
  }

  suppressWarnings(suppressMessages(
    extrafont::font_import(font_dir, prompt = FALSE))
  )
}
