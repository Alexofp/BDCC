extends Reference
class_name Species

const Any = "any"
const Human = "human"
const Feline = "feline"
const Dragon = "dragon"
const Wolf = "wolf"
const Canine = "canine"
const Equine = "equine"
const Demon = "demon"
const Unknown = "unknown"

var id = "error"

func _init():
	pass
	
func getVisibleName():
	return "Error"
	
func getVisibleDescription():
	return "Not implemented, Let the developer know"

func getDefaultLegs(_gender):
	return "plantilegs"

func getDefaultBreasts(_gender):
	if(_gender in [Gender.Male]):
		return "malebreasts"
	
	return "humanbreasts"

func getDefaultHair(_gender):
	return "baldhair"
	
func getDefaultTail(_gender):
	return null

func getDefaultBody(_gender):
	return "anthrobody"

func getDefaultHead(_gender):
	return "humanhead"
	
func getDefaultArms(_gender):
	return "anthroarms"

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

# Allows to pick these bodyparts even if they're from another species. Useful for mods
func getAllowedBodyparts():
	return []

func isPlayable():
	return false

# [[amount, weight], [amount, weight]]
func getEggCellOvulationAmount():
	return [
		[1, 10.0],
		[2, 1.0],
	]

# How often is this species will show up in procedural encounters. 0 = never, 0-1 = less often, 1 = default chance, >1 = more often
func npcGenerationWeight(_npcType):
	if(!isPlayable() || id == "error"):
		return 0.0
	return 1.0
