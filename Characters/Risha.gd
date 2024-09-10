extends Character

func _init():
	id = "risha"
	npcLevel = 5
	npcBasePain = 150
	npcBaseLust = 120
	npcCharacterType = CharacterType.Guard
	
	pickedSkin="FerriSkin"
	pickedSkinRColor=Color("ff007e91")
	pickedSkinGColor=Color("ffd0e4e3")
	pickedSkinBColor=Color("ff000000")
	npcSkinData={
	"hair": {"r": Color("ff003e6f"),"g": Color("ff113c5e"),"b": Color("ff00335c"),},
	"ears": {"g": Color("ffff5858"),},
	"penis": {"g": Color("ffc31919"),"b": Color("ffd0501e"),},
	}
	
	npcLustInterests = {
		InterestTopic.TallyMarks: Interest.Likes,
		InterestTopic.Bodywritings: Interest.ReallyLikes,
		InterestTopic.Gags: Interest.Likes,
		InterestTopic.Blindfolds: Interest.KindaLikes,
		InterestTopic.BDSMRestraints: Interest.Loves,
		InterestTopic.ButtPlugs: Interest.Likes,
		InterestTopic.VaginalPlugs: Interest.KindaLikes,
		InterestTopic.FeminineBody: Interest.ReallyLikes,
		InterestTopic.AndroBody: Interest.Likes,
		InterestTopic.MasculineBody: Interest.ReallyDislikes,
		InterestTopic.ThickBody: Interest.Dislikes,
		InterestTopic.AverageMassBody: Interest.Likes,
		InterestTopic.SlimBody: Interest.KindaLikes,
		InterestTopic.ThickButt: Interest.Likes,
		InterestTopic.AverageButt: Interest.KindaLikes,
		InterestTopic.SlimButt: Interest.Dislikes,
		InterestTopic.SmallBreasts: Interest.KindaLikes,
		InterestTopic.MediumBreasts: Interest.ReallyLikes,
		InterestTopic.BigBreasts: Interest.Likes,
		InterestTopic.LactatingBreasts: Interest.Likes,
		InterestTopic.StuffedPussy: Interest.Loves,
		InterestTopic.StuffedAss: Interest.ReallyLikes,
		InterestTopic.StuffedPussyOrAss: Interest.Likes,
		InterestTopic.StuffedThroat: Interest.Likes,
		InterestTopic.CoveredInCum: Interest.ReallyLikes,
		InterestTopic.CoveredInLotsOfCum: Interest.Likes,
		InterestTopic.FullyNaked: Interest.Likes,
		InterestTopic.ExposedPussy: Interest.ReallyLikes,
		InterestTopic.ExposedAnus: Interest.Likes,
		InterestTopic.ExposedBreasts: Interest.Likes,
		InterestTopic.ExposedCock: Interest.Dislikes,
		InterestTopic.ExposedPanties: Interest.Hates,
		InterestTopic.ExposedBra: Interest.Hates,
		InterestTopic.LooseAnus: Interest.KindaLikes,
		InterestTopic.LoosePussy: Interest.KindaLikes,
		InterestTopic.TightAnus: Interest.Likes,
		InterestTopic.TightPussy: Interest.Likes,
		InterestTopic.NoVagina: Interest.Hates,
		InterestTopic.HasVaginaOnly: Interest.Loves,
		InterestTopic.HasVaginaAndCock: Interest.Likes,
		InterestTopic.BigCock: Interest.Dislikes,
		InterestTopic.AverageCock: Interest.SlightlyDislikes,
		InterestTopic.SmallCock: Interest.KindaLikes,
		InterestTopic.NoCock: Interest.Likes,
		InterestTopic.HasCockOnly: Interest.SlightlyDislikes,
		InterestTopic.Pregnant: Interest.ReallyLikes,
	}
	
	npcHasMenstrualCycle = true
	
