extends ItemBase

func _init():
	id = "policecuffs"

func getVisibleName():
	return "Police cuffs"
	
func getDescription():
	return "Pretty standart police cuffs that go on your wrists"

func getClothingSlot():
	return InventorySlot.Wrists

func getBuffs():
	return [
		buff(Buff.RestrainedArmsBuff),
		]
