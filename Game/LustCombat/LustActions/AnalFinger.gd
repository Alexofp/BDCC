extends LustAction

func _init():
	id = "AnalFinger"
	hasByDefault = true
	
func shouldShow(_lustState: LustCombatState, _args):
	if(!_lustState.isDoingActivity(LustActivity.ProddingAnal)):
		return false
	var pc:Player = _lustState.getCharacter()
	if(!pc.hasBodypart(BodypartSlot.Anus) || pc.isBodypartCovered(BodypartSlot.Anus)):
		return false
	
	return true

func canDo(_lustState: LustCombatState, _args):
	var pc:Player = _lustState.getCharacter()
	if(pc.hasBoundArms()):
		return [false, "You can't do that with bound arms"]
	#if(pc.hasBlockedHands()):
	#	return [false, "You can't do that with blocked hands"]
	
	return .canDo(_lustState, _args)

func getVisibleName(_lustState: LustCombatState, _args):
	return "Finger butt"

func getVisibleDescription(_lustState: LustCombatState, _args):
	return "Pleasure your backdoor"

func doAction(_lustState: LustCombatState, _args):
	#_lustState.getCharacter().addLust(3)

	var pc:Player = _lustState.getCharacter()
	
	var text = ""
	if(RNG.chance(50)):
		text += "A quiet moan escapes from your lips as you slide your digits back and forth in your butt. The more you do it, the less resistance your {pc.analStretch} anal ring gives you."
		text += "\n\n"
	else:
		text += "You push your digits deeper down your {pc.analStretch} ring, exploring yourself and then pull them back, leaving empty space that slowly closes up."
		text += "\n\n"
	
	if(RNG.chance(50) && _lustState.isInBattle()):
		text += "You make sure to give your enemy the best view of your {pc.thick} ass and {pc.masc} thighs as you finger yourself."
		text += "\n\n"
	
	if(RNG.chance(30) && pc.hasEffect(StatusEffect.HasCumInsideAnus)):
		text += "Your digits get coated with cum of your previous lovers, it acts great as a lube, allowing you to thrust your fingers in and out with greater force."
		text += "\n\n"
	
	if(RNG.chance(30) && pc.hasPenis()):
		text += "Your {pc.cock} throbbing as you occasionally brush over your pleasure spot."
		text += "\n\n"

	return {
		text = text,
		lust = 5,
	}

func getLustTopics():
	return {
		InterestTopic.ThickButt : 0.2,
		InterestTopic.AverageButt : 0.2,
		InterestTopic.SlimButt : 0.2,
		InterestTopic.StuffedAss : 0.5,
		InterestTopic.StuffedPussyOrAss : 0.2,
		InterestTopic.FullyNaked : 0.4,
		InterestTopic.ExposedPussy : 0.3,
		InterestTopic.ExposedAnus : 0.8,
		InterestTopic.ExposedCock : 0.1,
		InterestTopic.LooseAnus : 1.0,
		InterestTopic.TightAnus : 1.0,
		InterestTopic.TallyMarks : 0.1,
		InterestTopic.Bodywritings : 0.1,
		InterestTopic.ButtPlugs : 0.4,
		InterestTopic.VaginalPlugs : 0.2,
	}

func getPriority():
	return 5

func skillNeeded():
	return 3

func getExperience(_lustState: LustCombatState, _args):
	if(_lustState.isInPublic()):
		return [[Skill.Exhibitionism, 2]]
	return []
