#-----------------------------------------------------------------------
# 'romanddbb.10_01_stat_summary.R' includes several accessory functions
# identify how many 'NAs' there are by 'roman_ddbb.summary.na_count()'
# identify and remove 'outliers' by 'roman_ddbb.summary.is_outlier()'
#-----------------------------------------------------------------------


### compute global `NA` info------------------------------------------------------------------------

#' @export
roman_ddbb.summary.na_count <- function(
  df,
  gr_by,
  tested_var,
  na_cutoff = 10)
{
### list
  l_na <- list ()

### loop #01
  for(i in seq_along(tested_var)){
    ### modify
    df <- df %>%
      select(all_of(gr_by), any_of(tested_var)) %>%
      group_by_at(gr_by) %>%
      group_nest() %>%
      mutate(
        n_isna = map_dbl(data, ~ sum(is.na(.x[i]))),
        n_total = map_dbl(data, ~ nrow(.)),
        perc_na = (n_isna / n_total) * 100,
        percna_lb = factor(
          ifelse(perc_na >= na_cutoff, paste0('upper_', na_cutoff),  paste0('lower_', na_cutoff)))) %>%
      select(-data) %>%
      unnest(cols = c())

    ### save
      l_na[[length(l_na) + 1]] = df
  }

### names()
  names(l_na) <- tested_var


### return
  return(l_na)
}




### compute outliers----------------------------------------------------------------------


#' @export
roman_ddbb.summary.is_outlier <- function(
  df,
  gr_by,
  tested_vars,
  qt_cutoff = c(0.25, 0.75),
  k_cutoff = 2,
  rm_outliers = FALSE)
{
### detect outliers using IQR method
### remove 'out_flag == 'outlier' in 'rm_outliers == TRUE' arguments


### list
	l_out <- list()


### select only 'gr_by' & 'tested_var'
    df_out <- df %>%
			select(all_of(gr_by), all_of(tested_var)) %>%
 			group_by_at(gr_by) %>%
      group_nest()


### calculate 'out_flag' by loop #01

	for(i in seq_along(tested_var)) {
	  if(!missing(gr_by)) {
		
      	df_out <- df_out %>%
      		mutate(out_data = map(data,
      		~ mutate(.x,
        			qt_lower = quantile(.[[tested_var]], qt_cutoff[1], na.rm = TRUE),
        			qt_upper = quantile(.[[tested_var]], qt_cutoff[2], na.rm = TRUE),
        			iqr = qt_upper - qt_lower,
        			kiqr_upper = (iqr * k_cutoff) + qt_upper,
        			kiqr_lower = qt_lower - (iqr * k_cutoff),
        			out_flag = as.factor(
          			ifelse(
									c(.[[tested_var]] > kiqr_upper | .[[tested_var]] < kiqr_lower), 'outlier', 'no_outlier'),
									levels = c('no_outlier', 'outlier'))))) %>%
      		select(-data) %>%
      		unnest(cols = c(out_data))
			
	  } else {

    	df_out <- df_out %>%
      	mutate(out_data = map(data,
      	~ mutate(.x,
        	qt_lower = quantile(.[[tested_var]], qt_cutoff[1], na.rm = TRUE),
        	qt_upper = quantile(.[[tested_var]], qt_cutoff[2], na.rm = TRUE),
        	iqr = qt_upper - qt_lower,
        	kiqr_upper = (iqr * k_cutoff) + qt_upper,
        	kiqr_lower = qt_lower - (iqr * k_cutoff),
        	out_flag = as.factor(
          	ifelse(
							c(.[[tested_var]] > kiqr_upper | .[[tested_var]] < kiqr_lower), 'outlier', 'no_outlier'),
							levels = c('no_outlier', 'outlier'))))) %>%
      	select(-data) %>%
      	unnest(cols = c(out_data))

 	 }

	 ### save
		 l_out[[length(l_out) + 1]] = df_out
}
		

### remove outliers
  if(rm_outliers == TRUE) {

    cat('Removing outliers in column ', tested_var, ' \n')

    df_out <- df_out %>%
      filter(out_flag == 'no_outlier') %>%
      droplevels()

  }


### return
  return(df_out)
}
