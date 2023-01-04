extends "res://Inventory/Items/Underwear/Strapon.gd"

func _init():
	id = "StraponCanine"

func getVisibleName():
	return "Strapon (canine)"
	
func getDescription():
	var text = "A strapon with a knot"

	return text

func getRiggedParts(_character):
	if(itemState.isRemoved()):
		return null
	return {
		"panties": "res://Inventory/RiggedModels/Strapons/CaninecockStrapon.tscn",
	}
