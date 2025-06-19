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
		"strapon": "res://Inventory/RiggedModels/Strapons/HorsecockStrapon.tscn",
	}

func getStraponLength():
	return 30.0

func getCasualName():
	return "giant horsecock strapon"

func getLewdStraponName() -> String:
	return RNG.pick(["giant rubber horsecock", "horsecock strapon", "giant strapon", "giant flared-tip strapon", "huge rubber cock"])

func getPrice():
	return 50

func generateFluids():
	fluids = Fluids.new()
	fluids.setCapacity(3000.0)

func getInventoryImage():
	return "res://Images/Items/strapons/horse.png"

func getStraponTraits() -> Dictionary:
	return {
		PartTrait.PenisFlare: true,
	}
