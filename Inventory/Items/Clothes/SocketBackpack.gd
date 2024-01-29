extends ItemBase

func _init():
	id = "SocketBackpack"

func getVisibleName():
	return "Socket's backpack"
	
func getDescription():
	return "A handy backpack"

func getClothingSlot():
	return InventorySlot.Torso

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
		"back": ["res://Inventory/RiggedModels/SocketArmor/BackpackModel.tscn"],
	}

#func getInventoryImage():
#	return "res://Images/Items/bdsm/blindfold.png"
