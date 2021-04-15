#!/usr/bin/env Rscript --vanilla --no-save
library(knitr)
library(argparse)

parser <- ArgumentParser()

# specify our desired options
# by default ArgumentParser will add an help option

parser$add_argument("-t", "--token",
                    type = "character",
                    help = "LD-Link API access token. If you don't have one go here: https://ldlink.nci.nih.gov/?tab=apiaccess",
                    metavar = "LD-Link API token")
parser$add_argument("-i", "--input-file",
                    type = "character",
                    help = "Rmd file to knit",
                    default="VD_COVID_MR_ALL.Rmd",
                    metavar = "Rmd File")
parser$add_argument("-o", "--outcome-file",
                    type = "character",
                    help = "Outcomes file to knit",
                    metavar = "Outcome File")
parser$add_argument("-f", "--output-file",
                    type = "character",
                    help = "Output filename",
                    default = NULL,
                    metavar = "pdf document")
  

# get command line options, if help option encountered print help and exit,
# otherwise if options not found on command line then set defaults, 
args <- parser$parse_args()

rmarkdown::render(
  input = "VD_COVID_MR_ALL.Rmd",
  output_format = "pdf_document",
  params = list(LDLink_token = args$token,
                skip_LD_api = FALSE,
                use_cache=FALSE,
                outcome_file = args$outcome_file),
  output_file = args$output_file
  )
