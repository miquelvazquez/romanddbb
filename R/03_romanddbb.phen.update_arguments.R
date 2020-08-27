#----------------------------------------
# modify 'dat_imp' in 'romanddbb.phen.R'
# argument 'amphitheaters'
#----------------------------------------

### update group 'dat_imp' by argument 'amphitheaters'----------------------------------------------

roman_ddbb.update.dat_imp_list <- function(dat_imp)
{
### modify 'dat_imp[[1]]'
  dat_emperors <- dat_imp[[1]] %>%
    slice(rep(1:n(), each = nrow(dat_imp[[2]])))

### avoid rubish elements
  rm(list = setdiff(ls(), c('dat')))

### returns
  return(dat_imp)
}
