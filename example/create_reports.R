##################################
#####     Create reports     #####
##################################

# Compile .Rmd documents as HTML reports

##### Create docs for website #####
# Knit to /docs

rmarkdown::render_site('example')


### IS THIS NECESSARY?!?!?!?!?!
file.create("docs/.nojekyll") # tell GitHub to not use Jekyll

##### Standalone HTML docs #####
# Knit to /reports

# Index
katereR::render_report("R_markdowns/index.Rmd",
                       output_file = "../reports/index.html")

# 01 Metadata
katereR::render_report("R_markdowns/01_metadata.html",
                       output_file = '../reports/01_metadata.html')

# 02 Data wrangling
katereR::render_report("R_markdowns/02_data_wrangling.html",
                       output_file = '../reports/02_data_wrangling.html')
