# katereR

A package catering to Kate's workflow.

- [RStudio project templates](#rstudio-project-templates)
- [R Markdown templates](#r-markdown-templates)
- [ggplot themes](#ggplot-themes)

<br>

## Installation

```
devtools::install_github("katekathrynkat/katereR")
```

<br>

## RStudio project templates

- `eco_analysis`: General project for ecological data analysis

### Usage

Open a new project in RStudio: File -> New Project -> New Directory -> katereR

<br>

## R Markdown templates

View examples at https://katekathrynkat.github.io/katereR/

- `t_analysis`: General Rmd for data analysis
- `t_datasets`: Rmd for describing data
- `t_index`: Rmd to use as the home page for a project website
- `t_notes`: Rmd for notes
- `t_simple`: Simple Rmd

### Usage

Open a new .Rmd file in RStudio: File -> New File -> R Markdown -> From Template -> katereR

<br>

## ggplot themes

- `foundation`: Base theme

### Usage

```
library(katereR)
library(ggplot2)
p <- ggplot(cars, aes(x = speed, y = dist)) +
            geom_point()
p + theme_foundation()
```

<br>

## Acknowledgements

Code originally modified from [epuRate](https://github.com/holtzy/epuRate), [ptexamples](https://github.com/rstudio/ptexamples), and [ggthemes](https://github.com/jrnold/ggthemes).
