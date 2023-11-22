extends ItemBase

func _init():
	id = "ropeharness"

func getVisibleName():
	return "Rope harness"
	
func getA():
	return "a"
	
func getDescription():
	return "A set of ropes that go over your body"

func getClothingSlot():
	return InventorySlot.Torso

func getBuffs():
	return [
		buff(Buff.AmbientLustBuff, [10]),
		buff(Buff.StatBuff, [Stat.Sexiness, 2]),
		]

func getPrice():
	return 0

func canSell():
	return true

func getTags():
	return [ItemTag.BDSMRestraint, ItemTag.CanBeForcedByGuards, ItemTag.CanBeForcedInStocks]

func isRestraint():
	return true

func generateRestraintData():
	restraintData = RestraintRopeHarness.new()
	restraintData.setLevel(calculateBestRestraintLevel())

func getTakingOffStringLong(withS):
	if(withS):
		return "unties all the knots and removes your rope harness"
	else:
		return "untie all the knots and remove your rope harness"

func getPuttingOnStringLong(withS):
	if(withS):
		return "ties your body up with ropes"
	else:
		return "tie your body up with ropes"

func getForcedOnMessage(isPlayer = true):
	if(isPlayer):
		return getAStackNameCapitalize()+" was forced onto you. The ropes keep rubbing against your sensetive spots"
	else:
		return getAStackNameCapitalize()+" was forced onto {receiver.name}. The ropes keep rubbing against {receiver.his} sensetive spots"

func getRiggedParts(_character):
	return {
		"harness": "res://Inventory/RiggedModels/RopeHarness/RopeHarness.tscn",
	}

func getInventoryImage():
	return "res://Images/Items/bdsm/rope.png"
