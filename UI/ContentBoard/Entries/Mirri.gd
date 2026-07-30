extends ContentBoardEntryBase

func _init():
	id = "Mirri"
	
func getName() -> String:
	return "Blacktail Market"

func getDesc(_isFull:bool) -> String:
	if(_isFull):
		return "Meet Mirri and Luxe from the Blacktail family who are running a slave auction. Get an ability to sell your slaves on a Blacktail Market!"
	return "Meet Mirri and Luxe from the Blacktail family who are running a slave auction. Sell your slaves here!"

func getKinks() -> Array:
	return [
		"Player is dominant",
		"Slavery (pc is slaver)",
		"Slave auctions",
		"Noncon",
	]

func getCompletedDesc() -> String:
	var r6out = getFlag("SlaveAuctionModule.r6outcome", "")
	if(r6out == "mirrislave"):
		return ("You helped Luxe to sell Mirri into slavery. Good riddance. You can still participate in the Black Market, but now as a presenter!")
	if(r6out == "mirrigone"):
		return ("You got rid of Mirri completely. That bitch got what was coming for her. You can still participate in the Black Market, but now as a presenter!")
	if(r6out == "luxedead"):
		return ("Luxe is dead. Mirri is now the head of the Blacktail family! You can still sell slaves on the Blacktail Market if you want.")
	if(r6out == "middleground"):
		return ("You managed to help Mirri and Luxe find middle ground! Mirri is no longer part of Blacktail but Luxe won't terrorize her anymore. You can still sell slaves on the Blacktail Market if you want.")

	return "You can now sell slaves on a Blacktail Market in peace!"

func getStatus() -> int:
	if(getFlag("SlaveAuctionModule.repLevel", 0) >= 6):
		return ContentBoardStatus.Completed
	if(getFlag("SlaveAuctionModule.s1hap", false)):
		return ContentBoardStatus.InProgress
	return ContentBoardStatus.ConditionsNotMet

func getStartConditions() -> Array:
	return [
		[completeIf("Mining_IntroducedToMinning"), "Follow Risha's order and go work in the mines."],
		[completeIf("PortalPantiesModule.Alex_FirstTimeTalked"), "Talk with Alex Rynard near the entrance to the mines."],
		[completeIf("PortalPantiesModule.Panties_AskedAlex"), "Ask Alex Rynard if he can help you with credits."],
		[completeIfBool(getFlag("PortalPantiesModule.Panties_FleshlightsReturnedToAlex", false) || getFlag("PortalPantiesModule.Panties_PcDenied", false)), "Complete the 'portal panties' task that Alex Rynard gives fully or decline him after trying them once."],
		[completeIfBool(GM.pc.getSkillsHolder().getLevel() >= 10), "Reach level 10."],
		[completeIf("SocketModule.socketIntroduced"), "Enter the workshop to meet Socket."],
		[completeIfBool(int(getFlag("NpcSlaveryModule.slavesSpace", 0)) > 0), "Buy a cell expansion upgrade from Socket, at least one."],
		[completeIfBool((GM.main.getPCSlaveAmount() > 0) || getFlag("SlaveAuctionModule.s1hap", false)), "Enslave anyone by beating them up, breaking their spirit and then kidnapping them into your cell."],
		[completeIfBool(doesPCHaveBrokenSlave() || getFlag("SlaveAuctionModule.s1hap", false)), "Make at least one of your slaves submit to you completely by breaking them or making them love you."],
		[completeIf("SlaveAuctionModule.s1hap"), "Let Mirri find you near the cellblocks!"],
	]

func getProgressText() -> String:
	return "Follow the \"Blacktail Market\" task in order to progress the storyline"

func doesPCHaveBrokenSlave() -> bool:
	var hasBrokenSlave:bool = false
	var slaves = GM.main.getPCSlavesIDs()
	for slaveID in slaves:
		var theSlave:BaseCharacter = GlobalRegistry.getCharacter(slaveID)
		if(theSlave == null):
			continue
		var npcSlavery:NpcSlave = theSlave.getNpcSlavery()
		if(npcSlavery == null):
			continue
		if(npcSlavery.hasSubmittedToPC()):
			hasBrokenSlave = true
			break
	return hasBrokenSlave
