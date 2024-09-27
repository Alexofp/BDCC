extends BodypartHair

func _init():
	visibleName = "mane"
	id = "manehair"

	maleWeight = 1.0
	femaleWeight = 0.5

func getDoll3DScene():
	return "res://Player/Player3D/Parts/Hair/ManeHair/ManeHair.tscn"

func getTraits():
	return {
		PartTrait.HairShort: true,
	}

func npcGenerationWeight(_dynamicCharacter):
	for speciesID in _dynamicCharacter.getSpecies():
		var theSpecies = GlobalRegistry.getSpecies(speciesID)
		if(theSpecies == null):
			return 0.0
		if(!theSpecies.supportsMane()):
			return 0.0
			
	return .npcGenerationWeight(_dynamicCharacter)
