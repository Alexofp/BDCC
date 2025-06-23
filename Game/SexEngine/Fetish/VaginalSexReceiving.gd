extends FetishBase

func _init():
	id = Fetish.VaginalSexReceiving

func getVisibleName():
	return "Vaginal sex (Bottom)"

func getGoals(_sexEngine, _domFetishHolder, _dom, _sub):
	var possible = []
	
	possible.append(SexGoal.ReceiveVaginal)
	
	return possible

func isPossibleFor(_character):
	if(!_character.hasVagina()):
		return false
	return true

func getExposeMod(_charInfo) -> float:
	if(_charInfo.getChar().isZoneOverstimulated(BodypartSlot.Vagina)):
		return -5.0
	return 1.0
