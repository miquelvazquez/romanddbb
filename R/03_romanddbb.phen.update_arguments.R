#----------------------------------------
# modify 'dat_imp' in 'romanddbb.phen.R'
# argument choise 'group_ddbb'
# argument choise 'dinasty_gr'
#----------------------------------------

### update group 'dat_imp' by argument 'amphitheaters'----------------------------------------------

roman_ddbb.update.dat_group_ddbb <- function(
  dat_imp,
  group_ddbb,
  emperor_dinasty)
{
### 'slice()' original 'dat_imp' by 'dimension'
### choise arguments by 'group_ddbb' & 'dinasty_gr'

### argument 'amphitheaters' data
  if(group_ddbb == 'amphitheaters' & !missing(emperor_dinasty)) {
    ### update
      dat_1 <- dat_imp[[1]] %>%
          slice(rep(1:n(), times = dim(dat_imp[[2]])[1]))

      dat_2 <- dat_imp[[2]] %>%
          slice(rep(1:n(), times = dim(dat_imp[[1]])[1]))


    ### 'bind_cols()'
      dat <- bind_cols(dat_1, dat_2)


  } else if(group_ddbb == 'amphitheaters' & emperor_dinasty == 'none') {
    ### return 'base' data for 'amphitheathers'data
      dat <- dat_imp[[2]]


  } else if(group_ddbb == 'roman_emperors' & emperor_dinasty != 'none') {
    ### return 'base' data for 'emperor_dinasty'
      dat <- dat_imp[[1]] %>%
        filter(across(any_of('dinasty_1'), ~ . %in% emperor_dinasty))


  } else if(group_ddbb == 'none' & emperor_dinasty == 'none') {
    ### return original 'dat_imp' data
      dat <- dat_imp

  }

### avoid rubish elements
  rm(list = setdiff(ls(), c('dat', 'dat_imp')))

### returns
  return(dat_imp)
}
