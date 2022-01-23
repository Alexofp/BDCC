extends Species

func _init():
	id = Species.Dragon
	
func getVisibleName():
	return "Dragon"

func getDefaultLegs():
	return "dragonleg"

func getDefaultTail():
	return "dragontail"

func isPlayable():
	return true

func getVisibleDescription():
	return "They roar and stuff"

func getDefaultArms():
	return "dragonarms"

func getDefaultHorns():
	return "dragonhorns"

func getDefaultHead():
	return "felinehead"
