extends BodypartHair

func _init():
	visibleName = "jacki hair"
	id = "jackihair"

func getDoll3DScene():
	return "res://Player/Player3D/Parts/Hair/JackiHair/JackiHair.tscn"

func getCompatibleSpecies():
	return [] # Unique npc hair
