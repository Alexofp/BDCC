extends "res://Inventory/Items/Underwear/PlainPanties.gd"

func _init():
	id = "MirriPanties"
	clothesColor = Color("#0E446E")

func getVisibleName():
	return "Mirri's panties"
	
func getDescription():
	var text = "Simple panties with a stripped pattern on them."

	return text

func getPrice():
	return 30

func getTags():
	return [
		]

func getRiggedParts(_character):
	if(itemState.isRemoved()):
		return null
	if(itemState.isDamaged()):
		return {
			"panties": "res://Inventory/RiggedModels/Panties/PantiesDamaged.tscn",
		}
	return {
		"panties": "res://Inventory/RiggedModels/Panties/PantiesStripped.tscn",
	}
