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

func canBegFor() -> bool:
	return false

func getBegName() -> String:
	return getVisibleName()

func getBegDesc() -> String:
	return "Ask the dom to do this to you!"

func getBegMessage(_sexEngine, _domInfo, _subInfo) -> String:
	return "{sub.You} {sub.youVerb('beg')} {dom.you} to '"+getVisibleName()+"'."

func getBegDialogue(_sexEngine, _domInfo, _subInfo) -> String:
	return "Please?"

func getBegAgreeDialogue() -> String:
	return RNG.pick([
		"Sure.",
		"Sounds good.",
		"Alright, let's do it.",
		"Hm. Okay, let's do it.",
		"Sure, let's see.",
		"Why not, let's do it.",
		"Okay, I hear you.",
	])

func getBegDenyDialogue() -> String:
	return RNG.pick([
		"Nope. I don't want to.",
		"I don't want to do that.",
		"No, I'm not doing that.",
		"No. Just no.",
	])

func getBegDomFetishes() -> Dictionary:
	return {}
