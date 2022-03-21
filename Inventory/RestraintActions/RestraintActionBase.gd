extends Reference
class_name RestraintActionBase

var id = -1

func getVisibleName(item):
	return "Mew"+item.getVisibleName()

func getVisibleDescription(item):
	return "mew the "+item.getVisibleName()

func doAction(item):
	return {
		"text": "You did something with "+item.getVisibleName(),
		"noise": 0.1,
	}
