extends Character

func _init():
	id = "axis"
	
	pickedSkin="WoonaSkin"
	pickedSkinRColor=Color("ffefefef")
	pickedSkinGColor=Color("ffdfdfdf")
	pickedSkinBColor=Color("ffe6e6e6")
	npcSkinData={
	"head": {"b": Color("ff232323"),},
	"hair": {"r": Color("ffffffff"),"g": Color("ffd3d3d3"),"b": Color("ffa9a9a9"),},
	"penis": {"g": Color("ffff0000"),"b": Color("ff8b0000"),},
	}
	
	npcLevel = 12
	npcBasePain = 150
	npcBaseLust = 200
	npcCharacterType = CharacterType.Inmate
	npcLustInterests = {
		InterestTopic.TallyMarks: Interest.Dislikes,
		InterestTopic.Bodywritings: Interest.Likes,
		InterestTopic.Gags: Interest.Likes,
		InterestTopic.Blindfolds: Interest.Likes,
		InterestTopic.BDSMRestraints: Interest.Likes,
		InterestTopic.ButtPlugs: Interest.Hates,
		InterestTopic.VaginalPlugs: Interest.Hates,
		InterestTopic.FeminineBody: Interest.ReallyLikes,
		InterestTopic.AndroBody: Interest.Likes,
		InterestTopic.MasculineBody: Interest.Hates,
		InterestTopic.ThickBody: Interest.ReallyLikes,
		InterestTopic.AverageMassBody: Interest.Likes,
		InterestTopic.SlimBody: Interest.KindaLikes,
		InterestTopic.ThickButt: Interest.Loves,
		InterestTopic.AverageButt: Interest.Likes,
		InterestTopic.SlimButt: Interest.Hates,
		InterestTopic.NoBreasts: Interest.Hates,
		InterestTopic.SmallBreasts: Interest.Hates,
		InterestTopic.MediumBreasts: Interest.Likes,
		InterestTopic.BigBreasts: Interest.Loves,
		InterestTopic.LactatingBreasts: Interest.Likes,
		InterestTopic.StuffedPussy: Interest.Loves,
		InterestTopic.StuffedAss: Interest.Loves,
		InterestTopic.StuffedPussyOrAss: Interest.Likes,
		InterestTopic.Pregnant: Interest.Likes,
		InterestTopic.StuffedThroat: Interest.Likes,
		InterestTopic.CoveredInCum: Interest.Likes,
		InterestTopic.CoveredInLotsOfCum: Interest.Loves,
		InterestTopic.FullyNaked: Interest.Loves,
		InterestTopic.ExposedPussy: Interest.Likes,
		InterestTopic.ExposedAnus: Interest.Likes,
		InterestTopic.ExposedBreasts: Interest.KindaLikes,
		InterestTopic.ExposedPanties: Interest.Dislikes,
		InterestTopic.ExposedBra: Interest.Dislikes,
		InterestTopic.LooseAnus: Interest.Likes,
		InterestTopic.LoosePussy: Interest.Likes,
		InterestTopic.TightAnus: Interest.Loves,
		InterestTopic.TightPussy: Interest.Loves,
		InterestTopic.NoVagina: Interest.Dislikes,
		InterestTopic.HasVaginaAndCock: Interest.Hates,
		InterestTopic.BigCock: Interest.Hates,
		InterestTopic.AverageCock: Interest.Hates,
		InterestTopic.SmallCock: Interest.Likes,
		InterestTopic.NoCock: Interest.Likes,
		InterestTopic.HasCockOnly: Interest.KindaLikes,
	}
	
func _getName():
	return "Axis"

func getGender():
	return Gender.Male
	
func getSmallDescription() -> String:
	return "Muscular white wolf with red eyes. Wears lilac uniform"

func getSpecies():
	return ["canine"]

func _getAttacks():
	return ["simplepunchattack", "simplekickattack", "biteattack", "AxisTaunt", "AxisGrab", "trygetupattack"]

func getFightIntro(_battleName):
	var mes = "The wolf waves to the crowd, he is tall and looks strong, the lilac uniform looks strange on him. He then bows to you before offering you a playful smirk."
	mes += "\n\n"
	mes += "[say=axis]Hey there~. I must admit, you are quite a courageous person to come here.[/say]"
	mes += "\n\n"
	mes += "He then unbuttons his shirt, exposing his ripped torso and a six pack. He flexes his muscles."
	mes += "\n\n"
	mes += "[say=axis]I wouldn’t mind breeding such a strong-willed inmate like you. I’m the alpha of this prison after all, I possess the best genes.[/say]"
	mes += "\n\n"
	mes += "His hand rubs his crotch. Wow, his cock must be massive, the palm can’t even cover the bulge."
	mes += "\n\n"
	mes += "[say=axis]Sounds way more fun, doesn’t it~?[/say]"
	return mes

func getThickness() -> int:
	return 80

func getFemininity() -> int:
	return 0

func createBodyparts():
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("wolfhead"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("wolfears"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("baldhair"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anthrobody"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("buffarms"))
	var breasts = GlobalRegistry.createBodypart("malebreasts")
	breasts.size = -1
	giveBodypartUnlessSame(breasts)
	var penis = GlobalRegistry.createBodypart("caninepenis")
	penis.lengthCM = 25
	penis.ballsScale = 1
	giveBodypartUnlessSame(penis)
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anus"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("caninetail"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("digilegs"))

func getDefaultEquipment():
	return ["inmatecollar", "inmateuniformSexDeviant"]

func getLootTable(_battleName):
	return InmateLoot.new()
