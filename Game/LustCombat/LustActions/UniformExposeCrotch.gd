extends LustAction

func _init():
	id = "UniformExposeCrotch"
	
func shouldShow(_lustState: LustCombatState, _args):
	if(_lustState.isInventorySlotBlocked(InventorySlot.Body)):
		return false
		
	var itemState: ShirtAndShortsState = _args["itemState"]
	if(itemState.areShortsPulledDown()):
		return false
	
	var pc:Player = _lustState.getCharacter()
	if(pc.hasBoundArms() || pc.hasBlockedHands()):
		return false
	
	return true

func canDo(_lustState: LustCombatState, _args):
	#var itemState: ShirtAndShortsState = _args["itemState"]
#	var pc:Player = _lustState.getCharacter()
#	if(pc.hasBoundArms()):
#		return [false, "You can't do that with bound arms"]
#	if(pc.hasBlockedHands()):
#		return [false, "You can't do that with blocked hands"]
	return .canDo(_lustState, _args)

func getVisibleName(_lustState: LustCombatState, _args):
	return "Expose crotch"

func getVisibleDescription(_lustState: LustCombatState, _args):
	return "Pull down the shorts of your uniform"

func doAction(_lustState: LustCombatState, _args):
	var _item:ItemBase = getItem(_lustState, _args)
	
	var itemState: ShirtAndShortsState = _args["itemState"]
	itemState.pullDownShorts()
	
	var pc:Player = _lustState.getCharacter()
	
	var text = ""
	if(!pc.isBodypartCovered(BodypartSlot.Anus)):
		text += "You sneak two digits under your shorts and proceed to teasingly pull it down, exposing your {pc.thick} {pc.masc} butt."
		text += "\n\n"
		
		if(pc.hasPenis()):
			text += "As you do it, the tip of your {pc.cock} catches on the ribbon, gets tugged down by it and then springs back as your shorts fall onto the floor. Your cock is completely exposed and your other privates too."
			text += "\n\n"
		elif(pc.hasVagina()):
			text += "As your shorts are pulled down, your wet needy slit gets completely exposed too. So naughty~. The thought of your privates being exposed to anyone to see fills you with so much desire."
			text += "\n\n"
	else:
		text += "You sneak two digits under your shorts and proceed to teasingly pull them down, exposing the underwear. The fabric brushing against your {pc.thick} thighs as it slides down feels nice, maybe you should strip more often."
		text += "\n\n"
	
	if(pc.hasEffect(StatusEffect.CoveredInCum)):
		text += "Pulling down the shorts reveals how much cum you also have underneath, so messy."
		text += "\n\n"
	
	if(!pc.isBodypartCovered(BodypartSlot.Anus) && (pc.hasEffect(StatusEffect.HasCumInsideVagina) || pc.hasEffect(StatusEffect.HasCumInsideAnus))):
		text += "And your used fuckhole seems to be stuffed with someone’s cum, seeing it drip down onto the floor is so lewd."
		text += "\n\n"
	
	if(_lustState.isInBattle()):
		text += "The enemy seems to be watching you carefully as you do a little striptease dance for them~"
		text += "\n\n"
	
	return {
		text = text
	}

func getPriority():
	return -4

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

func isTease():
	return true

func skillNeeded():
	return 1

func getExperience(_lustState: LustCombatState, _args):
	if(_lustState.isInPublic()):
		return [[Skill.Exhibitionism, 1]]
	return []
