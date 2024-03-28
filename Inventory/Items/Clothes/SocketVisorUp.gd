extends ItemBase

func _init():
	id = "SocketVisorUp"

func getVisibleName():
	return "Socket's visor"
	
func getDescription():
	return "A cool little vr visor"

func getClothingSlot():
	return InventorySlot.Eyes

func getBuffs():
	return [
		]

func getPrice():
	return 0

func canSell():
	return true

func getTags():
	return []

func getUnriggedParts(_character):
	return {
		"blindfold": ["res://Inventory/RiggedModels/SocketArmor/VisorUpModel.tscn"],
	}

#func getInventoryImage():
#	return "res://Images/Items/bdsm/blindfold.png"
