extends ItemBase

func _init():
	id = "ballgag"

func getVisibleName():
	return "Ball Gag"
	
func getDescription():
	return "Can be used to gag those cheeky brats"


func getPossibleActions():
	return [
	]

func getClothingSlot():
	return InventorySlot.Mouth

func getBuffs():
	return [
		buff("gagBuff"),
		buff("lustDamageBuff", [100])
		]
