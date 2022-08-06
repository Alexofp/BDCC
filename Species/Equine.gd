extends Species

func _init():
	id = Species.Equine
	
func getVisibleName():
	return "Equine"

func getDefaultLegs(_gender):
	return "hoofs"

func getDefaultTail(_gender):
	return "horsetail"

func isPlayable():
	return true

func getVisibleDescription():
	return "Studs and mares"

func getDefaultHead(_gender):
	return "horsehead"

func getDefaultArms(_gender):
	return "anthroarms"

func getDefaultEars(_gender):
	return "horseears"

func getDefaultPenis(_gender):
	if(_gender in [Gender.Male, Gender.Androgynous]):
		return "equinepenis"
	else:
		return null

func getEggCellOvulationAmount():
	return [
		[1, 6.0],
		[2, 1.0],
		[3, 0.5],
	]
