extends Character

func _init():
	id = "nova"
	
	pickedSkin="NovaSkin"
	pickedSkinRColor=Color("ffc5c4c4")
	pickedSkinGColor=Color("ff414241")
	pickedSkinBColor=Color("ff747474")
	npcSkinData={
	"hair": {"r": Color("ffd9d9d9"),"g": Color("ff0f5fdb"),"b": Color("ff0f5fdb"),},
	"ears": {"r": Color("ff737373"),"g": Color("ffb5b5b5"),"b": Color("ffb8b8b8"),},
	"penis": {"g": Color("ffd12020"),"b": Color("ff8b0000"),},
	}
	
	npcArmor = {
		DamageType.Physical: 10,
	}
	npcStats = {
		Stat.Sexiness: 1,
	}
	npcLevel = 2
	npcCharacterType = CharacterType.Guard
	npcLustInterests = {
		InterestTopic.TallyMarks: Interest.Loves,
		InterestTopic.Bodywritings: Interest.Loves,
		InterestTopic.Gags: Interest.Likes,
		InterestTopic.Blindfolds: Interest.Likes,
		InterestTopic.BDSMRestraints: Interest.Loves,
		InterestTopic.ButtPlugs: Interest.ReallyLikes,
		InterestTopic.VaginalPlugs: Interest.ReallyLikes,
		InterestTopic.FeminineBody: Interest.ReallyLikes,
		InterestTopic.AndroBody: Interest.ReallyDislikes,
		InterestTopic.SlimBody: Interest.KindaLikes,
		InterestTopic.ThickButt: Interest.Loves,
		InterestTopic.AverageButt: Interest.KindaLikes,
		InterestTopic.SlimButt: Interest.SlightlyDislikes,
		InterestTopic.NoBreasts: Interest.SlightlyDislikes,
		InterestTopic.SmallBreasts: Interest.KindaLikes,
		InterestTopic.MediumBreasts: Interest.Loves,
		InterestTopic.BigBreasts: Interest.ReallyLikes,
		InterestTopic.StuffedPussy: Interest.Loves,
		InterestTopic.StuffedPussyOrAss: Interest.Loves,
		InterestTopic.StuffedThroat: Interest.Likes,
		InterestTopic.CoveredInCum: Interest.Likes,
		InterestTopic.CoveredInLotsOfCum: Interest.Loves,
		InterestTopic.FullyNaked: Interest.KindaLikes,
		InterestTopic.ExposedPussy: Interest.ReallyLikes,
		InterestTopic.ExposedAnus: Interest.Likes,
		InterestTopic.ExposedBreasts: Interest.Likes,
		InterestTopic.ExposedPanties: Interest.Dislikes,
		InterestTopic.ExposedBra: Interest.Dislikes,
		InterestTopic.LooseAnus: Interest.KindaLikes,
		InterestTopic.LoosePussy: Interest.KindaLikes,
		InterestTopic.TightAnus: Interest.Loves,
		InterestTopic.TightPussy: Interest.Loves,
		InterestTopic.HasVaginaOnly: Interest.ReallyLikes,
		InterestTopic.HasVaginaAndCock: Interest.Loves,
		InterestTopic.BigCock: Interest.Likes,
		InterestTopic.AverageCock: Interest.ReallyLikes,
		InterestTopic.SmallCock: Interest.ReallyLikes,
		InterestTopic.HasCockOnly: Interest.ReallyDislikes,
		InterestTopic.Pregnant: Interest.Loves,
	}
	
	npcHasMenstrualCycle = true
	
func interestVerbalReaction(interest):
	if(interest == InterestTopic.Pregnant):
		return "Gonna be a mommy soon? Nice~"
	if(interest == InterestTopic.TallyMarks):
		return "I'd love to leave more marks on you"
	if(interest == InterestTopic.BDSMRestraints):
		return "Aren't you a cute restriction slut~"
	if(interest == InterestTopic.ThickButt):
		return "That's an ass I would grope"
	if(interest == InterestTopic.ExposedPanties):
		return "Take your panties off, cutie"
	if(interest == InterestTopic.HasVaginaAndCock):
		return "Herms are nice~. I love the full package~"
	if(interest == InterestTopic.StuffedPussyOrAss):
		return "You got fucked, huh~. Lewd"
	if(interest == InterestTopic.TightAnus):
		return "Mommy would love to train that ass of yours"
	if(interest == InterestTopic.TightPussy):
		return "We can have so much fun stretching you~"
	if(interest == InterestTopic.MediumBreasts):
		return "I love your tits, not too small, not too big~"
	if(interest == InterestTopic.AverageCock):
		return "Great cock you have there~"
	
