#' Datacamp styled ioslides presentation
#'
#' @param ... parameters to pass to \link[rmarkdown]{ioslides_presentation}
#' @importFrom rmarkdown ioslides_presentation
#' @export
ioslides_presentation <- function(...){
  ioslides_dc_styles <- system.file(
    'css', 'ioslides_dc_styles.css', package = 'ggdc'
  )
  params <- list(...)
  params$css <- c(params$css, ioslides_dc_styles)
  do.call(rmarkdown::ioslides_presentation, params)
}

#' Datacamp styled xaringan presentation
#'
#' @param ... parameters to pass to \link[xaringan]{moon_reader}
#' @export
moon_reader <- function(...){
  xaringan_dc_styles <- system.file(
    'css', 'xaringan_dc_styles.css', package = 'ggdc'
  )
  css <- c('default', xaringan_dc_styles)
  params <- list(...)
  params$css <- unique(c('default', params$css, xaringan_dc_styles))
  do.call(xaringan::moon_reader, params)
}
