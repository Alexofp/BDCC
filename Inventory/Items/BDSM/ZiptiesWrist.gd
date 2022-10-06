extends "res://Inventory/Items/BDSM/InmateWristCuffs.gd"

func _init():
	id = "ZiptiesWrist"

func getVisibleName():
	return "Zip ties (wrists)"
	
func getDescription():
	return "Bulky metal restraints. Can be locked to bind arms together"

func getTakeOffScene():
	return "CuffTuggingScene"

func getTags():
	return [ItemTag.BDSMRestraint]

func getUnriggedParts(_character):
	return {
		"wrist.L": ["res://Inventory/UnriggedModels/ZipTies/ZipTiesModel.tscn"],
		"wrist.R": ["res://Inventory/UnriggedModels/ZipTies/ZipTiesModel.tscn"],
	}
