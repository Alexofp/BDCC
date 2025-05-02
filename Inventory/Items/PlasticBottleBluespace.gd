extends ItemBase

func _init():
	id = "PlasticBottleBluespace"

func getVisibleName():
	return "Bluespace Plastic bottle"
	
func getDescription():
	return "Stores all your fluids in a bluespace dimension, allowing this bottle to store 100 times as much fluids as the normal bottle. Selling price depends on the contents."

func getPrice():
	return 20

func getTags():
	var canBuyBottle:bool = false
	if(GM.main != null && GM.main.SCI != null && GM.main.SCI.hasUpgrade("advPlasticBottle")):
		canBuyBottle = true
	var result:Array = .getTags()
	if(!canBuyBottle):
		result.erase(ItemTag.SoldByMedicalVendomat)
	return result

func getSellPrice():
	return 0 + Util.maxi(0, fluids.getCost())

func generateFluids():
	fluids = Fluids.new()
	fluids.setCapacity(1000000.0)

func getInventoryImage():
	return "res://Images/Items/medical/water-bottle-blue.png"
