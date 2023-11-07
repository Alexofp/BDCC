extends SpeechModifierBase

func _init():
	id = "GaggedSpeech"
	priority = 1000
	
func appliesTo(_speaker: BaseCharacter) -> bool:
	return _speaker.isGagged()
	
func modify(_text: String, _speaker: BaseCharacter) -> String:
	if(GM.pc.hasPerk(Perk.BDSMGagTalk)):
		return Util.muffledSpeech(_text)+"\" ("+_text+")"
	else:
		return Util.muffledSpeech(_text)
