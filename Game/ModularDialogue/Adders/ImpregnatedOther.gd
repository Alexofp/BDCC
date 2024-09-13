extends DialogueFillerAdder

func _init():
	prefix = false
	chance = 100.0
	priority = 1

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
	var mainCharID:String = getCharID(_args, _form.mainRole)
	var dirToCharID:String = getCharID(_args, _form.dirToRole)
	
	if(GM.main.WHS.queryHappened(WHEvent.Impregnated, [
		[WHCond.Who, mainCharID],
		[WHCond.Target, dirToCharID],
	]) && getChar(_args, _form.dirToRole).isVisiblyPregnant()):
		return true
	return false

func getText(_id:String, _args:Dictionary):
	if(_id == "AttackStart"):
		return [
			"I don't care that I got your pregnant.",
		]
	if(_id == "GuardFrisk"):
		return [
			"Hope our kids will turn out okay by the way.. unlike their mother.",
		]
	if(_id == "ReactGETTING_FUCKED"):
		return [
			"I'm so glad that I got you pregnant first!",
			"I got this slut pregnant first!",
		]
	if(_id == "ReactCOVERED_IN_CUM"):
		return [
			"Carrying my litter and still acting so slutty..",
		]
	if(_id == "HelpRestraintsAgree"):
		return [
			"Hope the kids are okay, by the way..",
		]
	if(_id == "SlutwallAddTip"):
		return [
			"Buy our future kids something with this.",
		]
	if(_id == "ProstitutionOffer"):
		return [
			"Oh, you're working with my litter in you. What a slut..",
		]
	if(_id == "AskKeyGive"):
		return [
			"Might as well help since I put that litter in you.",
		]
	if(_id in ["PunishAboutToStocks", "TalkSexOfferAccept"]):
		return [
			"Careful with the belly, it's mine after all.",
		]
	return [
	]
