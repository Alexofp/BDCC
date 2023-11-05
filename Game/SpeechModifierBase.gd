extends Reference
class_name SpeechModifierBase

var id = "error"
var priority = 0
	
func appliesTo(_speaker: BaseCharacter) -> bool:
	return false
	
func modify(_text: String, _speaker: BaseCharacter) -> String:
	return "ERROR: Base speech modifier implementation used by speech modifier ID: " + id + "! " + _text;
