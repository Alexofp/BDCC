extends ItemBase

func _init():
	id = "PlasticBottle"

func getVisibleName():
	return "Plastic bottle"
	
func getDescription():
	return "Just your average plastic bottle. The special lid compresses liquids inside, allowing it to store more than it could have otherwise. Selling price depends on the contents."

func getPrice():
	return 5

func getSellPrice():
	return 0 + Util.maxi(0, fluids.getCost())

func canSell():
	return true

func canCombine():
	return false

func getTags():
	return [
		ItemTag.SoldByMedicalVendomat,
		ItemTag.CanPeeInto,
		ItemTag.CanForceCumInto,
		ItemTag.PlasticBottle,
		]

func generateFluids():
	fluids = Fluids.new()
	fluids.setCapacity(10000.0)

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
		{
			"name": "Collect fluids from you",
			"scene": "CatchBodyFluidsScene",
			"description": "Catch some of the fluids that you are covered with",
		},
	]

func getInventoryImage():
	return "res://Images/Items/medical/water-bottle.png"
