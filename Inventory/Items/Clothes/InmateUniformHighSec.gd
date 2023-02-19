extends "res://Inventory/Items/Clothes/InmateUniformGeneral.gd"

func _init():
	id = "inmateuniformHighsec"
	inmateType = InmateType.HighSec

func getTags():
	return [
		ItemTag.HighSecurityInmateUniform,
		]
