extends Character

func _init():
	id = "PCTentacles"
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
	pass

#func prepareForSex():
#	var thePers:Personality = personality
#	var theFetishHolder:FetishHolder = fetishHolder
#
#	var theMean:float = 0.0 + anger*1.5 - lust
#	thePers.setStat(PersonalityStat.Mean, clamp(theMean*0.1, -1.0, 1.0))
#	var theDom:float = -5.0 + mind + anger*0.5
#	thePers.setStat(PersonalityStat.Subby, -clamp(theDom*0.1, -1.0, 1.0))
#	var thePerceptive:float = -10.0 + mind*2.0
#	thePers.setStat(PersonalityStat.Naive, -clamp(thePerceptive*0.1, -1.0, 1.0))
#	var theBrave:float = -5.0 + agility*1.5
#	thePers.setStat(PersonalityStat.Coward, -clamp(theBrave*0.1, -1.0, 1.0))
#	var thePatience:float = -5.0 + mind
#	thePers.setStat(PersonalityStat.Impatient, -clamp(thePatience*0.1, -1.0, 1.0))
#
#	var theChoke:float = -5.0 + 3.0*anger
#	theFetishHolder.setFetish(Fetish.Choking, clamp(theChoke*0.1, 0.0, 1.0))
#	var theUncon:float = -5.0 + 2.0*anger
#	theFetishHolder.setFetish(Fetish.UnconsciousSex, clamp(theUncon*0.1, -0.5, 1.0))
#	var theSadism:float = 0.0 + 2.0*anger + agility*0.5 - mind*0.5
#	theFetishHolder.setFetish(Fetish.Sadism, clamp(theSadism*0.1, -0.5, 1.0))
#	var theEx:float = 2.5 + mind*1.5
#	theFetishHolder.setFetish(Fetish.Exhibitionism, clamp(theEx*0.1, -0.5, 1.0))
