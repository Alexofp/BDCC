extends SpeechModifierBase

func _init():
	id = "GaggedSpeech"
	priority = 1100
	
func appliesTo(_speaker: BaseCharacter) -> bool:
	return _speaker.getSpecies().has("feline")
	
func modify(_text: String, _speaker: BaseCharacter) -> String:
	return _text + " Nya~"
