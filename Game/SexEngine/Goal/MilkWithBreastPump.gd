extends SexGoalBase

func _init():
	id = SexGoal.MilkWithBreastPump

func getVisibleName():
	return "Use breast pump on"

func isPossible(_sexEngine, _domInfo, _subInfo, _data):
	return true

func getSubGoals(_sexEngine, _domInfo, _subInfo, _data):
	return {
		SexGoal.SubUndressSub: 1.0,
	}

func getGoalDefaultWeight():
	return 0.5
