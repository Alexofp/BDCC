extends Reference
class_name Module

var scenes = []
var characters = []
var items = []
var events = []
var quests = []
var id = "badmodule"
var author = "no author"

func _init():
	pass

func register():
	for scene in scenes:
		GlobalRegistry.registerScene(scene)
	
	for character in characters:
		GlobalRegistry.registerCharacter(character)
	
	for item in items:
		GlobalRegistry.registerItem(item)
	
	for event in events:
		GlobalRegistry.registerEvent(event)

	for quest in quests:
		GlobalRegistry.registerQuest(quest)

func resetFlagsOnNewDay():
	pass

func setFlag(flagID, value):
	GM.main.setFlag(flagID, value)

func getFlag(flagID, defaultValue = null):
	return GM.main.getFlag(flagID, defaultValue)

func increaseFlag(flagID, addvalue = 1):
	GM.main.increaseFlag(flagID, addvalue)

func getRandomSceneFor(_sceneType):
	return []
