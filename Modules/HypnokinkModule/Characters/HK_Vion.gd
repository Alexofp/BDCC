extends Character

func _init():
	id = "vion"
	
	npcLevel = 3
	npcBasePain = 50
	npcBaseLust = 80
	npcCharacterType = CharacterType.Inmate
	
	pickedSkin="SoftSpikySkin"
	pickedSkinRColor=Color("ffecd5d0")
	pickedSkinGColor=Color("ff7f4f45")
	pickedSkinBColor=Color("ff8a8cac")
	npcSkinData={
		"head": {"skin": "NovaSkin","g": Color("ff0d0909"),"b": Color("ff8a6161"),},
		"hair": {"r": Color("ff5a0e2e"),"g": Color("ffd165fd"),"b": Color("ff250202"),},
		"ears": {"g": Color("ffac4545"),"b": Color("ffb615b7"),},
		"penis": {"g": Color("ff9f2c90"),"b": Color("ffc41111"),},
		"tail": {"skin": "ArconSkin","b": Color("ffb24695"),},
	}
	
	npcPersonality = {
		PersonalityStat.Brat: 0.2,
		PersonalityStat.Mean: 0.2,
		PersonalityStat.Subby: -0.5,
		PersonalityStat.Impatient: -0.6,
		PersonalityStat.Naive: -0.5,
		PersonalityStat.Coward: 0.3,
	}
	
	npcFetishes = {
		Fetish.AnalSexReceiving : FetishInterest.SlightlyLikes,
		Fetish.AnalSexGiving : FetishInterest.Loves,
		Fetish.VaginalSexGiving : FetishInterest.Hates,
		Fetish.OralSexReceiving : FetishInterest.Likes,
		Fetish.OralSexGiving : FetishInterest.Likes,
		Fetish.Sadism : FetishInterest.SlightlyLikes,
		Fetish.Masochism : FetishInterest.Dislikes,
		Fetish.UnconsciousSex : FetishInterest.Hates,
		Fetish.BeingBred : FetishInterest.Dislikes,
		Fetish.Bondage : FetishInterest.Neutral,
		Fetish.Condoms : FetishInterest.Neutral,
		Fetish.DrugUse : FetishInterest.Dislikes,
		Fetish.Exhibitionism : FetishInterest.Neutral,
		Fetish.HypnosisHypnotist : FetishInterest.Loves,
		Fetish.HypnosisSubject : FetishInterest.SlightlyLikes
	}
	
	npcLustInterests = {
		InterestTopic.TallyMarks: Interest.ReallyLikes,
		InterestTopic.Bodywritings: Interest.Loves,
		InterestTopic.FeminineBody: Interest.SlightlyDislikes,
		InterestTopic.AndroBody: Interest.KindaLikes,
		InterestTopic.MasculineBody: Interest.ReallyLikes,
		InterestTopic.ThickBody: Interest.KindaLikes,
		InterestTopic.SlimBody: Interest.SlightlyDislikes,
		InterestTopic.MediumBreasts: Interest.SlightlyDislikes,
		InterestTopic.BigBreasts: Interest.Dislikes,
		InterestTopic.LactatingBreasts: Interest.Hates,
		InterestTopic.StuffedPussy: Interest.Dislikes,
		InterestTopic.Pregnant: Interest.ReallyDislikes,
		InterestTopic.StuffedThroat: Interest.KindaLikes,
		InterestTopic.CoveredInCum: Interest.Likes,
		InterestTopic.CoveredInLotsOfCum: Interest.KindaLikes,
		InterestTopic.FullyNaked: Interest.ReallyLikes,
		InterestTopic.ExposedPussy: Interest.SlightlyDislikes,
		InterestTopic.ExposedAnus: Interest.KindaLikes,
		InterestTopic.ExposedBreasts: Interest.SlightlyDislikes,
		InterestTopic.ExposedCock: Interest.Likes,
		InterestTopic.ExposedPanties: Interest.SlightlyDislikes,
		InterestTopic.ExposedBra: Interest.SlightlyDislikes,
		InterestTopic.LooseAnus: Interest.SlightlyDislikes,
		InterestTopic.LoosePussy: Interest.SlightlyDislikes,
		InterestTopic.TightAnus: Interest.KindaLikes,
		InterestTopic.TightPussy: Interest.KindaLikes,
		InterestTopic.NoVagina: Interest.Likes,
		InterestTopic.HasVaginaOnly: Interest.ReallyDislikes,
		InterestTopic.HasVaginaAndCock: Interest.SlightlyDislikes,
		InterestTopic.BigCock: Interest.Likes,
		InterestTopic.AverageCock: Interest.ReallyLikes,
		InterestTopic.SmallCock: Interest.Likes,
		InterestTopic.NoCock: Interest.Dislikes,
		InterestTopic.HasCockOnly: Interest.ReallyLikes,
	}
	
func _getName():
	return "Vion"

func getGender():
	return Gender.Male
	
func getChatColor():
	return "#E866f4"
	
func getSmallDescription() -> String:
	return "A lilac dragon inmate. Supposedly a licensed hypnotherapist"

func getSpecies():
	return ["dragon"]
	
func _getAttacks():
	return ["biteattack", "simplekickattack", "stretchingAttack", "lickWounds", "shoveattack", "trygetupattack"]

func getThickness() -> int:
	return 25

func getFemininity() -> int:
	return 15

func createBodyparts():
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("dragonhead"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("shorthair"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("dragonears"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anthrobody"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anthroarms"))
	var breasts = GlobalRegistry.createBodypart("malebreasts")
	breasts.size = -1
	giveBodypartUnlessSame(breasts)
	var penis = GlobalRegistry.createBodypart("dragonpenis")
	penis.lengthCM = 11
	penis.ballsScale = 0.5
	giveBodypartUnlessSame(penis)
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anus"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("digilegs"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("dragontail"))
	
	
func getLootTable(_battleName):
	return InmateLoot.new()

func getDefaultEquipment():
	return ["inmatecollar", "inmateuniformSexDeviant", "VionGlasses"]
