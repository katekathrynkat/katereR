library(usethis)
library(renv)

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
    paste0("View analyses at https://katekathrynkat.github.io/", path),
    "",
    "## Directory structure",
    "",
    "    .",
    "    ├── data_raw         # Raw data files",
    "        ├── external         # Data from external sources",
    "        ├── field            # Field/lab measurements",
    "        ├── literature       # Data compiled from the literature",
    "        └── spatial          # Maps and other spatial files",
    "    ├── docs             # Documents summarizing analyses (.html compiled from .Rmd)",
    "    ├── output           # Figures (.png) and data (.csv) generated during analyses",
    "    ├── R_markdowns      # Code for analyses (.Rmd)",
    "    ├── R_scripts        # Scripts containing source code, functions, etc. (.R)",
    "        └── archive          # Unorganized snippets of ill-fated code (view at your own risk)",
    "    └── README.md        # You are here",
    "",
    "-----",
    "",
    "**Contact:** Kate Culhane, kathrynculhane@ucsb.edu",
    sep = '\n'
    )
    writeLines(readme, "README.md", useBytes = TRUE)
    
    
    ##### CREATE INITIAL R SCRIPT #####
    
    temp_script <- paste(
      "# Temporary R script for initializing a project",
      "# DELETE AFTER USE",
      "",
      "# Create license",
      "usethis::use_mit_license('Kathryn Culhane')",
      "",
      "# Initialize renv",
      "renv::init()",
      "",
      "# Start git repo",
      "usethis::use_git(message = 'initial commit')",
      "usethis::use_github(protocol = 'https')",
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
  create_reports <- paste(
    "##################################",
    "#####     Create reports     #####",
    "##################################",
    "",
    "# Compile .Rmd documents as HTML reports",
    "# Save in folder 'docs'",
    "",
    "# Index",
    "rmarkdown::render('code/00_index.Rmd', output_file = '../docs/index.html')",
    "",
    "# 01 Metadata",
    "rmarkdown::render('code/01_metadata.Rmd', output_file = '../docs/01_metadata.html')",
    "",
    "# 02 Data wrangling",
    "rmarkdown::render('code/02_data_wrangling.Rmd', output_file = '../docs/02_data_wrangling.html')",
    "",
    "# 03 First analysis",
    "rmarkdown::render('code/03_first_analysis.Rmd', output_file = '../docs/03_first_analysis.html')",
    sep = "\n"
  )
  writeLines(create_reports, "R_scripts/create_reports.R")

  
  ##### CREATE FILES FOR WEBSITE #####
  
  if (dots[["website"]]) {
    
    # create site YAML
    site_yml <- paste(
      paste0('name: "', path, '"'),
      'navbar:',
      paste0('  title: "', dots[["project_name"]], '"'),
      '  left:',
      '    - text: "Home"',
      '      icon: fa-home',
      '      href: home.html',
      '    - text: "Data"',
      '      icon: table',
      '      menu:',
      '        - text: "Metadata"',
      '          href: 01_metadata.html',
      '       - text: "Data wrangling"',
      '         href: 02_data_wrangling.html',
      '    - text: "Analyses"',
      '      icon: chart-line',
      '      menu:',
      '        -text: "First analysis"',
      '         href: 03_first_analysis.html',
      '  right:',
      '    - icon: fa-github',
      paste0('    - href: https://github.com/katekathrynkat/', path),
      'output_dir: "docs"',
      sep = "\n"
    )
    writeLines(site_yml, "docs/_site.yml")
    
    # create .nojekyll file
    file.create("docs/.nojekyll")
  }
 
}
