extends ItemBase

func _init():
	id = "CanineDildo"

func getVisibleName():
	return "Canine dildo"
	
func getDescription():
	return "A giant rubber dildo. Big enough to reach even the most deep spots. Can be filled with fluids to receive extra fun while riding it."

func getPossibleActions():
	return [
		{
			"name": "Transfer fluids",
			"scene": "FluidTransferScene",
			"description": "Transfer the fluids between fluid containers",
		},
		{
			"name": "Ride it!",
			"scene": "HorsecockDildoScene",
			"description": "Use it for your pleasure",
			"onlyWhenCalm": true,
		},
	]

func getPrice():
	return 100

func canSell():
	return true

func getTags():
	return [
		#ItemTag.SoldByTheAnnouncer,
		]

func getItemCategory():
	return ItemCategory.Generic

func generateFluids():
	fluids = Fluids.new()
	fluids.setCapacity(5000.0)

func getInventoryImage():
	return "res://Images/Items/toys/horsecockdildo.png"
