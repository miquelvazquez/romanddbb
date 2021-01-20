#-----------------------------------------------
# update 'data' with info in 'romanddbb.phen.R'
#-----------------------------------------------



### update 'romanddbb.phen.R'-------------------------------------------------------------

roman_ddbb.phen.update_amphi <- function(
  l_amphitheaters)
{
### derivate measurements
## overall ratio length versus width from 'overall_ratio == overall_max / overall_min'
## arena ratio length versus width from 'arena_ratio == arena_max / arena min'
## cavea width from 'caveaw_max == overall_max - arena_max'
## cavea width from 'caveaw_min == overall_min - arena_min'
## circunference from 'circ == ((overall_max + overall_min) + pi) / 2'


### 'bind_rows()' and 'update'
	df_amphi <- bind_rows(l_amphitheaters) %>%
			separate(
				vasa_class, c('prov_imp', 'n_amphi'), sep = '#', remove = FALSE) %>%
			mutate(
				n_amphi = paste0('#', n_amphi),
				overall_ratio = 
					ifelse(complete.cases(overall_max, overall_min), overall_max / overall_min, NA),
				arena_ratio = 
					ifelse(complete.cases(arena_max, arena_min), arena_max / arena_min, NA),
				caveaw_max = 
					ifelse(complete.cases(overall_max, arena_max), overall_max - arena_max, NA),
				caveaw_min = 
					ifelse(complete.cases(overall_min, arena_min), overall_min - arena_min, NA),
				circ =
					ifelse(complete.cases(overall_max, overall_min), ((overall_max + overall_min) + pi) / 2, NA))



### return
	return(df_amphi)

}
