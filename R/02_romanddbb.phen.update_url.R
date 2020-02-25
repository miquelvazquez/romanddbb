#----------------------------
# Update 'roman_ddbb.phen()' 
#----------------------------

### list of whole roman emperors 'dat_imp_url[[1]][c(1:13)]'
### list of whole bizantine emperors 'dat_imp_url[[1]][c(14:30)]'

roman_ddbb.update.dat_imp_url <- function(
	dat_imp_url,
	dat_imp_file)  	
{
### 'ldply()' for 'dat_imp_url[[1]][c(1:13)]'
	dat_imp_url[[1]] <- ldply(dat_imp_url[[1]][1:13], data.frame)


### update
	dat_imp_url[[1]] <- dat_imp_url[[1]] %>%
		select(-Portrait) %>%
		clean_names(case = 'snake') %>%
	  remove_empty(which = 'cols')

	# return
	return(dat_imp_url)		
}
