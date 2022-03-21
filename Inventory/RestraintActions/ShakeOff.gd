extends RestraintActionBase

func _init():
	id = RestraintAction.ShakeOff

func getVisibleName(item):
	return "Shake off "+item.getVisibleName()


func doAction(item):
	return {
		"text": "You shake off the "+item.getVisibleName(),
		"noise": 0.1,
	}
