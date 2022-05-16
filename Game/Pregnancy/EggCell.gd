extends Reference
class_name EggCell

var lifeSpan: int # seconds
var orificeType = OrificeType.Vagina
var isimpregnated = false
var motherID = null
var fatherID = null
var progress = 0.0
var motherSpecies
var resultSpecies = []
var resultGender = null

func _init():
	lifeSpan = 60*60*24*2 + RNG.randi_range(-60*60*12, 60*60*12)

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

func processTime(seconds):
	
	if(!isimpregnated):
		lifeSpan -= seconds
		if(lifeSpan < 0):
			removeMe()
	
	if(isimpregnated):
		var newProgress: float = float(seconds) / getGestationTime()
		
		progress += newProgress
		if(progress > 1.0):
			progress = 1.0

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
	resultGender = BaseCharacter.generateChildGender()

	print("EGGCELL IMPREGNATED BY "+str(newfatherID)+", species: "+str(resultSpecies)+", gender: "+BaseCharacter.genderToString(resultGender))

func tryImpregnate(whosCum, amountML):
	if(!canImpregnate()):
		return false
	
	var father = GlobalRegistry.getCharacter(whosCum)
	
	var crossSpeciesMod = SpeciesCompatibility.pregnancyChanceMod(motherSpecies, father.getSpecies())
	
	var finalChance = amountML * crossSpeciesMod * 10.0
	print(finalChance)
	
	if(RNG.chance(finalChance)):
		impregnatedBy(whosCum)
		return true
	return false
