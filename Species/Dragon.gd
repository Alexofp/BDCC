extends Species

func _init():
	id = Species.Dragon
	
func getVisibleName():
	return "Dragon"

func getDefaultLegs(_gender):
	return "dragonleg"

func getDefaultTail(_gender):
	return "dragontail"

func isPlayable():
	return true

func getVisibleDescription():
	return "They roar and stuff"

func getDefaultArms(_gender):
	return "dragonarms"

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
