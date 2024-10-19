extends SlaveActivityBase

func _init():
	id = "StuckInStocks"
	
func getVisibleName():
	return "Stuck in stocks"

func onStart(_args = []):
	var pawn = GM.main.IS.spawnPawnIfNeeded(getCharID())
	pawn.setLocation("main_punishment_spot")
	GM.main.IS.startInteraction("InStocks", {inmate=getCharID()})

func onNewDay():
	pass

func preventsStatsDecay():
	return false

func preventsNormalInteractions():
	return true

func getActivityText():
	return "{npc.name} is currently stuck in stocks so {npc.he} {npc.isAre} not here."

func onPawnDeleted(_pawn):
	stopActivity()

func onInteractionChanged(_newInteraction):
	if(_newInteraction == null || _newInteraction.id != "InStocks"):
		stopActivity()

func getSexEventID():
	return "stocksUsed"

func onInteractionEvent(_eventID:String, _args:Dictionary):
	if(_eventID == getSexEventID()):
		var npcSlave:NpcSlave = getSlave()
		if(npcSlave != null):
			npcSlave.addTired(1)
			if(npcSlave.getTiredEffect() >= 0.9):
				npcSlave.addDespair(0.06)
			else:
				npcSlave.addDespair(0.01)
				npcSlave.addBrokenSpirit(0.05 * npcSlave.getWorkEfficiency())
				npcSlave.addExperience(5)

func hoursPassed(_howMuch):
	if(!pawnExist()):
		stopActivity()
		return
	
func getInteractActions():
	return [
		{
			name = "Stocks",
			desc = "Pay them a visit",
			sceneID = "SlaveTPToLocScene",
			args = ["main_punishment_spot"],
			buttonChecks = [],
		}
	]

func getCustomInteractAnimInfo():
	return [StageScene.Solo, "stand", {pc="pc"}]
