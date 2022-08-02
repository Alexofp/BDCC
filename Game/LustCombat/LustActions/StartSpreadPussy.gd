extends LustAction

func _init():
	id = "StartSpreadPussy"
	hasByDefault = true
	
func shouldShow(_lustState: LustCombatState, _args):
	if(!_lustState.canStartNewActivity(LustActivity.SpreadingPussy)):
		return false
	var pc:Player = _lustState.getCharacter()
	if(!pc.hasBodypart(BodypartSlot.Vagina) || pc.isBodypartCovered(BodypartSlot.Vagina)):
		return false
	
	return true

func canDo(_lustState: LustCombatState, _args):
	return .canDo(_lustState, _args)

func getVisibleName(_lustState: LustCombatState, _args):
	return "Rub pussy"

func getVisibleDescription(_lustState: LustCombatState, _args):
	return "Begin rubbing your kitty"

func doAction(_lustState: LustCombatState, _args):
	#_lustState.getCharacter().addLust(1)
	_lustState.startActivity(LustActivity.SpreadingPussy)

	#var pc:Player = _lustState.getCharacter()
	
	var text = ""
	if(RNG.chance(50)):
		text += "You slide your hand down to your crotch and find your cute pussy. You give the sensitive folds a few rubs to make sure they’re all nice and wet."
		text += "\n\n"
	else:
		text += "Your hand lands on your pussy and gives your clit a little rub. You moan and close your legs slightly with the stuck hand still teasing your slit."
		text += "\n\n"

	return {
		text = text,
		lust = 1,
	}

func getLustTopics():
	return {
		InterestTopic.FeminineBody : 0.3,
		InterestTopic.MasculineBody : 0.3,
		InterestTopic.AndroBody : 0.3,
		InterestTopic.ThickButt : 0.1,
		InterestTopic.AverageButt : 0.1,
		InterestTopic.SlimButt : 0.1,
		InterestTopic.StuffedPussy : 0.3,
		InterestTopic.CoveredInCum : 0.2,
		InterestTopic.CoveredInLotsOfCum : 0.2,
		InterestTopic.FullyNaked : 0.2,
		InterestTopic.ExposedPussy : 0.4,
		InterestTopic.ExposedCock : 0.3,
		InterestTopic.HasVaginaAndCock : 0.2,
		InterestTopic.NoCock : 0.2,
		InterestTopic.ExposedPanties : 0.3,
		InterestTopic.LoosePussy : 0.2,
		InterestTopic.TightPussy : 0.2,
		InterestTopic.BDSMRestraints : 0.1,
		InterestTopic.VaginalPlugs : 0.1,
		InterestTopic.Pregnant: 0.2,
	}

func isTease():
	return true

func skillNeeded():
	return 2

func getExperience(_lustState: LustCombatState, _args):
	if(_lustState.isInPublic()):
		return [[Skill.Exhibitionism, 2]]
	return []
