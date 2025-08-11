extends Character

func _init():
	id = "psmilkgirl"
	npcHasMenstrualCycle = false
	
	pickedSkin="VerySpiky"
	pickedSkinRColor=Color("ffa83333")
	pickedSkinGColor=Color("ffff9a39")
	pickedSkinBColor=Color("ffd44949")
	npcSkinData={
	"hair": {"r": Color("ffff7801"),"g": Color("ffff5d01"),"b": Color("ffff5c00"),},
	"ears": {"skin": "dragonears2tricolor",},
	"horns": {"r": Color("ff573e31"),"g": Color("ffd14210"),"b": Color("ff33160d"),},
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
		Fetish.AnalSexReceiving : FetishInterest.SlightlyLikes,
		Fetish.AnalSexGiving : FetishInterest.Loves,
		Fetish.VaginalSexReceiving : FetishInterest.Likes,
		Fetish.VaginalSexGiving : FetishInterest.Loves,
		Fetish.OralSexReceiving : FetishInterest.ReallyLikes,
		Fetish.OralSexGiving : FetishInterest.Dislikes,
		Fetish.Sadism : FetishInterest.Loves,
		Fetish.Masochism : FetishInterest.Dislikes,
		Fetish.UnconsciousSex : FetishInterest.Loves,
		Fetish.Breeding : FetishInterest.Loves,
		Fetish.Bondage : FetishInterest.Likes,
		Fetish.Condoms : FetishInterest.Hates,
		Fetish.DrugUse : FetishInterest.ReallyLikes,
		Fetish.Exhibitionism : FetishInterest.Likes,
		Fetish.StraponSexAnal : FetishInterest.Loves,
		Fetish.StraponSexVaginal : FetishInterest.Loves,
		Fetish.BeingBred : FetishInterest.Hates,
		Fetish.Bodywritings : FetishInterest.Likes,
		Fetish.Choking : FetishInterest.Loves,
		Fetish.Tribadism : FetishInterest.Dislikes,
		Fetish.FeetplayGiving : FetishInterest.Likes,
		Fetish.FeetplayReceiving : FetishInterest.Hates,
		Fetish.Lactation : FetishInterest.Likes,
		Fetish.SeedMilking : FetishInterest.Likes,
	}
	
func _getName():
	return "Sofie"

func getGender():
	return Gender.Female
	
func getSmallDescription() -> String:
	return "A mean dragon girl."

func getSpecies():
	return [Species.Dragon]

func _getAttacks():
	return ["simplekickattack", "NpcScratch", "biteattack", "kickToBallsAttack", "slapTitsAttack", "ForceMuzzlePC", "BolaThrow", "shoveattack", "trygetupattack"]

func getThickness() -> int:
	return 70

func getFemininity() -> int:
	return 50

func createBodyparts():
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("dragonhead"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("dragonears2"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("tavihair"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("dragonhorns2"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anthrobody"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anthroarms"))
	var breasts = GlobalRegistry.createBodypart("humanbreasts")
	breasts.size = 3
	giveBodypartUnlessSame(breasts)
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("vagina"))
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
			clothesColor = "BB5555",
			amount = 1,
		},
	},
	]

#func getLootTable(_battleName):
#	return InmateLoot.new()
