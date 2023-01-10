extends FetishBase

func _init():
	id = Fetish.BeingBred

func getVisibleName():
	return "Being bred"

func getGoals(_sexEngine, _domFetishHolder, _dom, _sub):
	var possible = []
	
	return possible

func isPossibleFor(_character):
	if(!_character.hasAnyWomb()):
		return false
	return true
