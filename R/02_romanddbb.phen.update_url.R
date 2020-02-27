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
	dat_imp_url_1 <- dat_imp_url[[1]] %>%
		select(-Portrait) %>%
		clean_names(case = 'snake') %>%
	  remove_empty(which = 'cols') %>%
		mutate(
			dinasty = factor(
				ifelse(str_detect(name, paste(roman_ddbb.l_emp.julio_claudian()[[1]], collapse = '|')), 'julio_claudian',
				ifelse(str_detect(name, paste(roman_ddbb.l_emp.four_emperors()[[1]], collapse = '|')), 'four_emperors',
				ifelse(str_detect(name, paste(roman_ddbb.l_emp.flavian()[[1]], collapse = '|')), 'flavian',
				ifelse(str_detect(name, paste(roman_ddbb.l_emp.ulpia()[[1]], collapse = '|')), 'ulpia_aelia',
				ifelse(str_detect(name, paste(roman_ddbb.l_emp.antonine()[[1]], collapse = '|')), 'antonine',
				ifelse(str_detect(name, paste(roman_ddbb.l_emp.severan()[[1]], collapse = '|')), 'severan',
				ifelse(str_detect(name, paste(roman_ddbb.l_emp.six()[[1]], collapse = '|')), 'six_emperors',
				ifelse(str_detect(name, paste(roman_ddbb.l_emp.3th_century()[[1]], collapse = '|')), 'militar_anarchy',
				ifelse(str_detect(name, paste(roman_ddbb.l_emp.tetrarchy()[[1]], collapse = '|')), 'tetrarchy',
				ifelse(str_detect(name, paste(roman_ddbb.l_emp.constantinian()[[1]], collapse = '|')), 'constantinian',
				ifelse(str_detect(name, paste(roman_ddbb.l_emp.valentinian()[[1]], collapse = '|')), 'valentinian',
				ifelse(str_detect(name, paste(roman_ddbb.l_emp.theodosian()[[1]], collapse = '|')),  'theodosian',
				ifelse(str_detect(name, paste(roman_ddbb.l_emp.western()[[1]], collapse = '|')), 'western_emperors',
				ifelse(str_detect(name, paste(roman_ddbb.l_emp.leonid()[[1]], collapse = '|')), 'leonid',	
				NA)))))))))))))))) %>%
		mutate(
			dinasty = factor(
				ifelse(str_detect(name, 'Claudius Gothicus'), 'militar_anarchy', paste0(dinasty)),
				levels = c('julio_claudian', 'four_emperors', 'flavian', 'ulpia_aelia', 'antonine', 'severan',
					'six_emperors', 'militar_anarchy', 'tetrarchy', 'constantinian', 'valentinian',
					'theodosian', 'western_emperors', 'leonid')))	%>%
		mutate(
			co_emperor = factor(
				ifelse(str_detect(name, 'with\n'), 'co_emperor', 'unique_emperor'),
				levels = c('unique_emperor', 'co_emperor'))) %>%
		group_by(co_emperor) %>%
		group_nest()

	# return
	return(dat_imp_url)		
}
