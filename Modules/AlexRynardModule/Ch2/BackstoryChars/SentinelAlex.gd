extends Character

func _init():
	id = "sen_alex"

	npcCharacterType = CharacterType.Generic
	disableSerialization = true
	
func _getName():
	return "Sentinel"

func getGender():
	return Gender.Other
	
func getSmallDescription() -> String:
	return "Alex's custom-made security system."

func getSpecies():
	return [Species.Unknown]
	
func getThickness() -> int:
	return 50

func getFemininity() -> int:
	return 50

func createBodyparts():
	pass

func getDefaultEquipment():
	return ["AlexExoskeleton"]
