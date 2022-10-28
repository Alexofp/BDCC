extends SexActivityBase

var something = 0

func _init():
	id = "SexFuckTest2"

func doDomAction(_id, _actionInfo):
	return {
		"text": "Bad stuff happened 2222 "+str(something),
	}

func getDomActions():
	return [
		{
			"id": "fuckthem2",
			"score": 1.0,
			"name": "FUCK THEM 2",
			"desc": "fuck them raw",
			"isDisabled": false,
		}
	]

func doSubAction(_id, _actionInfo):
	something += 1
	return {
		"text": "Bad SUB stuff happened 2222",
	}

func getSubActions():
	return [
		{
			"id": "getfucked2",
			"score": 1.0,
			"name": "GET FUCKED 2",
			"desc": "get fucked raw",
			"isDisabled": false,
		}
	]
