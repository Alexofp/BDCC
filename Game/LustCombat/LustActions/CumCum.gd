extends LustAction

func _init():
	id = "CumCum"
	isOrgasmAction = true
	
func shouldShow(_lustState: LustCombatState, _args):
	return true

func canDo(_lustState: LustCombatState, _args):
	return .canDo(_lustState, _args)

func getVisibleName(_lustState: LustCombatState, _args):
	return "Cum"

func getVisibleDescription(_lustState: LustCombatState, _args):
	return "Embrace the orgasm.. If you are in a fight, you will lose and succumb to your enemy"

func doAction(_lustState: LustCombatState, _args):
	#_lustState.getCharacter().addLust(1)
	#_lustState.startActivity(LustActivity.StrokingCock)
	var pc: Player = _lustState.getCharacter()
	pc.orgasmFrom(pc.getID())
	
	var text = ""
	if(RNG.chance(50)):
		text += "You feel your climax approaching fast and decide to let it happen. You produce a series of passionate moans before going over the peak and finally cumming. The orgasmic waves overtake your whole body and cause you to shiver and squirm as you ride off each one."
		text += "\n\n"
	else:
		text += "The ecstatic waves suddenly wash over you, leaving you no choice but to cum. You let out some long moans as your body betrays you, most muscles begin flexing and tensing up, legs and arms shiver, you’re shaking and quivering as your eyes shine brightly with lust and desire."
		text += "\n\n"
	
	if(pc.hasPenis()):
		if(_lustState.isDoingActivity(LustActivity.StrokingCock)):
			text += "You stroke yourself just past the orgasm until your {pc.cock} starts throbbing and shooting ropes of hot sticky {pc.cum} all over the floor. You feel your balls being drained as each second the shaft erupts again and again."
			text += "\n\n"
		else:
			text += "Your {pc.cock} starts throbbing and shooting ropes of hot sticky {pc.cum} all over the floor without you even stroking it. You feel your balls being drained until you’re completely spent."
			text += "\n\n"
	
	if(pc.canBeMilked() && _lustState.isDoingActivity(LustActivity.GropingChest)):
		text += "Your nipples squirt with your {pc.milk} as you grope them through the orgasm! An almost constant flow of {pc.milk} spawns from your {pc.breasts} and flows down your curves as you’re squirming from orgasm."
		text += "\n\n"
	
	if(pc.hasVagina()):
		if(_lustState.isDoingActivity(LustActivity.SpreadingPussy)):
			text += "Your pussy squirts with your girly juices all over your fingers and the floor. You close your legs around your hand and feel your slit pulsate and leak more girlcum, coating your {pc.masc} thighs with it too. You pull your digits out of your snatch and let out another moan."
			text += "\n\n"
		else:
			text += "Your pussy pulsates and sprays your girly juices all over your thighs and floor."
			text += "\n\n"

	if(_lustState.isDoingActivity(LustActivity.ProddingAnal)):
		text += "Your {pc.analStretch} ring is clenching around your digits. Muscles spasming uncontrollably and putting pressure on your fingers brings you so much extra pleasure."
		text += "\n\n"

	return {
		text = text,
		came = true,
		lostBattle = true,
	}

func getLustTopics():
	return {
		InterestTopic.FeminineBody : 0.2,
		InterestTopic.MasculineBody : 0.2,
		InterestTopic.AndroBody : 0.2,
		InterestTopic.BigCock : 0.2,
		InterestTopic.AverageCock : 0.2,
		InterestTopic.SmallCock : 0.2,
		InterestTopic.HasVaginaOnly : 0.4,
		InterestTopic.HasCockOnly : 0.2,
		InterestTopic.HasVaginaAndCock : 0.4,
		InterestTopic.StuffedPussy : 0.2,
		InterestTopic.CoveredInCum : 0.2,
		InterestTopic.CoveredInLotsOfCum : 0.2,
	}

func getPriority():
	return 1

func getExperience(_lustState: LustCombatState, _args):
	if(_lustState.isInPublic()):
		return [[Skill.Exhibitionism, 10], [Skill.CumLover, 5]]
	return [[Skill.CumLover, 5]]

func getVisibility():
	return RNG.randf_range(0.1, 0.4)
