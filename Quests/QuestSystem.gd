extends Node
class_name QuestSystem

var quests: Dictionary = {}

func _ready():
	GM.QS = self
	name = "QuestSystem"
	
	registerQuests()

func registerQuests():
	var loadedquests = GlobalRegistry.getQuests()
	for questID in loadedquests:
		var quest = loadedquests[questID]
		
		quests[questID] = quest

func isCompleted(questID):
	assert(quests.has(questID))
	
	return quests[questID].isCompleted()

func isActive(questID):
	assert(quests.has(questID))
	
	return quests[questID].isVisible() && !quests[questID].isCompleted()

func getQuests():
	return quests

func getAllQuests():
	var result = quests.duplicate()
	
	for datapackID in GM.main.loadedDatapacks:
		var datapack = GlobalRegistry.getDatapack(datapackID)
		if(datapack == null):
			continue
		
		for questID in datapack.quests:
			var datapackQuest = datapack.quests[questID]
			
			var newQuestBase:DatapackQuestBase = DatapackQuestBase.new()
			newQuestBase.id = (datapackID+":"+questID)
			newQuestBase.setDatapackAndQuest(datapack, datapackQuest)
			
			result[datapackID+":"+questID] = newQuestBase
	
	return result
