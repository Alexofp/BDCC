extends "res://Inventory/Items/Clothes/InmateUniformGeneral.gd"

func _init():
	id = "inmateuniformSexDeviant"
	inmateType = InmateType.SexDeviant

func getTags():
	return [
		ItemTag.SexualDeviantInmateUniform,
		]
