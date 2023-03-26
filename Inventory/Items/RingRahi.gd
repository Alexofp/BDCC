extends ItemBase

func _init():
	id = "RingRahi"

func getVisibleName():
	return "Ring of Eternal Love"
	
func getDescription():
	return "A simple metal ring. But it means a lot to you. Engraved on it are the words \"To Remember. Forever and Always\""

func getClothingSlot():
	return InventorySlot.Ring

func getBuffs():
	return [
		buff(Buff.DodgeChanceBuff, [10]),
		buff(Buff.ExposureBuff, [-50]),
		]

func getPrice():
	return 50

func canSell():
	return true
