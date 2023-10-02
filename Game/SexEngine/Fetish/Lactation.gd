extends FetishBase

func _init():
	id = Fetish.Lactation

func getVisibleName():
	return "Lactation"

func getGoals(_sexEngine, _domFetishHolder, _dom, _sub):
	var possible = []
	
	if(_sub.canBeMilked()):
		possible.append(SexGoal.MilkWithBreastPump)
	
	return possible

func isPossibleFor(_character):
	return true
