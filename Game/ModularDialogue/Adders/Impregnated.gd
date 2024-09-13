extends DialogueFillerAdder

func _init():
	prefix = false
	chance = 100.0
	priority = 0

func getFormIDs() -> Array:
	return [
		"FightWonGeneric",
		"PunishLockIntoSlutwall",
		"ReactGETTING_FUCKED",
		"ReactON_A_LEASH",
		"SlutwallStealCredits",
		"PunishLockIntoSlutwall",
		"HelpRestraintsDeny",
		"TalkGrabAndFuck",
		"AttackReact",
		"AskKeyDeny",
		]

func canBeUsed(_id:String, _args:Dictionary, _form) -> bool:
	var mainCharID:String = getCharID(_args, _form.mainRole)
	var dirToCharID:String = getCharID(_args, _form.dirToRole)
	
	if(GM.main.WHS.queryHappened(WHEvent.Impregnated, [
		[WHCond.Who, dirToCharID],
		[WHCond.Target, mainCharID],
	]) && getChar(_args, _form.mainRole).isVisiblyPregnant()):
		return true
	return false

func getText(_id:String, _args:Dictionary):
	if(_id == "AttackReact"):
		return [
			"You've bred me.. and now you're doing this?..",
			"You've impregnated me.. and now you're doing this?..",
			"I'm carrying your litter, you know!",
			"You're gonna hit me while I have your litter?",
		]
	return [
		"That's for breeding me.",
		"That's what you get for breeding me, you fuck.",
		"That's what you get for impregnating me.",
	]
