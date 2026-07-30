extends SceneBase
class_name RecruitTalkSceneBase

var allTopics:Array = [[0], [1]]
var pickedTopics:Array = []

func saveData():
	var data = .saveData()
	
	data["pickedTopics"] = pickedTopics
	
	return data

func loadData(data):
	.loadData(data)

	pickedTopics = SAVE.loadVar(data, "pickedTopics", [])

func do_ask_next():
	for theLayer in allTopics:
		var thePossible:Array = []
		for theStateIndx in theLayer:
			if(!pickedTopics.has(theStateIndx)):
				thePossible.append(theStateIndx)
		
		if(!thePossible.empty()):
			var thePickedTopic = RNG.pick(thePossible)
			pickedTopics.append(thePickedTopic)
			setState(str(thePickedTopic))
			return
	endScene()
	
func didAllTopics() -> bool:
	for theLayer in allTopics:
		for theStateIndx in theLayer:
			if(!pickedTopics.has(theStateIndx)):
				return false
	return true

func addRecButtons():
	if(!didAllTopics()):
		addButton("Ask more", "Ask something else", "ask_next")
	else:
		addDisabledButton("Ask more", "You asked everything you could")
	addButton("Enough", "That was enough talking", "endthescene")
