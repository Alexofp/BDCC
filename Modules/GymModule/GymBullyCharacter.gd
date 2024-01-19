extends Character

func _init():
	id = "gymbully"
	
	npcLevel = 7
	npcBasePain = 120
	npcBaseLust = 120
	npcCharacterType = CharacterType.Inmate
	
	pickedSkin="SoftSpikySkin"
	pickedSkinRColor=Color("ffeb935a")
	pickedSkinGColor=Color("ffdcdcdc")
	pickedSkinBColor=Color("ff7f573c")
	npcSkinData={
	"hair": {"r": Color("ff2c1e14"),"g": Color("ffd3d3d3"),"b": Color("ff000000"),},
	"arms": {"skin": "WoonaSkin",},
	"penis": {"g": Color("ffff0000"),"b": Color("ff8b0000"),},
	"legs": {"skin": "MonsterGirl",},
	}
	
	npcLustInterests = {
		InterestTopic.TallyMarks: Interest.Dislikes,
		InterestTopic.Bodywritings: Interest.Dislikes,
		InterestTopic.Gags: Interest.Dislikes,
		InterestTopic.Blindfolds: Interest.Likes,
		InterestTopic.BDSMRestraints: Interest.Likes,
		InterestTopic.ButtPlugs: Interest.Likes,
		InterestTopic.VaginalPlugs: Interest.Likes,
		InterestTopic.FeminineBody: Interest.ReallyLikes,
		InterestTopic.AndroBody: Interest.Loves,
		InterestTopic.MasculineBody: Interest.ReallyLikes,
		InterestTopic.ThickBody: Interest.ReallyLikes,
		InterestTopic.AverageMassBody: Interest.Likes,
		InterestTopic.SlimBody: Interest.KindaLikes,
		InterestTopic.ThickButt: Interest.Loves,
		InterestTopic.AverageButt: Interest.Likes,
		InterestTopic.SlimButt: Interest.Likes,
		InterestTopic.NoBreasts: Interest.Hates,
		InterestTopic.SmallBreasts: Interest.ReallyDislikes,
		InterestTopic.MediumBreasts: Interest.ReallyLikes,
		InterestTopic.BigBreasts: Interest.KindaLikes,
		InterestTopic.LactatingBreasts: Interest.Hates,
		InterestTopic.StuffedPussy: Interest.Dislikes,
		InterestTopic.StuffedAss: Interest.Dislikes,
		InterestTopic.StuffedPussyOrAss: Interest.Dislikes,
		InterestTopic.Pregnant: Interest.Hates,
		InterestTopic.StuffedThroat: Interest.Dislikes,
		InterestTopic.CoveredInCum: Interest.Dislikes,
		InterestTopic.CoveredInLotsOfCum: Interest.Dislikes,
		InterestTopic.FullyNaked: Interest.Likes,
		InterestTopic.ExposedPussy: Interest.ReallyLikes,
		InterestTopic.ExposedAnus: Interest.ReallyLikes,
		InterestTopic.ExposedBreasts: Interest.Loves,
		InterestTopic.ExposedCock: Interest.Likes,
		InterestTopic.ExposedPanties: Interest.Loves,
		InterestTopic.ExposedBra: Interest.Loves,
		InterestTopic.LooseAnus: Interest.Dislikes,
		InterestTopic.LoosePussy: Interest.Dislikes,
		InterestTopic.TightAnus: Interest.Loves,
		InterestTopic.TightPussy: Interest.Loves,
		InterestTopic.HasVaginaAndCock: Interest.Likes,
		InterestTopic.BigCock: Interest.ReallyLikes,
		InterestTopic.AverageCock: Interest.Likes,
		InterestTopic.SmallCock: Interest.KindaLikes,
	}
	
func _getName():
	return "Main bully"

func getGender():
	return Gender.Male
	
func getSmallDescription() -> String:
	return "Red inmate, has a red band on his head."

func getSpecies():
	return ["canine"]
	
func _getAttacks():
	return ["biteattack", "simplekickattack", "stretchingAttack", "lickWounds", "shoveattack", "trygetupattack"]

func getThickness() -> int:
	return 60

func getFemininity() -> int:
	return 0

func createBodyparts():
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("caninehead"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("coolhair"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("canineears"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anthrobody"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anthroarms"))
	var breasts = GlobalRegistry.createBodypart("malebreasts")
	breasts.size = -1
	giveBodypartUnlessSame(breasts)
	var penis = GlobalRegistry.createBodypart("caninepenis")
	penis.lengthCM = 18
	penis.ballsScale = 1
	giveBodypartUnlessSame(penis)
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anus"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("caninetail"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("digilegs"))

func getLootTable(_battleName):
	return InmateLoot.new()

func getDefaultEquipment():
	return ["inmatecollar", "inmateuniformHighsec"]
