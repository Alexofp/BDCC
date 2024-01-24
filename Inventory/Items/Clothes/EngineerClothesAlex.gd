extends "res://Inventory/Items/Clothes/EngineerClothes.gd"

func _init():
	id = "EngineerClothesAlex"

func getDescription():
	return "Just a simple shirt and shorts colored in orange. This one has some armored shoulder pads, perfect for someone sly and agile."

func getRiggedParts(_character):
	if(itemState.isRemoved()):
		return null
	return {
		"clothing": "res://Inventory/RiggedModels/EngineerUniform/EnginnerClothesAlex.tscn",
	}
