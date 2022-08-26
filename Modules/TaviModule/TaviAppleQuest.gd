extends QuestBase

func _init():
	id = "TaviAppleQuest"

func getVisibleName():
	return "Forbidden fruit"

func getProgress():
	var result = []
	
	result.append("Tavi told you she wants an apple. You can get one in the greenhouses which are near prison's yard")
	if(GM.pc.getInventory().hasItemID("appleitem")):
		result.append("I have an apple. I should go give it to Tavi. She is always hanging around on the mining level")
	
	return result

func isVisible():
	return GM.main.getModuleFlag("TaviModule", "Tavi_NeedsApple")

func isCompleted():
	return GM.main.getModuleFlag("TaviModule", "Tavi_GotApple")

func isMainQuest():
	return false
