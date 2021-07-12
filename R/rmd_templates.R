library(rmarkdown)
library(htmltools)

# Features of the analysis template
analysis <- function(toc = TRUE, code_folding = "hide") {

  # get the locations of resource files located within the package
  css <- system.file("rmarkdown", "templates", "analysis",
                     "resources", "style.css", package = "katereR")

  # call the base html_document function
  rmarkdown::html_document(theme = "flatly",
                           css = css,
                           toc = toc,
                           toc_float = TRUE,
                           toc_depth = 2,
                           number_sections = FALSE,
                           df_print = "paged",
                           code_folding = code_folding,
                           # includes = rmarkdown::includes(after_body = footer)
  )
}
