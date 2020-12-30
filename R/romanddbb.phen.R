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
    'julio_claudian', 'four_emperors', 'flavian', 'ulpia_aelia', 'antonine', 'severan',
    'six_emperors', 'barrack_emperors',
    'tetrarchy', 'constantinian', 'valentinian',
    'theodosian', 'western', 'leonid'),
 	filter,
  dir)
{

### match arguments
	gr_ddbb <- match.arg(gr_ddbb)
	gr_amphitheaters <- match.arg(gr_amphitheaters)
	emperor_dinasty <- match.arg(emperor_dinasty)


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
	l_amphitheathers <- romanddbb.phen.reads_dtblock(l_files_dt[['roman_amphitheaters']])



### arguments
	if(gr_ddbb == 'amphitheaters' & gr_amphitheaters == 'none') {
				
		# manage 'data'
			dat <- l_amphitheathers %>% 
				bind_rows()
		
	} else if (gr_ddbb == 'amphitheaters' & gr_amphitheaters != 'none') {
		
		# manage 'data'
			dat <- l_amphitheathers %>%
				bind_rows() %>%
				filter_at(vars('dinasty_gr'), ~ . %in% gr_amphitheaters)

	}


### show data by 'tidyverse'
  dat <- dat %>%
    as_tibble()	


### return
	return(dat)
}
