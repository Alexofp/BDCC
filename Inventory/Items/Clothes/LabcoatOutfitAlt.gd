extends "res://Inventory/Items/Clothes/LabcoatOutfit.gd"

func _init():
	id = "LabcoatOutfitAlt"

func getRiggedParts(_character):
	if(itemState.isRemoved()):
		return null
	return {
		"clothing": "res://Inventory/RiggedModels/LabcoatOutfit/LabcoatOutfitAlt.tscn",
	}
