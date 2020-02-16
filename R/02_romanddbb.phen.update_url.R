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


### updates
	dat_imp_url[[1]] <- dat_imp_url[[1]] %>%
			clean_names(case = 'snake') %>%
	    remove_empty(which = 'cols') %>%
			separate(
				birth, c('birth_1', 'birth_2', 'birth_3', 'birth_4'), 
				sep = ',', remove = FALSE, extra = 'drop', fill = 'right') %>%
			separate(
				reign, c('reign_1', 'reign_2', 'reign_3', 'reign_4', 'reign_5', 'reign_6', 'reign_7'), 
				sep = ' ', remove = FALSE, extra = 'drop', fill = 'right') %>%
			separate(name, c('name_emp', 'titles_emp'), 
				sep = '[a-z]+', remove = FALSE)
			
			
	}

	# return
	return(dat_imp_url)		
}


#	mutate(name_emp = factor(paste0(name_emp_1, name_emp_2))) %>%
#	separate(name, c('name_emp_1', 'titles_emp'), 
#		sep = '[a-z]+', remove = FALSE) %>%
#	separate(name, c('titles_emp_1', 'name_emp_2'), 
#		sep = '[A-Z]+', remove = FALSE) %>%
#	select(
#		birth, starts_with('birth_'), 
#		reign, starts_with('reign_'))
