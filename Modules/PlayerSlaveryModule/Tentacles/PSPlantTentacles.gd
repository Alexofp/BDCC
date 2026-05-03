extends Character

func _init():
	id = "psplantTentacles"
	disableSerialization = true
	
	npcDefaultFetishInterest = FetishInterest.Neutral
	npcPersonality = {
		PersonalityStat.Brat: 0.0,
		PersonalityStat.Mean: 0.0,
		PersonalityStat.Subby: 0.0,
		PersonalityStat.Impatient: 0.0,
		PersonalityStat.Naive: 0.0,
		PersonalityStat.Coward: 0.0,
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
	if(GM.main != null):
		if(GM.main.PS && GM.main.PS.id == "Tentacles"):
		 return GM.main.PS.getMonsterName()
	return "Plant Tentacles"

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
	# Will never be visible but still need this stuff for the sex activities to function
	var penis = GlobalRegistry.createBodypart("humanpenis")
	penis.lengthCM = 22
	penis.ballsScale = 1
	giveBodypartUnlessSame(penis)
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("humanhead"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anthrobody"))
	var breasts = GlobalRegistry.createBodypart("humanbreasts")
	breasts.size = 3
	giveBodypartUnlessSame(breasts)
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anus"))

func getCustomAttribute(id):
	if(id == BuffAttribute.OverstimulationThresholdAll):
		return 100.0
	
	return .getCustomAttribute(id)

func tentaclesProcessTalk(_text:String) -> String:
	var currentSlavery = GM.main.PS
	if(!currentSlavery || currentSlavery.id != "Tentacles"):
		return ""
	return currentSlavery.processTalkText(_text)
