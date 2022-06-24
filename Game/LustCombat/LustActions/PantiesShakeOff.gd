extends LustAction

func _init():
	id = "PantiesShakeOff"
	
func shouldShow(_lustState: LustCombatState, _args):
	if(_lustState.isInventorySlotBlocked(InventorySlot.UnderwearBottom)):
		return false
	var pc: Player = _lustState.getCharacter()
	if(!pc.hasBlockedHands()):
		return false
	var itemState: PantiesState = _args["itemState"]
	if(itemState.isRemoved()):
		return false
	return true

func canDo(_lustState: LustCombatState, _args):
	return .canDo(_lustState, _args)

func getVisibleName(_lustState: LustCombatState, _args):
	var itemState: PantiesState = _args["itemState"]
	return "Shake "+itemState.casualName+" off"

func getVisibleDescription(_lustState: LustCombatState, _args):
	var itemState: PantiesState = _args["itemState"]
	return "You can't your hands so you have to shake your whole body to remove your "+itemState.casualName

func doAction(_lustState: LustCombatState, _args):
	var _item:ItemBase = getItem(_lustState, _args)
	
	var itemState: PantiesState = _args["itemState"]
	itemState.remove()
	
	return {
		text = "{attacker.name} shakes {attacker.his} "+itemState.casualName+" off!"
	}

func getLustTopics():
	return {
		InterestTopic.ButtPlugs : 0.2,
		InterestTopic.VaginalPlugs : 0.2,
		InterestTopic.ExposedPussy : 1.0,
		InterestTopic.ExposedAnus : 1.0,
		InterestTopic.StuffedPussy : 0.5,
		InterestTopic.StuffedAss : 0.5,
	}

func getPriority():
	return -3
