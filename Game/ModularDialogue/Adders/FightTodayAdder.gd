extends DialogueFillerAdder

func _init():
	prefix = false
	chance = 100.0
	priority = 10

func getFormIDs() -> Array:
	return [
		"GuardCaughtOffLimits",
		"AttackStart",
		"AttackReact",
		]

func canBeUsed(_id:String, _args:Dictionary, _form) -> bool:
	var mainCharID:String = getCharID(_args, _form.mainRole)
	var dirToCharID:String = getCharID(_args, _form.dirToRole)
	
	if(GM.main.WHS.queryHappened(WHEvent.WonFight, [
		[WHCond.Who, mainCharID],
		[WHCond.Target, dirToCharID],
		[WHCond.Today],
		])):
		if(!GM.main.WHS.queryHappened(WHEvent.WonFight, [
			[WHCond.Who, dirToCharID],
			[WHCond.Target, mainCharID],
			[WHCond.Today],
		])):
			return true # We won but didn't lose
	return false

func getText(_id:String, _args:Dictionary):
	if(_id == "GuardCaughtOffLimits"):
		return [
			"And yeah, you're back so soon.",
			"Oh yeah, last time wasn't enough?",
			"You already lost today.",
		]
	if(_id == "AttackStart"):
		return [
			"Missed me?",
			"I'm gonna win again, you know it.",
		]
	if(_id == "AttackReact"):
		return [
			"You want more I guess..",
			"I won. Why are you coming back?",
		]
	
	return []
