extends Species

func _init():
	id = Species.Wolf
	
func getVisibleName():
	return "Wolf"

func isPlayable():
	return false

func getVisibleDescription():
	return "Wuf wuf"

func getEggCellOvulationAmount():
	return [
		[2, 3.0],
		[3, 6.0],
		[4, 8.0],
		[5, 6.0],
		[6, 4.0],
		[7, 1.0],
	]
