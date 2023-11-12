extends Reference
class_name EggCell

var lifeSpan: int # seconds
var orificeType: int = OrificeType.Vagina
var isimpregnated = false
var motherID = ""
var fatherID = ""
var progress = 0.0
var motherSpecies = []
var resultSpecies = []
var resultGender = NpcGender.Male
var monozygotic: int = 1
var fetusReadyForBirth := false


func _init():
	#lifeSpan = 60*60*24*2 + RNG.randi_range(-60*60*12, 60*60*24)
	var optionsLifespan:int = OPTIONS.getEggCellLifespanHours()
	optionsLifespan = Util.maxi(optionsLifespan, 1)
	#warning-ignore:integer_division
	var minRange = int(optionsLifespan / 4)
	#warning-ignore:integer_division
	var maxRange = int(optionsLifespan / 2)
	lifeSpan = 60*60*optionsLifespan + RNG.randi_range(-60*60*minRange, 60*60*maxRange)

var cycle = null

func setMonozygotic(): #check if the egg splits
	var chance = RNG.randf_range(0.00, 100.00)
	if(chance > 9.00):
		return # Egg didn't split
	elif(chance <= 0.01):
		monozygotic = 6 #EGG_MONOZYGOTIC_LEVEL["Sextuplets"]
	elif(chance <= 0.1):
		monozygotic = 5 #EGG_MONOZYGOTIC_LEVEL["Quintuplets"]
	elif(chance <= 0.6):
		monozygotic = 4 #EGG_MONOZYGOTIC_LEVEL["Quadruplets"]
	elif(chance <= 2.6):
		monozygotic = 3 #EGG_MONOZYGOTIC_LEVEL["Triplets"]
	else:
		monozygotic = 2 #EGG_MONOZYGOTIC_LEVEL["Twins"]

func setMother(newmotherID, newmotherSpecies):
	motherID = newmotherID
	motherSpecies = newmotherSpecies

func getMotherID():
	return motherID

func getFatherID():
	return fatherID

func setOrifice(orif):
	orificeType = orif

func getOrifice():
	return orificeType

func getCycle():
	if(cycle == null):
		return null
	return cycle.get_ref()

func removeMe():
	if(cycle != null):
		getCycle().removeEgg(self)
		cycle = null

# Seconds
func getGestationTime() -> int:
	if(motherID == "pc"):
		var pcPregTime:int = OPTIONS.getPlayerPregnancyTimeDays()
		pcPregTime = Util.maxi(pcPregTime, 1)
		return 60*60*24*pcPregTime
	else:
		var npcPregTime:int = OPTIONS.getNPCPregnancyTimeDays()
		npcPregTime = Util.maxi(npcPregTime, 1)
		return 60*60*24*npcPregTime
	
	#return 60*60*24*7

func getTimeUntilReadyForBirth() -> int:
	var gestationTime = getGestationTime()
	var currentProgress = min(1.0, getProgress())
	return int(gestationTime * (1.0 - currentProgress))

func processTime(seconds):
	
	if(!isimpregnated):
		lifeSpan -= seconds
		if(lifeSpan < 0):
			removeMe()
	
	if(isimpregnated):
		var newProgress: float = float(seconds) / getGestationTime()
		
		if((progress + newProgress) >= 1.0):
			fetusReadyForBirth = true
		
		progress += newProgress
		if(progress > 2.5):
			progress = 2.5

func fetusIsReadyForBirth():
	return fetusReadyForBirth

func getProgress():
	return progress

func canImpregnate():
	return !isimpregnated

func isImpregnated():
	return isimpregnated

func impregnatedBy(fluidDNA):
	if(isimpregnated):
		return
	
	isimpregnated = true
	fatherID = fluidDNA.getCharacterID()
	
	var father = GlobalRegistry.getCharacter(fatherID)
	var mother = GlobalRegistry.getCharacter(motherID)
	
	var allowHybrids = true
	if(father.hasPerk(Perk.StartNoHybrids) || mother.hasPerk(Perk.StartNoHybrids)):
		allowHybrids = false
	
	resultSpecies = SpeciesCompatibility.generateChildSpecies(motherSpecies, fluidDNA.getSpecies(), allowHybrids)
	if(fatherID == "pc" || motherID == "pc"):
		resultGender = GM.main.getEncounterSettings().generateGender()
	else:
		resultGender = NpcGender.generate()

	print("EGGCELL IMPREGNATED BY "+str(fatherID)+", species: "+str(resultSpecies)+", gender: "+NpcGender.getVisibleName(resultGender), ", division: ", monozygotic)

func tryImpregnate(fluidDNA, amountML, eggMultiplier = 1.0, fertility = 1.0, crossSpeciesCompatibility = 0.0):
	if(!canImpregnate()):
		return false
	
	var virility = fluidDNA.getVirility()
	
	if(!GlobalRegistry.characterExists(fluidDNA.getCharacterID())):
		return false
	
	var crossSpeciesMod = SpeciesCompatibility.pregnancyChanceMod(motherSpecies, fluidDNA.getSpecies())
	if(crossSpeciesCompatibility > 0.0):
		crossSpeciesMod = min(crossSpeciesCompatibility, crossSpeciesMod)
	if(crossSpeciesCompatibility < 0.0):
		crossSpeciesMod = crossSpeciesMod * (1.0 - abs(crossSpeciesCompatibility))
	crossSpeciesMod = clamp(crossSpeciesMod, 0.0, 1.0)
	virility = max(virility, 0.0)
	fertility = max(fertility, 0.0)
	
	var finalChance = amountML * crossSpeciesMod * 5.0 * eggMultiplier * virility * fertility * OPTIONS.getImpregnationChanceModifier()
	#print(finalChance)
	
	if(RNG.chance(finalChance)):
		impregnatedBy(fluidDNA)
		setMonozygotic()
		return true
	return false

func saveData():
	var data = {
		"lifeSpan": lifeSpan,
		"orificeType": orificeType,
		"isimpregnated": isimpregnated,
		"motherID": motherID,
		"fatherID": fatherID,
		"progress": progress,
		"motherSpecies": motherSpecies,
		"resultSpecies": resultSpecies,
		"resultGender": resultGender,
		"monozygotic": monozygotic,
		"fetusReadyForBirth": fetusReadyForBirth
	}
	
	return data

func loadData(data):
	lifeSpan = SAVE.loadVar(data, "lifeSpan", 0)
	orificeType = SAVE.loadVar(data, "orificeType", OrificeType.Vagina)
	isimpregnated = SAVE.loadVar(data, "isimpregnated", false)
	motherID = SAVE.loadVar(data, "motherID", "pc")
	fatherID = SAVE.loadVar(data, "fatherID", "pc")
	progress = SAVE.loadVar(data, "progress", 0.0)
	motherSpecies = SAVE.loadVar(data, "motherSpecies", ["feline"])
	resultSpecies = SAVE.loadVar(data, "resultSpecies", [])
	resultGender = SAVE.loadVar(data, "resultGender", NpcGender.Male)
	monozygotic = SAVE.loadVar(data, "monozygotic", 1)
	fetusReadyForBirth = SAVE.loadVar(data, "fetusReadyForBirth", false)
