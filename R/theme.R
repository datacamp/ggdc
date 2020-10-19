#' DataCamp ggplot2 theme
#'
#' @export
#' @rdname theme_datacamp
theme_datacamp_light <- function(base_size = 11,
                           base_family = "Poppins",
                           subtitle_family = "Poppins Light",
                           base_line_size = base_size/22,
                           base_rect_size = base_size/22,
                           fill_plot = "#f7f3eb",
                           fill_panel = fill_plot,
                           fill_strip = dc_colors_new$yellow,
                           color_geom = '#444444',
                           color_text = '#222222',
                           fill_text = color_text,
                           color_grid = "#e5e1da",
                           ...) {
  .update_geom_defaults(
    color_geom = color_geom, fill_geom  = 'gray',
    color_text = color_text, fill_text = fill_text
  )
  .update_geom_font_defaults(
    family = base_family, size = 3, color = color_text
  )
  for (g in c('bar', 'col')){
    update_geom_defaults(g, list(fill = dc_colors_new$navy, color = dc_colors_new$beige300))
  }
  theme_gray(base_size, base_family, base_line_size, base_rect_size) +
    theme(
      plot.title = element_text(size = rel(1.3), face = 'bold'),
      plot.subtitle = element_text(family = subtitle_family),
      panel.grid = element_line(color = color_grid),
      panel.background = element_rect(fill = fill_panel),
      plot.background = element_rect(fill = fill_plot),
      strip.background = element_rect(fill = fill_strip),
      axis.title.x = element_text(hjust = 0.5),
      axis.title.y = element_text(hjust = 0.5),
      legend.background = element_rect(fill = NA),
      legend.box.background = element_rect(fill = NA, color = NA),
      legend.position = 'bottom',
      plot.title.position = 'plot',
      panel.grid.major.x = element_blank(),
      panel.grid.minor.x = element_blank(),
      ...
    )
}

#' @export
#' @rdname theme_datacamp
theme_datacamp_dark <- function(base_size = 11,
                          base_family = "Poppins",
                          subtitle_family = "Poppins Light",
                          base_line_size = base_size / 22,
                          base_rect_size = base_size / 22,
                          fill_plot = "#05192d",
                          color_text =  "#F8F8F2",
                          fill_panel = "#05192d",
                          color_panel = "transparent",
                          fill_strip = colorspace::darken(fill_plot, 0.6),
                          fill_legend = colorspace::darken(fill_plot, 0.4),
                          color_strip = color_text,
                          color_axis = color_text,
                          color_grid = colorspace::lighten(fill_plot, 0.5),
                          color_geom = color_text,
                          fill_geom = color_text,
                          fill_text = fill_plot,
                          ...) {
  .update_geom_defaults(color_geom, fill_geom, color_text, fill_text)
  .update_geom_font_defaults(
    family = base_family, size = 3, color = color_text
  )
  for (g in c('bar', 'col')){
    update_geom_defaults(g, list(color = dc_colors_new$navyDark))
  }
  update_geom_defaults('point', list(color = dc_colors_new$green))
  theme_dark(base_size, base_family, base_line_size, base_rect_size) +
    theme(
      plot.background = element_rect(fill = fill_plot, color = NA),
      panel.background = element_rect(fill = fill_panel, color = color_panel),
      panel.grid = element_line(color = color_grid),
      strip.background = element_rect(fill = fill_strip),
      strip.text = element_text(color = color_strip),
      text = element_text(color = color_text),
      axis.text = element_text(color = color_axis),
      plot.title = element_text(size = rel(1.3), face = 'bold'),
      plot.subtitle = element_text(family = subtitle_family),
      axis.title.x = element_text(hjust = 0.5),
      axis.title.y = element_text(hjust = 0.5),
      legend.background = element_rect(fill = NA),
      legend.key = element_rect(fill = fill_legend, color = NA),
      legend.text = element_text(color = color_text),
      legend.position = 'bottom',
      plot.title.position = 'plot',
      panel.grid.major.x = element_blank(),
      panel.grid.minor.x = element_blank()
    )
}


