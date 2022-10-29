extends SexActivityBase
var times = 0

func _init():
	id = "SexFuckExample"

func getActivityScore(_sexEngine: SexEngine, _domInfo: SexDomInfo, _subInfo: SexSubInfo):
	if(_sexEngine.hasGoal(_domInfo, SexGoal.Fuck, _subInfo)):
		return 1.0
	
	return 0.0

func getDomTags():
	return [SexActivityTag.PenisUsed]

func getSubTags():
	return [SexActivityTag.VaginaUsed]

func startActivity(_args):
	state = ""
	
	return {
		text = "Positions himself behind your butt with his dick out.",
	}

func processTurn():
	if(state == "fucking"):
		times += 1
		
		return {text="HE is still fucking you."}
	else:
		return {text="HE is NOT fucking you."}
	
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
			}
		]

func doDomAction(_id, _actionInfo):
	if(_id == "cum"):
		if(state == "fucking"):
			if(RNG.chance(50)):
				times = 0
				state = ""
				return {text = "HE CAMEEEE"}
			else:
				endActivity()
				return {text = "HE CAME AND DECIDED TO STOP"}
	
	if(_id == "fuck"):
		if(state == ""):
			if(RNG.chance(50)):
				return {text = "He tries to insert but fails"}
			else:
				state = "fucking"
				return {text = "He inserts his cock!"}

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
		
		return {text = "You rub against them",}
	if(_id == "begnottocum"):
		if(state == "fucking"):
			return {text = "YOU BEG THEM NOT TO CUM INSIDE"}
	if(_id == "avoid"):
		if(state == "fucking"):
			if(RNG.chance(50)):
				return {text = "You try to avoid but fail"}
			else:
				state = ""
				return {text = "YOU MAKE HIM PULL OUT, NICE"}
