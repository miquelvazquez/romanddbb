#----------------------
# Get phenotype data
#----------------------

#' @export
roman_ddbb.phen <- function(
   group_ddbb = c('amphitheaters', 'roman_emperors', 'none'),
   amphitheaters_gr = c(
    'republican', 'caesarean',
   	'1st_century', 'early_1st', 'late_1st', 
    'julio_claudian', 'augustan', 'tiberian', 'caligulan', 'claudian', 'neronian', 'flavian',
    '2nd_century', 'early_2nd', 'late_2nd', 'ulpio_aelian', 'trajanic', 'hadrianic', 'antonine',
    '3rd_century', 'late_3rd', 'severan', 'principate',
    '4th_century', 'undated'),     
   emperor_dinasty = c(
    'julio_claudian', 'four_emperors', 'flavian', 'ulpia_aelia', 'antonine', 'severan',
    'six_emperors', 'barrack_emperors',
    'tetrarchy', 'constantinian', 'valentinian',
    'theodosian', 'western', 'leonid'),
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


### group 'dat_imp' by type of ddbbd in '02_romanddbb.phen.update_file.R' file
  dat_imp <- roman_ddbb.update.datimp_list(dat_list)


### arguments for 'group_ddbb' in '03_romanddbb.phen.update_arguments.R' file
  dat <- roman_ddbb.update.dat_group_ddbb(
    dat_imp,
    group_ddbb,
    amphitheaters_gr,
    emperor_dinasty)


### show data by 'tidyverse'
  dat <- dat %>%
    as_tibble()


### return
	return(dat)
}
