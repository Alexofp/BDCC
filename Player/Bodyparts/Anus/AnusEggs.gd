extends BodypartAnus

func _init():
	visibleName = "cloaca"
	id = "anusEggs"

func getCompatibleSpecies():
	return [Species.Any]

func hasWomb():
	return true

func shouldOvulateWithBigEggs() -> bool:
	return true

func getCharacterCreatorName():
	return "Cloaca (lays eggs)"

func getCharacterCreatorDesc():
	return "Unique kind of anus that can lay fertilized eggs"

func getTraits():
	return {
		PartTrait.AnusWomb: true,
		PartTrait.LaysEggs: true,
	}
