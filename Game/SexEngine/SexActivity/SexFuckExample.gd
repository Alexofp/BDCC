extends SexActivityBase
var times = 0

func _init():
	id = "SexFuckExample"

func getGoals():
	return {
		#SexGoal.Fuck: 1.0,
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
		addDomLust(10, {Fetish.VaginalSexTop: 1.0})
		addSubLust(10, {Fetish.VaginalSexBottom: 1.0})
		
		domInfo.addArousalSex(0.2)
		subInfo.addArousalSex(0.2)

		
		if(subInfo.isReadyToCum()):
			subInfo.cum()
			return {text="{sub.You} came!"}
		
		return {text="{dom.You} {dom.youAre} still fucking {sub.youHim}."}
	elif(state == "noncon"):
		times += 1
		addDomLust(10, {Fetish.VaginalSexTop: 1.0})
		addSubLust(5, {Fetish.VaginalSexBottom: 1.0})
		domInfo.addArousalSex(0.2)
		subInfo.addArousalSex(0.2)
		
		return {text="{dom.You} {dom.youAre} still fucking {sub.youHim} VERY ROUGH."}
	else:
		return {text="{dom.You} {dom.youAre} NOT fucking {sub.youHim}."}
	
func getDomActions():
	var actions = []
	if(state in ["fucking", "noncon"] && domInfo.isReadyToCum()):
		actions.append({
				"id": "cum",
				"score": 1.0,
				"name": "Cum inside them",
				"desc": "fuck them raw",
			})
	
	if(state in ["fucking"]):
		actions.append({
				"id": "startnoncon",
				"score": -0.2 + getDomAngryScore() * 0.8,
				"name": "Fuck roughly",
				"desc": "fuck them rough",
			})
	
	if(state == ""):
		actions.append_array([{
				"id": "fuck",
				"score": 1.0,
				"name": "FUCK THEM",
				"desc": "fuck them raw",
			},{
				"id": "stop",
				"score": getStopScore(),
				"name": "STOP FUCK",
				"desc": "enough fucking",
			}])
	return actions

func doDomAction(_id, _actionInfo):
	if(_id == "stop" && state == ""):
		endActivity()
		return {text = "{dom.You} stopped the fuck"}
	
	if(_id == "cum"):
		if(state in ["fucking", "noncon"]):
			if(RNG.chance(50)):
				times = 0
				state = ""
				domInfo.cum()
				satisfyGoals()
				return {text = "{dom.You} CAMEEEE"}
			else:
				domInfo.cum()
				satisfyGoals()
				endActivity()
				return {text = "{dom.You} CAME AND DECIDED TO STOP"}
	
	if(_id == "startnoncon"):
		state = "noncon"
		return {text = "{dom.You} began fucking {sub.you} ROUGH!"}
	
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
	if(state in ["fucking", "noncon"]):
		actions.append({
				"id": "avoid",
				"score": 1.0,
				"name": "AVOID",
				"desc": "MEOW",
			})
		if(domInfo.isCloseToCumming()):
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
		calmDomDown(0.1)
		domInfo.addArousalForeplay(0.1)
		subInfo.addArousalForeplay(0.1)
		
		return {text = "{sub.You} {sub.youVerb('rub')} against {dom.youHim}",}
	if(_id == "begnottocum"):
		calmDomDown(0.1)
		return {text = "{sub.You} {sub.youVerb('BEG')} {dom.youHim} NOT TO CUM INSIDE"}
	if(_id == "avoid"):
		if(state in ["fucking", "noncon"]):
			if(RNG.chance(50)):
				makeDomAngry(0.1)
				return {text = "{sub.You} {sub.youVerb('try', 'tries')} to avoid but {sub.youVerb('fail')}"}
			else:
				makeDomAngry(0.5)
				state = ""
				return {text = "{sub.You} {sub.youVerb('make')} {dom.youHim} PULL OUT, NICE"}
