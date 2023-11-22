extends "res://Inventory/Items/Underwear/Strapon.gd"

func _init():
	id = "StraponFeeldoe"

func getVisibleName():
	return "Strapon (feeldoe)"
	
func getDescription():
	var text = "A double-sided strapon with a knot. Also brings pleasure to the wearer during sex"

	return text

func getRiggedParts(_character):
	if(itemState.isRemoved()):
		return null
	return {
		"panties": "res://Inventory/RiggedModels/Strapons/FeeldoeStrapon.tscn",
	}

func getStraponPleasureForDom():
	return 0.5

func getCasualName():
	return "feeldoe strapon"

func getPrice():
	return 30

func generateFluids():
	fluids = Fluids.new()
	fluids.setCapacity(850.0)

func getInventoryImage():
	return "res://Images/Items/strapons/feeldoe.png"
