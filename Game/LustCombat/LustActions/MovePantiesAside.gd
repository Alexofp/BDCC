extends LustAction

func _init():
	id = "MovePantiesAside"
	
func shouldShow(_lustState: LustCombatState, _args):
	return true

func canDo(_lustState: LustCombatState, _args):
	# return [false, "Too horny"]
	return true

func getVisibleName(_lustState: LustCombatState, _args):
	return "Shift panties aside"

func getVisibleDescription(_lustState: LustCombatState, _args):
	if(_args.has("itemName")):
		return "Shift your "+_args["itemName"]+" aside"
	return "Shift your panties aside"

func doAction(_lustState: LustCombatState, _args):
	var _item:ItemBase = getItem(_lustState, _args)
	
	return {
		text = "{attacker.name} moved the panties aside"
	}
