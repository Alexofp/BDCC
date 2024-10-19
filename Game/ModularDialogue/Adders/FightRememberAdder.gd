extends DialogueFillerAdder

func _init():
	prefix = false
	chance = 100.0
	priority = 20

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
		[WHCond.MaxDaysAgo, 3],
		[WHCond.MinDaysAgo, 1],
	])):
		return true
	return false

func getText(_id:String, _args:Dictionary):
	if(_id in ["GuardCaughtOffLimits", "AttackReact"]):
		return [
			"Wait, didn't I beat you up the other day?",
			"Wait, didn't I beat you up the other day? You want more?",
			"I remember beating you up the other day. You came back for more?",
		]
	if(_id == "AttackStart"):
		return [
			"I'm gonna do this until you learn your place.",
		]
	
	return []
