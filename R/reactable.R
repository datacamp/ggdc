#' DataCamp themes for reactable interactive tables
#'
#' Create a theme for reactable interactive tables that is consistent with
#' DataCamp style.
#' @param color Text color.
#' @param background_color Background color for the header and footer regions.
#' @param base_family Font family for all text.
#' @param row_background_color Background color for all rows
#' (\code{striped = FALSE}) or even numbered rows (\code{striped = TRUE}).
#' @param striped_row_background_color Background color for odd numbered rows
#' when \code{striped = TRUE}.
#' @param row_highlight_font_weight Font weight for the highlighted row.
#' @param filter_input_background_color Background color the the filter input
#' textboxes.
#' @param page_button_hover_background_color Background color when you hover
#' over the page number/previous/next buttons.
#' @return An object of class \code{reactableTheme}.
#' @examples
#' reactable_theme_light()
#' reactable_theme_dark()
#' @importFrom reactable reactableTheme
#' @export
reactable_theme_light <- function(
  color = "#222222", background_color = dc_colors_new$beige300,
  base_family = "Poppins", row_background_color = dc_colors_new$beige100,
  striped_row_background_color = dc_colors_new$beige200,
  row_highlight_font_weight = "bold",
  filter_input_background_color = dc_colors_new$beige100,
  page_button_hover_background_color = dc_colors_new$beige400
) {
  reactableTheme(
    color = color,
    backgroundColor = background_color,
    style = list(fontFamily = base_family),
    rowStyle = list(backgroundColor = row_background_color),
    stripedColor = striped_row_background_color,
    rowHighlightStyle = list(fontWeight = row_highlight_font_weight),
    filterInputStyle = list(backgroundColor = filter_input_background_color),
    pageButtonHoverStyle = list(backgroundColor = page_button_hover_background_color)
  )
}

#' @rdname reactable_theme_light
#' @export
reactable_theme_dark <- function(
  color = "#F8F8F2", background_color = dc_colors_new$navyDark,
  base_family = "Poppins", row_background_color = dc_colors_new$navy,
  striped_row_background_color = dc_colors_new$navyLight,
  row_highlight_font_weight = "bold",
  filter_input_background_color = dc_colors_new$navyDark,
  page_button_hover_background_color = dc_colors_new$blueDark
) {
  reactableTheme(
    color = color,
    backgroundColor = background_color,
    style = list(fontFamily = base_family),
    rowStyle = list(backgroundColor = row_background_color),
    stripedColor = striped_row_background_color,
    rowHighlightStyle = list(fontWeight = row_highlight_font_weight),
    filterInputStyle = list(backgroundColor = filter_input_background_color),
    pageButtonHoverStyle = list(backgroundColor = page_button_hover_background_color)
  )
}

#' Create DataCamp-style reactable interactive table
#'
#' Creates a reactable interactive table with DataCamp style defaults.
#' @param data The data frame to make a table from.
#' @param ... Arguments passed to \code{\link[reactable]{reactable}}.
#' @param filterable Should column widths be resizable?
#' @param filterable Should rows be filterable?
#' @param highlight Should hovering over a row highlight it?
#' @param borderless Should internal borders be removed?
#' @param striped Should alternate rows have a different background color?
#' @param compact Should cell padding be reduced to increase data density?
#' @return A \code{reactable} HTML widget.
#' @seealso \code{\link{reactable_theme_light}}
#' @examples
#' dc_reactable_light(CO2)
#' dc_reactable_dark(CO2)
#' @importFrom reactable reactable
#' @export
dc_reactable_light <- function(
  data, ..., resizable = TRUE,
  filterable = TRUE, highlight = TRUE, borderless = TRUE, striped = TRUE,
  compact = TRUE) {
  reactable(
    data,
    resizable = resizable,
    filterable = filterable,
    highlight = highlight,
    borderless = borderless,
    striped = striped,
    compact = compact,
    theme = reactable_theme_light(),
    ...
  )
}

#' @rdname dc_reactable_light
#' @export
dc_reactable_dark <- function(
  data, ..., resizable = TRUE,
  filterable = TRUE, highlight = TRUE, borderless = TRUE, striped = TRUE,
  compact = TRUE) {
  reactable(
    data,
    resizable = resizable,
    filterable = filterable,
    highlight = highlight,
    borderless = borderless,
    striped = striped,
    compact = compact,
    theme = reactable_theme_dark(),
    ...
  )
}
