extends BodypartBreasts

func _init():
	name = "human breasts"
	id = "humanbreasts"
	dollType = ""

func _getDollType():
	if(size < BreastsSize.B):
		return "Flat"
	else:
		return "Curvy"

func getCompatibleSpecies():
	return [Species.Any]
