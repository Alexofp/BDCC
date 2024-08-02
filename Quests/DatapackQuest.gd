extends QuestBase
class_name DatapackQuestBase

var codeContext:DatapackQuestCodeContext = DatapackQuestCodeContext.new()
var datapackQuest:DatapackQuest
var datapack:Datapack

func setDatapackAndQuest(newD, newQ):
	datapack = newD
	datapackQuest = newQ
	codeContext.setDatapack(datapack)
	codeContext.setQuest(datapackQuest)

func getVisibleName():
	return datapackQuest.name

func getProgress():
	var info = codeContext.calculateQuestInfo()
	
	return info["storedStages"]

func isVisible():
	var info = codeContext.calculateQuestInfo()
	
	return info["questVisible"]

func isCompleted():
	var info = codeContext.calculateQuestInfo()
	
	return info["questCompleted"]

func isMainQuest():
	return datapackQuest.isMain

func getPriority():
	return datapackQuest.priority
