#--------------------------------
# Oficial list of roman emperors
#--------------------------------


#' @export
roman_ddbb.l_emp.julio_claudian <- function()
{
  # lemp
  rulers_1 <- c('Augustus', 'Tiberius', 'Caligula', 'Claudius', 'Nero')
	rulers_2 <- c('augustus', 'tiberius', 'caligula', 'claudius', 'nero') 

  # list
  l_julio <- list(
    lemp_1 = rulers_1,
		lemp_2 = rulers_2,
		succession = c(as.character(roman_ddbb.l_emp.succesion()[rulers_2])))

  # return
  return(l_julio)
}



#' @export
roman_ddbb.l_emp.four_emperors <- function()
{
  # lemp
  rulers_1 <- c('Galba', 'Otho', 'Vitellius')
	rulers_2 <- c('galba', 'otho', 'vitellius')

  # list
  l_four <- list(
    lemp_1 = rulers_1,
		lemp_2 = rulers_2,
		succession = c(as.character(roman_ddbb.l_emp.succesion()[rulers_2])))

  # return
  return(l_four)
}



#' @export
roman_ddbb.l_emp.flavian <- function()
{
  # lemp
  rulers_1 <- c('Vespasian', 'Titus', 'Domitian')
	rulers_2 <- c('vespasian', 'titus', 'domitian')

  # list
  l_flavian <- list(
    lemp_1 = rulers_1,
		lemp_2 = rulers_2,
		succession = c(as.character(roman_ddbb.l_emp.succesion()[rulers_2])))

  # return
  return(l_flavian)
}



#' @export
roman_ddbb.l_emp.ulpia <- function()
{
  # lemp
  rulers_1 <- c('Nerva', 'Trajan', 'Hadrian')
	rulers_2 <- c('nerva', 'trajan', 'hadrian')
	
  # list
  l_ulpia <- list(
    lemp_1 = rulers_1,
		lemp_2 = rulers_2,
		succession = c(as.character(roman_ddbb.l_emp.succesion()[rulers_2])))

  # return
  return(l_ulpia)
}



#' @export
roman_ddbb.l_emp.antonine <- function()
{
  # lemp
  rulers_1 <- c('Antoninus Pius', 'Marcus Aurelius', 'Lucius Verus', 'Commodus')
	rulers_2 <- c('antoninus_pius', 'marcus_aurelius', 'lucius_verus', 'Commodus')
  
	# list
  l_antonine <- list(
    lemp_1 = rulers_1,
		lemp_2 = rulers_2,
		succession = c(as.character(roman_ddbb.l_emp.succesion()[rulers_2])))

  # return
  return(l_antonine)
}



#' @export
roman_ddbb.l_emp.severan <- function()
{
  # lemp
 	rulers_1 <- c( 'Pertinax', 'Didius Julianus', 'Septimius Severus', 'Caracalla', 'Geta', 'Macrinus',
	 'Elagabalus', 'Diadumedian', 'Severus Alexander')
	rulers_2 <- c( 'pertinax', 'didius_julianus', 'septimius_severus', 'caracalla', 'geta', 'macrinus',
	 'elagabalus', 'diadumedian', 'severus_alexander')

  # list
  l_severan <- list(
    lemp_1 = rulers_1,
		lemp_2 = rulers_2,
		succession = c(as.character(roman_ddbb.l_emp.succesion()[rulers_2])))

  # return
  return(l_severan)
}



#' @export
roman_ddbb.l_emp.six <- function()
{
  # lemp
 	rulers_1 <- c('Maximinus Thrax', 'Gordian I', 'Gordian II', 'Pupienus', 'Balbinus', 'Gordian III')
	rulers_2 <- c('maximinus_thrax', 'gordian_i', 'gordian_ii', 'pupienus', 'balbinus', 'gordian_iii')

  # list
  l_six <- list(
    lemp_1 = rulers_1,
		lemp_2 = rulers_2,
		succession = c(as.character(roman_ddbb.l_emp.succesion()[rulers_2])))

  # return
  return(l_six)
}



#' @export
roman_ddbb.l_emp.3th_century <- function()
{
  # lemp
 	rulers_1 <- c('Philip the Arab', 'Decius', 'Hostilian', 'Aemilian', 'Valerian',
		'Gallienus', 'Claudius Gothicus', 'Quintillus', 'Aurelian', 'Ulpia Severina', 'Tacitus',
		'Florianus', 'Probus', 'Carus', 'Numerian', 'Carinus', 'Philip II', 'Herennius Etruscus', 
		'Trebonianus Gallus', 'Volusianus', 'Salonius')
	rulers_2 <- c('philip_arab', 'decius', 'hostilian', 'aemilian', 'valerian',
		'gallienus', 'claudius_gothicus', 'quintillus', 'aurelian', 'ulpia_severina', 'tacitus',
		'florianus', 'probus', 'carus', 'numerian', 'carinus', 'philip_ii', 'herennius_etruscus', 
		'trebonianus_gallus', 'volusianus', 'salonius')

  # list
  l_iii <- list(
    lemp_1 = rulers_1,
		lemp_2 = rulers_2,
		succession = c(as.character(roman_ddbb.l_emp.succesion()[rulers_2])))

  # return
  return(l_iii)
}


