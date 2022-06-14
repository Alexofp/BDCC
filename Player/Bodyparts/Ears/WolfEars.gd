extends BodypartEars

func _init():
	visibleName = "wolf ears"
	id = "wolfears"
	dollType = "Wolf"

func getCompatibleSpecies():
	return [Species.Canine, Species.Wolf]

func getDoll3DScene():
	return "res://Player/Player3D/Parts/Ears/WolfEars/WolfEars.tscn"
