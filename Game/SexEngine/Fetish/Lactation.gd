extends FetishBase

func _init():
	id = Fetish.Lactation
	dynamicChangesPersonalityAffectors = {
		PersonalityStat.Subby: 0.2,
	}

func getVisibleName():
	return "Lactation"

func getGoals(_sexEngine, _domFetishHolder, _dom, _sub):
	var possible = []
	
	if(_sub.canBeMilked() || _sub.hasBigBreasts()):
		possible.append(SexGoal.MilkWithBreastPump)
	if(_sub.hasNonFlatBreasts()):
		if(!_sub.hasEffect(StatusEffect.SoreNipplesAfterMilking)):
			possible.append(SexGoal.GropeBreasts)
	if(_sub.canBeMilked()):
		if(!_sub.hasEffect(StatusEffect.SoreNipplesAfterMilking)):
			possible.append(SexGoal.BreastFeedOnSub)
	if(_dom.canBeMilked() || _dom.hasNonFlatBreasts()):
		if(!_dom.hasEffect(StatusEffect.SoreNipplesAfterMilking)):
			possible.append(SexGoal.BreastFeedSub)
	
	return possible

func isPossibleFor(_character):
	return true
