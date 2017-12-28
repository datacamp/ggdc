# ggdc

Datacamp Themes for ggplot2.

## Installation

```r
devtools::install_github("datacamp/ggdc")
```

## Usage

```r
library(ggplot2)
ggplot(mtcars, aes(x = mpg, y = wt, color = as.factor(vs))) +
  geom_point() +
  facet_wrap(~ gear) +
  scale_color_manual(name = 'VS', values = dc_pal()) +
  labs(
    title = 'Mileage vs. Weight by Gears',
    subtitle = "Automobile Data (mtcars)",
    x = "Miles per Gallon",
    y = "Weight"
  ) +
  ggdc::theme_datacamp()
```

![Datacamp Theme](https://imgur.com/Fb4Lrv5.png)


