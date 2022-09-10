extends QuestBase

func _init():
	id = "PortalPantiesQuest"

func getVisibleName():
	return "Bluespace panties"

func getProgress():
	var result = []
	
	result.append("Find some generic female panties and bring them to Alex Rynard. He said you can buy some in the laundry.")
	
	if(GM.main.getFlag("PortalPantiesModule.Panties_GavePantiesToAlex")):
		result.append("You are now wearing the portal panties. Alex said you will be awarded a single credit after each test they do with you.")
	
	if(GM.main.getFlag("PortalPantiesModule.Panties_PcDenied")):
		result.append("You denied his offer")
	
	return result

func isVisible():
	return GM.main.getFlag("PortalPantiesModule.Panties_AskedAlex")

func isCompleted():
	return GM.main.getFlag("PortalPantiesModule.Panties_PcDenied")

func isMainQuest():
	return false
