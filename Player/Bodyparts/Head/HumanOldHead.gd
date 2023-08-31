extends BodypartHead

func _init():
	visibleName = "human head (beard)"
	id = "humanoldhead"

func getCompatibleSpecies():
	return [Species.Human, Species.Demon]

func getDoll3DScene():
	return "res://Player/Player3D/Parts/Head/HumanOldHead/HumanOldHead.tscn"

func npcGenerationWeight(_dynamicCharacter):
	if(_dynamicCharacter.getGender() in [Gender.Male]):
		return 0.2
	return 0.0

func getHeadLength():
	return 0.0
