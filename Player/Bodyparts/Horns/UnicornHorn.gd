extends BodypartHorns

func _init():
	visibleName = "unicorn horn"
	id = "unicornhorn"

func getCompatibleSpecies():
	return [Species.Equine]

func getDoll3DScene():
	return "res://Player/Player3D/Parts/Horns/UnicornHorn/UnicornHorn.tscn"

func getTraits():
	# Need two horns to be able to use them as handlebars
	return {
		PartTrait.HornsSingle: true,
	}

func npcGenerationWeight(_dynamicCharacter):
	return 0.05
