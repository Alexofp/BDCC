extends Species

func _init():
	id = Species.Feline
	
func getVisibleName():
	return "Feline"

func getDefaultLegs(_gender):
	return "digilegs"

func getDefaultTail(_gender):
	return "felinetail"

func isPlayable():
	return true

func getVisibleDescription():
	return "Cute fluffballs"

func getDefaultHead(_gender):
	return "felinehead"

func getDefaultArms(_gender):
	return "anthroarms"

func getDefaultEars(_gender):
	return "felineears"

func getDefaultPenis(_gender):
	if(_gender in [Gender.Male, Gender.Androgynous]):
		return "felinepenis"
	else:
		return null

func getEggCellOvulationAmount():
	return [
		[1, 2.0],
		[2, 8.0],
		[3, 6.0],
		[4, 4.0],
		[5, 2.0],
		[6, 1.0],
		[7, 0.5],
	]
