extends BodypartHair

func _init():
	visibleName = "jacki hair"
	id = "jackihair"

	maleWeight = 0.0
	femaleWeight = 0.0

func getDoll3DScene():
	return "res://Player/Player3D/Parts/Hair/JackiHair/JackiHair.tscn"

#func getCompatibleSpecies():
#	return [] # Unique npc hair

func getTraits():
	return {
		PartTrait.HairPonytail: true,
	}
