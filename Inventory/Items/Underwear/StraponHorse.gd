extends "res://Inventory/Items/Underwear/Strapon.gd"

func _init():
	id = "StraponHorse"

func getVisibleName():
	return "Strapon (horse)"
	
func getDescription():
	var text = "A huge ass strapon"

	return text

func getRiggedParts(_character):
	if(itemState.isRemoved()):
		return null
	return {
		"panties": "res://Inventory/RiggedModels/Strapons/HorsecockStrapon.tscn",
	}

func getStraponLength():
	return 30.0
