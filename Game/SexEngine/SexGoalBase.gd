extends Reference
class_name SexGoalBase

var id = "error"

func getVisibleName():
	return "Error"

func isPossible(_sexEngine, _domInfo, _subInfo, _data):
	return true

func isCompleted(_sexEngine, _domInfo, _subInfo, _data):
	return false

func generateData(_sexEngine, _domInfo, _subInfo):
	return []

func progressGoal(_sexEngine, _domInfo, _subInfo, _data, _args = []):
	pass

func getSubGoals(_sexEngine, _domInfo, _subInfo, _data):
	return {}

func canLeadToSubsPregnancy(_sexEngine, _domInfo, _subInfo, _data):
	return false

func getGoalDefaultWeight():
	return 1.0
