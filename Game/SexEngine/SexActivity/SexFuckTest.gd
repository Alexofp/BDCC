extends SexActivityBase

func _init():
	id = "SexFuckTest"

func getDomActions():
	return [
		{
			"id": "fuckthem",
			"score": 1.0,
			"name": "FUCK THEM",
			"desc": "fuck them raw",
			"isDisabled": false,
		}
	]

func getSubActions():
	return [
		{
			"id": "getfucked",
			"score": 1.0,
			"name": "GET FUCKED",
			"desc": "get fucked raw",
			"isDisabled": false,
		}
	]
