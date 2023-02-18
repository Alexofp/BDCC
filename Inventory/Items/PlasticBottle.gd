extends ItemBase

func _init():
	id = "PlasticBottle"

func getVisibleName():
	return "Plastic bottle"
	
func getDescription():
	return "Just your average plastic bottle. The special lid compresses liquids inside, allowing it to store more than it could have otherwise."

func getPrice():
	return 1

func canSell():
	return true

func canCombine():
	return false

func getTags():
	return [
		ItemTag.SoldByMedicalVendomat,
		]

func generateFluids():
	fluids = Fluids.new()
	fluids.setCapacity(10000.0)
	fluids.addFluid("Cum", 1000.0)

func getPossibleActions():
	return [
		{
			"name": "Transfer fluids",
			"scene": "FluidTransferScene",
			"description": "Transfer the fluids between fluid containers",
		},
		{
			"name": "Drink from",
			"scene": "DrinkFromScene",
			"description": "Swallow the contents of this item",
		},
	]
