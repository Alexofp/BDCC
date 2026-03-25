extends Reference
class_name EggCell

var lifeSpan: int # seconds
var orificeType: int = OrificeType.Vagina
var isimpregnated = false
var motherID:String = ""
var fatherID:String = ""
var causerID:String = ""
var progress:float = 0.0
var motherSpecies:Array = []
var resultSpecies:Array = []
var resultGender:String = NpcGender.Male
var monozygotic: int = 1
var fetusReadyForBirth := false

var bigEgg:bool = false # If true, this egg will turn into a big egg when impregnated
var tentacleEggType:int = TentacleEggType.NONE # Did this egg come from a tentacle monster
# Tentacle eggs don't get born as children, they instead become fruits (if egg was a plant one)

var cycle = null

func _init():
	#lifeSpan = 60*60*24*2 + RNG.randi_range(-60*60*12, 60*60*24)
	var optionsLifespan:int = OPTIONS.getEggCellLifespanHours()
	optionsLifespan = Util.maxi(optionsLifespan, 1)
	#warning-ignore:integer_division
	var minRange:int = int(optionsLifespan / 4)
	#warning-ignore:integer_division
	var maxRange:int = int(optionsLifespan / 2)
	lifeSpan = 60*60*optionsLifespan + RNG.randi_range(-60*60*minRange, 60*60*maxRange)

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

func setMother(newmotherID:String, newmotherSpecies:Array):
	motherID = newmotherID
	motherSpecies = newmotherSpecies

func getMotherID() -> String:
	return motherID

func getFatherID() -> String:
	return fatherID

func setCauserID(newcauser:String):
	causerID = newcauser

func setOrifice(orif:int):
	orificeType = orif

func getOrifice() -> int:
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
	var gestationTime := getGestationTime()
	var currentProgress := min(1.0, getProgress())
	return int(gestationTime * (1.0 - currentProgress))

func processTime(seconds:float): #seconds is float because pregnancy speed is float
	var ispeed:int = int(ceil(seconds))
	if(!isimpregnated):
		lifeSpan -= ispeed
		if(lifeSpan < 0):
			removeMe()
	else:
		if(tentacleEggType == TentacleEggType.NONE):
			var newProgress: float = float(seconds) / getGestationTime()
			
			if((progress + newProgress) >= 1.0):
				fetusReadyForBirth = true
			
			progress += newProgress
			if(progress > 2.5):
				progress = 2.5

		else: # Tentacle eggs
			lifeSpan -= ispeed # Lifespan is the grow time for tentacle eggs
			if(lifeSpan <= 0):
				fetusReadyForBirth = true
				lifeSpan = 0

func delayEgg(_time:int):
	if(tentacleEggType == TentacleEggType.NONE):
		var theGestTime := getGestationTime()
		var adjustedTime:float = float(_time) / float(theGestTime)
		progress = clamp(1.0 - adjustedTime, 0.0, 1.0)
	else:
		if(lifeSpan < _time):
			lifeSpan = _time
	if(_time > 0):
		fetusReadyForBirth = false

func getTimeUntilReadyToBeLaid() -> int:
	if(tentacleEggType == TentacleEggType.NONE):
		var theGestTime := getGestationTime()
		var progressLeft:float = 1.0 - progress
		return int(theGestTime * progressLeft)
	else:
		return lifeSpan

func fetusIsReadyForBirth() -> bool:
	if(tentacleEggType != TentacleEggType.NONE): # Tentacle eggs work differnetly
		return false
	if(bigEgg): # Big eggs need to be laid
		return false
	return fetusReadyForBirth

func isReadyToBeLaid() -> bool:
	if(bigEgg || (tentacleEggType != TentacleEggType.NONE)):
		return fetusReadyForBirth
	return false

func getProgress() -> float:
	return progress

func canImpregnate() -> bool:
	return !isimpregnated

func isImpregnated() -> bool:
	return isimpregnated

