#--------------------------------------------------------
# modify 'dat_imp' in 'romanddbb.phen.R'
# 'roman_ddbb.update.dat_group_ddbb()'
# argument choise 'group_ddbb'
# argument choise 'emperor_dinasty' | 'amphitheaters_gr'
#--------------------------------------------------------



### update group 'dat_imp' by argument 'amphitheaters'----------------------------------------------

roman_ddbb.update.dat_group_ddbb <- function(
  dat_imp,
  group_ddbb,
  amphitheaters_gr,
  emperor_dinasty)
{
### description function



### argument 'amphitheaters' data
  if(group_ddbb == 'none' & missing(amphitheaters_gr) & missing(emperor_dinasty)) {
    
    ### update
      dat <- dat_imp


    ### 'names()'
      names(dat) <- paste0('emperors_ddbb', 'amphitheaters_ddbb')


  } else if(group_ddbb == 'roman_emperors' & missing(amphitheaters_gr) & !missing(emperor_dinasty)) {
    
    ### update
      dat <- dat_imp[[1]] %>%
        filter(across(any_of('dinasty_1'), ~ . %in% emperor_dinasty))


	} else if(group_ddbb == 'amphitheaters' & !missing(amphitheaters_gr) & missing(emperor_dinasty)) {
		
		### update
			dat <- dat_imp[[2]] %>%
        filter(across(any_of('dinasty_gr'), ~ . %in% amphitheaters_gr))
        
  } else if(group_ddbb == 'amphitheaters' & !missing(amphitheaters_gr) & !missing(emperor_dinasty)) {
  
  	### update
  		dat <- dat_imp[[2]]
  }



### avoid rubish elements
  rm(list = setdiff(ls(), c('dat')))

### returns
  return(dat)
}
