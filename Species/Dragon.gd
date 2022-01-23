extends Species

func _init():
	id = Species.Dragon
	
func getVisibleName():
	return "Dragon"

func isPlayable():
	return true

func getVisibleDescription():
	return "They roar and stuff"
