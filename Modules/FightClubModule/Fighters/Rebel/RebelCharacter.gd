extends Character

func _init():
	id = "rebel"
	
	npcLevel = 8
	npcBasePain = 180
	npcBaseLust = 120
	npcCharacterType = CharacterType.Inmate
	
	pickedSkin="LynxSkin"
	pickedSkinRColor=Color("ffab472b")
	pickedSkinGColor=Color("ffe7b686")
	pickedSkinBColor=Color("ff7a2a13")
	npcSkinData={
	"hair": {"r": Color("ffd42eb4"),"g": Color("ff00ff6c"),"b": Color("ffe105ff"),},
	"arms": {"skin": "MonsterGirl",},
	"tail": {"skin": "MonsterGirl",},
	"legs": {"skin": "MonsterGirl",},
	}
	
	npcLustInterests = {
		InterestTopic.TallyMarks: Interest.ReallyLikes,
		InterestTopic.Bodywritings: Interest.ReallyLikes,
		InterestTopic.Gags: Interest.Likes,
		InterestTopic.BDSMRestraints: Interest.Likes,
		InterestTopic.ButtPlugs: Interest.Loves,
		InterestTopic.VaginalPlugs: Interest.Loves,
		InterestTopic.FeminineBody: Interest.Likes,
		InterestTopic.AndroBody: Interest.Likes,
		InterestTopic.MasculineBody: Interest.Loves,
		InterestTopic.ThickBody: Interest.ReallyLikes,
		InterestTopic.AverageMassBody: Interest.ReallyLikes,
		InterestTopic.SlimBody: Interest.Likes,
		InterestTopic.ThickButt: Interest.KindaLikes,
		InterestTopic.AverageButt: Interest.Likes,
		InterestTopic.SlimButt: Interest.KindaLikes,
		InterestTopic.NoBreasts: Interest.ReallyDislikes,
		InterestTopic.SmallBreasts: Interest.Likes,
		InterestTopic.MediumBreasts: Interest.ReallyLikes,
		InterestTopic.BigBreasts: Interest.Loves,
		InterestTopic.LactatingBreasts: Interest.KindaLikes,
		InterestTopic.StuffedPussy: Interest.Likes,
		InterestTopic.StuffedAss: Interest.Likes,
		InterestTopic.StuffedPussyOrAss: Interest.Likes,
		InterestTopic.Pregnant: Interest.Hates,
		InterestTopic.StuffedThroat: Interest.KindaLikes,
		InterestTopic.CoveredInCum: Interest.KindaLikes,
		InterestTopic.CoveredInLotsOfCum: Interest.KindaLikes,
		InterestTopic.FullyNaked: Interest.ReallyLikes,
		InterestTopic.ExposedPussy: Interest.Loves,
		InterestTopic.ExposedAnus: Interest.Loves,
		InterestTopic.ExposedBreasts: Interest.KindaLikes,
		InterestTopic.ExposedCock: Interest.KindaLikes,
		InterestTopic.ExposedPanties: Interest.Hates,
		InterestTopic.ExposedBra: Interest.SlightlyDislikes,
		InterestTopic.LooseAnus: Interest.Loves,
		InterestTopic.LoosePussy: Interest.Loves,
		InterestTopic.TightAnus: Interest.Dislikes,
		InterestTopic.TightPussy: Interest.Dislikes,
		InterestTopic.NoVagina: Interest.Dislikes,
		InterestTopic.HasVaginaOnly: Interest.Likes,
		InterestTopic.HasVaginaAndCock: Interest.KindaLikes,
		InterestTopic.BigCock: Interest.Loves,
		InterestTopic.AverageCock: Interest.Likes,
		InterestTopic.SmallCock: Interest.ReallyDislikes,
		InterestTopic.HasCockOnly: Interest.Likes,
	}
	
func interestVerbalReaction(interest):
	if(interest == InterestTopic.BigCock):
		return "I love me a good stallion cock"
	if(interest == InterestTopic.LooseAnus):
		return "Hah! Your ass is stretched already. But we always go futher"
	if(interest == InterestTopic.TightAnus):
		return "Training your ass will take a while"
	if(interest == InterestTopic.Pregnant):
		return "Why did you come here pregnant?"
	if(interest == InterestTopic.ButtPlugs):
		return "Oh yeah, I see you love training your butt"
	if(interest == InterestTopic.ExposedPanties):
		return "Take off the panties, sweetie"
	if(interest == InterestTopic.AverageButt):
		return "Shake that ass, sweetie~"

func _getName():
	return "Rebel"

func getGender():
	return Gender.Female
	
func getSmallDescription() -> String:
	return "A tall horse from the red block. Looks very buff for a female, thick body, clearly defined muscles, huge tits."

func getSpecies():
	return ["equine"]

func _getAttacks():
	return ["StrongPunch", "RebelThrow", "RebelTaunt", "RebelPin", "trygetupattack"]

func getFightIntro(_battleName):
	var text = "Rebel is such a wrestler, she turns towards the audience and roars while flexing her muscles for everyone to see. Then she shifts her attention to you."
	text += "\n\n"
	text += "[say=rebel]See this?[/say]"
	text += "\n\n"
	text += "Rebel points at you and then clenches her hand into a fist."
	text += "\n\n"
	text += "[say=rebel]When you lose, this will go inside your ass, sweetie. My entire fucking arm. I will turn you into a hand puppet.[/say]"
	text += "\n\n"
	text += "The idea of being fisted by this lady is scary. Seems like the stakes were never this high."
		
	return text

func getThickness() -> int:
	return 125

func getFemininity() -> int:
	return 33

func createBodyparts():
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("mohawkhair"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("horseears"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anthrobody"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("buffarms"))
	var breasts = GlobalRegistry.createBodypart("humanbreasts")
	breasts.size = 8
	giveBodypartUnlessSame(breasts)
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("vagina"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anus"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("horsetail"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("hoofs"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("horsehead"))

func getLootTable(_battleName):
	return InmateLoot.new()

func getDefaultEquipment():
	return ["inmatecollar", "inmateuniform"]
