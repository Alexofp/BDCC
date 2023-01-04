extends "res://Inventory/Items/Underwear/Strapon.gd"

func _init():
	id = "StraponFeeldoe"

func getVisibleName():
	return "Strapon (feeldoe)"
	
func getDescription():
	var text = "A strapon with a knot"

	return text

func getRiggedParts(_character):
	if(itemState.isRemoved()):
		return null
	return {
		"panties": "res://Inventory/RiggedModels/Strapons/FeeldoeStrapon.tscn",
	}

func getStraponPleasureForDom():
	return 0.5
