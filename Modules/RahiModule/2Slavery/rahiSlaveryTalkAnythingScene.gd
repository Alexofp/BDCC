extends SceneBase

func _init():
	sceneID = "rahiSlaveryTalkAnythingScene"

func _reactInit():
	addCharacter("rahi")
	var talkedTopics = getFlag("RahiModule.rahiTalkedTopics", {})
	var possibleTopics = []
	var allTopics = []
	
	if(true):
		allTopics.append_array(["meow_topic"])
	
	for topic in allTopics:
		if(talkedTopics.has(topic)):
			continue
		possibleTopics.append(topic)
	
	
	if(possibleTopics.size() > 0):
		var randomTopic = possibleTopics[0]#RNG.pick(possibleTopics)
		talkedTopics[randomTopic] = true
		setFlag("RahiModule.rahiTalkedTopics", talkedTopics)
		setState(randomTopic)

func _run():
	if(state == ""):
		saynn("You ask if Rahi has anything to talk about.")

		saynn("[say=rahi]Sorry, {rahiMaster}. She has run out of things to talk about..[/say]")

		saynn("Fair enough. Maybe you can ask her again when your relationship advances.")

		addButton("Continue", "Enough talking", "endthescene")
	if(state == "meow_topic"):
		saynn("[say=rahi]She likes to meow.. Maybe because she is a cat..[/say]")

		addButton("Continue", "Enough talking", "endthescene")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	setState(_action)
