extends SexActivityBase
var times = 0

func _init():
	id = "SexFuckExample"

func getGoals():
	return {
		SexGoal.Fuck: 1.0,
	}

func getCategory():
	return []

func getDomTags():
	return [SexActivityTag.PenisUsed]

func getSubTags():
	return [SexActivityTag.VaginaUsed]

func startActivity(_args):
	state = ""
	
	return {
		text = "{dom.name} positions {dom.himself} behind {sub.your} butt with {dom.his} dick out.",
	}

func processTurn():
	if(state == "fucking"):
		times += 1
		
		return {text="{dom.You} {dom.youAre} still fucking {sub.youHim}."}
	else:
		return {text="{dom.You} {dom.youAre} NOT fucking {sub.youHim}."}
	
func getDomActions():
	if(state == "fucking" && times > 5):
		return [
			{
				"id": "cum",
				"score": 1.0,
				"name": "Cum inside them",
				"desc": "fuck them raw",
			}
		]
	
	if(state == ""):
		return [
			{
				"id": "fuck",
				"score": 1.0,
				"name": "FUCK THEM",
				"desc": "fuck them raw",
			},
			{
				"id": "stop",
				"score": getStopScore(),
				"name": "STOP FUCK",
				"desc": "enough fucking",
			}
		]

func doDomAction(_id, _actionInfo):
	if(_id == "stop" && state == ""):
		endActivity()
		return {text = "{dom.You} stopped the fuck"}
	
	if(_id == "cum"):
		if(state == "fucking"):
			if(RNG.chance(50)):
				times = 0
				state = ""
				satisfyGoals()
				return {text = "{dom.You} CAMEEEE"}
			else:
				satisfyGoals()
				endActivity()
				return {text = "{dom.You} CAME AND DECIDED TO STOP"}
	
	if(_id == "fuck"):
		if(state == ""):
			if(RNG.chance(50)):
				return {text = "{dom.You} {dom.youVerb('try', 'tries')} to insert but {dom.youVerb('fail')}"}
			else:
				state = "fucking"
				return {text = "{dom.You} {dom.youVerb('insert')} {dom.yourHis} cock!"}

func getSubActions():
	var actions = []
	if(state == ""):
		actions.append({
				"id": "rub",
				"score": 1.0,
				"name": "Rub",
				"desc": "MEOW",
			})
	if(state == "fucking"):
		actions.append({
				"id": "avoid",
				"score": 1.0,
				"name": "AVOID",
				"desc": "MEOW",
			})
		if(times > 3):
			actions.append({
					"id": "begnottocum",
					"score": 1.0,
					"name": "BEG NOT CUM",
					"desc": "MEOW",
				})
	return actions

func doSubAction(_id, _actionInfo):
	if(_id == "rub"):
		#switchCurrentActivityTo("SexFuckTest2")
		
		return {text = "{sub.You} {sub.youVerb('rub')} against {dom.youHim}",}
	if(_id == "begnottocum"):
		if(state == "fucking"):
			return {text = "{sub.You} {sub.youVerb('BEG')} {dom.youHim} NOT TO CUM INSIDE"}
	if(_id == "avoid"):
		if(state == "fucking"):
			if(RNG.chance(50)):
				return {text = "{sub.You} {sub.youVerb('try', 'tries')} to avoid but {sub.youVerb('fail')}"}
			else:
				state = ""
				return {text = "{sub.You} {sub.youVerb('make')} {dom.youHim} PULL OUT, NICE"}
