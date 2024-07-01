extends BodypartEars

func _init():
	visibleName = "canine ears 2 (tribal)"
	id = "canineears2tribal"

func getCompatibleSpecies():
	return [Species.Canine]

func getDoll3DScene():
	return "res://Player/Player3D/Parts/Ears/CanineEars2Tribal/CanineEars2Tribal.tscn"

func npcGenerationWeight(_dynamicCharacter):
	return 0.1
