extends LustAction

func _init():
	id = "PantiesPullDown"
	
func shouldShow(_lustState: LustCombatState, _args):
	if(_lustState.isInventorySlotBlocked(InventorySlot.UnderwearBottom)):
		return false
	var pc: Player = _lustState.getCharacter()
	if(pc.hasBlockedHands()):
		return false
	var itemState: PantiesState = _args["itemState"]
	if(itemState.isRemoved()):
		return false
	return true

func canDo(_lustState: LustCombatState, _args):
	return .canDo(_lustState, _args)

func getVisibleName(_lustState: LustCombatState, _args):
	var itemState: PantiesState = _args["itemState"]
	return "Pull "+itemState.casualName+" down"

func getVisibleDescription(_lustState: LustCombatState, _args):
	var itemState: PantiesState = _args["itemState"]
	return "Pull down your "+itemState.casualName

func doAction(_lustState: LustCombatState, _args):
	var _item:ItemBase = getItem(_lustState, _args)
	
	var itemState: PantiesState = _args["itemState"]
	itemState.remove()
	
	var pc:Player = _lustState.getCharacter()
	
	var text = ""
	if(true):
		text += "Overwhelmed with lust, you slide two fingers under your <casualName> and pull them down, exposing your privates."
		text += "\n\n"
		
	if(pc.hasPenis()):
		text += "Your {pc.cock} quickly springs up after it is freed, a drop of precum shines as it slides down from the tip."
		text += "\n\n"
	
	if(pc.hasVagina()):
		text += "Your cute pussy slit is now totally exposed for anyone who might see you, so lewd! Your inviting sensitive folds feel the light breeze of fresh air."
		text += "\n\n"
		
	if(RNG.chance(50) && (pc.hasEffect(StatusEffect.HasCumInsideVagina) || pc.hasEffect(StatusEffect.HasCumInsideAnus))):
		text += "As soon as you move the <casualName>, cum starts leaking from your used fuckhole, reminding you of your past lewd adventures and displaying how big of a cum slut you are."
		text += "\n\n"
		
	if(RNG.chance(70) && pc.getLust() >= 50 && pc.hasVagina()):
		text += "Wow, your pussy is very much drenched with your juices, all the horny thoughts in your head only make you drip more."
		text += "\n\n"
	
	if(RNG.chance(50) && pc.hasVagina() && pc.hasEffect(StatusEffect.InHeat)):
		text += "The heat is driving you insane, you spread your pussy lips for a second and a flow of your juices starts running down your fingers. Fuck, you really want to be used."
		text += "\n\n"
		
	if(RNG.chance(30) && pc.hasVagina()):
		text += RNG.pick([
			"[say=pc]Huh, should I spread my legs.. I really want to..[/say]",
			"[say=pc]My pussy is so wet..[/say]",
			"[say=pc]Yes-s~[/say]",
		])
		text += "\n\n"
	
	return {
		text = text.replace("<casualName>", itemState.casualName)
	}

func getLustTopics():
	return {
		InterestTopic.FeminineBody : 0.2,
		InterestTopic.MasculineBody : 0.2,
		InterestTopic.AndroBody : 0.2,
		InterestTopic.ThickButt : 0.2,
		InterestTopic.AverageButt : 0.2,
		InterestTopic.SlimButt : 0.2,
		InterestTopic.NoVagina : 0.5,
		InterestTopic.HasVaginaOnly : 0.5,
		InterestTopic.HasVaginaAndCock : 0.2,
		InterestTopic.BigCock : 0.5,
		InterestTopic.AverageCock : 0.5,
		InterestTopic.SmallCock : 0.5,
		InterestTopic.NoCock : 0.5,
		InterestTopic.HasCockOnly : 0.2,
		InterestTopic.StuffedPussy : 0.4,
		InterestTopic.StuffedAss : 0.4,
		InterestTopic.StuffedPussyOrAss : 0.2,
		InterestTopic.FullyNaked : 0.2,
		InterestTopic.ExposedPussy : 0.4,
		InterestTopic.ExposedAnus : 0.4,
		InterestTopic.ExposedCock : 0.4,
		InterestTopic.ExposedPanties : 0.3,
		InterestTopic.LooseAnus : 0.1,
		InterestTopic.LoosePussy : 0.1,
		InterestTopic.TightAnus : 0.1,
		InterestTopic.TightPussy : 0.1,
		InterestTopic.ButtPlugs : 0.2,
		InterestTopic.VaginalPlugs : 0.2,
	}

func getPriority():
	return -6

func isTease():
	return true

func skillNeeded():
	return 1

func getExperience(_lustState: LustCombatState, _args):
	if(_lustState.isInPublic()):
		return [[Skill.Exhibitionism, 1]]
	return []
