library(rmarkdown)
library(htmltools)

# Analysis template
t_analysis <- function(toc = TRUE, code_folding = "hide") {

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
  )
}

# Data wrangling template
# t_data_wrangling <- function(toc = TRUE, code_folding = "hide") {
#   
#   # get the locations of resource files located within the package
#   css <- system.file("rmarkdown", "templates", "data_wrangling",
#                      "resources", "style.css", package = "katereR")
#   
#   # call the base html_document function
#   rmarkdown::html_document(theme = "flatly",
#                            css = css,
#                            toc = toc,
#                            toc_float = TRUE,
#                            toc_depth = 2,
#                            number_sections = FALSE,
#                            df_print = "paged",
#                            code_folding = code_folding,
#   )
# }

# Index template
# t_index <- function(toc = TRUE, code_folding = "hide") {
#   
#   # get the locations of resource files located within the package
#   css <- system.file("rmarkdown", "templates", "index",
#                      "resources", "style.css", package = "katereR")
#   
#   # call the base html_document function
#   rmarkdown::html_document(theme = "flatly",
#                            css = css,
#                            toc = toc,
#                            toc_float = TRUE,
#                            toc_depth = 2,
#                            number_sections = FALSE,
#                            df_print = "paged",
#                            code_folding = code_folding,
#   )
# }

# Metadata template
# t_metadata <- function(toc = TRUE, code_folding = "hide") {
#   
#   # get the locations of resource files located within the package
#   css <- system.file("rmarkdown", "templates", "metadata",
#                      "resources", "style.css", package = "katereR")
#   
#   # call the base html_document function
#   rmarkdown::html_document(theme = "flatly",
#                            css = css,
#                            toc = toc,
#                            toc_float = TRUE,
#                            toc_depth = 2,
#                            number_sections = FALSE,
#                            df_print = "paged",
#                            code_folding = code_folding,
#   )
# }

# Simple template
# t_simple <- function(toc = TRUE, code_folding = "hide") {
#   
#   # get the locations of resource files located within the package
#   css <- system.file("rmarkdown", "templates", "simple",
#                      "resources", "style.css", package = "katereR")
#   
#   # call the base html_document function
#   rmarkdown::html_document(theme = "flatly",
#                            css = css,
#                            toc = toc,
#                            toc_float = TRUE,
#                            toc_depth = 2,
#                            number_sections = FALSE,
#                            df_print = "paged",
#                            code_folding = code_folding,
#   )
# }
