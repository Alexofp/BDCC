extends QuestBase

func _init():
	id = "DealingWithRush"

func getVisibleName():
	return "Stallion for time"

func getProgress():
	var result = []
	
	result.append("Vion needs help dealing with Rush, an equine-dragon hybrid making increasingly insistent demands.")
	if(GM.main.getFlag("HypnokinkModule.RushDealStruckAtLeastOnce", false)):
		result.append("You've struck a deal with Rush that should get him off Vion's back for a while.")
	if(GM.main.getFlag("HypnokinkModule.RushCausingMoreTrouble", false)):
		result.append("Your solution for the Rush problem is proving to be only temporary. Perhaps a more permanent one is possible?")
	if(GM.main.getFlag("HypnokinkModule.RushSubdued", false)):
		result.append("Rush has been dealt with permanently.")
	
	return result

func isVisible():
	return GM.main.getFlag("HypnokinkModule.KnowAboutRush", false)

func isCompleted():
	return GM.main.getFlag("HypnokinkModule.RushSubdued", false)

func isMainQuest():
	return false
