extends BodypartEars

func _init():
	visibleName = "wolf ears"
	id = "wolfears"

func getCompatibleSpecies():
	return [Species.Canine]

func getDoll3DScene():
	return "res://Player/Player3D/Parts/Ears/WolfEars/WolfEars.tscn"
