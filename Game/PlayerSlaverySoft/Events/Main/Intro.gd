extends NpcOwnerEventBase

func _init():
	id = "Intro"

func onStart(_args:Array):
	setState("start")

func start():
	playAnimation(StageScene.HangingDuo, "stand", {npc=getOwnerID()})
	saynn("YOU WAKE UP HANGING IN SOMEONE'S CELL (OR ROOM).")
	talk(C_OWNER, "YOU ARE NOW MY {npc.npcSlave}. UNDERSTAND?")
	saynn("YOU ARE NOW A SLAVE!")
	talk(C_OWNER, "YOU WILL DO AS I SAY OR I WILL HAVE TO PUNISH YOU.")
	
	addContinue("setState", ["nearcellblock"])
	
func nearcellblock():
	playAnimation(StageScene.Duo, "stand", {npc=getOwnerID(), bodyState={leashedBy=getOwnerID()}})
	setLocation(LOC_CELLBLOCK_MIDDLE)
	
	saynn("YOU GOT BROUGHT OUT INTO THE CELLBLOCK.")
	
	talk(C_OWNER, "I WILL SEE YOU SOON.")
	
	addContinue("endEvent")
