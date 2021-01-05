#----------------------
# Phen directories
#---------------------

#' @export
roman_ddbb.phendir <- function()
{
### databases from 'datasets'
  nodename <- Sys.info()[["nodename"]]

  switch(nodename,
			'annamiquel-H110M-S2H' = '~/my_git/romanddbb/data',
			'DESKTOP-6P8VLTV' = '~/my_git/romanddbb/data',
   
  stop(paste0("`nodemname` (", nodename, ") is unknown")))
}



#------------------------
# load required packages
#------------------------


roman_ddbb.required_packages <- function(
	locale = 'es_ES.UTF-8',
	update_packages = FALSE)
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
    rmarkdown, knitr, prettydoc, DT, car,
    tidyr, stringr, janitor, broom, extrafont,
    install = TRUE,
		update = update_packages)


### screen width
	if(R.Version()$os == 'linux-gnu') {
 		options(width = 150)
	}


### rm funtions 'R.profile'
	rm(list = ls(all = TRUE))
}
