extends Character

func _init():
	id = "ferri"
	
	npcLevel = 6
	npcBasePain = 250
	npcBaseLust = 90
	
	npcLustInterests = {
		InterestTopic.TallyMarks: Interest.Loves,
		InterestTopic.Bodywritings: Interest.Loves,
		InterestTopic.Gags: Interest.Loves,
		InterestTopic.Blindfolds: Interest.Loves,
		InterestTopic.BDSMRestraints: Interest.Loves,
		InterestTopic.ButtPlugs: Interest.Loves,
		InterestTopic.VaginalPlugs: Interest.Loves,
		InterestTopic.FeminineBody: Interest.Likes,
		InterestTopic.AndroBody: Interest.Likes,
		InterestTopic.MasculineBody: Interest.KindaLikes,
		InterestTopic.ThickBody: Interest.ReallyDislikes,
		InterestTopic.AverageMassBody: Interest.Likes,
		InterestTopic.SlimBody: Interest.Likes,
		InterestTopic.ThickButt: Interest.KindaLikes,
		InterestTopic.AverageButt: Interest.ReallyLikes,
		InterestTopic.SlimButt: Interest.KindaLikes,
		InterestTopic.NoBreasts: Interest.KindaLikes,
		InterestTopic.SmallBreasts: Interest.Likes,
		InterestTopic.MediumBreasts: Interest.Loves,
		InterestTopic.BigBreasts: Interest.Likes,
		InterestTopic.LactatingBreasts: Interest.Loves,
		InterestTopic.StuffedPussy: Interest.SlightlyDislikes,
		InterestTopic.StuffedAss: Interest.SlightlyDislikes,
		InterestTopic.StuffedPussyOrAss: Interest.SlightlyDislikes,
		InterestTopic.Pregnant: Interest.Hates,
		InterestTopic.StuffedThroat: Interest.SlightlyDislikes,
		InterestTopic.CoveredInCum: Interest.Hates,
		InterestTopic.CoveredInLotsOfCum: Interest.Dislikes,
		InterestTopic.FullyNaked: Interest.Likes,
		InterestTopic.ExposedPussy: Interest.ReallyLikes,
		InterestTopic.ExposedAnus: Interest.KindaLikes,
		InterestTopic.ExposedBreasts: Interest.ReallyLikes,
		InterestTopic.ExposedCock: Interest.Likes,
		InterestTopic.ExposedPanties: Interest.KindaLikes,
		InterestTopic.ExposedBra: Interest.KindaLikes,
		InterestTopic.LooseAnus: Interest.Dislikes,
		InterestTopic.LoosePussy: Interest.Dislikes,
		InterestTopic.TightAnus: Interest.Likes,
		InterestTopic.TightPussy: Interest.Likes,
		InterestTopic.HasVaginaAndCock: Interest.Likes,
		InterestTopic.BigCock: Interest.Dislikes,
		InterestTopic.AverageCock: Interest.ReallyLikes,
		InterestTopic.SmallCock: Interest.KindaLikes,
		InterestTopic.NoCock: Interest.Likes,
	}
	
func interestVerbalReaction(interest):
	if(interest == InterestTopic.TallyMarks):
		return "What a whore~"
	if(interest == InterestTopic.CoveredInCum):
		return "I don't wanna taste cum while biting you!"
	if(interest == InterestTopic.Pregnant):
		return "I don't wanna bite a pregnant slut! Grr!"
	if(interest == InterestTopic.HasVaginaAndCock):
		return "Herms? Hot!"
	if(interest == InterestTopic.BDSMRestraints):
		return "Yes-yes! Need more restraints!"
	if(interest == InterestTopic.Gags):
		return "Drool for me, gagged slut~"
	if(interest == InterestTopic.Blindfolds):
		return "Can't see me? What a shame~"
	if(interest == InterestTopic.LactatingBreasts):
		return "Huff, I wanna be lactating too.."
	if(interest == InterestTopic.MediumBreasts):
		return "Nice funbags, can I play with them~?"
	if(interest == InterestTopic.FullyNaked):
		return "So much skin to bite~"
	if(interest == InterestTopic.TightPussy):
		return "That's a nice pussy~"
		
func _getName():
	return "Ferri"

func getGender():
	return Gender.Female
	
func getSmallDescription() -> String:
	return "Feline-dragon female hybrid of a medium build. Spots cyan fur with some dark blue and white accents. High-security block inmate."

func getSpecies():
	return ["feline", "dragon"]

func _getAttacks():
	return ["NpcScratch", "lickWounds", "StrongBite", "TailSwipe", "FerriTaunt", "trygetupattack"]

func getFightIntro(_battleName):
	var text = "Ferri exposes her dangerous fangs and playfully growls at you. She then extends her sharp claws and teasingly licks one. Her long dragon tail swishes behind her."
	text += "\n\n"
	text += "[say=ferri]You don’t stand a chance against the all mighty dracat~.[/say]"
	text += "\n\n"
	text += "She gets into a combat stance and taunts you to come closer."
	
	return text

func getThickness() -> int:
	return 100

func getFemininity() -> int:
	return 100

func createBodyparts():
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("felinehead"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("ferrihair"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("felineears"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("dragonhorns"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anthrobody"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anthroarms"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("vagina"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anus"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("dragontail"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("digilegs"))
	var breasts = GlobalRegistry.createBodypart("humanbreasts")
	breasts.size = 6
	giveBodypartUnlessSame(breasts)

func getLootTable(_battleName):
	return InmateLoot.new()

func createEquipment():
	getInventory().equipItem(GlobalRegistry.createItemNoID("inmatecollar"))
	pass

func getAiStrategy(_battleName):
	var basicAI = LoseEarlyAI.new()
	basicAI.setCharacterID(id)
	return basicAI
