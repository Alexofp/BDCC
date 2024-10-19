extends DialogueFillerAdder

func _init():
	prefix = true
	chance = 100.0
	priority = 11

func getFormIDs() -> Array:
	return [
		"GuardCaughtOffLimits",
		"AttackReact",
		]

func canBeUsed(_id:String, _args:Dictionary, _form) -> bool:
	var mainCharID:String = getCharID(_args, _form.mainRole)
	var dirToCharID:String = getCharID(_args, _form.dirToRole)
	
	if(GM.main.WHS.queryHappened(WHEvent.WonFight, [
		[WHCond.Who, dirToCharID],
		[WHCond.Target, mainCharID],
		[WHCond.MaxDaysAgo, 3],
	])):
		return true
#		if(!GM.main.WHS.queryHappened(WHEvent.WonFight, [
#			[WHCond.Who, mainCharID],
#			[WHCond.Target, dirToCharID],
#			[WHCond.Today],
#		])):
#			return true # We lost and didn't win
	return false

func getText(_id:String, _args:Dictionary):
	return [
		"Not you again..",
		"Fuck, it's you..",
		"Oh c'mon.",
		"Why is it you again..",
		"Ah shit.",
		"Fuck..",
		"Oh no.",
		"Sigh..",
		"It's you..",
		"You again..",
	]