func interestVerbalReaction(interest):
	if(interest == InterestTopic.Pregnant):
		return "You like breeding too, huh. Come to me when you're in heat next time"
	if(interest == InterestTopic.BDSMRestraints):
		return "Fuck yeah, bound sluts are so hot"
	if(interest == InterestTopic.NoVagina):
		return "If you don't have a vagina how I'm gonna breed you, whore?"
	if(interest == InterestTopic.ExposedBra):
		return "Throw that bra into trash, you don't need it here"
	if(interest == InterestTopic.ExposedPanties):
		return "Your stupid panties are getting torn first"
	if(interest == InterestTopic.ExposedPussy):
		return "Yeah~. Now bend over, slut"
	if(interest == InterestTopic.BigCock):
		return "I will find the smallest cage for that cock, I swear"
	if(interest == InterestTopic.StuffedPussy):
		return "Oh yeah, I love seeing bred sluts"
	if(interest == InterestTopic.StuffedAss):
		return "You're leaking back there, slut"
	if(interest == InterestTopic.CoveredInCum):
		return "So messy, I love cum sluts"
	if(interest == InterestTopic.FullyNaked):
		return "Think you can just undress without me fucking you after?"
	if(interest == InterestTopic.SlimButt):
		return "That butt can't fit all my cum, whore"
	if(interest == InterestTopic.FeminineBody):
		return "I like girly types, they moan the best"
	if(interest == InterestTopic.HasVaginaAndCock):
		return "You're a herm too, huh~. I'm the top though"
	
	
func _getName():
	return "Risha"

func getGender():
	return Gender.Androgynous
	
func getPronounGender():
	return Gender.Female
	
func getSmallDescription() -> String:
	return "A very tall lynx with cyan fur. Usually wears her bulky guard armor. Her feline face features a huge amount of piercings"

func getSpecies():
	return ["feline"]

func _getAttacks():
	return ["aitaunthumiliate", "stunbatonAttack", "stunbatonStrongAttack", "biteattack", "simplekickattack", "shoveattack", "trygetupattack"]

func getFightIntro(_battleName):
	return getName() + " eyes you out and licks her lips.\n\n"+("[say=risha]You're an easy prey for me. Why don't you just undress and we can have some fun instead~[/say]")+"\n\nRisha then gets into a combat stance and gestures you to come closer. Her heavy armor doesn't seem to inpact her mobility one bit, her hand holds the stun baton very tightly\n\nSeems the first move is yours"

func getThickness() -> int:
	return 110

func getFemininity() -> int:
	return 70

func createBodyparts():
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anthrobody"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anus"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("digilegs"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("felinehead"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("overeyehair"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("lynxears2"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("buffarms"))
	var breasts = GlobalRegistry.createBodypart("humanbreasts")
	breasts.size = 8
	giveBodypartUnlessSame(breasts)
	var penis = GlobalRegistry.createBodypart("felinepenis")
	penis.lengthCM = 22
	penis.ballsScale = 1
	giveBodypartUnlessSame(penis)
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("vagina"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("shorttail"))

func reactRestraint(restraintType, restraintAmount, isGettingForced):
	if(!isGettingForced):
		if(restraintAmount == 0):
			return RNG.pick([
				"Haha! Is that all?",
				"Pathetic attempt",
				"Now stop trying to tie me up and spread your legs",
				"Hahaha, cute",
			])
		
		return RNG.pick([
			"I'm strong, I will rip these in half if I have to",
			"These won't keep me forever",
			"This only makes me more horny for that ass",
		])
	
	if(isGettingForced):
		if(restraintAmount > 2 && RNG.chance(30)):
			return RNG.pick([
				"Oh shit, stop",
				"I can't breed you if I'm tied up",
				"Bitch, I'm in control here",
			])
		
		if(restraintType == RestraintType.Gag):
			return RNG.pick([
				"Hey! Don't fucking gag me",
				"Oh, I'm so-o-o biting you",
			])
		if(restraintType == RestraintType.Muzzle):
			return RNG.pick([
				"Hey! Don't fucking muzzle me",
				"Oh, I'm so-o-o biting you",
			])
		if(restraintType == RestraintType.ButtPlug):
			return RNG.pick([
				"Fuck!",
				"My ass!",
				"Bitch, I will have my revenge on your ass",
			])
		if(restraintType == RestraintType.VaginalPlug):
			return RNG.pick([
				"Keep these for the sluts!",
				"I'm not a slut, you are!",
				"Only sluts use toys. I have the real thing",
			])
	
		return RNG.pick([
			"Hey! I'm a guard!",
			"I'm gonna use these against you later",
			"Don't make me mad",
			"You can't win like this",
			"Fight me instead of this shit",
			"I'm a huge cat, you can't tie me up",
		])
	return null

func getDefaultEquipment():
	return ["GuardArmor", "RishaPiercings"]
