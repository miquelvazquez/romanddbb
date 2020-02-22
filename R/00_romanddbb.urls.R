#-------------------------
# 'romanddbb' list of url
#-------------------------


#' @export
roman_ddbb.phenurl <- function()
{
	# list of url
	n_url <- c('url_1')  

	# url
  l_url <- c('https://la.wikipedia.org/wiki/Tabula_successionis_provinciarum_Romanarum')

  # list
  url_ddbb <- list(
		l_url = l_url,
    descriptions_url = c(as.character(roman_ddbb.l_url.descriptions()[n_url])))

  # return
  return(url_ddbb)
}



#-------------------------------------
# Descriptions to list of url sources
#-------------------------------------

roman_ddbb.l_url.descriptions <- function(url)
{
# 'url' list
	covlist <- list(
	  url_1 = c('url_1: list of roman provinces'))

	# select traits
	  if(!missing(url)) {
	    stopifnot(all(url %in% names(covlist)))
	    covlist <- covlist[[url]]

	# case of a single trait
	  if(length(url)) {
	    covlist <- unlist(covlist)
	    }
  }
	# return
  return(covlist)
}
