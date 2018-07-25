#' DataCamp Color Palettes
#'
#' @param name Which of three palettes to choose
#' @param named Whether the vector should be named
#'
#' @export
dc_pal <- function(name = c("accents", "greys", "accents_light"), named = FALSE) {
  name <- match.arg(name)
  greys <- c(
    dark_grey = "#3D4251",
    grey = "#686F75",
    oslo_gray = "#859094",
    geyser = "#CFDCE1",
    light_grey = "#D1D3D8",
    lighter_grey = "#E6EAEB"
  )
  accents <- c(
    green = "#36D57D",
    red = "#FE5C5C",
    orange_dark = "#AD662C",
    purple_dark = "#5D488C"
  )
  accents_light <- c(
    light_green = "#A5ECC5",
    light_red = "#FFB5B5",
    orange = "#ff9400",
    purple = "#8468C4"
  )
  switch(name, if (named) get(name) else unname(get(name)))
}


#' DataCamp Theme
#'
#' @export
#' @import ggplot2
#' @examples
#' library(ggplot2)
#' ggplot(mtcars, aes(x = mpg, y = wt, color = as.factor(vs))) +
#'   geom_point() +
#'   facet_wrap(~ gear) +
#'   scale_color_manual(name = 'VS', values = dc_pal()) +
#'   labs(
#'     title = 'Mileage vs. Weight by Gears',
#'     subtitle = "Automobile Data (mtcars)",
#'     x = "Miles per Gallon",
#'     y = "Weight"
#'   ) +
#'   theme_datacamp()
theme_datacamp <- function(){
  theme_gray() +
    theme(
      legend.position = 'bottom',
      text = element_text(color = "#686F75", family = "Lato"),
      plot.title = element_text(color = "#3d4251", face = 'bold', size = 16),
      plot.subtitle = element_text(color = "#859094", size = 12),
      panel.background = element_rect(fill = "#EBF4F7"),
      strip.background = element_rect(fill = '#33AACC'),
      strip.text = element_text(colour = 'white', face = 'bold')
    )
}
