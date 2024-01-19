extends Character

func _init():
	id = "maleguard_canine"
	
	pickedSkin="ArconSkin"
	pickedSkinRColor=Color("ff8f6052")
	pickedSkinGColor=Color("ff432d26")
	pickedSkinBColor=Color("ffd5bbb4")
	npcSkinData={
	"hair": {"r": Color("ff9b3716"),"g": Color("ff22456f"),"b": Color("ff3056be"),},
	"penis": {"g": Color("ffff0000"),"b": Color("ff8b0000"),},
	}
	
	npcArmor = {
		DamageType.Physical: 10,
	}
	npcLevel = 1
	npcBasePain = 70
	npcBaseLust = 50
	npcBaseStamina = 60
	npcCharacterType = CharacterType.Guard
	npcLustInterests = {
		InterestTopic.TallyMarks: Interest.KindaLikes,
		InterestTopic.Bodywritings: Interest.KindaLikes,
		InterestTopic.Gags: Interest.Likes,
		InterestTopic.Blindfolds: Interest.KindaLikes,
		InterestTopic.BDSMRestraints: Interest.KindaLikes,
		InterestTopic.ButtPlugs: Interest.ReallyLikes,
		InterestTopic.VaginalPlugs: Interest.Dislikes,
		InterestTopic.FeminineBody: Interest.ReallyLikes,
		InterestTopic.AndroBody: Interest.Dislikes,
		InterestTopic.MasculineBody: Interest.ReallyDislikes,
		InterestTopic.ThickBody: Interest.Likes,
		InterestTopic.AverageMassBody: Interest.KindaLikes,
		InterestTopic.SlimBody: Interest.KindaLikes,
		InterestTopic.ThickButt: Interest.Loves,
		InterestTopic.AverageButt: Interest.KindaLikes,
		InterestTopic.SlimButt: Interest.Likes,
		InterestTopic.NoBreasts: Interest.SlightlyDislikes,
		InterestTopic.SmallBreasts: Interest.KindaLikes,
		InterestTopic.MediumBreasts: Interest.Loves,
		InterestTopic.BigBreasts: Interest.ReallyLikes,
		InterestTopic.LactatingBreasts: Interest.Likes,
		InterestTopic.StuffedPussy: Interest.Loves,
		InterestTopic.StuffedAss: Interest.KindaLikes,
		InterestTopic.StuffedPussyOrAss: Interest.Loves,
		InterestTopic.StuffedThroat: Interest.Likes,
		InterestTopic.CoveredInCum: Interest.Likes,
		InterestTopic.CoveredInLotsOfCum: Interest.Loves,
		InterestTopic.FullyNaked: Interest.Likes,
		InterestTopic.ExposedPussy: Interest.ReallyLikes,
		InterestTopic.ExposedAnus: Interest.Likes,
		InterestTopic.ExposedBreasts: Interest.ReallyLikes,
		InterestTopic.ExposedCock: Interest.KindaLikes,
		InterestTopic.ExposedPanties: Interest.KindaLikes,
		InterestTopic.ExposedBra: Interest.KindaLikes,
		InterestTopic.LooseAnus: Interest.ReallyLikes,
		InterestTopic.LoosePussy: Interest.ReallyLikes,
		InterestTopic.TightAnus: Interest.KindaLikes,
		InterestTopic.TightPussy: Interest.KindaLikes,
		InterestTopic.NoVagina: Interest.Hates,
		InterestTopic.HasVaginaOnly: Interest.Loves,
		InterestTopic.HasVaginaAndCock: Interest.ReallyLikes,
		InterestTopic.BigCock: Interest.Likes,
		InterestTopic.AverageCock: Interest.Likes,
		InterestTopic.SmallCock: Interest.KindaLikes,
		InterestTopic.HasCockOnly: Interest.ReallyDislikes,
	}
	
func _getName():
	return "Male guard"

func getGender():
	return Gender.Male
	
func getSmallDescription() -> String:
	return "A buff canine wearing a guard uniform and armor, this one don’t look kind"

func getSpecies():
	return ["canine"]

func _getAttacks():
	return ["DoubleCuffPC", "CuffPCHands", "ForceGagPC", "ForceMuzzlePC", "stunbatonAttack", "stunbatonOverchargeAttack", "simplekickattack", "shoveattack", "trygetupattack"]

func getFightIntro(_battleName):
	return "The guard prepares to fight"
	
func getLootTable(_battleName):
	return GuardLoot.new()

func getPenisSize():
	return 25.0

func getThickness() -> int:
	return 60

func getFemininity() -> int:
	return 0

func createBodyparts():
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anthrobody"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anthroarms"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anus"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("digilegs"))
	var breasts = GlobalRegistry.createBodypart("malebreasts")
	breasts.size = -1
	giveBodypartUnlessSame(breasts)
	var penis = GlobalRegistry.createBodypart("caninepenis")
	penis.lengthCM = 15
	penis.ballsScale = 1
	giveBodypartUnlessSame(penis)
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("caninetail"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("caninehead"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("mohawkhair"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("canineears"))

func getDefaultEquipment():
	return ["GuardArmor"]
