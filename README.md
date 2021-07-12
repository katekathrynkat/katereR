# katereR

Templates for Kate's favorite docs, plots, scripts, and projects.

- [RStudio project templates](#rstudio-project-templates)
- [R Markdown templates](#r-markdown-templates)
- [ggplot themes](#ggplot-themes)

<br>

## Installation

```
library(devtools)
install_github("katekathrynkat/katereR")
```

<br>

## RStudio project templates

### Usage

Open a new project in RStudio: File -> New Project -> New Directory -> katereR

### Templates

- **eco_analysis**: general project for ecological data analysis

<br>

## R Markdown templates

### Usage

Open a new .Rmd file in RStudio: File -> New File -> R Markdown -> From Template -> katereR

### Templates

- **analysis**: general Rmd for data analysis

<br>

## ggplot themes

### Usage

```
library(katereR)
library(ggplot2)
p <- ggplot(cars, aes(x = speed, y = dist)) +
            geom_point()
p + theme_foundation()
```

### Themes

- **foundation**: base theme

<br>

## Acknowledgements

Code originally modified from [epuRate](https://github.com/holtzy/epuRate), [ptexamples](https://github.com/rstudio/ptexamples), and [ggthemes](https://github.com/jrnold/ggthemes).
