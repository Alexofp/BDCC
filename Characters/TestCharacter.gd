extends Character

func _init():
	id = "testchar"
	
func _getName():
	return "Bob"

func _getAttacks():
	return ["simplepunchattack", "scratchattack", "biteattack", "simplekickattack", "shoveattack"]
