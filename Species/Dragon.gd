extends Species

func _init():
	id = Species.Dragon
	
func getVisibleName():
	return "Dragon"

func getDefaultLegs(_gender):
	return "digilegs"

func getDefaultTail(_gender):
	return "dragontail"

func isPlayable():
	return true

func getVisibleDescription():
	return "They roar and stuff"

func getDefaultArms(_gender):
	return "anthroarms"

func getDefaultHorns(_gender):
	return "dragonhorns"

func getDefaultHead(_gender):
	return "dragonhead"

func getDefaultEars(_gender):
	return "dragonears"

func getDefaultPenis(_gender):
	if(_gender in [Gender.Male, Gender.Androgynous]):
		return "dragonpenis"
	else:
		return null

func getEggCellOvulationAmount():
	return [
		[1, 4.0],
		[2, 5.0],
		[3, 3.0],
		[4, 1.0],
		[5, 0.4],
	]

func getSkinType():
	return SkinType.Scales
