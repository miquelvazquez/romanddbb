#----------------------------
# Descriptions in CHMI Study
#----------------------------

#' @export
roman_ddbb.l_emp.succesion <- function(rulers_2)
{
	# list of info about succesion
  covlist <- list(

    # roman_ddbb.l_emp.julio_claudian()
	  augustus = c('[augustus] adopted son of Julius Caesar became emperor with the agreement with the Roman Senate'),
    tiberius = c('[tiberius] natural son of Livia Drusilla and adopted by Augustus as his son and heir'),
    caligula = c('[caligula] adoptive grandson of Tiberius and great-grandson of Augustus'),
		claudius = c('[claudius] great-nephew and step-grandson of Augustus, proclaimed by the Praetorian Guard'), 
		nero = c('[nero] adopted son of Claudius and great-great-grandson of Augustus'),
		
    # roman_ddbb.l_emp.four_emperors()
    galba = c('[galba] seized power with support of legions from Hispania'),
    otho = c('[otho] appointed by Praetorian Guard'),
    vitelius = c('[vitellius] seized power with support of legions from Germania'),
    
    # roman_ddbb.l_emp.flavian()
    vespasian = c('[vespasian] seized power with the support of the Eastern legions'),
    titus = c('[titus] son of Vespasian'),
		domitian = c('[domitian] son of Vespasian'),

    # roman_ddbb.l_emp.ulpia()
    nerva = c('[nerva] appointed by the Senate, so-called first of the `Five Good Emperors`'),
    trajan = c('[trajan] adopted son and heir of Nerva'),
    hadrian = c('[hadrian] adopted son and heir of Trajan'),

		# roman_ddbb.l_emp.antonine()
    antoninus_pius = c('[antoninus_pius] adopted son and heir of Hadrian'),
    marcus_aurelius = c('[marcus_aurelius] adopted son and heir of Antoninus Pius and co-emperor with Lucius Verus'),
    lucius_verus = c('[lucius_verus] adopted son and heir of Antoninus Pius and co-emperor with Marcus Aurelius'),
    commodus = c('[commodus] son of Marcus Aurelius'),

		# roman_ddbb.l_emp.severan()
    pertinax = c('[pertinax] proclaimed emperor by Praetorian Guard'),
    didius_julianus = c('[didius_julianus] won auction held by the Praetorian Guard'),
    septimius_severus = c('[septimius_severus] seized power with support of legions from Pannonia'),
    caracalla = c('[caracalla] son of Septimius Severus and co-emperor with Severus and Geta'),
    geta = c('[geta] son of Septimius Severus; co-emperor with Severus and Caracalla'),
    macrinus = c('[macrinus] conspaired to Caracalla as Praetorian Prefect'),
    diadumedian = c('[diadumedian] associated as co-emperor with Macrinus'),
    elagabalus = c('[elagabalus] great-nephew of Septimius Severus, proclaimed emperor by legions from Syria'),
    severus_alexander = c('[severus_alexander] great-nephew of Septimius Severus'),

    # roman_ddbb.l_emp.six()
    maximinus_thrax = c('[maximus_thrax] seized power with support of legions from Germania'),
    gordian_i = c('[gordian_i] proclaimed emperor during a revolt against Maximinus, ruled jointly with Gordian II'),
    gordian_ii = c('[gordian_ii] proclaimed emperor, alongside father Gordian I'),
    pupienus = c('[pupienus] proclaimed joint emperor with Balbinus, co-emperor with Balbinus'),
    balbinus = c('[balbinus] proclaimed joint emperor with Pupienus, co-emperor with Pupienus'),
    gordian_iii = c('[gordian_iii] proclaimed emperor by supporters of Gordian I and II'),
    
		# roman_ddbb.l_emp.3th_century()
		philip_arab = c('[philip_arab] praetorian Prefect to Gordian III, made his son Philip II co-emperor'),
    philip_ii = c('[philip_ii] son of Philip the Arab and co-emperor'),
    decius = c('[decius] proclaimed emperor by legions from Danubian limes and made his son Herennius Etruscus co-emperor'),
    herennius_etruscus = c('[herennius_etruscus] son of Decius and co-emperor'),
    hostilian = c('[hostilian] son of Decius'),
    trebonianus_gallus = c('[trebonianus_gallus] proclaimed emperor by legions from Danubian region'),
    volusianus = c('[volusianus] son of Trebonianus Gallus, proclaimed co-emperor'),
    aemilian = c('[aemilian] proclaimed emperor by legions from Danubian region'),
    valerian = c('[valerian] proclaimed emperor by legions from Rhine region'),
    gallienus = c('[gallienus] son of Valerian, proclaimed co-emperor with Valerian'),
    salonius = c('[salonius] son of Gallienus, proclaimed co-emperor with Gallienus'),
    claudius_gothicus = c('[claudius_gothicus] seized power after death of Gallienus'),
    quintillus = c('[quintilus] brother of Claudius II'),
    aurelian = c('[aurelian] proclaimed emperor by legions from Danubian region'),
    ulpia_severina = c('[ulpia_severina] wife of Aurelian, she ruled during Aurelian and Tacitus'),
    tacitus = c('[tacitus] elected by the Senate'),
    florianus = c('[florianus] brother of Tacitus'),
    probus = c('[probus] proclaimed emperor by legions from Danubian region'),
		carus = c('[carus] seized power before or after Probus was murdered'),
		carinus = c('[carinus] son of Carus'),
		numerian = c('[numerian] son of Carus'),

		# roman_ddbb.l_emp.tetrarchy()
		# roman_ddbb.l_emp.constantinian()
		diocletian = c('[diocletian] proclaimed emperor by army of Numerian'),
    maximian = c('[maximian] adopted as senior co-emperor by Diocletian'),
    galerius = c('[galerius] adopted as junior co-emperor by Diocletian'),
    constatius_chlorus = c('[constantius_chlorus] adopted as junior co-emperor by Maximian'),
    valerius_severus = c('[valerius_severus] adopted as junior co-emperor by Constantius Chlorus'),
    constantine_i = c('[constantine_i] son of Constantius Chlorus, proclaimed emperor by army of Constantius Chlorus'),
		maxentius = c('[maxentius] son of Maximian, seized after dath of Constantius Chlorus'),
		licinius = c('[licinius] son-in-law of Constantius Chlorus'),
		valerius_valens = c('[valerius_valens] appointed by Licinius'),
		martinian = c('[martinian] appointed by Licinius'),
		maximinus_ii = c('[maximinus_ii] nephew of Galerius and adopted as caesar'),
		valerius_valens = c('[valerius_valens] son of Constantine I'),
		constantine_ii = c('[constantine_ii] son of Constantine I'),
		constantius_ii = c('[constantius_ii] son of Constantine I'),
		constans_i = c('[constans_i] son of Constantine I'),
		vetranio = c('[vetranio] proclaimed and accepted as caesar and emperor by Constantius II'),
		julian = c('[julian] cousin of Constantius II'),
		jovian = c('[jovian] general of the emperor Julian'),
	
		# roman_ddbb.l_emp.valentinian()
		valentinian_i = c('[valentinian_i] elected to replace Jovian by the army'),
    valens = c('[valens] brother of Valentinian I'),
    gratian = c('[gratian] son of Valentinian I'),
    valentinian_ii = c('[valentinian_ii] son of Valentinian I, accepted as co-emperor by Gratian'),
   
		# roman_ddbb.l_emp.theodosian()
		magnus_maximus = c('[magnus_maximus] usurper and legitimized by Theodosian I as emperor'),
    victor = c('[victor] usurper and legitimized by Theodosian I as emperor'),
		eugenius = c('[eugenius] usurper and elevated as emperor by Arbogast'),
		theodosius_i = c('[theodosius_i] son-in-law of Valentinian I'),
		arcadius = c('[arcadius] son of Theodosius I'),
 		honorius = c('[honorius] son of Theodosius I'),
    theodosius_ii = c('[theodosius_ii] son of Arcadius'),
		constantius_iii = c('[constantius_iii] selevated as co-augustus by Honorius'),
		constans_ii = c('[constans_ii] son of Constantius III, elevated as co-emperor of Constantius III'),
		joanes = c('[joanes] proclaimed emperor by Castinus'),
		valentinian_iii = c('[valentinian_iii] son of Constantius III'),
		pulcheria = c('[pulcheria] appointed by Licinius'),
		marcian = c('[marcian] appointed by Licinius'),

		# roman_ddbb.l_emp.western()
		petronius_maximus = c('[petronius_maximus] son-in-law of Theodosius II, proclaimed himself emperor'),
    avitus = c('[avitus] proclaimed emperor by Theoderic II'),
		majorian = c('[majorian] proclaimed emperor by the army'),
		libius_severus = c('[libius_severus] appointed emperor by Ricimer'),
		anthemius = c('[anthemius] son-in-law of Marcian, appointed by eastern emperor Leo I'),
 		olybrius = c('[olybrius] son-in-law of valentinian III, appointed emperor by Ricimer'),
    glycerius = c('[glycerius] appointed emperor by Gundobad'),
		julius_nepos = c('[julius_nepos] nephew-in-law of the eastern emperor Leo I '),
		romulus_augustulus = c('[romulus_augustulus] appointed by his father Orestes'),

		# roman_ddbb.l_emp.leonid()
		leo_i = c('[leo_i] chosen by the army'),
		leo_ii = c('[leo_ii] grandson of Leo I'),
    zeno = c('[zeno] proclaimed co-emperor by his son Leo II'),
    basiliscus = c('[basiliscus] seized throne from Zeno'),
		marcus = c('[marcus] son of Basiliscus, appointed as co-emperor'),
    anastasius_i = c('[anastasius_i] son-in-law of Leo I'))


	### select rulers_2
  if(!missing(rulers_2)) {
    stopifnot(all(rulers_2 %in% names(covlist)))
    covlist <- covlist[[rulers_2]]

  ### case of a single trait
  if(length(rulers_2)) {
    covlist <- unlist(covlist)
    }
  }
  return(covlist)
}
