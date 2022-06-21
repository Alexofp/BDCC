extends ItemBase

func _init():
	id = "ropeharness"

func getVisibleName():
	return "Rope harness"
	
func getDescription():
	return "A set of ropes that go over your body"

func getClothingSlot():
	return InventorySlot.Torso

func getBuffs():
	return [
		buff(Buff.AmbientLustBuff, [10]),
		]

func getPrice():
	return 0

func canSell():
	return true

func getTags():
	return [ItemTag.BDSMRestraint, ItemTag.CanBeForcedByGuards]

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

func getForcedOnMessage():
	return getAStackNameCapitalize()+" was forced onto you. The ropes keep rubbing against your sensetive spots"

func getRiggedParts(_character):
	return {
		"harness": "res://Inventory/RiggedModels/RopeHarness/RopeHarness.tscn",
	}
