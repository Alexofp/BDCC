extends QuestBase
class_name EscapeQuest

func _init():
	id = "EscapeQuest"

func getVisibleName():
	return "Escape from the prison"

func getProgress():
	var result = []
	
	result.append("Seems like you are stuck in this place for while. You should try and see if escaping from this space prison is even possible.")
	
	if(GM.main.getModuleFlag("TaviModule", "Tavi_ToldHowToEscape")):
		result.append("(Switch Route) Tavi says that she can help you escape if you find a way to get to the Captain and make him take off your collar.")
	elif(GM.main.getModuleFlag("TaviModule", "Tavi_IntroducedTo")):
		result.append("(Switch Route) You can find Tavi near the mineshafts and see if she can help you escape this prison.")
	if(GM.main.getFlag("KaitModule.talkedKaitArena")):
		result.append("(Dom Route) It looks like Kait is gathering people for a team in order to try to dominate the whole prison!")
	elif(GM.main.getFlag("KaitModule.gotMetByKait")):
		result.append("(Dom Route) You've met Kait, a snow leopard who seems interested in inmates who can fight.")
	
	return result

func isVisible():
	return !GM.main.hasCommittedToMainRoute() || isCompleted()

func isCompleted():
	return getFlag("TaviModule.Ch7CaptainSceneHappened")

func isMainQuest():
	return true
