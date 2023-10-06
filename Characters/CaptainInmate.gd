extends "res://Characters/Captain.gd"

func _init():
	id = "captainInmate"
	npcCharacterType = CharacterType.Generic
	disableSerialization = true

func _getName():
	return "Mr. Wright"

func getSmallDescription() -> String:
	return "Canine with black fur."

func createEquipment():
	getInventory().equipItem(GlobalRegistry.createItemNoID("inmatecollar"))
	getInventory().equipItem(GlobalRegistry.createItemNoID("inmateuniformHighsec"))
