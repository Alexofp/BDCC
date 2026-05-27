extends QuestBase

func _init():
	id = "DomRouteIntroQuest"

func getVisibleName():
	return "Asserting Yourself"

func getProgress():
	var result:Array = []
	
	result.append("(Dominant Main Route) You got approached by Kait, the snow leopard lilac. It looks like she wants to overtake the captain and is looking for people who can help.")
	result.append("Kait wants you to find her down in the underground arena that is hidden somewhere near the gym.")
	
	var amountWon:int = GlobalRegistry.getModule("FightClubModule").getAmountFightersWon()
	
	if(getFlag("KaitModule.talkedKaitArena")):
		result.append("You've met Kait in the underground arena. She wants you to prove yourself by winning 3 fights in the arena!\nYou have currently won: "+str(amountWon))
	
		if(amountWon >= 3 && !getFlag("KaitModule.joinedTeam")):
			result.append("Kait is ready to offer you to join the team! Go talk with her.")
	
	return result

func isVisible():
	if(getFlag("KaitModule.joinedTeam")):
		return true
	if(GM.main.hasCommittedToMainRoute()):
		return false
	return getFlag("KaitModule.gotMetByKait") || getFlag("KaitModule.talkedKaitArena")

func isCompleted():
	return getFlag("KaitModule.joinedTeam")

func isMainQuest():
	return true
