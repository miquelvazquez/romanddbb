#---------------------------------------------------------------------------------
# functions to manage 'romanddbb' package
# read several dtaset from each 'dt_blocks' by 'romanddbb.stats.reads_dtblocks()'
#---------------------------------------------------------------------------------



### read several datasets---------------------------------------------------------------------


#' @export
romanddbb.phen.reads_dtblock <- function(
  l_files)
{
### list
	l_dt <- list()


	for(i in seq_along(l_files)) {
  	dt <- lapply(
  		l_files[[i]],
  		fread,
  		sep = ';',
  		dec = '.',
  		na.strings = c('', 'NA'))

  	# save in a list
  		l_dt[[length(l_dt) + 1]] = dt
	}


### unlist()
  l_dt <- unlist(l_dt, recursive = FALSE)


### kept only few elements in the environment
  rm(list = setdiff(ls(), 'l_dt'))


### return
	return(l_dt)
}
