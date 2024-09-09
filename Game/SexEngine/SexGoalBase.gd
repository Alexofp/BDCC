extends Reference
class_name SexGoalBase

var id = "error"

func getVisibleName():
	return "Error"

func isPossible(_sexEngine, _domInfo, _subInfo, _data):
	return true

func isCompleted(_sexEngine, _domInfo, _subInfo, _data):
	return false

func generateData(_sexEngine, _domInfo, _subInfo):
	return []

func progressGoal(_sexEngine, _domInfo, _subInfo, _data, _args = []):
	pass

func getSubGoals(_sexEngine, _domInfo, _subInfo, _data):
	return {}

func canLeadToSubsPregnancy(_sexEngine, _domInfo, _subInfo, _data):
	return false

func domWantsToCum():
	return false

func getGoalDefaultWeight():
	return 1.0

func doFastSex(_sexEngine, _domInfo, _subInfo, _data):
	pass

func sendSexEvent(_sexEngine, type, _sourceInfo, _targetInfo, data = {}):
	var newSexEvent:SexEvent = SexEvent.new()
	newSexEvent.type = type
	newSexEvent.sourceCharID = _sourceInfo.charID
	newSexEvent.targetCharID = _targetInfo.charID
	newSexEvent.data = data
	newSexEvent.isSexEngine = true
	newSexEvent.sexEngine = _sexEngine
	
	_sourceInfo.getChar().sendSexEvent(newSexEvent)
	if(_sourceInfo.getChar() != _targetInfo.getChar()):
		_targetInfo.getChar().sendSexEvent(newSexEvent)
