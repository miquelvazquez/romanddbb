#-----------------------------------------
# update 'dat_list' in 'romanddbb.phen.R'
#-----------------------------------------

### update group 'dat_list' by type of ddbbd--------------------------------------------------------

roman_ddbb.update.dat_imp_list <- function(dat_list)
{
### database of roman emperors (dat_list[[1]])
### database of roman amphitheaters (dat_list[2:48])
  dat_amphi_imp <- bind_rows(dat_list[2:48])

### redone 'dat_imp'
  dat_imp <- list(dat_list[[1]], dat_amphi_imp)

### avoid rubish elements
  rm(list = setdiff(ls(), c('dat_imp')))

### returns
  return(dat_imp)
}
