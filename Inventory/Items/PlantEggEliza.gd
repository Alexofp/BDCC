extends "res://Inventory/Items/PlantEgg.gd"

func _init():
	id = "PlantEggEliza"
	whoGaveBirth = "eliza"

func getVisibleName():
	return "Plant Egg"
	
func getSellPrice():
	return 50

func getInventoryImage():
	return "res://Images/Items/medical/egg-shell.png"

func getDescription():
	var theDesc:String = .getDescription()
	
	if(whoGaveBirth == "eliza"):
		return theDesc + "\n\n\"[i]Treasure it. Or eat it the moment I leave. But if you get poisoned, don’t come to me.[/i] \""
	return theDesc
