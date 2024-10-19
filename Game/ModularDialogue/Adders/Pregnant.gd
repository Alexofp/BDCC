extends DialogueFillerAdder

func _init():
	prefix = false
	chance = 10.0
	priority = 0

func getFormIDs() -> Array:
	return [
		"AttackStart",
		"GuardFrisk",
		"ReactGETTING_FUCKED",
		"ReactCOVERED_IN_CUM",
		"HelpRestraintsAgree",
		"SlutwallAddTip",
		"ProstitutionOffer",
		"PunishAboutToStocks",
		"TalkSexOfferAccept",
		"AskKeyGive",
		]

func canBeUsed(_id:String, _args:Dictionary, _form) -> bool:
	if(getChar(_args, _form.dirToRole).isVisiblyPregnant()):
		return true
	return false

func getText(_id:String, _args:Dictionary):
	if(_id == "AttackStart"):
		return [
			"I don't care that you're pregnant.",
			"I don't care about your belly.",
		]
	if(_id == "GuardFrisk"):
		return [
			"I will be careful with the belly.",
		]
	if(_id == "ReactGETTING_FUCKED"):
		return [
			"Pregnant but still getting fucked!",
		]
	if(_id == "ReactCOVERED_IN_CUM"):
		return [
			"Pregnant but still hungry for cum..",
			"Pregnant but still eager..",
		]
	if(_id == "HelpRestraintsAgree"):
		return [
			"Nice belly..",
		]
	if(_id == "SlutwallAddTip"):
		return [
			"Buy your kids something with this, whore.",
		]
	if(_id == "ProstitutionOffer"):
		return [
			"Oh, you're working even while pregnant. What a slut..",
		]
	if(_id == "AskKeyGive"):
		return [
			"You're a future mother after all.",
		]
	if(_id in ["PunishAboutToStocks", "TalkSexOfferAccept"]):
		return [
			"Careful with the belly.",
		]
	return [
	]
