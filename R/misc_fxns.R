###########################################
#####     Miscellaneous functions     #####
###########################################

# Packages
library(rmarkdown)

##### render_report() #####

# Renders .Rmd as standalone .html reports
# Ignores _site.yml by temporarily moving it

render_report <- function(site_yaml = "R_markdowns/_site.yml",
                          input, ...) {
  file.rename(site_yaml, "_site.yml")
  try(rmarkdown::render(input, ...))
  file.rename("_site.yml", site_yaml)
}
