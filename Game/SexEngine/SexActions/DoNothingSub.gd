extends SexActionBase

func _init():
	id = "DoNothingSub"
	isDomAction = false

func getVisibleName():
	return "Do nothing"
	
func getVisibleDescription():
	return "Do nothing desc"

func doAction(_sexEngine:SexEngine, _domInfo:SexDomInfo, _subInfo:SexSubInfo):
	return {
		text = "Nothing for sub happened",
	}
