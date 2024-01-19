extends Character

func _init():
	id = "jack"
	
	pickedSkin="HumanSkin"
	pickedSkinRColor=Color("ff4d343d")
	pickedSkinGColor=Color("ff7a4758")
	pickedSkinBColor=Color("ff603c48")
	npcSkinData={
	"hair": {"r": Color("ff282828"),"g": Color("ff262626"),"b": Color("ff262626"),},
	"penis": {"g": Color("ff900000"),"b": Color("fffb0000"),},
	}
	
	npcLevel = 18
	npcBasePain = 250
	npcBaseLust = 200
	npcCharacterType = CharacterType.Inmate
	npcLustInterests = {
		InterestTopic.TallyMarks: Interest.Loves,
		InterestTopic.Bodywritings: Interest.Loves,
		InterestTopic.Gags: Interest.Dislikes,
		InterestTopic.Blindfolds: Interest.Likes,
		InterestTopic.BDSMRestraints: Interest.Likes,
		InterestTopic.ButtPlugs: Interest.Likes,
		InterestTopic.VaginalPlugs: Interest.Likes,
		InterestTopic.FeminineBody: Interest.Loves,
		InterestTopic.AndroBody: Interest.Likes,
		InterestTopic.MasculineBody: Interest.Hates,
		InterestTopic.ThickBody: Interest.Likes,
		InterestTopic.AverageMassBody: Interest.ReallyLikes,
		InterestTopic.SlimBody: Interest.KindaLikes,
		InterestTopic.ThickButt: Interest.Loves,
		InterestTopic.AverageButt: Interest.Likes,
		InterestTopic.SlimButt: Interest.ReallyDislikes,
		InterestTopic.NoBreasts: Interest.Hates,
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
		InterestTopic.FullyNaked: Interest.Likes,
		InterestTopic.ExposedPussy: Interest.ReallyLikes,
		InterestTopic.ExposedAnus: Interest.KindaLikes,
		InterestTopic.ExposedBreasts: Interest.ReallyLikes,
		InterestTopic.ExposedCock: Interest.Hates,
		InterestTopic.ExposedPanties: Interest.KindaLikes,
		InterestTopic.ExposedBra: Interest.KindaLikes,
		InterestTopic.LooseAnus: Interest.Likes,
		InterestTopic.LoosePussy: Interest.Loves,
		InterestTopic.TightAnus: Interest.ReallyLikes,
		InterestTopic.TightPussy: Interest.Likes,
		InterestTopic.NoVagina: Interest.Hates,
		InterestTopic.HasVaginaOnly: Interest.Loves,
		InterestTopic.HasVaginaAndCock: Interest.Hates,
		InterestTopic.BigCock: Interest.Hates,
		InterestTopic.AverageCock: Interest.Hates,
		InterestTopic.SmallCock: Interest.Hates,
		InterestTopic.NoCock: Interest.Likes,
		InterestTopic.HasCockOnly: Interest.Hates,
	}
	
func _getName():
	return "Jack"

func getGender():
	return Gender.Male
	
func getSmallDescription() -> String:
	return "Tall stallion wearing a red inmate uniform. Brown coat, rich black mane."

func getSpecies():
	return ["equine"]

func _getAttacks():
	return ["simplepunchattack", "StrongKick", "BreedingTaunt", "biteattack", "trygetupattack"]

func getFightIntro(_battleName):
	var mes = "Jack stands straight in a typical male pose, even now you can see his huge bulge barely hidden under the shorts."
	mes += "\n\n"
	mes += "[say=jack]Huh.[/say]"
	mes += "\n\n"
	mes += "He tilts his head to the sides, stretching."
	mes += "\n\n"
	mes += "[say=jack]Hope ya ready.[/say]"
	return mes

func getThickness() -> int:
	return 100

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
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anus"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("horsetail"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("hoofs"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("shorthair2"))

func getDefaultEquipment():
	return ["inmatecollar", "inmateuniformHighsec"]

func getLootTable(_battleName):
	return InmateLoot.new()
