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

func getCasualName():
	return "giant horsecock strapon"

func getPrice():
	return 50

func generateFluids():
	fluids = Fluids.new()
	fluids.setCapacity(3000.0)

func getInventoryImage():
	return "res://Images/Items/strapons/horse.png"
