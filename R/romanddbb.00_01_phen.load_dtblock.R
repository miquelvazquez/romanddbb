#--------------------------------------------------------------------------------
# list of files to load managed by 'romanddbb.phen.R' 
# read several dtaset from each dt_blocks by 'roman_ddbb.00_phen.list_dtblock()'
#--------------------------------------------------------------------------------



### list file to load---------------------------------------------------------------------


roman_ddbb.phen.list_dtblock <- function(
	home_dir)
{
### 'list.dirs()'
  l_dir <- list.dirs(
  	path = home_dir,
  	recursive = FALSE)


### 'list.files()'
	l_files <- list()

	for(i in seq_along(l_dir)) {

  	file <- list.files(
  		path = l_dir[i],
  		pattern = '.csv',
  		full.names = TRUE,
  		recursive = TRUE)

  	# save in a list
  		l_files[[length(l_files) + 1]] = file
	}


### 'names()'
	names(l_files) <- substring(
    basename(list.dirs(path = home_dir, recursive = FALSE)), first = 4)


### kept only few elements in the environment
  rm(list = setdiff(ls(), 'l_files'))


### return
	return(l_files)
}
