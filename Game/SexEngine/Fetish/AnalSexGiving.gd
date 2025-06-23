extends FetishBase

func _init():
	id = Fetish.AnalSexGiving

func getVisibleName():
	return "Anal sex (Top)"

func getGoals(_sexEngine, _domFetishHolder, _dom, _sub):
	var possible = []
	
	possible.append(SexGoal.FuckAnal)
	
	return possible

func isPossibleFor(_character):
	if(!_character.hasPenis()):
		return false
	return true

func getExposeMod(_charInfo) -> float:
	if(_charInfo.getChar().isZoneOverstimulated(BodypartSlot.Penis)):
		return -5.0
	return 1.0
