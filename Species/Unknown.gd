extends Species

func _init():
	id = Species.Unknown
	
func getVisibleName():
	return "???"

func isPlayable():
	return false

func getVisibleDescription():
	return "You shouldn't see this"
