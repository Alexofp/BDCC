extends Character

func _init():
	id = "PCTentacles"
	disableSerialization = true
	
	npcDefaultFetishInterest = FetishInterest.Neutral
	npcPersonality = {
		PersonalityStat.Brat: 0.0,
		PersonalityStat.Mean: 0.0,
		PersonalityStat.Subby: -1.0,
		PersonalityStat.Impatient: 0.0,
		PersonalityStat.Naive: -1.0,
		PersonalityStat.Coward: -1.0,
	}
	npcFetishes = {
		Fetish.VaginalSexGiving : FetishInterest.Likes,
		Fetish.AnalSexGiving : FetishInterest.Likes,
		Fetish.Exhibitionism : FetishInterest.Likes,
		Fetish.OralSexGiving : FetishInterest.Likes,
		Fetish.OralSexReceiving : FetishInterest.Likes,
		Fetish.Breeding : FetishInterest.Likes,
		
		Fetish.Choking : FetishInterest.Likes, # Optional ?
		Fetish.Sadism : FetishInterest.Likes, # Optional ?
		Fetish.UnconsciousSex : FetishInterest.Likes, # Optional?
	}
	
func _getName():
	var theName:String = "Tentacles"
	if(GM.main != null):
		var newName:String = GM.main.getFlag("ElizaModule.tent_name", "")
		if(!newName.empty()):
			theName = newName
	return theName

func getGender():
	return Gender.Other
	
func getSmallDescription() -> String:
	return "A tentacle monster made out of multiple slick green tendrils.."

func getSpecies():
	return ["unknown"]

#func getPenisSize():
#	return 20.0

func getCustomFluidType(_fluidSource) -> String:
	return "IvyNectar"

#func getFluidAmount(_fluidSource):
#	return RNG.randf_range(350.0, 750.0)

func getBaseFertility() -> float:
	return 0.0

# Can't get pregnant from it
func getBaseVirility() -> float:
	return 0.0

func createBodyparts():
	var penis = GlobalRegistry.createBodypart("humanpenis")
	penis.lengthCM = 22
	penis.ballsScale = 1
	giveBodypartUnlessSame(penis)

func getCustomAttribute(id):
	if(id == BuffAttribute.OverstimulationThresholdAll):
		return 100.0
	
	return .getCustomAttribute(id)

func prepareForSex():
	var theMood:String = GM.main.getFlag("ElizaModule.tent_mood", "") # "" mean kind lusty
	var thePers:Personality = personality
	var theFetishHolder:FetishHolder = fetishHolder
	
	if(theMood == "mean"):
		theFetishHolder.setFetish(Fetish.Choking, 1.0)
		theFetishHolder.setFetish(Fetish.UnconsciousSex, 1.0)
		theFetishHolder.setFetish(Fetish.Sadism, 1.0)
		theFetishHolder.setFetish(Fetish.Exhibitionism, -1.0)
		theFetishHolder.setFetish(Fetish.AnalSexGiving, 0.25)
		theFetishHolder.setFetish(Fetish.VaginalSexGiving, 0.25)
		theFetishHolder.setFetish(Fetish.OralSexGiving, 0.0)
		theFetishHolder.setFetish(Fetish.OralSexReceiving, 0.25)
		theFetishHolder.setFetish(Fetish.Breeding, 0.5)
		thePers.setStat(PersonalityStat.Mean, 1.0)
	elif(theMood == "kind"):
		theFetishHolder.setFetish(Fetish.Choking, -1.0)
		theFetishHolder.setFetish(Fetish.UnconsciousSex, -1.0)
		theFetishHolder.setFetish(Fetish.Sadism, -1.0)
		theFetishHolder.setFetish(Fetish.Exhibitionism, 1.0)
		theFetishHolder.setFetish(Fetish.AnalSexGiving, -0.25)
		theFetishHolder.setFetish(Fetish.VaginalSexGiving, -0.25)
		theFetishHolder.setFetish(Fetish.OralSexGiving, 0.5)
		theFetishHolder.setFetish(Fetish.OralSexReceiving, 0.5)
		theFetishHolder.setFetish(Fetish.Breeding, -1.0)
		thePers.setStat(PersonalityStat.Mean, -1.0)
	elif(theMood == "lusty"):
		theFetishHolder.setFetish(Fetish.Choking, 0.25)
		theFetishHolder.setFetish(Fetish.UnconsciousSex, -0.25)
		theFetishHolder.setFetish(Fetish.Sadism, 0.0)
		theFetishHolder.setFetish(Fetish.Exhibitionism, -1.0)
		theFetishHolder.setFetish(Fetish.AnalSexGiving, 1.0)
		theFetishHolder.setFetish(Fetish.VaginalSexGiving, 1.0)
		theFetishHolder.setFetish(Fetish.OralSexGiving, 1.0)
		theFetishHolder.setFetish(Fetish.OralSexReceiving, 1.0)
		theFetishHolder.setFetish(Fetish.Breeding, 1.0)
		thePers.setStat(PersonalityStat.Mean, 0.0)
	else:
		theFetishHolder.setFetish(Fetish.Choking, 0.0)
		theFetishHolder.setFetish(Fetish.UnconsciousSex, 0.0)
		theFetishHolder.setFetish(Fetish.Sadism, 0.25)
		theFetishHolder.setFetish(Fetish.Exhibitionism, 0.75)
		theFetishHolder.setFetish(Fetish.AnalSexGiving, 0.5)
		theFetishHolder.setFetish(Fetish.VaginalSexGiving, 0.5)
		theFetishHolder.setFetish(Fetish.OralSexGiving, 0.5)
		theFetishHolder.setFetish(Fetish.OralSexReceiving, 0.5)
		theFetishHolder.setFetish(Fetish.Breeding, 0.2)
		thePers.setStat(PersonalityStat.Mean, -0.1)

func tentaclesProcessTalk(_text:String) -> String:
	if(!GM.main.getFlag("ElizaModule.tent_neurolink", false)):
		return ""
	return _text

func loadData(data):
	.loadData(data)
	prepareForSex()
