extends "res://Inventory/Items/Clothes/OfficialClothes.gd"

func _init():
	id = "OfficialClothesGreen"

func getRiggedParts(_character):
	if(itemState.isRemoved()):
		return null
	return {
		"clothing": "res://Inventory/RiggedModels/OfficialClothes/OfficialClothesGreen.tscn",
	}
