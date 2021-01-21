#----------------------------------------------------------------------------
# 'romanddbb.10_02_stat_plots.R' includes functions to do several plot types 
# 'romanddbb.plots.wv_dens()' plots scatterplots versus densityplots
#----------------------------------------------------------------------------



### scatterplot versus densityplot--------------------------------------------------------


#' @export
romanddbb.plots.wv_dens <- function(
	df, 
	var_x,
	var_y,
	aes_color,
	aspect_ratio = NULL,
	ggempty_theme = c('bw', 'light')) 
{
### 'ggempty_theme' argument
	empty <- roman_ddbb.setup.theme_ggempty(
		aspect_ratio = aspect_ratio,
		ggempty_theme = ggempty_theme)


### enquo
  var_x <- enquo(var_x)
  var_y <- enquo(var_y)
  aes_color <- enquo(aes_color)


### plot #01
	p_1 <- ggplot(
      data = df_impute %>% filter(out_flag != 'outlier'),
      aes(x = !! var_x, y = !! var_y, colour = !! aes_color)) +
    geom_jitter(aes(color = !! aes_color), alpha = .5) +
    scale_color_brewer(palette = option_brewer) +
    geom_jitter(
      inherit.aes = FALSE,
      data = df_impute %>% filter(out_flag == 'outlier'),
      aes(x = !! var_x, y = !! var_y), width = .1, alpha = .5, color = '#8B0000') +
    labs(x = paste0(quo_name(var_x)), y = paste0(quo_name(var_y))) +
    theme(
      axis.text.x = element_text(angle = 90, vjust = 0.5, hjust = 1))


### plot #02
	p_2 <- ggplot(
      data = df_impute,
      aes(x = !! var_x, colour = !! aes_color)) +
  	geom_density(
      aes(x = !! var_x, y = ..density..), position = 'identity', alpha = .5) +
		scale_color_brewer(palette = option_brewer) +
  	labs(y = 'density')	+
		theme(
      legend.position = 'none',
			text = element_text(family = 'Arial'),
			axis.text.x = element_blank(),
			axis.title.x = element_blank(),
			axis.ticks.x =  element_blank(),
			axis.text.y = element_text(size = 11),
      axis.title.y = element_text(size = 13, face = 'bold'))


### plot #03
	p_3 <- ggplot(
      data = df_impute,
      aes(x = !! var_x, colour = !! aes_color)) +
  	geom_density(
      aes(x = !! var_x, y = ..density..), position = 'identity', alpha = .5) +
		scale_color_brewer(palette = option_brewer) +
    coord_flip() +
  	labs(x = 'density')	+
  	theme(
      legend.position = 'none',
			text = element_text(family = 'Arial'),
			axis.text.x = element_text(size = 11),
			axis.title.x = element_text(size = 13, face = 'bold'),
			axis.title.y = element_blank(),
      axis.text.y = element_blank(),
			axis.ticks.y = element_blank())


### arrange
	plot <- ggpubr::ggarrange(
    p_2, empty, p_1, p_3,
    ncol = 2, nrow = 2,
		widths = c(4, 1), heights = c(1, 4),
		common.legend = TRUE, legend = 'bottom')

### return
  return(plot)
}
