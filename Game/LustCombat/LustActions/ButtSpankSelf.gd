extends LustAction

func _init():
	id = "ButtSpankSelf"
	hasByDefault = true
	
func shouldShow(_lustState: LustCombatState, _args):
	if(!_lustState.isDoingActivity(LustActivity.GropingButt)):
		return false
	#var pc:Player = _lustState.getCharacter()
	#if(!pc.hasBodypart(BodypartSlot.Vagina) || pc.isBodypartCovered(BodypartSlot.Vagina)):
	#	return false
	
	return true

func canDo(_lustState: LustCombatState, _args):
	return .canDo(_lustState, _args)

func getVisibleName(_lustState: LustCombatState, _args):
	return "Spank ass"

func getVisibleDescription(_lustState: LustCombatState, _args):
	return "Send your butt to bounce"

func doAction(_lustState: LustCombatState, _args):
	#_lustState.getCharacter().addLust(1)
	#_lustState.startActivity(LustActivity.StrokingCock)

	var pc:Player = _lustState.getCharacter()
	
	var text = ""
	if(RNG.chance(50)):
		text += "You give your {pc.thick} ass a powerful smack, sending it to jiggle! Ow, you drop a lustful noise as your rear gets a slight red tint."
		text += "\n\n"
	else:
		text += "You rub your cute butt and then slap it with full force, making it bounce. You let out a moan and caress the area that you smacked so it doesn’t sting as much."
		text += "\n\n"
	
	if(RNG.chance(40) && (pc.hasEffect(StatusEffect.HasCumInsideVagina) || pc.hasEffect(StatusEffect.HasCumInsideAnus))):
		text += "And as you spank yourself, more cum is leaking out of your used hole and dripping down your thighs, creating a mess."
		text += "\n\n"
	
	if(_lustState.isInBattle()):
		text += "You made sure to show off how your butt jiggles after your smacks."
		text += "\n\n"
	
	if(RNG.chance(50) && pc.getLust() >= 50):
		text += "You pant softly and give your butt another smack. Huff, you feel like you can get off from that."
		text += "\n\n"

	return {
		text = text,
		lust = 1,
		pain = 3,
	}

func getLustTopics():
	return {
		InterestTopic.FeminineBody : 0.4,
		InterestTopic.MasculineBody : 0.4,
		InterestTopic.AndroBody : 0.4,
		InterestTopic.ThickButt : 0.7,
		InterestTopic.AverageButt : 0.7,
		InterestTopic.SlimButt : 0.7,
		InterestTopic.FullyNaked : 0.8,
		InterestTopic.ExposedPussy : 0.8,
		InterestTopic.ExposedAnus : 0.8,
		InterestTopic.ExposedCock : 0.8,
		InterestTopic.ExposedPanties : 0.3,
		InterestTopic.LooseAnus : 0.1,
		InterestTopic.LoosePussy : 0.1,
		InterestTopic.TightAnus : 0.1,
		InterestTopic.TightPussy : 0.1,
		InterestTopic.TallyMarks : 0.3,
		InterestTopic.Bodywritings : 0.3,
		InterestTopic.BDSMRestraints : 0.4,
		InterestTopic.ButtPlugs : 0.1,
		InterestTopic.VaginalPlugs : 0.1,
	}

func getPriority():
	return 5

func skillNeeded():
	return 2

func getExperience(_lustState: LustCombatState, _args):
	if(_lustState.isInPublic()):
		return [[Skill.Exhibitionism, 2]]
	return []
