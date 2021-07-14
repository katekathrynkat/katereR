library(rmarkdown)
library(htmltools)

# Analysis template
t_analysis <- function(toc = TRUE, code_folding = "hide", df_print = "paged") {

  # get the locations of resource files located within the package
  css <- system.file("rmarkdown", "templates", "analysis",
                     "resources", "style.css", package = "katereR")

  # call the base html_document function
  rmarkdown::html_document(theme = "flatly",
                           highlight = "pygments",
                           css = css,
                           toc = toc,
                           toc_float = TRUE,
                           toc_depth = 3,
                           number_sections = FALSE,
                           df_print = df_print,
                           code_folding = code_folding,
  )
}

# Index template
t_index <- function(rmd_dir = "R_markdowns", # where to save CSS relative to root
                    toc = FALSE, code_folding = "none", df_print = "paged") {

  # get the locations of CSS file located within the package
  css <- system.file("rmarkdown", "templates",
                     "index", "style_index.css", package = "katereR")
  
  # copy to the specified directory (default /R_markdowns)
  file.copy(css, paste0(getwd(), "/", rmd_dir, "/", basename(css)),
            overwrite = FALSE)
  
  # call the base html_document function
  rmarkdown::html_document(theme = "flatly",
                           highlight = "pygments",
                           css = paste0(getwd(), "/", rmd_dir, "/", basename(css)),
                           toc = toc,
                           toc_float = TRUE,
                           toc_depth = 3,
                           number_sections = FALSE,
                           df_print = df_print,
                           code_folding = code_folding,
  )
}

# Metadata template
t_metadata <- function(toc = TRUE, code_folding = "hide", df_print = "paged") {

  # get the locations of resource files located within the package
  css <- system.file("rmarkdown", "templates", "metadata",
                     "resources", "style.css", package = "katereR")

  # call the base html_document function
  rmarkdown::html_document(theme = "flatly",
                           highlight = "pygments",
                           css = css,
                           toc = toc,
                           toc_float = TRUE,
                           toc_depth = 3,
                           number_sections = FALSE,
                           df_print = df_print,
                           code_folding = code_folding,
  )
}

# Simple template
t_simple <- function(toc = FALSE, code_folding = "none", df_print = "paged") {

  # get the locations of resource files located within the package
  css <- system.file("rmarkdown", "templates", "simple",
                     "resources", "style.css", package = "katereR")

  # call the base html_document function
  rmarkdown::html_document(theme = "flatly",
                           highlight = "pygments",
                           css = css,
                           toc = toc,
                           toc_float = TRUE,
                           toc_depth = 3,
                           number_sections = FALSE,
                           df_print = df_print,
                           code_folding = code_folding,
  )
}
