extends Character

func _init():
	id = "avy"
	
	pickedSkin="WoonaSkin"
	pickedSkinRColor=Color("ff393939")
	pickedSkinGColor=Color("ff242424")
	pickedSkinBColor=Color("ff1f1f1f")
	npcSkinData={
	"hair": {"r": Color("ff161616"),"g": Color("ffff0000"),"b": Color("ff070707"),},
	"ears": {"g": Color("ff890000"),"b": Color("fff00000"),},
	"breasts": {"g": Color("ff581818"),"b": Color("ff800000"),},
	"penis": {"g": Color("ffff0000"),"b": Color("ff8b0000"),},
	}
	
	npcLevel = 5
	npcBasePain = 130
	npcBaseLust = 110
	npcCharacterType = CharacterType.Inmate
	
	npcPersonality = {
		PersonalityStat.Brat: 1.0,
		PersonalityStat.Mean: 1.0,
		PersonalityStat.Subby: -1.0,
		PersonalityStat.Impatient: -0.3,
		PersonalityStat.Naive: -0.5,
		PersonalityStat.Coward: 0.5,
	}
	npcFetishes = {
		Fetish.AnalSexReceiving : FetishInterest.Hates,
		Fetish.AnalSexGiving : FetishInterest.Loves,
		Fetish.VaginalSexGiving : FetishInterest.Loves,
		Fetish.OralSexReceiving : FetishInterest.Loves,
		Fetish.OralSexGiving : FetishInterest.Hates,
		Fetish.Sadism : FetishInterest.Loves,
		Fetish.Masochism : FetishInterest.Hates,
		Fetish.UnconsciousSex : FetishInterest.Loves,
		Fetish.Breeding : FetishInterest.Loves,
		Fetish.Bondage : FetishInterest.Dislikes,
		Fetish.Condoms : FetishInterest.Hates,
		Fetish.DrugUse : FetishInterest.Loves,
		Fetish.Exhibitionism : FetishInterest.Likes,
	}
	
	npcLustInterests = {
		InterestTopic.TallyMarks: Interest.Loves,
		InterestTopic.Bodywritings: Interest.Loves,
		InterestTopic.Gags: Interest.Likes,
		InterestTopic.Blindfolds: Interest.Likes,
		InterestTopic.BDSMRestraints: Interest.ReallyLikes,
		InterestTopic.ButtPlugs: Interest.Likes,
		InterestTopic.VaginalPlugs: Interest.Likes,
		InterestTopic.FeminineBody: Interest.ReallyLikes,
		InterestTopic.AndroBody: Interest.KindaLikes,
		InterestTopic.MasculineBody: Interest.Dislikes,
		InterestTopic.ThickBody: Interest.KindaLikes,
		InterestTopic.AverageMassBody: Interest.ReallyLikes,
		InterestTopic.SlimBody: Interest.Loves,
		InterestTopic.ThickButt: Interest.SlightlyDislikes,
		InterestTopic.AverageButt: Interest.SlightlyDislikes,
		InterestTopic.SlimButt: Interest.ReallyLikes,
		InterestTopic.NoBreasts: Interest.KindaLikes,
		InterestTopic.SmallBreasts: Interest.Likes,
		InterestTopic.MediumBreasts: Interest.KindaLikes,
		InterestTopic.BigBreasts: Interest.KindaLikes,
		InterestTopic.LactatingBreasts: Interest.Likes,
		InterestTopic.StuffedPussy: Interest.KindaLikes,
		InterestTopic.StuffedAss: Interest.ReallyLikes,
		InterestTopic.StuffedPussyOrAss: Interest.Likes,
		InterestTopic.StuffedThroat: Interest.Loves,
		InterestTopic.CoveredInCum: Interest.ReallyLikes,
		InterestTopic.CoveredInLotsOfCum: Interest.Loves,
		InterestTopic.FullyNaked: Interest.Likes,
		InterestTopic.ExposedPussy: Interest.KindaLikes,
		InterestTopic.ExposedAnus: Interest.ReallyLikes,
		InterestTopic.ExposedBreasts: Interest.Likes,
		InterestTopic.ExposedCock: Interest.ReallyDislikes,
		InterestTopic.ExposedPanties: Interest.Hates,
		InterestTopic.ExposedBra: Interest.Dislikes,
		InterestTopic.LooseAnus: Interest.Hates,
		InterestTopic.LoosePussy: Interest.Hates,
		InterestTopic.TightAnus: Interest.Likes,
		InterestTopic.TightPussy: Interest.Likes,
		InterestTopic.NoVagina: Interest.KindaLikes,
		InterestTopic.HasVaginaOnly: Interest.KindaLikes,
		InterestTopic.HasVaginaAndCock: Interest.Likes,
		InterestTopic.BigCock: Interest.Hates,
		InterestTopic.AverageCock: Interest.Dislikes,
		InterestTopic.SmallCock: Interest.Likes,
		InterestTopic.NoCock: Interest.KindaLikes,
		InterestTopic.HasCockOnly: Interest.KindaLikes,
		InterestTopic.Pregnant: Interest.Loves,
	}
	
