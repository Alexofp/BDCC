extends Reference
class_name SexGoalBase

var id = "error"

func getVisibleName():
	return "Error"

func isPossible(_sexEngine, _dom, _sub):
	return true

func isCompleted(_sexEngine, _dom, _sub):
	return false
