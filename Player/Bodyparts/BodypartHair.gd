extends Bodypart
class_name BodypartHair

func _init():
	pass

func getCategory():
	return Category.Hair

func getCompatibleSpecies():
	return [Species.Any]
