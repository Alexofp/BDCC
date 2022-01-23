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

func getDefaultHair():
	return "baldhair"
	
func getDefaultTail():
	return null

func getDefaultBody():
	return "humanbody"

func getDefaultHead():
	return "humanhead"
	
func getDefaultArms():
	return "humanarms"

func getDefaultEars():
	return "felineears"

func getDefaultHorns():
	return null

func getDefaultForSlot(slot):
	if(slot == BodypartSlot.Legs):
		return getDefaultLegs()
	if(slot == BodypartSlot.Breasts):
		return getDefaultBreasts()
	if(slot == BodypartSlot.Hair):
		return getDefaultHair()
	if(slot == BodypartSlot.Tail):
		return getDefaultTail()
	if(slot == BodypartSlot.Body):
		return getDefaultBody()
	if(slot == BodypartSlot.Head):
		return getDefaultHead()
	if(slot == BodypartSlot.Arms):
		return getDefaultArms()
	if(slot == BodypartSlot.Ears):
		return getDefaultEars()
	if(slot == BodypartSlot.Horns):
		return getDefaultHorns()
	
	return null

func isPlayable():
	return false
