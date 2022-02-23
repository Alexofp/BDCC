extends Bodypart
class_name BodypartTail

func _init():
	limbSlot = LimbTypes.Tail

func getSlot():
	return BodypartSlot.Tail

func getLewdSizeAdjective():
	return RNG.pick(["long"])

func getLewdAdjective():
	return RNG.pick(["fluffy"])
	
func getLewdName():
	return RNG.pick(["tail"])
