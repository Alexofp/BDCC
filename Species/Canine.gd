extends Species

func _init():
	id = Species.Canine
	
func getVisibleName():
	return "Canine"

func getDefaultLegs(_gender):
	return "digilegs"

func getDefaultTail(_gender):
	return "caninetail"

func isPlayable():
	return true

func getVisibleDescription():
	return "The good boys and girls"

func getDefaultHead(_gender):
	return "caninehead"

func getDefaultArms(_gender):
	return "anthroarms"

func getDefaultEars(_gender):
	return "canineears"

func getDefaultPenis(_gender):
	if(_gender in [Gender.Male, Gender.Androgynous]):
		return "caninepenis"
	else:
		return null

func getEggCellOvulationAmount():
	return [
		[2, 3.0],
		[3, 6.0],
		[4, 8.0],
		[5, 6.0],
		[6, 4.0],
		[7, 1.0],
	]

func supportsMane():
	return true
