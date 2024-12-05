extends QuestBase

func _init():
	id = "BlacktailQuest"

func getVisibleName():
	return "Blacktail Market"

func getProgress():
	var result = []
	
	result.append("You almost got sold by a Syndicate Agent. She offered you a deal: bring her a slave to sell and she will pay you.\n\nYou can choose which slave you want to sell from inside the 'Slaves' menu. Keep in mind that selling a slave will get rid of them for forever.")

	if(getFlag("SlaveAuctionModule.s2hap")):
		result.append("Sell more slaves and help Mirri raise her slaver rank in order to advance the story. Use the Slaves menu to teleport to the Blacktail market.")

	if(getFlag("SlaveAuctionModule.repLevel", 0) >= 5):
		result.append("Mirri has reached slaver rank 5. Keep in mind that next rank is the last one, you won't be able to undo certain things anymore.")

	if(getFlag("SlaveAuctionModule.repLevel", 0) >= 6):
		var r6out = getFlag("SlaveAuctionModule.r6outcome", "")
		if(r6out == "mirrislave"):
			result.append("You helped Luxe to sell Mirri into slavery. Good riddance. You can still participate in the Black Market, but now as a presenter!")
		if(r6out == "mirrigone"):
			result.append("You got rid of Mirri completely. That bitch got what was coming for her. You can still participate in the Black Market, but now as a presenter!")
		if(r6out == "luxedead"):
			result.append("Luxe is dead. Mirri is now the head of the Blacktail family! You can still sell slaves on the Blacktail Market if you want.")
		if(r6out == "middleground"):
			result.append("You managed to help Mirri and Luxe find middle ground! Mirri is no longer part of Blacktail but Luxe won't terrorize her anymore. You can still sell slaves on the Blacktail Market if you want.")

	return result

func isVisible():
	return getFlag("SlaveAuctionModule.s1hap")

func isCompleted():
	return getFlag("SlaveAuctionModule.repLevel", 0) >= 6

func isMainQuest():
	return false