func interestVerbalReaction(interest):
	if(interest == InterestTopic.HasVaginaAndCock):
		return "You're a herm, huh~"
	if(interest == InterestTopic.ExposedPanties):
		return "Take those panties off before I rip them off, slut"
	if(interest == InterestTopic.TallyMarks):
		return "Oh my~. I love when sluts have tally marks"
	if(interest == InterestTopic.Bodywritings):
		return "Can I leave some words on you too~?"
	if(interest == InterestTopic.BigCock):
		return "Pff-f, how do you even have enough blood for your cock to get hard?"
	if(interest == InterestTopic.LoosePussy):
		return "Meh, your cunt is too ruined already, it's not fun."
	if(interest == InterestTopic.LooseAnus):
		return "Can you ride less horsecocks with that ass maybe?"
	if(interest == InterestTopic.StuffedThroat):
		return "Oh yeah, I love when sluts drool cum~"
	if(interest == InterestTopic.CoveredInLotsOfCum):
		return "You're such a cum dump~"
	if(interest == InterestTopic.SlimBody):
		return "Oh, you're so slim I think I can hold you hovering while fucking~"
	if(interest == InterestTopic.Pregnant):
		return "Someone knocked you up, huh~. Was it me by any chance?"
	if(interest == InterestTopic.ExposedCock):
		return "Hide that cock, slut, you won't need it with me"
	
	
func _getName():
	return "Avy"

func getGender():
	return Gender.Androgynous
	
func getPronounGender():
	return Gender.Female
	
func getSmallDescription() -> String:
	return "Red inmate, medium-height fox with a black fur and a feminine look."

func getSpecies():
	return ["canine"]
	
func _getAttacks():
	return ["biteattack", "simplekickattack", "stretchingAttack", "lickWounds", "shoveattack", "trygetupattack"]

func getFightIntro(_battleName):
	if(_battleName == "arenafight"):
		return "Avy stands tall, her foxy tail swishing behind her. It seems she is waiting for you to do the first move.."
	return "Avy stands straight, her hands slightly behind her, clawed digits spread out."

func getThickness() -> int:
	return 75

func getFemininity() -> int:
	return 50

func createBodyparts():
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anthrobody"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anthroarms"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anus"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("digilegs"))
	var breasts = GlobalRegistry.createBodypart("humanbreasts")
	breasts.size = 4
	giveBodypartUnlessSame(breasts)
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("foxhead"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("longhair"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("canineears"))
	var penis = GlobalRegistry.createBodypart("caninepenis")
	penis.lengthCM = 22
	penis.ballsScale = 1
	giveBodypartUnlessSame(penis)
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("caninetail"))

func getLootTable(_battleName):
	return InmateLoot.new()

func getDefaultEquipment():
	return ["inmatecollar", "inmateuniformHighsec"]
