extends FetishBase

func _init():
	id = Fetish.Lactation

func getVisibleName():
	return "Lactation"

func getGoals(_sexEngine, _domFetishHolder, _dom, _sub):
	var possible = []
	
	if(_sub.canBeMilked() || _sub.hasBigBreasts()):
		possible.append(SexGoal.MilkWithBreastPump)
	if(_sub.hasNonFlatBreasts()):
		possible.append(SexGoal.GropeBreasts)
	if(_sub.canBeMilked()):
		possible.append(SexGoal.BreastFeedOnSub)
	if(_dom.canBeMilked()):
		possible.append(SexGoal.BreastFeedSub)
	
	return possible

func isPossibleFor(_character):
	return true
