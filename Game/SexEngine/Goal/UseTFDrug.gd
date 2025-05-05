extends SexGoalBase

func _init():
	id = SexGoal.UseTFDrug

func getVisibleName():
	return "Use transformative drug"

func isPossible(_sexEngine, _domInfo, _subInfo, _data):
	if(_subInfo.getChar().isOralBlocked()):
		return false
	 # If we're hypnotized even a little bit, we should avoid TF pills if the pc hates them
	if(_subInfo.getChar().isPlayer() && !OPTIONS.isContentEnabled(ContentType.ForcedPermanentTFs)):
		if(GM.pc.hasEffect(StatusEffect.UnderHypnosis) && GM.pc.getFetishHolder().getFetishValue(Fetish.TFReceiving) <= 0.0):
			return false
	
	return true
	
func getSubGoals(_sexEngine, _domInfo, _subInfo, _data):
	return {
	}
	
func getGoalDefaultWeight():
	return 0.2
