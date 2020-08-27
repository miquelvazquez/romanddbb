#----------------------
# Get phenotype data
#----------------------

#' @export
roman_ddbb.phen <- function(
	dir_file,
  # group_ddbb = c(
    # 'amphitheaters', 'none'),
  # dinasty_gr = c(
    # 'julio_claudian', 'four_emperors', 'flavian', 'ulpia_aelia', 'antonine', 'severan',
    # 'six_emperors', '3th_century',
    # 'tetrarchy', 'constantinian', 'valentinian',
    # 'theodosian', 'western', 'leonid', 'none'),
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
	options(datatable.fread.dec.locale = 'es_ES.UTF-8') ## 'locale' configuration


### read data in 'dat.file'
  dat_list <- lapply(
    dat_file,
    fread,
    sep = ';',
    dec = '.',
    na.strings = c('', 'NA'))


### double_check #01
  sum(sapply(lapply(dat_list[1], dim), '[[', 1)) == '109' ## 'dim()' of emperors ddbbd
  sum(sapply(lapply(dat_list[2:48], dim), '[[', 1)) == '1242' ## 'dim()' of amphitheaters ddbbd


### group 'dat_imp' by type of ddbbd
  dat_imp <- roman_ddbb.update.dat_imp_list(dat_list)


### arguments for 'group_ddbb'
  if(group_ddbb == 'amphitheaters') {
    ### argument 'dinasty_gr'
      if(dinasty_gr != 'none'){
        ###slice
      }

  } else if(group_ddbb == 'none' & dinasty_gr == 'none') {
    ### dat_imp
  }


### return
	return(dat_imp)
}
