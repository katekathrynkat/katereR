library(rmarkdown)
library(htmltools)

# Analysis template
t_analysis <- function(rmd_dir = "R_markdowns", # where to save CSS relative to root
                       toc = TRUE, code_folding = "hide", df_print = "paged") {

  # get the locations of CSS file located within the package
  css <- system.file("rmarkdown", "templates",
                     "CSS", "style_base.css", package = "katereR")
  
  # copy to the specified directory (default /R_markdowns)
  file.copy(css, basename(css), overwrite = FALSE)

  # call the base html_document function
  rmarkdown::html_document(theme = "flatly",
                           highlight = "pygments",
                           css = basename(css),
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
                     "CSS", "style_index.css", package = "katereR")
  
  # copy to the specified directory (default /R_markdowns)
  file.copy(css, basename(css), overwrite = FALSE)
  
  # call the base html_document function
  rmarkdown::html_document(theme = "flatly",
                           highlight = "pygments",
                           css = basename(css),
                           toc = toc,
                           toc_float = TRUE,
                           toc_depth = 3,
                           number_sections = FALSE,
                           df_print = df_print,
                           code_folding = code_folding,
  )
}

# Metadata template
t_metadata <- function(rmd_dir = "R_markdowns", # where to save CSS relative to root
                       toc = TRUE, code_folding = "hide", df_print = "paged") {

  # get the locations of CSS file located within the package
  css <- system.file("rmarkdown", "templates",
                     "CSS", "style_base.css", package = "katereR")
  
  # copy to the specified directory (default /R_markdowns)
  file.copy(css, basename(css), overwrite = FALSE)

  # call the base html_document function
  rmarkdown::html_document(theme = "flatly",
                           highlight = "pygments",
                           css = basename(css),
                           toc = toc,
                           toc_float = TRUE,
                           toc_depth = 3,
                           number_sections = FALSE,
                           df_print = df_print,
                           code_folding = code_folding,
  )
}

# Simple template
t_simple <- function(rmd_dir = "R_markdowns", # where to save CSS relative to root
                     toc = FALSE, code_folding = "none", df_print = "paged") {

  # get the locations of CSS file located within the package
  css <- system.file("rmarkdown", "templates",
                     "CSS", "style_base.css", package = "katereR")
  
  # copy to the specified directory (default /R_markdowns)
  file.copy(css, basename(css), overwrite = FALSE)

  # call the base html_document function
  rmarkdown::html_document(theme = "flatly",
                           highlight = "pygments",
                           css = basename(css),
                           toc = toc,
                           toc_float = TRUE,
                           toc_depth = 3,
                           number_sections = FALSE,
                           df_print = df_print,
                           code_folding = code_folding,
  )
}
