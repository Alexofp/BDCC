extends Character

func _init():
	id = "novaArena"
	
	npcArmor = {
		DamageType.Physical: 30,
	}
	npcLevel = 10
	npcBasePain = 200
	npcBaseLust = 150
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
	
	#npcHasMenstrualCycle = true
	
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
	
func getAmbientLust():
	return 40
	
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
	var mes = "Seeing one of the staff members in the arena is quite strange, Nova pulls out her trusty stun baton and directs her attention to the crowd."
	mes += "\n\n"
	mes += "[say=nova]This is a bust, everyone please quietly lower yourself to your knees and await my justice.[/say]"
	mes += "\n\n"
	mes += "She is met with mostly quietness from the crowd. Someone brave yells ‘Go fuck yourself, slut!’."
	mes += "\n\n"
	mes += "[say=nova]Should have seen your faces. Nah, the only one who should worry is you.[/say]"
	mes += "\n\n"
	mes += "The husky points at you with her weapon before taking a fighting stance. She also flicks some kind of switch on her advanced power armor, causing it to light up like a christmas tree. Seems like she is way more protected than usual."
	mes += "\n\n"
	mes += "[say=nova]I’m awfully horny today, cutie. Gonna help a dog bury her bone?[/say]"
	return mes

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


func getLootTable(_battleName):
	return GuardLoot.new()
