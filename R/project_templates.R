#############################################
#####     RStudio project templates     #####
#############################################

# R Studio project template: Ecological analysis
eco_analysis <- function(path, ...) {
  
  ##### CREATE PROJECT PATH #####
  
  # use name inputted by user
  dir.create(path, recursive = TRUE, showWarnings = FALSE)
  
  # set as working directory
  setwd(file.path(getwd(), path))
  
  
  ##### COLLECT INPUTS #####

  dots <- list(...)
  
  
  ##### CREATE README #####

  readme <- paste(
    paste0("# ", path, ": ", dots[["project_name"]]),
    "",
    "Description goes here",
    "",
    paste0("View analyses at https://katekathrynkat.github.io/", path, "/"),
    "",
    "## Directory structure",
    "",
    "    .",
    "    \u251C\u2500\u2500 data_raw         # Raw data files",
    "        \u251C\u2500\u2500 external         # Data from external sources",
    "        \u251C\u2500\u2500 field            # Field/lab measurements",
    "        \u251C\u2500\u2500 literature       # Data compiled from the literature",
    "        \u2514\u2500\u2500 spatial          # Maps and other spatial files",
    "    \u251C\u2500\u2500 docs             # Website HTML files (rendered from R_markdowns)",
    "    \u251C\u2500\u2500 output           # Figures (.png) and data (.csv) generated during analyses",
    "    \u251C\u2500\u2500 R_markdowns      # Code for analyses (.Rmd)",
    "    \u251C\u2500\u2500 R_scripts        # Scripts containing source code, functions, etc. (.R)",
    "        \u2514\u2500\u2500 archive          # Unorganized snippets of ill-fated code (view at your own risk)",
    "    \u251C\u2500\u2500 renv             # Package management with renv",
    
    "    \u251C\u2500\u2500 reports          # Standalone HTML reports (rendered from R_markdowns)",
    "    \u2514\u2500\u2500 README.md        # You are here",
    "-----",
    "",
    "**Contact:** Kate Culhane, kathrynculhane@ucsb.edu",
    sep = '\n'
    )
    writeLines(readme, "README.md", useBytes = TRUE)
    
  
    ##### CREATE INITIAL R SCRIPT #####
    
    temp_script <- paste(
      '# Temporary R script to help with project initialization',
      '# DELETE AFTER USE',
      '',
      '# Initialize renv',
      'renv::init()',
      '',
      '# Install packages to renv environment',
      'install.packages("usethis")',
      'install.packages("devtools")',
      'devtools::install_github("katekathrynkat/katereR")',
      'install.packages("tidyverse")',
      '',
      '# Create license',
      'usethis::use_mit_license("Kathryn Culhane")',
      '',
      '# Start git repo',
      'usethis::use_git(message = "initial commit")',
      'usethis::use_github(protocol = "https")',
      sep = '\n'
    )
    writeLines(temp_script, "temporary_script.R")
    
    
  ##### CREATE FILE STRUCTURE #####
  
  # create base folders
  dir.create("data_raw", recursive = TRUE, showWarnings = FALSE)
  dir.create("docs", recursive = TRUE, showWarnings = FALSE)
  dir.create("output", recursive = TRUE, showWarnings = FALSE)
  dir.create("R_markdowns", recursive = TRUE, showWarnings = FALSE)
  dir.create("R_scripts", recursive = TRUE, showWarnings = FALSE)
  dir.create("R_scripts/archive", recursive = TRUE, showWarnings = FALSE)
  dir.create("reports", recursive = TRUE, showWarnings = FALSE)
  
  # create data folders
  if (dots[["data_external"]]) {
    dir.create("data_raw/external", recursive = TRUE, showWarnings = FALSE)
  }
  if (dots[["data_field"]]) {
    dir.create("data_raw/field", recursive = TRUE, showWarnings = FALSE)
  }
  if (dots[["data_literature"]]) {
    dir.create("data_raw/literature", recursive = TRUE, showWarnings = FALSE)
  }
  if (dots[["data_spatial"]]) {
    dir.create("data_raw/spatial", recursive = TRUE, showWarnings = FALSE)
  }
  
  # create create_reports.R
  create_docs <- paste(
    '##################################',
    '#####     Create reports     #####',
    '##################################',
    '',
    '# Compile .Rmd documents as a webpage and/or HTML reports',
    '',
    '# Packages',
    'library(rmarkdown)',
    'library(katereR)',
    '',
    '##### Create docs for website #####',
    '# Render to /docs',
    '',
    'rmarkdown::render_site("example")',
    '',
    '##### Standalone HTML docs #####',
    '# Render to /reports',
    '',
    '# Index',
    'katereR::render_report("R_markdowns/index.Rmd",',
    '                       output_file = "../reports/index.html")',
    '',
    '# 01 Metadata',
    'katereR::render_report("R_markdowns/01_metadata.html",',
    '                       output_file = "../reports/01_metadata.html")',
    '',
    '# 02 Data wrangling',
    'katereR::render_report("R_markdowns/02_data_wrangling.html",',
    '                       output_file = "../reports/02_data_wrangling.html")',
    sep = '\n'
  )
  writeLines(create_docs, "R_scripts/create_docs.R")

  
  ##### CREATE _site.yml FOR WEBSITE #####
  
  if (dots[["website"]]) {
    
    # create site YAML
    site_yml <- paste(
      paste0('name: "', dots[["project_name"]], '"'),
      'output_dir: "../docs"',
      'navbar:',
      paste0('  title: "', dots[["project_name"]], '"'),
      '  left:',
      '  - text: "Project home"',
      '    href: index.html',
      '    icon: fa-home',
      '  - text: "Data"',
      '    href: "01_metadata_html"',
      '    icon: fa-table',
      '  - text: "Analyses"',
      '    menu:',
      '    - text: "Data wrangling"',
      '      href: "02_data_wrangling.html"',
      '    - text: "First analysis"',
      '      href: "03_first_analysis.html"',
      '    icon: fa-chart-line',
      '  right:',
      paste0('  - href: https://github.com/katekathrynkat/', path, '/'),
      '    icon: fa-github',
      sep = "\n"
    )
    writeLines(site_yml, "R_markdowns/_site.yml")
  }
 
}
