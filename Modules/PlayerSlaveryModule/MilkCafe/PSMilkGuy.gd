extends Character

func _init():
	id = "psmilkguy"
	npcHasMenstrualCycle = false
	
	pickedSkin="LynxSkin"
	pickedSkinRColor=Color("ff6796bf")
	pickedSkinGColor=Color("ffb0c5d6")
	pickedSkinBColor=Color("ff24639a")
	npcSkinData={
	"hair": {"r": Color("ff29be9f"),"g": Color("ff12dec6"),"b": Color("ff0dffbb"),},
	"ears": {"skin": "dragonearsfingradient",},
	"horns": {"r": Color("ff195588"),"g": Color("ff08e2ff"),"b": Color("ff1c2832"),},
	"penis": {"skin": "tribaldragon","g": Color("ff1e3040"),"b": Color("ff21c6e1"),},
	}
	
	npcLevel = 15
	npcBasePain = 200
	npcBaseLust = 200
	npcBaseStamina = 120
	npcCharacterType = CharacterType.Generic
	npcLustInterests = {
		InterestTopic.TallyMarks: Interest.Likes,
		InterestTopic.Bodywritings: Interest.Likes,
		InterestTopic.Gags: Interest.Likes,
		InterestTopic.Blindfolds: Interest.Likes,
		InterestTopic.BDSMRestraints: Interest.Likes,
		InterestTopic.ButtPlugs: Interest.KindaLikes,
		InterestTopic.VaginalPlugs: Interest.KindaLikes,
		InterestTopic.FeminineBody: Interest.KindaLikes,
		InterestTopic.AndroBody: Interest.Likes,
		InterestTopic.MasculineBody: Interest.ReallyLikes,
		InterestTopic.ThickBody: Interest.Dislikes,
		InterestTopic.AverageMassBody: Interest.Likes,
		InterestTopic.SlimBody: Interest.Dislikes,
		InterestTopic.ThickButt: Interest.Likes,
		InterestTopic.AverageButt: Interest.SlightlyDislikes,
		InterestTopic.SlimButt: Interest.Hates,
		InterestTopic.SmallBreasts: Interest.Hates,
		InterestTopic.MediumBreasts: Interest.Likes,
		InterestTopic.BigBreasts: Interest.Loves,
		InterestTopic.LactatingBreasts: Interest.Loves,
		InterestTopic.StuffedPussy: Interest.ReallyLikes,
		InterestTopic.StuffedAss: Interest.ReallyLikes,
		InterestTopic.StuffedPussyOrAss: Interest.Likes,
		InterestTopic.Pregnant: Interest.ReallyLikes,
		InterestTopic.StuffedThroat: Interest.Dislikes,
		InterestTopic.CoveredInCum: Interest.Hates,
		InterestTopic.CoveredInLotsOfCum: Interest.Hates,
		InterestTopic.FullyNaked: Interest.Likes,
		InterestTopic.ExposedPussy: Interest.Likes,
		InterestTopic.ExposedAnus: Interest.Likes,
		InterestTopic.ExposedBreasts: Interest.Likes,
		InterestTopic.ExposedCock: Interest.Likes,
		InterestTopic.ExposedPanties: Interest.ReallyDislikes,
		InterestTopic.ExposedBra: Interest.ReallyDislikes,
		InterestTopic.LooseAnus: Interest.KindaLikes,
		InterestTopic.LoosePussy: Interest.KindaLikes,
		InterestTopic.TightAnus: Interest.Loves,
		InterestTopic.TightPussy: Interest.Loves,
		InterestTopic.NoVagina: Interest.Hates,
		InterestTopic.HasVaginaOnly: Interest.Likes,
		InterestTopic.HasVaginaAndCock: Interest.Loves,
		InterestTopic.BigCock: Interest.ReallyLikes,
		InterestTopic.AverageCock: Interest.ReallyLikes,
		InterestTopic.SmallCock: Interest.Loves,
		InterestTopic.NoCock: Interest.Dislikes,
		InterestTopic.HasCockOnly: Interest.KindaLikes,
	}
	
	npcFetishes = {
		Fetish.AnalSexReceiving : FetishInterest.Loves,
		Fetish.AnalSexGiving : FetishInterest.Likes,
		Fetish.VaginalSexGiving : FetishInterest.Loves,
		Fetish.OralSexReceiving : FetishInterest.Likes,
		Fetish.OralSexGiving : FetishInterest.Likes,
		Fetish.Sadism : FetishInterest.Dislikes,
		Fetish.Masochism : FetishInterest.SlightlyLikes,
		Fetish.UnconsciousSex : FetishInterest.Hates,
		Fetish.Breeding : FetishInterest.Loves,
		Fetish.Bondage : FetishInterest.SlightlyLikes,
		Fetish.Condoms : FetishInterest.SlightlyLikes,
		Fetish.DrugUse : FetishInterest.ReallyLikes,
		Fetish.Exhibitionism : FetishInterest.Likes,
		Fetish.Bodywritings : FetishInterest.SlightlyLikes,
		Fetish.Choking : FetishInterest.SlightlyDislikes,
		Fetish.FeetplayGiving : FetishInterest.Dislikes,
		Fetish.FeetplayReceiving : FetishInterest.Loves,
		Fetish.Lactation : FetishInterest.Likes,
		Fetish.SeedMilking : FetishInterest.Likes,
	}
	
func _getName():
	return "Leo"

func getGender():
	return Gender.Male
	
func getSmallDescription() -> String:
	return "A soft dragon guy."

func getSpecies():
	return [Species.Dragon]

func _getAttacks():
	return ["simplekickattack", "NpcScratch", "biteattack", "kickToBallsAttack", "slapTitsAttack", "ForceMuzzlePC", "BolaThrow", "shoveattack", "trygetupattack"]

func getThickness() -> int:
	return 60

func getFemininity() -> int:
	return 50

func createBodyparts():
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("dragonhead"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("messyhair2"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("dragonears"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("demonhorns2"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anthrobody"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anthroarms"))
	var breasts = GlobalRegistry.createBodypart("malebreasts")
	breasts.size = 0
	giveBodypartUnlessSame(breasts)
	var penis = GlobalRegistry.createBodypart("dragonpenis")
	penis.lengthCM = 18
	penis.ballsScale = 1
	giveBodypartUnlessSame(penis)
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anus"))
	var tail = GlobalRegistry.createBodypart("dragontail")
	tail.tailScale = 1
	giveBodypartUnlessSame(tail)
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("digilegs"))

func getDefaultEquipment():
	return [
	{
		id = "CasualClothes",
		data = {
			clothesColor = "AA2222",
			amount = 1,
		},
	},
	]

#func getLootTable(_battleName):
#	return InmateLoot.new()
