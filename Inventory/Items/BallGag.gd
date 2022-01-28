extends ItemBase

func _init():
	id = "ballgag"

func getVisibleName():
	return "Ball Gag"
	
func getVisisbleDescription():
	return "Can be used to gag those cheeky brats"


func getPossibleActions():
	return [
	]

func getClothingSlot():
	return InventorySlot.Mouth
