extends Reference
class_name Species

const Any = "any"
const Human = "human"
const Feline = "feline"
const Dragon = "dragon"
const Wolf = "wolf"
const Canine = "canine"

var id = "error"

func _init():
	pass
	
func getVisibleName():
	return "Error"
	
func getVisibleDescription():
	return "Not implemented, Let the developer know"

func getDefaultLegs(_gender):
	return "felineleg"

func getDefaultBreasts(_gender):
	if(_gender in [Gender.Male]):
		return "malebreasts"
	
	return "humanbreasts"

func getDefaultHair(_gender):
	return "baldhair"
	
func getDefaultTail(_gender):
	return null

func getDefaultBody(_gender):
	return "humanbody"

func getDefaultHead(_gender):
	return "humanhead"
	
func getDefaultArms(_gender):
	return "humanarms"

func getDefaultEars(_gender):
	return "felineears"

func getDefaultHorns(_gender):
	return null

func getDefaultPenis(_gender):
	if(_gender in [Gender.Male, Gender.Androgynous]):
		return "humanpenis"
	else:
		return null

func getDefaultVagina(_gender):
	if(_gender in [Gender.Female, Gender.Androgynous]):
		return "vagina"
	else:
		return null

func getDefaultAnus(_gender):
	return "anus"

func getDefaultForSlot(slot, _gender):
	if(slot == BodypartSlot.Legs):
		return getDefaultLegs(_gender)
	if(slot == BodypartSlot.Breasts):
		return getDefaultBreasts(_gender)
	if(slot == BodypartSlot.Hair):
		return getDefaultHair(_gender)
	if(slot == BodypartSlot.Tail):
		return getDefaultTail(_gender)
	if(slot == BodypartSlot.Body):
		return getDefaultBody(_gender)
	if(slot == BodypartSlot.Head):
		return getDefaultHead(_gender)
	if(slot == BodypartSlot.Arms):
		return getDefaultArms(_gender)
	if(slot == BodypartSlot.Ears):
		return getDefaultEars(_gender)
	if(slot == BodypartSlot.Horns):
		return getDefaultHorns(_gender)
	if(slot == BodypartSlot.Penis):
		return getDefaultPenis(_gender)
	if(slot == BodypartSlot.Vagina):
		return getDefaultVagina(_gender)
	if(slot == BodypartSlot.Anus):
		return getDefaultAnus(_gender)
	
	return null

func isPlayable():
	return false

# [[amount, weight], [amount, weight]]
func getEggCellOvulationAmount():
	return [
		[1, 10.0],
		[2, 1.0],
	]
