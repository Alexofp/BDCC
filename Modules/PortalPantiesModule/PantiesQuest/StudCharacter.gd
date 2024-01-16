extends Character

func _init():
	id = "stud"
	
	pickedSkin="MonsterGirl"
	pickedSkinRColor=Color("ff8c5c3b")
	pickedSkinGColor=Color("ff412b1c")
	pickedSkinBColor=Color("ffb98764")
	npcSkinData={
	"hair": {"r": Color("ffa87c4a"),"g": Color("ffc99667"),"b": Color("ffdfa865"),},
	"penis": {"g": Color("ffb70000"),"b": Color("ff882121"),},
	}
	
	npcLevel = 5
	npcBasePain = 115
	npcBaseLust = 100
	npcCharacterType = CharacterType.Inmate
	npcLustInterests = {
		InterestTopic.TallyMarks: Interest.Loves,
		InterestTopic.Bodywritings: Interest.Loves,
		InterestTopic.Gags: Interest.Dislikes,
		InterestTopic.Blindfolds: Interest.Likes,
		InterestTopic.BDSMRestraints: Interest.ReallyLikes,
		InterestTopic.ButtPlugs: Interest.ReallyLikes,
		InterestTopic.VaginalPlugs: Interest.Likes,
		InterestTopic.FeminineBody: Interest.Loves,
		InterestTopic.AndroBody: Interest.Likes,
		InterestTopic.MasculineBody: Interest.Hates,
		InterestTopic.ThickBody: Interest.Likes,
		InterestTopic.AverageMassBody: Interest.ReallyLikes,
		InterestTopic.SlimBody: Interest.KindaLikes,
		InterestTopic.ThickButt: Interest.Loves,
		InterestTopic.AverageButt: Interest.Likes,
		InterestTopic.SlimButt: Interest.KindaLikes,
		InterestTopic.NoBreasts: Interest.KindaLikes,
		InterestTopic.SmallBreasts: Interest.Likes,
		InterestTopic.MediumBreasts: Interest.ReallyLikes,
		InterestTopic.BigBreasts: Interest.Loves,
		InterestTopic.LactatingBreasts: Interest.Loves,
		InterestTopic.StuffedPussy: Interest.Loves,
		InterestTopic.StuffedAss: Interest.KindaLikes,
		InterestTopic.StuffedPussyOrAss: Interest.Likes,
		InterestTopic.Pregnant: Interest.Loves,
		InterestTopic.StuffedThroat: Interest.Likes,
		InterestTopic.CoveredInCum: Interest.Likes,
		InterestTopic.CoveredInLotsOfCum: Interest.Loves,
		InterestTopic.FullyNaked: Interest.Loves,
		InterestTopic.ExposedPussy: Interest.Loves,
		InterestTopic.ExposedAnus: Interest.KindaLikes,
		InterestTopic.ExposedBreasts: Interest.ReallyLikes,
		InterestTopic.ExposedCock: Interest.Dislikes,
		InterestTopic.ExposedPanties: Interest.KindaLikes,
		InterestTopic.ExposedBra: Interest.KindaLikes,
		InterestTopic.LooseAnus: Interest.Likes,
		InterestTopic.LoosePussy: Interest.Loves,
		InterestTopic.TightAnus: Interest.ReallyLikes,
		InterestTopic.TightPussy: Interest.Likes,
		InterestTopic.NoVagina: Interest.Dislikes,
		InterestTopic.HasVaginaOnly: Interest.Likes,
		InterestTopic.HasVaginaAndCock: Interest.KindaLikes,
		InterestTopic.BigCock: Interest.Hates,
		InterestTopic.AverageCock: Interest.Hates,
		InterestTopic.SmallCock: Interest.KindaLikes,
		InterestTopic.NoCock: Interest.Likes,
		InterestTopic.HasCockOnly: Interest.SlightlyDislikes,
	}
	
func _getName():
	return "Stud"

func getGender():
	return Gender.Male
	
func getSmallDescription() -> String:
	return "Strong stallion wearing a red inmate uniform."

func getSpecies():
	return ["equine"]

func _getAttacks():
	return ["simplepunchattack", "ShivAttack", "simplekickattack", "BreedingTaunt", "biteattack", "trygetupattack"]

func getFightIntro(_battleName):
	var mes = "Stud rubs his fist and waits for your first move"
	return mes

func getThickness() -> int:
	return 80

func getFemininity() -> int:
	return 0

func createBodyparts():
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("horseheadbig"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("horseears"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anthrobody"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("buffarms"))
	var breasts = GlobalRegistry.createBodypart("malebreasts")
	breasts.size = -1
	giveBodypartUnlessSame(breasts)
	var penis = GlobalRegistry.createBodypart("equinepenis")
	penis.lengthCM = 30
	penis.ballsScale = 1
	giveBodypartUnlessSame(penis)
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("horsetail"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anus"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("hoofs"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("longhair"))

func getDefaultEquipment():
	return ["inmatecollar", "inmateuniformHighsec"]

func getLootTable(_battleName):
	return InmateLoot.new()
