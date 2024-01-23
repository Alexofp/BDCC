extends SexGoalBase

func _init():
	id = "Hypnotize"

func getVisibleName():
	return "Hypnotize"

func generateData(_sexEngine, _domInfo, _subInfo):
	return []

func isPossible(_sexEngine, _domInfo, _subInfo, _data):
	if(_subInfo.isUnconscious()):
		return false
	if(_subInfo.getChar().isBlindfolded()):
		return false
	if(_domInfo.getChar().isGagged()):
		return false
		
	return true

func isCompleted(_sexEngine, _domInfo, _subInfo, _data):
	if(HypnokinkUtil.isInTrance(_subInfo.getChar())):
		return true
			
	return false

func getSubGoals(_sexEngine, _domInfo, _subInfo, _data):
	return {
	}

func getGoalDefaultWeight():
	return 0.1
