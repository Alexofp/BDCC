extends RestraintData
class_name RestraintUnremovable

func canStruggle():
	return false

func getVisibleLevel(_isBlind = false):
	return "999, impossible to remove"
