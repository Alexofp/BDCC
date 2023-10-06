extends QuestBase
class_name EscapeQuest

func _init():
	id = "EscapeQuest"

func getVisibleName():
	return "Escape from the prison"

func getProgress():
	var result = []
	
	result.append("Seems like you are stuck in this place for while. You should try and see if escaping form this space prison is even possible.")
	
	if(GM.main.getModuleFlag("TaviModule", "Tavi_ToldHowToEscape")):
		result.append("Tavi says that she can help you escape if you find a way to get to the Captain and make him take off your collar")
	
	return result

func isVisible():
	return true

func isCompleted():
	return getFlag("TaviModule.Ch7CaptainSceneHappened")

func isMainQuest():
	return true
