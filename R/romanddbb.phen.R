#----------------------
# Get phenotype data
#----------------------

#' @export
roman_ddbb.phen <- function(
   gr_ddbb = c('roman_emperors', 'amphitheaters', 'none'),
   gr_amphitheaters = c(
    'republican', 'caesarean',
   	'1st_century', 'early_1st', 'late_1st', 
    'julio_claudian', 'augustan', 'tiberian', 'caligulan', 'claudian', 'neronian', 'flavian',
    '2nd_century', 'early_2nd', 'late_2nd', 'ulpio_aelian', 'trajanic', 'hadrianic', 'antonine',
    '3rd_century', 'late_3rd', 'severan', 'principate',
    '4th_century', 'undated', 'none'),  
   emperor_dinasty = c(
		'julio_claudian', 
		'four_emperors', 'flavian',
		'nerva_antonine', 'ulpia_aelian', 'antonine', 'five_emperors', 'severan',
		'barrack_emperors', 'gordian', 'dacian', 'caran', 'diarchy', 'tetrarchy',
    '1st_tetrarchy', '2nd_tetrarchy', '3rd_tetrarchy', '4th_tetrarchy', '5th_tetrarchy', '6th_tetrarchy', 		 			'constantinian', 'valentinian', 'theodosian', 'valerian',
		'last_emperors', 'leonid', 'no_dinasty', 'none'),
 	filter,
  dir)
{

### match arguments
	gr_ddbb <- match.arg(gr_ddbb)

	gr_amphitheaters <- match.arg(
		gr_amphitheaters, several.ok = TRUE)

	emperor_dinasty <- match.arg(
		emperor_dinasty, several.ok = TRUE)


### require enviroments
	roman_ddbb.required_packages(
		locale = 'es_ES.UTF-8',
		update_packages = FALSE)


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

	
### list of files from 'dir'
	l_files_dt <- roman_ddbb.phen.list_dtblock(home_dir = dir)	


### read all 'ddbb'
	l_emperors <- romanddbb.phen.reads_dtblock(l_files_dt[['roman_emperors']])
	l_amphitheaters <- romanddbb.phen.reads_dtblock(l_files_dt[['roman_amphitheaters']])



### update 'l_emperors'
### update 'l_amphitheathers'
	l_amphitheaters <- roman_ddbb.phen.update_amphi(l_amphitheaters)


### arguments
	if (gr_ddbb == 'amphitheaters' & all(gr_amphitheaters == 'none')) {
				
		# manage 'data'
			dat <- l_amphitheaters %>% 
				bind_rows()
		
	} else if (gr_ddbb == 'amphitheaters' & any(gr_amphitheaters != 'none')) {
		
		# manage 'data'
			dat <- l_amphitheaters %>%
				bind_rows() %>%
				filter_at(vars('dinasty_gr'),  all_vars(. %in% gr_amphitheaters))

	} else if (gr_ddbb == 'roman_emperors' & all(emperor_dinasty == 'none')) {
	
		# manage 'data'
			dat <- l_emperors[[1]]
			
	} else if (gr_ddbb == 'roman_emperors' & any(emperor_dinasty != 'none')) {

		# manage 'data'
			dat <- l_emperors[[1]] %>%
				filter_at(vars(starts_with('dinasty_')), any_vars(. %in% emperor_dinasty))

	}


### show data by 'tidyverse'
  dat <- dat %>%
    as_tibble()	


### return
	return(dat)
}
