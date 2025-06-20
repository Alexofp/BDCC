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
		"strapon": "res://Inventory/RiggedModels/Strapons/FelinecockStrapon.tscn",
	}

func getCasualName():
	return "barbed strapon"

func getLewdStraponName() -> String:
	return RNG.pick(["barbed strapon", "feline strapon", "feline rubber cock"])

func getPrice():
	return 15

func generateFluids():
	fluids = Fluids.new()
	fluids.setCapacity(500.0)

func getInventoryImage():
	return "res://Images/Items/strapons/feline.png"

func getStraponTraits() -> Dictionary:
	return {
		PartTrait.PenisBarbs: true,
	}
