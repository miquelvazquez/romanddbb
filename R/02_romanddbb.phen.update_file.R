#----------------------------------------
# Update 'dat_imp' in 'romanddbb.phen.R'
#----------------------------------------

### update group 'dat_imp' by type of ddbbd

roman_ddbb.update.dat_imp_list <- function(dat_list)
{
### database of roman emperors (dat_list[[1]])
### database of roman amphitheaters (dat_list[2:48])
  dat_amphi_imp <- bind_rows(dat_list[2:48])

### redone 'dat_imp'
  dat_imp <- list(dat_list[[1]], dat_amphi_imp)

### returns
  return(dat_imp)
}



### update amphitheaters ddbb in 'dat_imp[[2]]'

roman_ddbb.update.dat_imp <- function(dat_imp)
{






### return
  return(dat_imp)
}