#' @export
roman_ddbb.l_emp.tetrarchy <- function()
{
  # lemp
 	rulers_1 <- c('Diocletian', 'Maximian', 'Galerius', 'Constantius Chlorus', 'Valerius Severus',
		'Constantine the Great', 'Maxentius', 'Licinius', 'Valerius Valens', 'Martinian', 'Maximinus II')
 	rulers_2 <- c('diocletian', 'maximian', 'galerius', 'constantius_chlorus', 'valerius_severus',
		'constantine_great', 'maxentius', 'licinius', 'valerius_valens', 'martinian', 'maximinus_ii')

  # list
  l_tetrarchy <- list(
    lemp_1 = rulers_1,
		lemp_2 = rulers_2,
		succession = c(as.character(roman_ddbb.l_emp.succesion()[rulers_2])))

  # return
  return(l_tetrarchy)
}



#' @export
roman_ddbb.l_emp.constantinian <- function()
{
  # l_emp
 	rulers_1 <- c('Constantine the Great', 'Constantine II', 'Constantius II', 'Constans I', 
		'Vetranio', 'Julian', 'Jovian')
	rulers_2 <- c('constantine_great', 'constantine_ii', 'constantius_ii', 'constans_i', 
		'vetranio', 'julian', 'jovian')

  # list
  l_constantinian <- list(
    lemp_1 = rulers_1,
		lemp_2 = rulers_2,
		succession = c(as.character(roman_ddbb.l_emp.succesion()[rulers_2])))

  # return
  return(l_constantinian)
}



#' @export
roman_ddbb.l_emp.valentinian <- function()
{
  # lemp
 	rulers_1 <- c('Valentinian I', 'Valens', 'Gratian', 'Valentinian II')
	rulers_2 <- c('valentinian_i', 'valens', 'gratian', 'valentinian_ii')

  # list
  l_valentinian <- list(
    lemp_1 = rulers_1,
		lemp_2 = rulers_2,
		succession = c(as.character(roman_ddbb.l_emp.succesion()[rulers_2])))

  # return
  return(l_valentinian)
}



#' @export
roman_ddbb.l_emp.theodosian <- function()
{
  # lemp
 	rulers_1 <- c('Magnus Maximus', 'Victor', 'Eugenius', 'Theodosius I', 'Arcadius', 'Honorius',
		'Constantine III', 'Constans II', 'Theodosius II', 'Constantius III', 'Joannes', 
		'Valentinian III', 'Pulcheria', 'Marcian')
 	rulers_2 <- c('magnus_maximus', 'victor', 'eugenius', 'theodosius_i', 'arcadius', 'honorius',
		'constantine_iii', 'constans_ii', 'theodosius_ii', 'constantius_iii', 'joannes', 
		'valentinian_iii', 'pulcheria', 'marcian')

  # list
  l_theodosian <- list(
    lemp_1 = rulers_1,
		lemp_2 = rulers_2,
		succession = c(as.character(roman_ddbb.l_emp.succesion()[rulers_2])))

  # return
  return(l_theodosian)
}



#' @export
roman_ddbb.l_emp.western <- function()
{
  # lemp
 	rulers_1 <- c('Petronius Maximus', 'Avitus', 'Majorian', 'Libius Severus', 'Anthemius', 'Olybrius',
		'Glycerius', 'Julius Nepos', 'Romulus Augustulus')
 	rulers_2 <- c('petronius_maximus', 'avitus', 'majorian', 'libius_severus', 'anthemius', 'olybrius',
		'glycerius', 'julius_nepos', 'romulus_augustulus')

  # list
  l_western <- list(
    lemp_1 = rulers_1,
		lemp_2 = rulers_2,
		succession = c(as.character(roman_ddbb.l_emp.succesion()[rulers_2])))

  # return
  return(l_western)
}



#' @export
roman_ddbb.l_emp.leonid <- function()
{
  # lemp
 	rulers_1 <- c('Leo I the Thracian', 'Leo II', 'Zeno', 'Basiliscus', 'Marcus', 'Anastasius I Dicorus')
 	rulers_2 <- c('leo_i', 'leo_ii', 'zeno', 'basiliscus', 'marcus', 'anastasius_i')

  # list
  l_leonid <- list(
    lemp_1 = rulers_1,
		lemp_2 = rulers_2,
		succession = c(as.character(roman_ddbb.l_emp.succesion()[rulers_2])))

  # return
  return(l_leonid)
}