func impregnatedBy(fluidDNA):
	if(isimpregnated):
		return
	
	isimpregnated = true
	fatherID = fluidDNA.getCharacterID()
	causerID = fluidDNA.getCauserID()
	
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
	
	print("EGGCELL IMPREGNATED BY "+str(fatherID)+", species: "+str(resultSpecies)+", gender: "+NpcGender.getVisibleName(resultGender), ", division: ", monozygotic, "" if causerID == "" else (" CAUSER: "+causerID))

func tryImpregnate(fluidDNA, amountML:float, eggMultiplier:float = 1.0, fertility:float = 1.0, crossSpeciesCompatibility:float = 0.0) -> bool:
	if(!canImpregnate()):
		return false
	
	var virility:float = fluidDNA.getVirility()
	
	if(!GlobalRegistry.characterExists(fluidDNA.getCharacterID())):
		return false
	
	var crossSpeciesMod:float = SpeciesCompatibility.pregnancyChanceMod(motherSpecies, fluidDNA.getSpecies())
	if(crossSpeciesCompatibility > 0.0):
		crossSpeciesMod = min(crossSpeciesCompatibility, crossSpeciesMod)
	if(crossSpeciesCompatibility < 0.0):
		crossSpeciesMod = crossSpeciesMod * (1.0 - abs(crossSpeciesCompatibility))
	crossSpeciesMod = clamp(crossSpeciesMod, 0.0, 1.0)
	virility = max(virility, 0.0)
	fertility = max(fertility, 0.0)
	
	var finalChance:float = amountML * crossSpeciesMod * 5.0 * eggMultiplier * virility * fertility * OPTIONS.getImpregnationChanceModifier()
	#print(finalChance)
	
	if(RNG.chance(finalChance)):
		impregnatedBy(fluidDNA)
		setMonozygotic()
		return true
	return false

func setBigEgg(_big:bool):
	bigEgg = _big

func setTentacleEggType(_type:int):
	tentacleEggType = _type

func makeChilds() -> Array:
	var result:Array = []
	for x in monozygotic:
		var newChild: Child = Child.new()
		newChild.generateUniqueID()
		newChild.loadFromEggCell(self)
		newChild.generateName()
		newChild.setBirthday(GM.main.getDays())
		newChild.setBornFromMonozygoticStatus(monozygotic)
	
		result.append(newChild)
	return result

func saveData() -> Dictionary:
	var data:Dictionary = {
		"lifeSpan": lifeSpan,
		"orificeType": orificeType,
		"isimpregnated": isimpregnated,
		"motherID": motherID,
		"fatherID": fatherID,
		"causerID": causerID,
		"progress": progress,
		"motherSpecies": motherSpecies,
		"resultSpecies": resultSpecies,
		"resultGender": resultGender,
		"monozygotic": monozygotic,
		"fetusReadyForBirth": fetusReadyForBirth
	}
	if(bigEgg):
		data["bigEgg"] = bigEgg
	if(tentacleEggType != TentacleEggType.NONE):
		data["tentacleEggType"] = tentacleEggType
	
	return data

func loadData(data:Dictionary):
	lifeSpan = SAVE.loadVar(data, "lifeSpan", 0)
	orificeType = SAVE.loadVar(data, "orificeType", OrificeType.Vagina)
	isimpregnated = SAVE.loadVar(data, "isimpregnated", false)
	motherID = SAVE.loadVar(data, "motherID", "pc")
	fatherID = SAVE.loadVar(data, "fatherID", "pc")
	causerID = SAVE.loadVar(data, "causerID", "")
	progress = SAVE.loadVar(data, "progress", 0.0)
	motherSpecies = SAVE.loadVar(data, "motherSpecies", ["feline"])
	resultSpecies = SAVE.loadVar(data, "resultSpecies", [])
	resultGender = SAVE.loadVar(data, "resultGender", NpcGender.Male)
	monozygotic = SAVE.loadVar(data, "monozygotic", 1)
	fetusReadyForBirth = SAVE.loadVar(data, "fetusReadyForBirth", false)
	
	if(data.has("bigEgg")):
		bigEgg = SAVE.loadVar(data, "bigEgg", false)
	if(data.has("tentacleEggType")):
		tentacleEggType = SAVE.loadVar(data, "tentacleEggType", TentacleEggType.NONE)
