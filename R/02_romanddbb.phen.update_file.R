#-----------------------
# Update `retrove.phen` 
#-----------------------

retrove.phen.update <- function(dat)  	
{
	# unite col.x & col.y	
	dat <- dat %>% mutate(PST = coalesce(PST.x, PST.y),
												PSLL = coalesce(PSLL.x, PSLL.y),
												GACA = coalesce(GACA.x, GACA.y),
												MACA = coalesce(MACA.x, MACA.y),
												GAFS = coalesce(GAFS.x, GAFS.y),
												MAFS = coalesce(MAFS.x, MAFS.y),
												GAB2 = coalesce(GAB2.x, GAB2.y),
												MAB2 = coalesce(MAB2.x, MAB2.y))
	
	# delete vars
	rm_vars <- c('PST.x', 'PST.y', 'PSLL.x', 'PSLL.y', 'GACA.x', 'GACA.y',
							 'MACA.x', 'MACA.y', 'GAFS.x', 'GAFS.y', 'MAFS.x', 'MAFS.y',
							 'GAB2.x', 'GAB2.y', 'MAB2.x', 'MAB2.y')		
	dat[, rm_vars] <- NULL	

	# derivate variables
	dat <- mutate(dat, sex = factor(sex, levels = c(0, 1)),
   				sex_c = factor(ifelse(sex == 0, 'F', 'M')),
   				# cascontrol
   				cascontrol = factor(cascontrol, levels = c(0, 1)),
					cc = factor(ifelse(cascontrol == 0, 'Controls', 'Cases')),    
					daco = factor(ifelse(sex == 1, 0, aco)),
					# smk & alc
					smk = factor(smk, levels = 1:4),
					dsmk = factor(ifelse(smk == 4, 0, 1)),
					dalc = factor(ifelse(alc != 0, 0, 1)),
					# white_factors
					enf_ren = factor(enf_ren, levels = c(0, 1)),
					epoc = factor(epoc, levels = c(0, 1)),		
					hta = factor(hta, levels = c(0, 1)),
					dlm = factor(dlm, levels = c(0, 1)),
					dbt = factor(dbt, levels = c(0, 1)),
					# pfa_factors
					sta = factor(sta, levels = c(0, 1)),
					anti_agg = factor(anti_agg, levels = c(0, 1)),
					aines = factor(aines, levels = c(0, 1)),
					enf_inm = factor(enf_inm, levels = c(0, 1)),
					fam_ete = factor(fam_ete, levels = c(0, 1)),
					fam_ven = factor(fam_ven, levels = c(0, 1)),
					fam_art = factor(fam_art, levels = c(0, 1)),
					ant_ict = factor(ant_ict, levels = c(0, 1)),
					ant_art = factor(ant_art, levels = c(0, 1)),
					# fbmi					
					fbmi = cut(bmi, breaks = c(0, 25, 30, 100)),
					# ABO
					ABO = factor(ABO))

	# `fbmi`
	# dat <- dat %>% mutate(fbmi = cut(bmi, breaks = c(0, 25, 30, 100)))

	#dat <- within(dat, {
	#  fbmi <- cut(bmi, breaks = c(0, 25, 30, 100))
	#  levels(fbmi) <- c('bmi25minus', 'bmi25_30', 'bmi30plus')
	#})

	# generate `age` variables
	dat <- mutate(dat,
  	gr = factor(ifelse(age <= 64, 1, 
     	 	  ifelse(age <= 96, 2, stop()))))

	dat <- mutate(dat,
     age_c = ifelse(age <= 64, age - 64/2,
             ifelse(age <= 96, age - (96 + 64)/2, stop())))

	dat <- mutate(dat, 
		 age_x = age - mean(age, na.rm = T))
	
	# ABO system	
	dat <- mutate(dat,
		ABO_c = factor(
		ifelse(ABO %in% c('A1A1', 'A1A2', 'A1B', 'A1O1', 'A1O2', 
											'A2A2', 'A2B', 'A2O1', 'A2O2', 
											'BB', 'BO1', 'BO2'), 'non_O',
		ifelse(ABO %in% c('O1O1', 'O1O2'), 'O',
		ifelse(ABO == 'NV', NA,
		NA))),
		levels = c('non_O', 'O')))
		
	dat <- mutate(dat,
		ABO_gr = factor(
		ifelse(ABO %in% c('O1O1', 'O1O2'), 'O',
		ifelse(ABO %in% c('A1A1', 'A1A2', 'A1O1', 'A1O2', 
											'A2A2', 'A2O1', 'A2O2'), 'A',
		ifelse(ABO %in% c('BB', 'BO1', 'BO2'), 'B',
		ifelse(ABO %in% c('A1B', 'A2B'), 'AB',
		ifelse(ABO == 'NV', NA,
		NA))))),
		levels = c('O', 'A', 'B', 'AB')))	

	# PFAadp & PFAepi derivates
	dat <- mutate(dat, EPI_191 = factor(ifelse(EPI > 191, 'over', 'normal')))
	dat <- mutate(dat, ADP_123 = factor(ifelse(ADP > 123, 'over', 'normal')))

	# date in `dat`
	dat$f_nac <- as.Date(dat$f_nac, format = '%d/%m/%Y')
	dat$f_intr <- as.Date(dat$f_intr, format = '%d/%m/%Y')

	# `all` relevels
	rel_fac_1 <- retrove.factor.relevel_1()
	rel_fac_m <- retrove.factor.relevel_non_1()[1]
	rel_fac_0 <- retrove.factor.relevel_non_1()[2]
	rel_fac_O <- retrove.factor.relevel_non_1()[c(3, 4)]

	for (i in rel_fac_1) {
	    dat[[i]] <- relevel(factor(dat[[i]]), ref = '1')
	}

	for (i in rel_fac_m) {
	    dat[[i]] <- relevel(factor(dat[[i]]), ref = 'M')
	}

	for (i in rel_fac_0) {
	    dat[[i]] <- relevel(factor(dat[[i]]), ref = '0')
	}

	for (i in rel_fac_O) {
	    dat[[i]] <- relevel(factor(dat[[i]]), ref = 'O')
	}


	# FcVIIIC data cleaning
	is.na(dat$FcVIIIC) <- !dat$FcVIIIC
	stopifnot(is.na(dat$FcVIIIC) != 5)

	ind <- dat[216,]$FcVIIIC <- 9.00
	ind <- as.numeric(ind)
	warning(paste("data ind[216,] FcVIIIC == `9.00`"))

	return(dat)
}


