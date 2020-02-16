#----------------------------
# Update 'roman_ddbb.phen()' 
#----------------------------

### list of whole roman emperors 'dat_imp_url[c(1:13)]'
### list of whole bizantine emperors 'dat_imp_url[c(14:30)]'


roman_ddbb.update.dat_imp_url <- function(dat_imp_url)  	
{
### update data from 'dat_imp_url[c(1:13)]'
  for(i in 1:13) {
		dat_imp_url[[i]] <- dat_imp_url[[i]] %>%
			clean_names(case = 'snake') %>%
	    remove_empty(which = 'cols') %>%
			separate(name, c('name_emp_1', 'titles_emp'), sep = '[a-z]+', remove = FALSE) %>%
			separate(name, c('titles_emp_1', 'name_emp_2'), sep = '[A-Z]+', remove = FALSE) %>%
			mutate(name_emp = factor(paste0(name_emp_1, name_emp_2))) %>%
			separate(birth, c('d_month_day', 'd_year', 'ancient_city', 'ancient_province'), 
				sep = ',', remove = FALSE, extra = 'drop') %>%
			separate(reign, c('ini_imp_year', 'end_imp_year'), sep = '-', remove = FALSE, extra = 'drop') %>%
			separate(ini_imp_year, c('ini_imp', 'ini_year'), sep = ',', remove = FALSE, extra = 'drop') %>%
			separate(end_imp_year, c('end_imp', 'end_year'), sep = ',', remove = FALSE, extra = 'drop')
	}

	# return
	return(dat_imp_url)		
}
