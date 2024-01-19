extends "res://Characters/Captain.gd"

func _init():
	id = "captainInmate"
	npcCharacterType = CharacterType.Generic
	disableSerialization = true

func _getName():
	return "Mr. Wright"

func getSmallDescription() -> String:
	return "Canine with black fur."

func getDefaultEquipment():
	return ["inmatecollar", "inmateuniformHighsec"]
