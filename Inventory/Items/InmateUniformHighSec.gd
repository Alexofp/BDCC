extends "res://Inventory/Items/InmateUniformGeneral.gd"

func _init():
	id = "inmateuniformHighsec"
	inmateType = InmateType.HighSec

func getTags():
	return [
		ItemTag.HighSecurityInmateUniform,
		]
