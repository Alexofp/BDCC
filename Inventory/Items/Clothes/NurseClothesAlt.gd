extends "res://Inventory/Items/Clothes/NurseClothes.gd"

func _init():
	id = "NurseClothesAlt"

func getRiggedParts(_character):
	if(itemState.isRemoved()):
		return null
	return {
		"clothing": "res://Inventory/RiggedModels/NurseClothes/NurseClothesAlt.tscn",
	}

