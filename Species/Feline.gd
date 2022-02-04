extends Species

func _init():
	id = Species.Feline
	
func getVisibleName():
	return "Feline"

func getDefaultLegs(_gender):
	return "felineleg"

func getDefaultTail(_gender):
	return "felinetail"

func isPlayable():
	return true

func getVisibleDescription():
	return "Cute fluffballs"

func getDefaultHead(_gender):
	return "felinehead"

func getDefaultArms(_gender):
	return "felinearms"

func getDefaultEars(_gender):
	return "felineears"

func getDefaultPenis(_gender):
	if(_gender in [BaseCharacter.Gender.Male, BaseCharacter.Gender.Androgynous]):
		return "caninepenis"
	else:
		return null
