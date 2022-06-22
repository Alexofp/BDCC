extends Reference
class_name LustAction

var id = "error"

func shouldShow(_lustState: LustCombatState, _args):
	return true

func canDo(_lustState: LustCombatState, _args):
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
