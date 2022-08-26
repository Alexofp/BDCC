extends Character

func _init():
	id = "nova"
	
	npcArmor = {
		DamageType.Physical: 10,
	}
	npcStats = {
		Stat.Sexiness: 1,
	}
	npcLevel = 2
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

func getPenisSize():
	return 18.0

func getChatColor():
	return '#90A9F4'

func createBodyparts():
	var mybreasts: BodypartBreasts = GlobalRegistry.createBodypart("humanbreasts")
	mybreasts.size = BreastsSize.EE
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

func createEquipment():
	#getInventory().equipItem(GlobalRegistry.createItemNoID("inmatecollar"))
	pass

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
