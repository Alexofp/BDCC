extends Character

func _init():
	id = "socket"
	npcHasMenstrualCycle = false
	npcCharacterType = CharacterType.Engineer
	
	pickedSkin="SocketSkin"
	pickedSkinRColor=Color("ffa37d64")
	pickedSkinGColor=Color("ffe4c7b9")
	pickedSkinBColor=Color("ff834d35")
	npcSkinData={
	"hair": {"r": Color("ff351d18"),"g": Color("ff4f2c23"),"b": Color("ff351d18"),},
	"ears": {"g": Color("ffdfa19b"),"b": Color("ffe9d8d2"),},
	"breasts": {"r": Color("ffeba794"),"b": Color("ffb7736c"),},
	}
	
	npcPersonality = {
		PersonalityStat.Brat: 0.3,
		PersonalityStat.Mean: -1.0,
		PersonalityStat.Subby: 0.75,
		PersonalityStat.Impatient: 0.4,
		PersonalityStat.Naive: 1.0,
		PersonalityStat.Coward: -0.5,
	}
	npcDefaultFetishInterest = FetishInterest.Neutral
	npcFetishes = {
		Fetish.AnalSexReceiving : FetishInterest.ReallyDislikes,
		Fetish.AnalSexGiving : FetishInterest.Hates,
		Fetish.VaginalSexGiving : FetishInterest.Hates,
		Fetish.VaginalSexReceiving : FetishInterest.Loves,
		Fetish.OralSexReceiving : FetishInterest.Likes,
		Fetish.OralSexGiving : FetishInterest.Likes,
		Fetish.Sadism : FetishInterest.ReallyDislikes,
		Fetish.Masochism : FetishInterest.Hates,
		Fetish.UnconsciousSex : FetishInterest.Loves,
		Fetish.BeingBred : FetishInterest.Dislikes,
		Fetish.Bondage : FetishInterest.Likes,
		Fetish.Rigging : FetishInterest.Likes,
		Fetish.Condoms : FetishInterest.Dislikes,
		Fetish.DrugUse : FetishInterest.Likes,
		Fetish.Exhibitionism : FetishInterest.Loves,
		Fetish.Tribadism : FetishInterest.SlightlyDislikes,
		Fetish.StraponSexVaginal : FetishInterest.Dislikes,
		Fetish.StraponSexAnal : FetishInterest.SlightlyDislikes,
		Fetish.Choking : FetishInterest.SlightlyDislikes,
		Fetish.HypnosisSubject : FetishInterest.Loves,
	}
	
	npcHasMenstrualCycle = true
	
func _getName():
	return "Socket"

func getGender():
	return Gender.Female
	
func getSmallDescription() -> String:
	return "Cute fennec that wears a very revealing armor."

func getChatColor():
	return '#FFC700'

func getSpecies():
	return ["canine"]

func getThickness() -> int:
	return 100

func getFemininity() -> int:
	return 100

func createBodyparts():
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("fennechead"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("sockethair"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("fennecears"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anthrobody"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anthroarms"))
	var breasts = GlobalRegistry.createBodypart("humanbreasts")
	breasts.size = 3
	giveBodypartUnlessSame(breasts)
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("vagina"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anus"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("fennectail"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("digilegs"))

func getDefaultEquipment():
	return ["SocketArmor", "SocketVisorUp", "SocketBackpack"]

func getPortalSexHoleAvailable(_bodypartSlot):
	if(GM.main != null && GM.main.getFlag("SocketModule.hasPortalPussy")):
		if(_bodypartSlot == BodypartSlot.Vagina):
			return true
	
	return false

func isWearingInvisiblePortalPanties():
	if(GM.main != null && GM.main.getFlag("SocketModule.hasPortalPussy")):
		return true
	return false

func updateBodyparts():
	if(GM.main != null):
		if(!GM.main.getFlag("SocketModule.removedWombImplant", false)):
			skillsHolder.addPerk(Perk.StartNoHeat)
			skillsHolder.addPerk(Perk.StartInfertile)
		else:
			skillsHolder.removePerk(Perk.StartNoHeat)
			skillsHolder.removePerk(Perk.StartInfertile)
