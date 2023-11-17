extends FetishBase

func _init():
	id = HK_Fetish.HypnosisHypnotist

func getVisibleName():
	return "Hypnosis (hypnotist)"

func getGoals(_sexEngine, _domFetishHolder, _dom, _sub):
	var possible = []
	
	possible.append("HK_Hypnotize")
	
	return possible

func isPossibleFor(_character):
	if(_character.isGagged()):
		return false
	return true
