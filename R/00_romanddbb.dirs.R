#----------------------
# Phen directories
#---------------------

#' @export
roman_ddbb.phendir <- function()
{
### databases from 'datasets'
  nodename <- Sys.info()[["nodename"]]

  switch(nodename,
			'annamiquel-H110M-S2H' = '~/git_roman/romanddbb/data',
			'DESKTOP-6P8VLTV' = '~/git_roman/romanddbb/data',
   
  stop(paste0("`nodemname` (", nodename, ") is unknown")))
}



#------------------------
# load required packages
#------------------------


roman_ddbb.required_packages <- function(
	locale = 'es_ES.UTF-8')
{
### predefined 'locale' config
	options(datatable.fread.dec.locale = 'es_ES.UTF-8') ## 'locale' configuration


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
		plyr, Hmisc, reshape, reshape2, viridis, scales, magrittr, gtools,
    gridExtra, rmarkdown, knitr, prettydoc, DT, car,
    nlme, readxl, tidyr, stringr, janitor, broom, extrafont,
    install = TRUE)


### screen width
	if(R.Version()$os == 'linux-gnu') {
 		options(width = 150)
	}


### rm funtions 'R.profile'
	rm(list = ls(all = TRUE))
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
