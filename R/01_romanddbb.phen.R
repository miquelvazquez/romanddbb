#----------------------
# Get phenotype data
#----------------------

#' @export
roman_ddbb.phen <- function(
   group_ddbb = c('roman_emperors', 'amphitheaters', 'none'),
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
  dir)
{

### match arguments
	group_ddbb <- match.arg(group_ddbb)
	amphitheaters_gr <- match.arg(amphitheaters_gr)
	emperor_dinasty <- match.arg(emperor_dinasty)


### require enviroments
	roman_ddbb.required_packages(
		locale = 'es_ES.UTF-8')


### argument #03
  if(!missing(filter)) {
    stopifnot(class(filter) == 'character')
  }


### argument #04
  if(missing(dir)) {
    dir <- roman_ddbb.phendir()
	}

	# double_check #04_01
  	stopifnot(file.exists(dir))

	
	# list of files from 'dir'
		l_files_dt <- roman_ddbb.00_phen.list_dt_block(home_dir = dir)	


	# read each file in 'l_files_dt'
		dt_block <- romanddbb.stats.reads_dtblock(l_files = l_files_dt)
	

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
