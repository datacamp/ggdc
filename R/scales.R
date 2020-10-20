# get_dc_colors <- function(){
#   library(rvest)
#   styleguide <- "http://styleguide.datacamp.com/core.html#bucket"
#   palette_colors <- styleguide %>%
#     read_html() %>%
#     html_nodes(".palette-color")
#
#   color_names <- palette_colors %>%
#     html_nodes('.language-markup') %>%
#     html_text() %>%
#     stringr::str_replace("\\$", "") %>%
#     stringr::str_replace_all("-", "_")
#
#   color_hex <- palette_colors %>%
#     html_nodes('.palette-color__hex') %>%
#     html_text()
#
#   palette <- data_frame(
#     name = color_names,
#     hex = color_hex[1:length(color_names)]
#   )
#
#   palette %>%
#     filter(grepl("^\\#", hex)) %>%
#     filter(grepl("^dc", name)) %>%
#     mutate(name = stringr::str_replace(name, "^dc\\_", "")) %>%
#     deframe() %>%
#     as.list()
# }
#
# dc_colors_all <- get_dc_colors()

#' Function to extract datacamp colors as hex codes
#'
#' @param ... Character names of datacamp colors
#' @export
dc_colors <- function(...) {
  data(dc_colors_new, package = 'ggdc')
  cols <- c(...)

  if (is.null(cols))
    return (dc_colors_new)

  dc_colors_new[cols]
}


.accents = dc_colors(
  'green', 'orange', 'blue', 'red', 'pink', 'purple'
)

#' Datacamp color palettes
#'
#' @export
dc_palettes <- list(
  greys = dc_colors('grey100',  'grey200', 'grey300', 'grey400'),
    accents = .accents,
    accents_light = paste0(.accents, 'Light'),
    accents_dark = paste0(.accents, 'Dark')
)


#' Return function to interpolate a datacamp color palette
#'
#' @param palette Character name of palette in dc_palettes()
#' @param reverse Boolean indicating whether the palette should be reversed
#' @param ... Additional arguments to pass to colorRampPalette()
#' @export
dc_palette <- function(palette = "accents", reverse = FALSE, ...) {
  pal <- dc_palettes[[palette]]

  if (reverse) pal <- rev(pal)

  colorRampPalette(pal, ...)
}

#' Color scale constructor for datacamp colors
#'
#' @param palette Character name of palette in dc_palettes()
#' @param discrete Boolean indicating whether color aesthetic is discrete or not
#' @param reverse Boolean indicating whether the palette should be reversed
#' @param ... Additional arguments passed to discrete_scale() or
#'    scale_color_gradientn(), used respectively when discrete is TRUE or FALSE
#' @export
scale_color_datacamp <- function(palette = "accents", discrete = TRUE,
    reverse = FALSE, ...) {
  pal <- dc_palette(palette = palette, reverse = reverse)

  if (discrete) {
    discrete_scale("colour", paste0("dc_", palette), palette = pal, ...)
  } else {
    scale_color_gradientn(colours = pal(256), ...)
  }
}

#' Fill scale constructor for drsimonj colors
#'
#' @param palette Character name of palette in drsimonj_palettes
#' @param discrete Boolean indicating whether color aesthetic is discrete or not
#' @param reverse Boolean indicating whether the palette should be reversed
#' @param ... Additional arguments passed to discrete_scale() or
#'  scale_fill_gradientn(), used respectively when discrete is TRUE or FALSE
#' @export
scale_fill_datacamp <- function(palette = "accents", discrete = TRUE,
    reverse = FALSE, ...) {
  pal <- dc_palette(palette = palette, reverse = reverse)

  if (discrete) {
    ggplot2::discrete_scale("fill", paste0("dc_", palette), palette = pal, ...)
  } else {
    ggplot2::scale_fill_gradientn(colours = pal(256), ...)
  }
}
