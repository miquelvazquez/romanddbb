#----------------------
# Get phenotype data
#----------------------

#' @export
roman_ddbb.phen <- function(
	dir_file,
 	filter)
{
### require enviroments
	roman_ddbb.required_packages()


### arg
  # group <- match.arg(group)

  if(missing(dir_file)) {
    dir_file <- roman_ddbb.phendir()
	}

	# double_check
  	stopifnot(file.exists(dir_file))

  if(!missing(filter)) {
    stopifnot(class(filter) == 'character')
  }


### read data to 'dat_file'
  dat_file <- list.files(
    dir_file,
    pattern = '.csv',
    full.names = TRUE,
    recursive = TRUE)


### predefined 'locale' config
	options(datatable.fread.dec.locale = 'es_ES.UTF-8')


### read data in 'dat.file'
  dat_imp <- lapply(
    dat_file,
    fread,
    sep = ';',
    dec = '.',
    na.strings = c('', 'NA'))


### update 'dat_imp'
	## dat_imp_file <- roman_ddbb.update.dat_imp_file(dat_imp_file)


# return
	return(dat_imp)
}
