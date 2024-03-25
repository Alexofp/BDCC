extends "res://Inventory/Items/Underwear/Strapon.gd"

func _init():
	id = "StraponDragon"

func getVisibleName():
	return "Strapon (dragon)"
	
func getDescription():
	var text = "A huge ass strapon"

	return text

func getRiggedParts(_character):
	if(itemState.isRemoved()):
		return null
	return {
		"strapon": "res://Inventory/RiggedModels/Strapons/DragoncockStrapon.tscn",
	}

func getCasualName():
	return "ribbed strapon"

func getPrice():
	return 20

func generateFluids():
	fluids = Fluids.new()
	fluids.setCapacity(750.0)

func getInventoryImage():
	return "res://Images/Items/strapons/dragon.png"
