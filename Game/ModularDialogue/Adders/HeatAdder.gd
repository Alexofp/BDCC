extends DialogueFillerAdder

func _init():
	prefix = true
	chance = 100.0

func getFormIDs() -> Array:
	return [
		"TalkSexOfferSelf",
		"TalkSexOfferAccept",
		"PunishSubSex",
		]

func canBeUsed(_id:String, _args:Dictionary, _form) -> bool:
	var inmate = getChar(_args, _form.mainRole)
	if(inmate == null):
		return false
	return inmate.isInHeat()

func getText(_id:String, _args:Dictionary):
	return [
		"Damn heat..",
		"I hate this heat..",
		"I can't resist this heat anymore..",
		"Stupid heat..",
		"I'm so fucking horny..",
		"It's this time again..",
		"I'm wet all the time..",
	]
