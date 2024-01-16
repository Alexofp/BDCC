extends Character

func _init():
	id = "kait"
	npcHasMenstrualCycle = true
	
	pickedSkin="LynxSkin"
	pickedSkinRColor=Color("ff9ea3b5")
	pickedSkinGColor=Color("ffcdcad5")
	pickedSkinBColor=Color("ff494c54")
	npcSkinData={
	"hair": {"r": Color("ff555555"),"g": Color("ff3c3c3c"),"b": Color("ff3d3d3d"),},
	"ears": {"b": Color("ffdcdcdc"),},
	}
	
	npcLevel = 15
	npcBasePain = 130
	npcBaseLust = 160
	npcBaseStamina = 200
	npcCharacterType = CharacterType.Inmate
	npcLustInterests = {
		InterestTopic.TallyMarks: Interest.Dislikes,
		InterestTopic.Bodywritings: Interest.Dislikes,
		InterestTopic.Gags: Interest.Dislikes,
		InterestTopic.Blindfolds: Interest.Dislikes,
		InterestTopic.BDSMRestraints: Interest.Dislikes,
		InterestTopic.ButtPlugs: Interest.KindaLikes,
		InterestTopic.VaginalPlugs: Interest.KindaLikes,
		InterestTopic.FeminineBody: Interest.Likes,
		InterestTopic.AndroBody: Interest.SlightlyDislikes,
		InterestTopic.MasculineBody: Interest.ReallyLikes,
		InterestTopic.ThickBody: Interest.Likes,
		InterestTopic.AverageMassBody: Interest.ReallyLikes,
		InterestTopic.SlimBody: Interest.Likes,
		InterestTopic.ThickButt: Interest.Dislikes,
		InterestTopic.AverageButt: Interest.ReallyLikes,
		InterestTopic.SlimButt: Interest.KindaLikes,
		InterestTopic.NoBreasts: Interest.Likes,
		InterestTopic.SmallBreasts: Interest.Loves,
		InterestTopic.MediumBreasts: Interest.Likes,
		InterestTopic.BigBreasts: Interest.Hates,
		InterestTopic.LactatingBreasts: Interest.Hates,
		InterestTopic.StuffedPussy: Interest.Dislikes,
		InterestTopic.StuffedAss: Interest.Dislikes,
		InterestTopic.StuffedPussyOrAss: Interest.Dislikes,
		InterestTopic.Pregnant: Interest.Hates,
		InterestTopic.StuffedThroat: Interest.Dislikes,
		InterestTopic.CoveredInCum: Interest.Dislikes,
		InterestTopic.CoveredInLotsOfCum: Interest.Dislikes,
		InterestTopic.FullyNaked: Interest.Loves,
		InterestTopic.ExposedPussy: Interest.Likes,
		InterestTopic.ExposedAnus: Interest.Likes,
		InterestTopic.ExposedBreasts: Interest.Loves,
		InterestTopic.ExposedCock: Interest.Loves,
		InterestTopic.ExposedPanties: Interest.ReallyLikes,
		InterestTopic.ExposedBra: Interest.KindaLikes,
		InterestTopic.LooseAnus: Interest.Dislikes,
		InterestTopic.LoosePussy: Interest.Dislikes,
		InterestTopic.TightAnus: Interest.ReallyLikes,
		InterestTopic.TightPussy: Interest.ReallyLikes,
		InterestTopic.NoVagina: Interest.ReallyLikes,
		InterestTopic.HasVaginaOnly: Interest.ReallyLikes,
		InterestTopic.HasVaginaAndCock: Interest.Hates,
		InterestTopic.BigCock: Interest.ReallyLikes,
		InterestTopic.AverageCock: Interest.Likes,
		InterestTopic.SmallCock: Interest.ReallyDislikes,
		InterestTopic.HasCockOnly: Interest.Likes,
	}
	
func interestVerbalReaction(interest):
	if(interest == InterestTopic.HasVaginaAndCock):
		return "I fucking hate herms"
	if(interest == InterestTopic.ExposedBreasts):
		return "Nice tits, I will admit"
	if(interest == InterestTopic.LoosePussy):
		return "Wow, your cunt is ruined"
	if(interest == InterestTopic.LooseAnus):
		return "Really? Your ass is destroyed"
	if(interest == InterestTopic.BigBreasts):
		return "Don't fucking shake your udders"
	if(interest == InterestTopic.LactatingBreasts):
		return "Are you a fucking cow or something"
	if(interest == InterestTopic.ExposedCock):
		return "Mmm.. nice cock"
	if(interest == InterestTopic.FullyNaked):
		return "Wow, you have no shame. I'm jealous"
	if(interest == InterestTopic.Pregnant):
		return "Someone bred you? Gross."
	if(interest == InterestTopic.MasculineBody):
		return "Mm.. You're so manly.."
	if(interest == InterestTopic.SmallCock):
		return "Hah, that's a pathetic cock."
	
func _getName():
	return "Kait"

func getGender():
	return Gender.Female
	
func getSmallDescription() -> String:
	return "Snow leopard girl wearing a lilac uniform. Medium height, slim body build."

func getSpecies():
	return ["feline"]

func _getAttacks():
	return ["simplekickattack", "NpcScratch", "biteattack", "kickToBallsAttack", "slapTitsAttack", "stretchingAttack", "lickWounds", "shoveattack", "trygetupattack"]

func getFightIntro(_battleName):
	var mes = "Kait bounces in place and stretches like all felines usually do. She then directs her attention to you while getting into a combat pose, slightly lowering herself and extending her claws out."
	mes += "\n\n"
	if(_battleName == "arenafight"):
		mes += "[say=kait]And who the heck are you?[/say]"
	else:
		mes += "[say=kait]Who do you think you are?[/say]"
	mes += "\n\n"
	mes += "She huffs and puts on a battle face, her big fluffy tail sways behind her like it has a mind of its own."
	mes += "\n\n"
	if(_battleName == "arenafight"):
		mes += "[say=kait]Actually, it doesn’t matter. Just remember. If I win - I’m marking you.[/say]"
	else:
		mes += "[say=kait]Bring it on, doormat.[/say]"
	return mes

func getThickness() -> int:
	return 60

func getFemininity() -> int:
	return 100

func createBodyparts():
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("felinehead"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("overeyehair2"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("felineears"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anthrobody"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anthroarms"))
	var breasts = GlobalRegistry.createBodypart("humanbreasts")
	breasts.size = 3
	giveBodypartUnlessSame(breasts)
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("vagina"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anus"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("felinetail"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("digilegs"))

func getDefaultEquipment():
	return ["inmatecollar", "inmateuniformSexDeviant"]

func getLootTable(_battleName):
	return InmateLoot.new()
