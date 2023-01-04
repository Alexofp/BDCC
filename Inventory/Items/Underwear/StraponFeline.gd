extends "res://Inventory/Items/Underwear/Strapon.gd"

func _init():
	id = "StraponFeline"

func getVisibleName():
	return "Strapon (feline)"
	
func getDescription():
	var text = "A strapon with barbs"

	return text

func getRiggedParts(_character):
	if(itemState.isRemoved()):
		return null
	return {
		"panties": "res://Inventory/RiggedModels/Strapons/FelinecockStrapon.tscn",
	}
