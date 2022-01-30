extends ItemBase

func _init():
	id = "inmateanklecuffs"

func getVisibleName():
	return "Iron ankle Cuffs"
	
func getDescription():
	return "Bulky metal restraints. Can be locked to bind legs together"

func getClothingSlot():
	return InventorySlot.Ankles

func getBuffs():
	return [
		]

func getTakeOffScene():
	return "CuffTuggingScene"
