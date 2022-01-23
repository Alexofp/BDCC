extends Species

func _init():
	id = Species.Wolf
	
func getVisibleName():
	return "Wolf"

func isPlayable():
	return false

func getVisibleDescription():
	return "Wuf wuf"
