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
		"strapon": "res://Inventory/RiggedModels/Strapons/CaninecockStrapon.tscn",
	}

func getCasualName():
	return "canine strapon"

func getPrice():
	return 20

func generateFluids():
	fluids = Fluids.new()
	fluids.setCapacity(750.0)

func getInventoryImage():
	return "res://Images/Items/strapons/canine.png"
