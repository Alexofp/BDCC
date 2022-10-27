extends Reference
class_name SexActionBase

var id = "error"
var isDomAction = true

func getVisibleName():
	return "Bad action"
	
func getVisibleDescription():
	return "Bad description"

func isVisible(_sexEngine:SexEngine, _domInfo:SexDomInfo, _subInfo:SexSubInfo):
	return true
	
func canDo(_sexEngine:SexEngine, _domInfo:SexDomInfo, _subInfo:SexSubInfo):
	return true

func doAction(_sexEngine:SexEngine, _domInfo:SexDomInfo, _subInfo:SexSubInfo):
	return {
		text = "Bad action happened",
	}
