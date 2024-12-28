extends BodypartArms

func _init():
	visibleName = "buff arms"
	id = "buffarms"

func getCompatibleSpecies():
	return [Species.Any]

func getDoll3DScene():
	return "res://Player/Player3D/Parts/Arms/BuffArms/BuffArms.tscn"
	
func getTraits():
	return {
		PartTrait.ArmsBuff: true,
	}
