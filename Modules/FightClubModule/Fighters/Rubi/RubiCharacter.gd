extends Character

func _init():
	id = "rubi"
	
	npcLevel = 1
	npcBasePain = 70
	npcBaseLust = 50
	npcCharacterType = CharacterType.Inmate
	
	pickedSkin="SoftSpikySkin"
	pickedSkinRColor=Color("ffeaeeec")
	pickedSkinGColor=Color("ffa5b9b0")
	pickedSkinBColor=Color("ff125437")
	npcSkinData={
	"hair": {"r": Color("ff6f847f"),"g": Color("ff74968e"),"b": Color("ffa9a9a9"),},
	"penis": {"g": Color("ff25ed6c"),"b": Color("ff8b0000"),},
	}
	
	npcLustInterests = {
		InterestTopic.TallyMarks: Interest.Dislikes,
		InterestTopic.Bodywritings: Interest.Dislikes,
		InterestTopic.Gags: Interest.Dislikes,
		InterestTopic.Blindfolds: Interest.Dislikes,
		InterestTopic.BDSMRestraints: Interest.Dislikes,
		InterestTopic.ButtPlugs: Interest.ReallyLikes,
		InterestTopic.VaginalPlugs: Interest.SlightlyDislikes,
		InterestTopic.FeminineBody: Interest.KindaLikes,
		InterestTopic.AndroBody: Interest.Likes,
		InterestTopic.MasculineBody: Interest.Loves,
		InterestTopic.ThickBody: Interest.Hates,
		InterestTopic.AverageMassBody: Interest.Likes,
		InterestTopic.SlimBody: Interest.KindaLikes,
		InterestTopic.ThickButt: Interest.SlightlyDislikes,
		InterestTopic.AverageButt: Interest.ReallyLikes,
		InterestTopic.SlimButt: Interest.Likes,
		InterestTopic.NoBreasts: Interest.ReallyLikes,
		InterestTopic.SmallBreasts: Interest.Dislikes,
		InterestTopic.MediumBreasts: Interest.Likes,
		InterestTopic.BigBreasts: Interest.ReallyLikes,
		InterestTopic.LactatingBreasts: Interest.Likes,
		InterestTopic.StuffedPussy: Interest.Loves,
		InterestTopic.StuffedAss: Interest.Likes,
		InterestTopic.StuffedPussyOrAss: Interest.KindaLikes,
		InterestTopic.Pregnant: Interest.Hates,
		InterestTopic.StuffedThroat: Interest.Loves,
		InterestTopic.CoveredInCum: Interest.Likes,
		InterestTopic.CoveredInLotsOfCum: Interest.KindaLikes,
		InterestTopic.FullyNaked: Interest.Likes,
		InterestTopic.ExposedPussy: Interest.ReallyLikes,
		InterestTopic.ExposedAnus: Interest.Likes,
		InterestTopic.ExposedBreasts: Interest.Likes,
		InterestTopic.ExposedCock: Interest.Loves,
		InterestTopic.ExposedPanties: Interest.KindaLikes,
		InterestTopic.ExposedBra: Interest.KindaLikes,
		InterestTopic.LooseAnus: Interest.Loves,
		InterestTopic.LoosePussy: Interest.Likes,
		InterestTopic.TightAnus: Interest.KindaLikes,
		InterestTopic.TightPussy: Interest.KindaLikes,
		InterestTopic.NoVagina: Interest.Likes,
		InterestTopic.HasVaginaOnly: Interest.KindaLikes,
		InterestTopic.HasVaginaAndCock: Interest.Hates,
		InterestTopic.BigCock: Interest.Hates,
		InterestTopic.AverageCock: Interest.Likes,
		InterestTopic.SmallCock: Interest.Hates,
		InterestTopic.NoCock: Interest.KindaLikes,
		InterestTopic.HasCockOnly: Interest.KindaLikes,
	}
	
func interestVerbalReaction(interest):
	if(interest == InterestTopic.ButtPlugs):
		return "Buttplugs, fuck yeahhh~"
	if(interest == InterestTopic.ThickBody):
		return "Sorry, I'm not interested"
	if(interest == InterestTopic.MasculineBody):
		return "Oh, I love strong types~"
	if(interest == InterestTopic.BigBreasts):
		return "Oh yeah, make those funbags bounce"
	if(interest == InterestTopic.HasVaginaAndCock):
		return "I'm not a fan of herms, too much things cramped in one place"
	if(interest == InterestTopic.ExposedCock):
		return "Nice dick~"
	if(interest == InterestTopic.BigCock):
		return "Oh, I don't want my insides rearranged"
	if(interest == InterestTopic.Pregnant):
		return "Slut, I don't wanna fight a pregnant bitch"
	if(interest == InterestTopic.LactatingBreasts):
		return "I can pretend to be a kitten if you let me suck on those~"
	if(interest == InterestTopic.SmallCock):
		return "How the fuck am I gonna feel anything with that cock?"
	
func _getName():
	return "Rubi"

func getGender():
	return Gender.Male
	
func getSmallDescription() -> String:
	return "Slim lilac femboy. His feline body is of a medium height and is quite fit, narrow shoulders, wide hips."

func getSpecies():
	return ["feline"]

func _getAttacks():
	return ["simplepunchattack", "simplekickattack", "shoveattack", "trygetupattack"]

func getFightIntro(_battleName):
	var text = "Rubi is a lilac inmate with no shirt, allowing you to see his defined musculature. But despite that, his body type is more feminine than anything else, narrow shoulders, slim flat chest with a pair of visible nips, wide hips, pretty face, long hair."
	text += "\n\n"
	text += "He straightens his posture and taunts you."
	text += "\n\n"
	text += "[say=rubi]You gonna fight with me? I’ve been training for years, you have no chance. Don’t worry though, I will go easy on you~.[/say]"
	text += "\n\n"
	text += "A cheeky smile can be seen on his face, one of the arms rests on his waist while another gestures to you to come closer."
	
	return text

func getThickness() -> int:
	return 80

func getFemininity() -> int:
	return 40

func createBodyparts():
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("felinehead"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("felineears"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("longhair"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anthrobody"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anthroarms"))
	var breasts = GlobalRegistry.createBodypart("malebreasts")
	breasts.size = -1
	giveBodypartUnlessSame(breasts)
	var penis = GlobalRegistry.createBodypart("felinepenis")
	penis.lengthCM = 15
	penis.ballsScale = 1
	giveBodypartUnlessSame(penis)
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anus"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("felinetail"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("digilegs"))

func getLootTable(_battleName):
	return InmateLoot.new()

func getDefaultEquipment():
	return ["inmatecollar", "inmateuniformSexDeviant"]
