#-------------------------------------------------
# modify 'dat_imp' in 'romanddbb.phen.R'
# argument choise 'group_ddbb'
# argument choise 'dinasty_gr'
#-------------------------------------------------

### update group 'dat_imp' by argument 'amphitheaters'----------------------------------------------

roman_ddbb.update.dat_group_ddbb <- function(
  dat_imp,
  group_ddbb
  emperor_dinasty)
{
### create list of 'amphi_dinasty'

  # list of 'amphitheaters' dates
  l_amphi_republic <- c('republican', 'caesarean')
  l_amphi_julio <- c(
    'augustan', 'tiberian', 'caligulan', 'claudian', 'neronian', 'julio_claudian',
    '1st_century', 'early_1st', 'late_1st')
  l_amphi_flavian <- c('flavian', '1st_century', 'late_1st')
  l_amphi_ulpian <- c('ulpio_aelian', 'trajanic', 'hadrianic', '2nd_century', 'early_2nd')
  l_amphi_antonine <- c('antonine', '2nd_century', 'late_2nd')
  l_amphi_severan <- c('severan', '2nd_century', 'late_2nd', '3rd_century')
  l_amphi_barrack <- c('3rd_century', 'late_3rd')
  l_amphi_tetrarchy <- c('3rd_century', 'late_3rd', '4th_century')
  l_amphi_rest <- c('principate', 'undated')


###


### avoid rubish elements
  rm(list = setdiff(ls(), c('dat')))

### returns
  return(dat_imp)
}
