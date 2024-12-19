extends Character

func _init():
	id = "luxe"
	
	pickedSkin="LuxeSkin"
	pickedSkinRColor=Color("ff171717")
	pickedSkinGColor=Color("ff353535")
	pickedSkinBColor=Color("fff8c610")
	npcSkinData={
	"hair": {"r": Color("ff171717"),"g": Color("ff353535"),"b": Color("fff8c610"),},
	"penis": {"skin": "Weiny","g": Color("ff1e1900"),"b": Color("ffffb800"),},
	}
	
	npcLevel = 75
	npcBasePain = 500
	npcBaseLust = 500
	npcBaseStamina = 200
	npcCharacterType = CharacterType.Generic
	
	npcLustInterests = {
		InterestTopic.TallyMarks: Interest.Hates,
		InterestTopic.Bodywritings: Interest.Hates,
		InterestTopic.Gags: Interest.Likes,
		InterestTopic.Blindfolds: Interest.Likes,
		InterestTopic.BDSMRestraints: Interest.Likes,
		InterestTopic.ButtPlugs: Interest.Hates,
		InterestTopic.VaginalPlugs: Interest.Hates,
		InterestTopic.FeminineBody: Interest.Likes,
		InterestTopic.AndroBody: Interest.Loves,
		InterestTopic.MasculineBody: Interest.Likes,
		InterestTopic.ThickBody: Interest.ReallyDislikes,
		InterestTopic.AverageMassBody: Interest.Loves,
		InterestTopic.SlimBody: Interest.Likes,
		InterestTopic.ThickButt: Interest.KindaLikes,
		InterestTopic.AverageButt: Interest.Likes,
		InterestTopic.SlimButt: Interest.KindaLikes,
		InterestTopic.NoBreasts: Interest.KindaLikes,
		InterestTopic.SmallBreasts: Interest.Dislikes,
		InterestTopic.MediumBreasts: Interest.ReallyLikes,
		InterestTopic.BigBreasts: Interest.Hates,
		InterestTopic.LactatingBreasts: Interest.Dislikes,
		InterestTopic.StuffedPussy: Interest.Dislikes,
		InterestTopic.StuffedAss: Interest.Dislikes,
		InterestTopic.StuffedPussyOrAss: Interest.Dislikes,
		InterestTopic.Pregnant: Interest.Hates,
		InterestTopic.StuffedThroat: Interest.Hates,
		InterestTopic.CoveredInCum: Interest.Hates,
		InterestTopic.CoveredInLotsOfCum: Interest.Hates,
		InterestTopic.FullyNaked: Interest.Hates,
		InterestTopic.ExposedPussy: Interest.SlightlyDislikes,
		InterestTopic.ExposedAnus: Interest.SlightlyDislikes,
		InterestTopic.ExposedBreasts: Interest.SlightlyDislikes,
		InterestTopic.ExposedCock: Interest.SlightlyDislikes,
		InterestTopic.ExposedPanties: Interest.Likes,
		InterestTopic.ExposedBra: Interest.Likes,
		InterestTopic.LooseAnus: Interest.KindaLikes,
		InterestTopic.LoosePussy: Interest.KindaLikes,
		InterestTopic.TightAnus: Interest.ReallyLikes,
		InterestTopic.TightPussy: Interest.ReallyLikes,
		InterestTopic.HasVaginaAndCock: Interest.Loves,
		InterestTopic.BigCock: Interest.SlightlyDislikes,
		InterestTopic.AverageCock: Interest.Likes,
		InterestTopic.SmallCock: Interest.Loves,
	}
	
func _getName():
	if(GM.main != null):
		if(!GM.main.getFlag("SlaveAuctionModule.knowsLuxeName", false)):
			return "Wolf"
	return "Luxe Blacktail"

func getGender():
	return Gender.Male
	
func getSmallDescription() -> String:
	return "A wolf with dark fur and a very mean stare."

func getChatColor():
	return "#D8D500"

func getSpecies():
	return ["canine"]

func _getAttacks():
	return ["LuxeIronGrip", "LuxePredatorsRush", "LuxeTauntingSnarl", "LuxeSavageBackhand", "LuxeViciousLunge", "LuxeEnragedSlam", "LuxeBreatheInOut", "trygetupattack"]

func getThickness() -> int:
	return 60

func getFemininity() -> int:
	return 50

func createBodyparts():
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("wolfhead"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("manehair"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("wolfears"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anthrobody"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("buffarms"))
	var breasts = GlobalRegistry.createBodypart("malebreasts")
	breasts.size = 0
	giveBodypartUnlessSame(breasts)
	var penis = GlobalRegistry.createBodypart("caninepenis")
	penis.lengthCM = 30
	penis.ballsScale = 1
	giveBodypartUnlessSame(penis)
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anus"))
	var tail = GlobalRegistry.createBodypart("caninetail")
	tail.tailScale = 1
	giveBodypartUnlessSame(tail)
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("digilegs"))

func getDefaultEquipment():
	return ["OfficialClothesRed", "plainBriefs"]

func beforeFightStarted():
	.beforeFightStarted()
	
	addEffect("LuxeRage")
