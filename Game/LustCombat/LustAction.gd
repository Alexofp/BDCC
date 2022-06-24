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
