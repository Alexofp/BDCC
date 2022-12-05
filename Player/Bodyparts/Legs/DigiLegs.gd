extends BodypartLeg

func _init():
	visibleName = "digi legs"
	id = "digilegs"

func getCompatibleSpecies():
	return [Species.Any]

func getDoll3DScene():
	return "res://Player/Player3D/Parts/Legs/DigiLegs/DigiLegs.tscn"

func getTraits():
	return {
		PartTrait.LegsDigi: true,
	}