func _getName():
	return "Nova"

func getGender():
	return Gender.Androgynous
	
func getPronounGender():
	return Gender.Female
	
func getSmallDescription() -> String:
	return "Gray husky that wears hi-tech guard armor. Medium height, fit body"

func getSpecies():
	return ["canine"]

func _getAttacks():
	return ["stunbatonAttack", "stunbatonOverchargeAttack", "AIHumiliateMommy", "shoveattack", "trygetupattack"]

func getFightIntro(_battleName):
	var mes = "Nova’s power armor lights up as she grabs her trusty stun baton and directs her attention to you."
	mes += "\n\n"
	return mes+formatSay("You have no right to remain silent, anything I say will be used against you. Come here, sweetie~")

func getChatColor():
	return '#90A9F4'

func createBodyparts():
	var mybreasts: BodypartBreasts = GlobalRegistry.createBodypart("humanbreasts")
	mybreasts.size = BreastsSize.G
	giveBodypartUnlessSame(mybreasts)
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("caninehead"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("vagina"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anus"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anthrobody"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anthroarms"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("canineears"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("shorthair"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("digilegs"))
	var penis:BodypartPenis = GlobalRegistry.createBodypart("caninepenis")
	penis.lengthCM = 21
	giveBodypartUnlessSame(penis)
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("huskytail"))

func getThickness():
	return 115

func onGivingBirth(_impregnatedEggCells: Array, _newkids: Array):
	.onGivingBirth(_impregnatedEggCells, _newkids)
	
	GM.main.increaseModuleFlag("NovaModule", "Nova_GaveBirthTimes", 1)

func onCharacterVisiblyPregnant():
	.onCharacterVisiblyPregnant()
	
	if(!GM.main.getModuleFlag("NovaModule", "Nova_FirstTimePregnantHappened", false)):
		GM.main.setModuleFlag("NovaModule", "Nova_NotThereToday", true)

func getLootTable(_battleName):
	return GuardLoot.new()

func reactRestraint(restraintType, restraintAmount, isGettingForced):
	if(!isGettingForced):
		if(restraintAmount == 0):
			return RNG.pick([
				"Oh, that was a great try, sweetie~",
				"I'm free. And you're not~",
				"Cute~",
				"Was that your worst~?",
			])
		
		return RNG.pick([
			"Huff, I didn't became a guard to do this",
			"This wasn't in my contract",
			"This reminds me of my past",
		])
	
	if(isGettingForced):
		if(restraintAmount > 2 && RNG.chance(30)):
			return RNG.pick([
				"Hey-hey-hey! I have enough already",
				"Why don't you wear that?",
				"Can you unlock that one? I don't need it",
				"Heck, I hope you don't have a spare collar",
			])
		
		if(restraintType == RestraintType.Gag):
			return RNG.pick([
				"Huff. But I wanna tease you, sweetie",
				"Time to train my gag speech",
			])
		if(restraintType == RestraintType.Muzzle):
			return RNG.pick([
				"Wow. I'm not your fucking pet",
				"A muzzle? Are you serious?",
			])
		if(restraintType == RestraintType.ButtPlug):
			return RNG.pick([
				"Oh, there is room for more~",
				"Hey! I'm not a buttslut, you are!",
				"I have much bigger ones, wanna try~?",
			])
		if(restraintType == RestraintType.VaginalPlug):
			return RNG.pick([
				"Is that a present for me?",
				"I have much bigger ones, wanna try~?",
			])
	
		return RNG.pick([
			"That won't break me",
			"Heck!",
			"Hey, quit it",
			"Silly pet, stop it",
			"That's kinky but only if it was on you",
			"I'm a guard, I'm not a bondage slut",
		])
	return null

func getDefaultEquipment():
	return ["GuardArmor"]
