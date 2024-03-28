extends ItemBase

func _init():
	id = "SocketVisor"

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
		"blindfold": ["res://Inventory/RiggedModels/SocketArmor/VisorModel.tscn"],
	}

#func getInventoryImage():
#	return "res://Images/Items/bdsm/blindfold.png"