#-------------------------
# Zero out `retrove.phen`
#-------------------------

retrove.phen.update_zero <- function(dat)
{
	###  variables
	plt_zero <- retrove.traits.platelets()
	## wht_zero <- retrove.traits.white()
	bioq_zero <- retrove.traits.bioq()
	hemog_zero <- retrove.traits.hemogram()
	coagu_zero <- retrove.traits.coagulation()
	adp_zero <- retrove.traits.adp()
	epi_zero <- retrove.traits.epi()
	multi_zero <- retrove.traits.multi_adp()
	tgt_zero <- retrove.traits.thrombin()
	mea_zero <- retrove.traits.mea()

	vars <- c(plt_zero, bioq_zero, hemog_zero, coagu_zero,
						adp_zero, epi_zero, multi_zero, tgt_zero, mea_zero) ## add `wht_zero` in vars

	warning(paste("attention filtered zeros done in all the group phenotypes"))
  
  for(var in vars) {
    if(var %in% names(dat)) {
      val <- dat[, var]
      
      # filter zeros
			val[val == 0] <- NA
      dat[, var] <- val
		}	
 	} 
  
	return(dat)
}

#-------------------------------------
# Ouliers out `retrove.phen.outliers`
#-------------------------------------

retrove.phen.update_outliers <- function(dat)
{
	###  variables
	plt_out <- retrove.traits.platelets()
	wht_out <- retrove.traits.white()
	bioq_out <- retrove.traits.bioq()
	hemog_out <- retrove.traits.hemogram()
	coagu_out <- retrove.traits.coagulation()
	adp_out <- retrove.traits.adp()
	epi_out <- retrove.traits.epi()
	multi_out <- retrove.traits.multi_adp()
	tgt_out <- retrove.traits.thrombin()
	mea_out <- retrove.traits.mea()

	vars <- c(plt_out, bioq_out, hemog_out, coagu_out,
						adp_out, epi_out, multi_out, tgt_out, mea_out)

	warning(paste("outliers by `K == 5` in numeric vars `taga.traits.` are filtered"))

# function 
		rm_outliers <- function(x) {
  		qntl <- quantile(x, probs = c(.25, .75), na.rm = T)
  		H <- 5 * IQR(x, na.rm = T)
  	
			val <- x
	 		val[x < (qntl[1] - H)] <- NA
  		val[x > (qntl[2] + H)] <- NA
  	
			return(val)				
		}

	### `mutate` variables in data.frame
	dat <- mutate_at(dat, .funs = funs(rm_outliers), .vars = intersect(vars, names(dat)))

return(dat)
}


#------------------------------------
# `Seguiment` data in `retrove.phen`
#------------------------------------

retrove.phen.vte_long <- function(dat)
{

return(dat)
}
