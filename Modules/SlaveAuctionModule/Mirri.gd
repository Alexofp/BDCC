extends Character

func _init():
	id = "mirri"
	
	pickedSkin="FurGirl"
	pickedSkinRColor=Color("ffb67d70")
	pickedSkinGColor=Color("ffbb5466")
	pickedSkinBColor=Color("ff1f1f1f")
	npcSkinData={
	"hair": {"r": Color("ff900c0a"),"g": Color("ff830200"),"b": Color("ff2c2a2a"),},
	"ears": {"r": Color("ff891917"),"g": Color("ffcca2a2"),"b": Color("fff3e9e9"),},
	"tail": {"r": Color("ff891917"),"g": Color("ff790402"),"b": Color("ff891917"),},
	}
	
	npcLevel = 25
	npcBasePain = 200
	npcBaseLust = 200
	npcCharacterType = CharacterType.Guard
	
	npcPersonality = {
		PersonalityStat.Brat: 1.0,
		PersonalityStat.Mean: 0.7,
		PersonalityStat.Subby: -1.0,
		PersonalityStat.Impatient: 0.6,
		PersonalityStat.Naive: -0.5,
		PersonalityStat.Coward: -0.5,
	}

	npcFetishes = {
		Fetish.VaginalSexReceiving : FetishInterest.Loves,
		Fetish.AnalSexReceiving : FetishInterest.Likes,
		Fetish.OralSexGiving : FetishInterest.SlightlyLikes,
		Fetish.OralSexReceiving : FetishInterest.Loves,
		Fetish.Tribadism : FetishInterest.Loves,
		Fetish.StraponSexVaginal : FetishInterest.Loves,
		Fetish.StraponSexAnal : FetishInterest.Loves,
		Fetish.Bodywritings : FetishInterest.Loves,
		Fetish.Masochism : FetishInterest.Likes,
		Fetish.Sadism : FetishInterest.Loves,
		Fetish.Choking : FetishInterest.Loves,
		Fetish.UnconsciousSex : FetishInterest.Dislikes,
		Fetish.DrugUse : FetishInterest.Dislikes,
		Fetish.BeingBred : FetishInterest.Dislikes,
		Fetish.Condoms : FetishInterest.Likes,
		Fetish.Lactation : FetishInterest.SlightlyLikes,
		Fetish.SeedMilking : FetishInterest.Likes,
		Fetish.Exhibitionism : FetishInterest.Loves,
		Fetish.Bondage : FetishInterest.ReallyLikes,
		Fetish.Rigging : FetishInterest.Loves,
		Fetish.RimmingGiving : FetishInterest.Hates,
		Fetish.RimmingReceiving : FetishInterest.SlightlyDislikes,
		Fetish.FeetplayGiving : FetishInterest.SlightlyLikes,
		Fetish.FeetplayReceiving : FetishInterest.SlightlyDislikes,
	}
	npcLustInterests = {

	}
	
func _getName():
	if(GM.main != null):
		if(!GM.main.getFlag("SlaveAuctionModule.knowsMirriName", false) && !GM.main.getFlag("SlaveAuctionModule.s1hap", false)):
			return "Catgirl Guard"
		if(GM.main.getFlag("SlaveAuctionModule.mirriNotBlacktail", false)):
			return "Mirri"
	return "Mirri Blacktail"

func getGender():
	return Gender.Female
	
func getSmallDescription() -> String:
	return "A ginger guard who is wearing a very skimpy armor"

func getChatColor():
	return "#E24F4D"

func getSpecies():
	return ["feline", "human"]

func _getAttacksForBattle(_battlename):
	var res := ["biteattack", "MirriFlasher", "MirriTease", "HeatGrenade", "simplekickattack", "stretchingAttack", "trygetupattack"]
	
	if(_battlename == "firstFight"):
		res.append("stunbatonAttack")
	if(_battlename == "domFight"):
		res.append("MirriStealthSuit")
	if(_battlename == "finalFight"):
		res.append("MirriStealthSuit")
		res.append("MirriPistolShot")
		res.append("StrongBite")
	
	return res

func getFightIntro(_battleName):
	return getName() + " gets into the combat stance and prepares for a fight."

func getThickness() -> int:
	return 100

func getFemininity() -> int:
	return 0

func createBodyparts():
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anthrobody"))
	var breasts = GlobalRegistry.createBodypart("humanbreasts")
	breasts.size = BreastsSize.D
	giveBodypartUnlessSame(breasts)
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anus"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("vagina"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("digilegs"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anthroarms"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("felineears2"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("ponytailhair4"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("felinetail"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("humanhead"))

func getLootTable(_battleName):
	return GuardLoot.new()

func getDefaultEquipment():
	return ["MirriArmor", "MirriPanties"]

func updateBodyparts():
	var auctionModule = GlobalRegistry.getModule("SlaveAuctionModule")

	if(auctionModule.isMirriOnPill()):
		if(!hasPerk(Perk.StartNoHeat) || !hasPerk(Perk.StartInfertile)):
			skillsHolder.addPerk(Perk.StartNoHeat)
			skillsHolder.addPerk(Perk.StartInfertile)
	else:
		if(hasPerk(Perk.StartNoHeat) || hasPerk(Perk.StartInfertile)):
			skillsHolder.removePerk(Perk.StartNoHeat)
			skillsHolder.removePerk(Perk.StartInfertile)
