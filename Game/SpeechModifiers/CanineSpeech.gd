extends SpeechModifierBase

func _init():
	id = "GaggedSpeech"
	priority = 1100
	
func appliesTo(_speaker: BaseCharacter) -> bool:
	return _speaker.getSpecies().has("canine")
	
func modify(_text: String, _speaker: BaseCharacter) -> String:
	return _text + " Woof~"
