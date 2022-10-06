extends "res://Inventory/Items/BDSM/InmateAnkleCuffs.gd"

func _init():
	id = "ZiptiesAnkle"

func getVisibleName():
	return "Zip ties (ankles)"
	
func getDescription():
	return "Bulky metal restraints. Can be locked to bind legs together"

func getTakeOffScene():
	return "CuffTuggingScene"

func getTags():
	return [ItemTag.BDSMRestraint]

func getUnriggedParts(_character):
	return {
		"ankle.L": ["res://Inventory/UnriggedModels/ZipTies/ZipTiesModel.tscn"],
		"ankle.R": ["res://Inventory/UnriggedModels/ZipTies/ZipTiesModel.tscn"],
	}
