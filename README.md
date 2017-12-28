# ggdc

Datacamp Themes for ggplot2.

## Installation

You can install the package from github using `devtools`.

```r
devtools::install_github("datacamp/ggdc")
```

## Setup

You will need to set up Lato fonts before you can use this pacakge. You can do this by by running the following lines of code.

```r
library(ggdc)
install_lato()
extrafont::loadfonts(quiet = TRUE)
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


