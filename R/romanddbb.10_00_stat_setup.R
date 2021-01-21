#----------------------------------------------------------------
# 'romanddbb.10_00_stat_setup.R' applied to several 'stat' files 
# create empty 'theme' to 'romanddbb.plots.wv_dens()'
#----------------------------------------------------------------



### empty 'theme' to 'ggplot()'-----------------------------------------------------------


#' @export

roman_ddbb.setup.theme_ggempty <- function(
	aspect_ratio = NULL,
	ggempty_theme = c('bw', 'light'))
{
### setup 'ggplot'
  if (theme_ggplot == 'bw') {
		
		### 'theme_bw()'		
			gg_empty <- ggplot() + 
				geom_point(aes(1, 1), colour = 'white') +
				theme_set(
					theme_bw() +
  	  		theme(
						plot.background = element_blank(), 
						panel.grid.major = element_blank(),
						panel.grid.minor = element_blank(), 
						panel.border = element_blank(), 
						panel.background = element_blank(), 
						axis.title.x = element_blank(), 
						axis.title.y = element_blank(), 
						axis.text.x = element_blank(), 
						axis.text.y = element_blank(), 
						axis.ticks = element_blank(), 
						plot.margin = unit(c(1, 1, 0, 0), 'lines'), 
						legend.position = 'none',
						aspect.ratio = aspect_ratio))


	} else if (theme_ggplot == 'light') {

		### 'theme_bw()'		
			gg_empty <- ggplot() + 
				geom_point(aes(1, 1), colour = 'white') +
				theme_set(
					theme_light() +
  	  		theme(
						plot.background = element_blank(), 
						panel.grid.major = element_blank(),
						panel.grid.minor = element_blank(), 
						panel.border = element_blank(), 
						panel.background = element_blank(), 
						axis.title.x = element_blank(), 
						axis.title.y = element_blank(), 
						axis.text.x = element_blank(), 
						axis.text.y = element_blank(), 
						axis.ticks = element_blank(), 
						plot.margin = unit(c(1, 1, 0, 0), 'lines'), 
						legend.position = 'none',
						aspect.ratio = aspect_ratio)) 
		
	}


### return
	return(gg_empty)
}


