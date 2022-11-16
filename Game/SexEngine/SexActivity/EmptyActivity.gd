extends SexActivityBase

func _init():
	id = "EmptyActivity"

func getGoals():
	return {
	}

func canStartActivity(_sexEngine: SexEngine, _domInfo: SexDomInfo, _subInfo: SexSubInfo):
	if(true):
		return false
	
	return .canStartActivity(_sexEngine, _domInfo, _subInfo)

func getVisibleName():
	return "Change me"

func getCategory():
	return ["Fuck"]

func getDomTags():
	var thetags = []
	return thetags

func getSubTags():
	var thetags = []
	return thetags

func getDomTagsCheck():
	return []

func getSubTagsCheck():
	return []

func startActivity(_args):
	state = ""
	
	var text = RNG.pick([
		"CHANGE ME",
	])
	
	return {
		text = text,
	}

func onSwitchFrom(_otherActivity, _args):
	return

func processTurn():
	return
	
func getDomActions():
	var actions = []

	actions.append({
		"id": "stop",
		"score": getStopScore(),
		"name": "Stop",
		"desc": "Stop the sex activity",
	})

	return actions

func doDomAction(_id, _actionInfo):

	if(_id == "stop"):
		endActivity()

		var text = RNG.pick([
			"{dom.You} pulled away.",
		])

		return {text = text}

func getSubActions():
	var actions = []

	actions.append({
		"id": "pullaway",
		"score": subInfo.getResistScore(),
		"name": "Pull away",
		"desc": "Try to pull away",
		"chance": getSubResistChance(30.0, 25.0),
	})

	return actions

func getSubResistChance(baseChance, domAngerRemoval):
	var theChance = baseChance - domInfo.getAngerScore()*domAngerRemoval
	if(getSub().hasBlockedHands()):
		theChance *= 0.5
	if(getSub().hasBoundArms()):
		theChance *= 0.5
	if(getSub().isBlindfolded()):
		theChance *= 0.8
	
	return max(theChance, 5.0)

func doSubAction(_id, _actionInfo):

	if(_id == "pullaway"):
		var successChance = getSubResistChance(30.0, 25.0)
		if(RNG.chance(successChance)):
			var text = RNG.pick([
				"{sub.You} {sub.youVerb('pull')} away from {dom.you}.",
			])
			domInfo.addAnger(0.3)
			if(state != ""):
				state = ""
			else:
				endActivity()
			return {text = text}
		else:
			var text = RNG.pick([
				"{sub.You} {sub.youVerb('try', 'tries')} to pull away from {dom.you} but {sub.youVerb('fail')}.",
			])
			domInfo.addAnger(0.1)
			return {text = text}

	return

func getAnimation():
	return [StageScene.Duo, "stand", {pc=subID, npc=domID, npcAction="stand"}]

func getDomOrgasmHandlePriority():
	return -1

func getSubOrgasmHandlePriority():
	return -1
