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
var resultGender = ChildGender.Male

signal readyForBirth(egg)

func _init():
	lifeSpan = 60*60*24*2 + RNG.randi_range(-60*60*12, 60*60*24)

var cycle = null

func setMother(newmotherID, newmotherSpecies):
	motherID = newmotherID
	motherSpecies = newmotherSpecies

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
	return 60*60*24*7

func getTimeUntilReadyForBirth() -> int:
	var gestationTime = getGestationTime()
	return int(gestationTime * (1.0 - getProgress()))

func processTime(seconds):
	
	if(!isimpregnated):
		lifeSpan -= seconds
		if(lifeSpan < 0):
			removeMe()
	
	if(isimpregnated):
		var newProgress: float = float(seconds) / getGestationTime()
		
		var justReady = false
		if(progress < 1.0 && (progress + newProgress) >= 1.0):
			justReady = true
		
		progress += newProgress
		if(progress > 1.0):
			progress = 1.0
		
		if(justReady):
			emit_signal("readyForBirth", self)

func getProgress():
	return progress

func canImpregnate():
	return !isimpregnated

func isImpregnated():
	return isimpregnated

func impregnatedBy(newfatherID):
	if(isimpregnated):
		return
	
	isimpregnated = true
	fatherID = newfatherID
	
	var father = GlobalRegistry.getCharacter(fatherID)
	
	resultSpecies = SpeciesCompatibility.generateChildSpecies(motherSpecies, father.getSpecies())
	resultGender = ChildGender.generate()

	print("EGGCELL IMPREGNATED BY "+str(newfatherID)+", species: "+str(resultSpecies)+", gender: "+ChildGender.getVisibleName(resultGender))

func tryImpregnate(whosCum, amountML, eggMultiplier = 1.0, virility = 1.0, fertility = 1.0, crossSpeciesCompatibility = 0.0):
	if(!canImpregnate()):
		return false
	
	var father = GlobalRegistry.getCharacter(whosCum)
	
	var crossSpeciesMod = SpeciesCompatibility.pregnancyChanceMod(motherSpecies, father.getSpecies())
	if(crossSpeciesCompatibility > 0.0):
		crossSpeciesMod = min(crossSpeciesCompatibility, crossSpeciesMod)
	if(crossSpeciesCompatibility < 0.0):
		crossSpeciesMod = crossSpeciesMod * (1.0 - abs(crossSpeciesCompatibility))
	crossSpeciesMod = clamp(crossSpeciesMod, 0.0, 1.0)
	virility = max(virility, 0.0)
	fertility = max(fertility, 0.0)
	
	var finalChance = amountML * crossSpeciesMod * 20.0 * eggMultiplier * virility * fertility
	#print(finalChance)
	
	if(RNG.chance(finalChance)):
		impregnatedBy(whosCum)
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
	resultGender = SAVE.loadVar(data, "resultGender", ChildGender.Male)
