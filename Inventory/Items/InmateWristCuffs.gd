extends ItemBase

func _init():
	id = "inmatewristcuffs"

func getVisibleName():
	return "Iron wrist Cuffs"
	
func getDescription():
	return "Bulky metal restraints. Can be locked to bind arms together"

func getClothingSlot():
	return InventorySlot.Wrists

func getBuffs():
	return [
		buff(Buff.RestrainedArmsBuff),
		]

func getTakeOffScene():
	return "CuffTuggingScene"

func getTags():
	return [ItemTag.BDSMRestraint]

func isRestraint():
	return true
