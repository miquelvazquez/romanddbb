#----------------------
# Get phenotype data
#----------------------

#' @export
roman_ddbb.phen <- function(
	dir_file, 
	dir_url,
 	filter)
{
### require enviroments
	roman_ddbb.required_packages()
	roman_ddbb.theme_ggplot_set()


### arg
  # group <- match.arg(group) 
  
  if(missing(dir_file) & missing(dir_url)) {
    dir_file <- roman_ddbb.phendir()
		dir_url <- roman_ddbb.phenurl()[['l_url']]
  }
	
	# double_check
  	stopifnot(file.exists(dir_file))

  if(!missing(filter)) {
    stopifnot(class(filter) == 'character')
  }
  

### predefined 'locale' config
	options(datatable.fread.dec.locale = 'en_US.UTF-8')	


### read data in 'dat_url'
	dat_imp_url <- dir_url %>% 
  	lapply(read_html) %>% 
  	map(html_nodes, 'table') %>%
		map(html_table, fill = TRUE)


### read data to 'dat_file'
	dat_file <- list.files(dir_file, pattern = '.csv', recursive = TRUE)
	dat_imp_file <- lapply(dat_file, fread, sep = ';', dec = ',')
	

### update 'dat_imp'
  dat_imp_url <- roman_ddbb.update.dat_imp_url(dat_imp_url)
	# dat_imp_file <- roman_ddbb.update.dat_imp_file(dat_imp_file)


# return
	return(dat_imp_url)
}

