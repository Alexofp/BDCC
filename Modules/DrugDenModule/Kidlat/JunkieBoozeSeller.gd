extends Character

func _init():
	id = "junkieBoozeSeller"
	npcHasMenstrualCycle = false
	npcCharacterType = CharacterType.Generic
	
	npcLevel = 20
	npcBasePain = 250
	npcBaseLust = 300
	npcBaseStamina = 250
	npcArmor = {
	}
	
	pickedSkin="DappledSkin"
	pickedSkinRColor=Color("ff53361b")
	pickedSkinGColor=Color("ff301f10")
	pickedSkinBColor=Color("ff927457")
	npcSkinData={
	"hair": {"r": Color("ff993829"),"g": Color("ffea2765"),"b": Color("ff961919"),},
	}
	
	npcLustInterests = {
		InterestTopic.TallyMarks: Interest.ReallyLikes,
		InterestTopic.Bodywritings: Interest.ReallyLikes,
		InterestTopic.Gags: Interest.Likes,
		InterestTopic.Blindfolds: Interest.Likes,
		InterestTopic.BDSMRestraints: Interest.Likes,
		InterestTopic.ButtPlugs: Interest.Hates,
		InterestTopic.VaginalPlugs: Interest.Likes,
		InterestTopic.FeminineBody: Interest.Likes,
		InterestTopic.AndroBody: Interest.Likes,
		InterestTopic.MasculineBody: Interest.Likes,
		InterestTopic.ThickBody: Interest.Likes,
		InterestTopic.AverageMassBody: Interest.Likes,
		InterestTopic.SlimBody: Interest.Likes,
		InterestTopic.ThickButt: Interest.Loves,
		InterestTopic.AverageButt: Interest.ReallyLikes,
		InterestTopic.SlimButt: Interest.KindaLikes,
		InterestTopic.NoBreasts: Interest.Hates,
		InterestTopic.SmallBreasts: Interest.ReallyDislikes,
		InterestTopic.MediumBreasts: Interest.KindaLikes,
		InterestTopic.BigBreasts: Interest.ReallyLikes,
		InterestTopic.LactatingBreasts: Interest.Loves,
		InterestTopic.StuffedPussy: Interest.Loves,
		InterestTopic.StuffedAss: Interest.Loves,
		InterestTopic.StuffedPussyOrAss: Interest.Loves,
		InterestTopic.Pregnant: Interest.Loves,
		InterestTopic.StuffedThroat: Interest.Likes,
		InterestTopic.CoveredInCum: Interest.Loves,
		InterestTopic.CoveredInLotsOfCum: Interest.Loves,
		InterestTopic.FullyNaked: Interest.Loves,
		InterestTopic.ExposedPussy: Interest.Loves,
		InterestTopic.ExposedAnus: Interest.Loves,
		InterestTopic.ExposedBreasts: Interest.Loves,
		InterestTopic.ExposedCock: Interest.Loves,
		InterestTopic.ExposedPanties: Interest.Hates,
		InterestTopic.ExposedBra: Interest.Hates,
		InterestTopic.LooseAnus: Interest.Likes,
		InterestTopic.LoosePussy: Interest.Likes,
		InterestTopic.TightAnus: Interest.Likes,
		InterestTopic.TightPussy: Interest.Likes,
		InterestTopic.NoVagina: Interest.Likes,
		InterestTopic.HasVaginaOnly: Interest.Likes,
		InterestTopic.HasVaginaAndCock: Interest.Likes,
		InterestTopic.BigCock: Interest.Loves,
		InterestTopic.AverageCock: Interest.ReallyLikes,
		InterestTopic.SmallCock: Interest.Likes,
		InterestTopic.NoCock: Interest.KindaLikes,
		InterestTopic.HasCockOnly: Interest.KindaLikes,
	}
	
func _getName():
	return "Junkie"

func getGender():
	return Gender.Female
	
func getSmallDescription() -> String:
	return "An annoying-looking bitch."

func getSpecies():
	return ["canine"]
#
#func getChatColor():
#	return '#13d9da'

func _getAttacks():
	return ["StrongPunch", "RebelThrow", "RebelTaunt", "RebelPin", "NpcScratch", "kickToBallsAttack", "slapTitsAttack", "trygetupattack"]

func getThickness() -> int:
	return 100

func getFemininity() -> int:
	return 50

func createBodyparts():
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("bulldoghead"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("tavihair"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("canineears"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anthrobody"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anthroarms"))
	var breasts = GlobalRegistry.createBodypart("humanbreasts")
	breasts.size = 5
	giveBodypartUnlessSame(breasts)
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("vagina"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anus"))
	var tail = GlobalRegistry.createBodypart("shorttail")
	tail.tailScale = 1
	giveBodypartUnlessSame(tail)
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("digilegs"))

func getDefaultEquipment():
	return ["inmatecollar", "inmateuniformHighsec"]
