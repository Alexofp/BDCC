extends Reference
class_name LustAction

var id = "error"
var needsFreeHand = false
var hasByDefault = false
var isOrgasmAction = false

func shouldShow(_lustState: LustCombatState, _args):
	return true

func canDo(_lustState: LustCombatState, _args):
	if(needsFreeHand && !_lustState.canDoAction()):
		return [false, "Your hands are all busy"]
	var minLevel = skillNeeded()
	if(minLevel > 0 && _lustState.isInPublic() && _lustState.getCharacter().getSkillLevel(Skill.Exhibitionism) < minLevel):
		return [false, "You feel too ashamed to do this in public, find a more secluded spot or do something else.. (Exhibitionism level "+str(minLevel)+"+)"]
	# return [false, "Too horny"]
	return true

func getVisibleName(_lustState: LustCombatState, _args):
	return "ERROR"

func getVisibleDescription(_lustState: LustCombatState, _args):
	return "You shouldn't see this"

func doAction(_lustState: LustCombatState, _args):
	return {
		text = "Nope"
	}

func getItem(_lustState: LustCombatState, _args) -> ItemBase:
	if(!_args.has("item")):
		return null
	return _lustState.getCharacter().getInventory().getItemByUniqueID(_args["item"])

func getLustTopics():
	return {}

func getPriority():
	return 0

func isTease():
	return false

func skillNeeded():
	return 0

func getExperience(_lustState: LustCombatState, _args):
	return []

func getVisibility():
	return RNG.randf_range(0.05, 0.1)
