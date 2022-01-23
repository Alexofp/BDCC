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

func getCategory():
	return Category.None

func getName():
	return name