# add comment
.update_geom_defaults <- function(color_geom = "#617a89",
                                  fill_geom = "#617a89",
                                  color_text = "#929299",
                                  fill_text = "#252a32") {
  geoms <- c(
    "abline", "area", "bar", "boxplot", "col", "crossbar",
    "density", "dotplot", "errorbar", "errorbar", "hline",
    "line", "linerange", "map", "path", "point", "polygon",
    "rect", "ribbon", "rug", "segment", "step", "tile", "violin",
    "vline"
  )
  for (g in geoms) {
    update_geom_defaults(g, list(color = color_geom, fill = fill_geom))
  }
  geoms <- c("text", "label")
  for (g in geoms) {
    update_geom_defaults(g, list(color = color_text, fill = fill_text))
  }
}

.update_geom_font_defaults <- function (family = "Arial Narrow",
                                        face = "plain",
                                        size = 3.5,
                                        color = "#2b2b2b"){
  l <- list(
    family = family, face = face, size = size, color = color
  )
  update_geom_defaults("text", l)
  update_geom_defaults("label", l)
}




#' @export
finalize_plot <- function(p, bg = NULL, logo_scale = 1) {
  m <- ggplot_build(p)
  if (is.null(bg)){
    bg <- m$plot$theme$plot.background$fill
    if (bg == "#05192d"){
      logo_image_path <- system.file('logo', 'logo-inverted.png', package = 'ggdc')
      color_divider = dc_colors_new$beige200
    } else if (bg == "#f7f3eb"){
      logo_image_path <- system.file('logo', 'logo-regular.png', package = 'ggdc')
      color_divider = dc_colors_new$navy
    }
  }
  logo_scale <- 1
  caption <- m$plot$labels$caption
  if (is.null(caption)) {
    caption <- ""
  } else {
    p <- p + labs(caption = NULL)
  }
  grob_logo <- grid::rasterGrob(
    png::readPNG(logo_image_path),
    x = grid::unit(0, "npc"),
    gp = grid::gpar(col = color_divider),
    height = unit(0.6, "npc"),
    hjust = -0.05,
    vjust = 0.5
  )
  grob_caption <- grid::textGrob(caption,
    x = grid::unit(1, "npc"),
    gp = grid::gpar(col = color_divider, fontsize = 8),
    hjust = 1.1
  )
  grob_footer <- grid::grobTree(
    grid::rectGrob(gp = grid::gpar(fill = bg, lwd = 0)),
    grob_logo,
    grob_caption
  )
  gridExtra::grid.arrange(
    p,
    grob_footer,
    heights = grid::unit(c(0.94, 0.06), c("npc", "npc"))
  )
}

dc_set_chunk_opts <- function(){
  width_final <- 1500
  dpi <- 300
  aspect_ratio <- 1.

  knitr::opts_chunk$set(
    cache = TRUE,
    warning = FALSE,
    message = FALSE,
    echo = TRUE,
    tidy = "styler",
    cache.lazy = FALSE
  )
  if (!is.null(getOption('knitr.in.progress'))){
    knitr::opts_chunk$set(
      class.output  = "knitr-output",
      comment = "#>",
      out.width = '100%',
      fig.width = 7,
      fig.height  = 4,
      dpi = 300,
      fig.fancybox = TRUE
    )
    assignInNamespace("print.ggplot", finalize_plot, asNamespace("ggplot2"))

    knitr::knit_hooks$set(
      plot = function(x, options) {
        cap <- options$fig.cap # figure caption
        tags <- htmltools::tags
        as.character(tags$figure(
          if (!is.null(options$fig.fancybox) && options$fig.fancybox) {
            tags$a(
              href = x, `data-fancybox` = "",
              tags$img(src = x, alt = cap)
            )
          } else {
            tags$img(src = x, alt = cap)
          },
          tags$figcaption(cap)
        ))
      }
    )
  }
}
