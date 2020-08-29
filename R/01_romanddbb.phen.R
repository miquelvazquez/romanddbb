#----------------------
# Get phenotype data
#----------------------

#' @export
roman_ddbb.phen <- function(
   group_ddbb = c('amphitheaters', 'none'),
   emperor_dinasty = c(
    'julio_claudian', 'four_emperors', 'flavian', 'ulpia_aelia', 'antonine', 'severan',
    'six_emperors', 'barrack_emperors',
    'tetrarchy', 'constantinian', 'valentinian',
    'theodosian', 'western', 'leonid', 'none'),
 	filter,
  dir_file)
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
	options(datatable.fread.dec.locale = 'es_ES.UTF-8') ## 'locale' configuration


### read data in 'dat.file'
  dat_list <- lapply(
    dat_file,
    fread,
    sep = ';',
    dec = '.',
    na.strings = c('', 'NA'))


### double_check #01
  ## sum(sapply(lapply(dat_list[1], dim), '[[', 1)) == '109' ## 'dim()' of emperors ddbbd
  ## sum(sapply(lapply(dat_list[2:48], dim), '[[', 1)) == '1242' ## 'dim()' of amphitheaters ddbbd


### group 'dat_imp' by type of ddbbd
  dat_imp <- roman_ddbb.update.datimp_list(dat_list)


### arguments for 'group_ddbb'
  dat <- roman_ddbb.update.dat_group_ddbb(
    dat_imp,
    group_ddbb,
    emperor_dinasty)


### return
	return(dat)
}
