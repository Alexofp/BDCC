extends BodypartVagina

func _init():
	visibleName = "vagina"
	id = "vaginaEggs"

func getCompatibleSpecies():
	return [Species.Any]

func hasWomb():
	return true

func shouldOvulateWithBigEggs() -> bool:
	return true

func getCharacterCreatorName():
	return "Vagina (lays eggs)"

func getCharacterCreatorDesc():
	return "A vagina that will lay eggs instead of doing live birth"

func getTraits():
	return {
		PartTrait.LaysEggs: true,
	}
