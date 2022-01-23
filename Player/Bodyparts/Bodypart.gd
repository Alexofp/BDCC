extends Resource
class_name Bodypart

enum Category {None, Breasts, Legs, Hair}

var name
var id
var dollType

func _init():
	pass

func _getDollType():
	return dollType

func saveData():
	return {}

func loadData(_data):
	pass

func getSlot():
	return BodypartSlot.Body

func getName():
	return name

func getCompatibleSpecies():
	return []

# Used to make sure we don't get hybrids with human ears unless player really wants that
func getHybridPriority():
	return 0
