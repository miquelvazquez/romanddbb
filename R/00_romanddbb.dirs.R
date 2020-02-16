#----------------------
# Phen directories
#---------------------

#' @export
roman_ddbb.phendir <- function()
{
### databases from 'datasets'
  nodename <- Sys.info()[["nodename"]]
  
  switch(nodename,
			'annamiquel-H110M-S2H' = '~/roman_datasets/',
    stop(paste0("`nodemname` (", nodename, ") is unknown")))
}



#------------------------
# load required packages
#------------------------


roman_ddbb.required_packages <- function()
{
	### repositories
	local({r <- getOption('repos')
    r['CRAN'] <- 'https://cloud.r-project.org/'
    options(repos = r)})

	### funtion to auto_load
	auto_load <- function(a.package){
		suppressWarnings(suppressPackageStartupMessages(
   	library(a.package, character.only = T)))
	}

	### list of packages
	pacman::p_load(
    tidyverse, lubridate, data.table, testthat, assertthat,
		rvest, plyr, Hmisc, reshape, viridis, scales, magrittr, gtools,
    gridExtra, rmarkdown, knitr, prettydoc, DT, car,
    nlme, readxl, tidyr, stringr,
    janitor, broom, tidymodels, extrafont,
    install = TRUE)

if(R.Version()$os == 'linux-gnu') {
	### option screen 'width'
 	options(width = 150)
	}

	### rm funtions `R.profile`
	rm(list = ls(all = T))
}



#------------------
# load theme_set()
#------------------

roman_ddbb.theme_ggplot_set <- function()
{
# setup 'ggplot'
  theme_set(theme_light() +
    theme(
    	legend.position = 'right',
    	text = element_text(family = 'Georgia'),
      plot.title = element_text(size = 12, hjust = .5, face = 'bold'),
      axis.text.x = element_text(size = 9, angle = 45, hjust = .95, vjust = .9),
      axis.title = element_text(size = 12, face = 'bold')))
}
