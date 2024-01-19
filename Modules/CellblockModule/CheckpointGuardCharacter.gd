extends Character

func _init():
	id = "cp_guard"
	
	npcBasePain = 80
	npcCharacterType = CharacterType.Guard
	
	pickedSkin="FerriSkin"
	pickedSkinRColor=Color("ff4d3b39")
	pickedSkinGColor=Color("ff58413e")
	pickedSkinBColor=Color("ff2f2524")
	npcSkinData={
	"hair": {"r": Color("ff191919"),"g": Color("ff171717"),"b": Color("ff0d0d0d"),},
	"penis": {"g": Color("ff861818"),"b": Color("ff6c1c1c"),},
	}
	
	npcArmor = {
		DamageType.Physical: 10,
	}
	npcStats = {
		Stat.Sexiness: 1,
	}
	npcLevel = 2
	npcLustInterests = {
		InterestTopic.TallyMarks: Interest.KindaLikes,
		InterestTopic.Bodywritings: Interest.KindaLikes,
		InterestTopic.Gags: Interest.ReallyLikes,
		InterestTopic.Blindfolds: Interest.Loves,
		InterestTopic.BDSMRestraints: Interest.ReallyLikes,
		InterestTopic.ButtPlugs: Interest.Likes,
		InterestTopic.VaginalPlugs: Interest.ReallyLikes,
		InterestTopic.FeminineBody: Interest.Loves,
		InterestTopic.AndroBody: Interest.Likes,
		InterestTopic.MasculineBody: Interest.Dislikes,
		InterestTopic.ThickBody: Interest.ReallyDislikes,
		InterestTopic.AverageMassBody: Interest.ReallyLikes,
		InterestTopic.SlimBody: Interest.Likes,
		InterestTopic.ThickButt: Interest.Loves,
		InterestTopic.AverageButt: Interest.KindaLikes,
		InterestTopic.SlimButt: Interest.Dislikes,
		InterestTopic.NoBreasts: Interest.Dislikes,
		InterestTopic.SmallBreasts: Interest.KindaLikes,
		InterestTopic.MediumBreasts: Interest.ReallyLikes,
		InterestTopic.BigBreasts: Interest.Loves,
		InterestTopic.LactatingBreasts: Interest.Loves,
		InterestTopic.StuffedPussy: Interest.ReallyLikes,
		InterestTopic.StuffedAss: Interest.Likes,
		InterestTopic.StuffedPussyOrAss: Interest.Likes,
		InterestTopic.StuffedThroat: Interest.KindaLikes,
		InterestTopic.CoveredInCum: Interest.ReallyLikes,
		InterestTopic.CoveredInLotsOfCum: Interest.Likes,
		InterestTopic.FullyNaked: Interest.ReallyLikes,
		InterestTopic.ExposedPussy: Interest.ReallyLikes,
		InterestTopic.ExposedAnus: Interest.Likes,
		InterestTopic.ExposedBreasts: Interest.Loves,
		InterestTopic.ExposedCock: Interest.KindaLikes,
		InterestTopic.ExposedPanties: Interest.Likes,
		InterestTopic.ExposedBra: Interest.Likes,
		InterestTopic.LooseAnus: Interest.Loves,
		InterestTopic.LoosePussy: Interest.Loves,
		InterestTopic.TightAnus: Interest.Dislikes,
		InterestTopic.TightPussy: Interest.Dislikes,
		InterestTopic.NoVagina: Interest.Dislikes,
		InterestTopic.HasVaginaOnly: Interest.KindaLikes,
		InterestTopic.HasVaginaAndCock: Interest.Hates,
		InterestTopic.BigCock: Interest.Hates,
		InterestTopic.AverageCock: Interest.ReallyLikes,
		InterestTopic.SmallCock: Interest.KindaLikes,
		InterestTopic.NoCock: Interest.KindaLikes,
		InterestTopic.HasCockOnly: Interest.KindaLikes,
	}
	
func _getName():
	return "Checkpoint guard"

func getGender():
	return Gender.Male
	
func getSmallDescription() -> String:
	return "A male canine wearing a guard uniform and a light armor"

func getSpecies():
	return ["canine"]

func _getAttacks():
	return ["DoubleCuffPC", "CuffPCHands", "ForceRingGagPC", "stunbatonAttack", "stunbatonOverchargeAttack", "simplekickattack", "shoveattack", "trygetupattack"]

func getFightIntro(_battleName):
	return "The guard grabs his stun baton and offers you to do the first move"

func getLootTable(_battleName):
	return GuardLoot.new()

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
	penis.lengthCM = 18
	penis.ballsScale = 1
	giveBodypartUnlessSame(penis)
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("caninetail"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("caninehead"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("canineears"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("messyhair"))

func getDefaultEquipment():
	return ["GuardArmor"]
