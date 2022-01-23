extends Object
class_name Species

const Any = "any"
const Human = "human"
const Feline = "feline"
const Dragon = "dragon"
const Wolf = "wolf"

var id = "error"

func _init():
	pass
	
func getVisibleName():
	return "Error"
	
func getVisibleDescription():
	return "Not implemented, Let the developer know"

func getDefaultLegs():
	return "felineleg"

func getDefaultBreasts():
	return "humanbreasts"

func getDefaultForSlot(slot):
	if(slot == BodypartSlot.Legs):
		return getDefaultLegs()
	if(slot == BodypartSlot.Breasts):
		return getDefaultBreasts()
	if(slot == BodypartSlot.Hair):
		return "baldhair"
	
	return null

func isPlayable():
	return false
