extends BodypartTail

func _init():
	name = "dragon tail"
	id = "dragontail"
	dollType = "Dragon"

func getCompatibleSpecies():
	return [Species.Dragon]
