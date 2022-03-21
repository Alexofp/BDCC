extends Reference
class_name RestraintAction

enum {
	WiggleOutOf,
	ShakeOff,
	ClawAt,
	SmashAgainstFloor,
	Bite,
	Tug,
	Rip,
}

static func canUseAction(pc, action, inventorySlot):
	var handsFree = !pc.hasBoundArms()
	#var legsFree = !pc.hasBoundLegs()
	#var canSee = !pc.isBlindfolded()
	var canBite = !pc.isGagged()
	
	if(action in [WiggleOutOf, ShakeOff, SmashAgainstFloor]):
		return true
		
	if((action in [ClawAt, Tug, Rip]) && handsFree):
		return true
	
	if(action in [Bite]):
		if(canBite):
			return true
		if(inventorySlot == InventorySlot.Mouth):
			return true
		
	return false
