extends LustAction

func _init():
	id = "CumDenySelf"
	isOrgasmAction = true
	
func shouldShow(_lustState: LustCombatState, _args):
	return true

func canDo(_lustState: LustCombatState, _args):
	var pc: Player = _lustState.getCharacter()
	if(pc.getStamina() <= 0):
		return [false, "You don't have enough will to stop now.."]
	return .canDo(_lustState, _args)

func getVisibleName(_lustState: LustCombatState, _args):
	return "Deny self"

func getVisibleDescription(_lustState: LustCombatState, _args):
	return "Go against your will and use 20 stamina to deny yourself the orgasm."

func doAction(_lustState: LustCombatState, _args):
	#_lustState.getCharacter().addLust(1)
	#_lustState.startActivity(LustActivity.StrokingCock)
	var pc: Player = _lustState.getCharacter()
	pc.addStamina(-20)
	pc.addLust( -int(float(pc.getLust()) / 2) )

	if(_lustState.isInBattle()):
		pc.addEffect(StatusEffect.DeniedDesperate, [2])

	var text = ""
	if(RNG.chance(50)):
		text += "You feel yourself on the edge of your peak. You only need so little extra stimulation to get that sweet release.. but instead you hold completely still and let that feeling calm down. You are denying yourself the climax that you wanted so much, you’re squirming desperate!"
		text += "\n\n"
	else:
		text += "The climax is so close, all you need is a little more.. But no, using a huge chunk of your will you manage to go against your desires and deny yourself the orgasm. You stay completely still while waiting for the pleasurable feelings to soften up. You skipped this one and it makes you feel desperate for another one.."
		text += "\n\n"

	return {
		text = text,
		came = true,
	}

func getLustTopics():
	return {
		InterestTopic.FeminineBody : 0.2,
		InterestTopic.MasculineBody : 0.2,
		InterestTopic.AndroBody : 0.2,
	}

func getPriority():
	return 0

func getExperience(_lustState: LustCombatState, _args):
	if(_lustState.isInPublic()):
		return [[Skill.Exhibitionism, 2]]
	return []
