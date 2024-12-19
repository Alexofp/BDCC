extends EventBase

func _init():
	id = "C0MirriEvent"

func registerTriggers(es):
	es.addTrigger(self, Trigger.EnteringRoom, "cellblock_corridor_middle")

func react(_triggerID, _args):
	if(!getFlag("SlaveAuctionModule.s0hap")):
		if(GM.main.getPCSlaveAmount() > 0):
			setFlag("SlaveAuctionModule.s0hap", true)
			runScene("MirriS0TeaseScene")
			return true
		return false
	
	if(!getFlag("SlaveAuctionModule.s1hap")):
		var hasBrokenSlave:bool = false
		var slaves = GM.main.getPCSlavesIDs()
		for slaveID in slaves:
			var theSlave:BaseCharacter = getCharacter(slaveID)
			if(theSlave == null):
				continue
			var npcSlavery:NpcSlave = theSlave.getNpcSlavery()
			if(npcSlavery == null):
				continue
			if(npcSlavery.hasSubmittedToPC()):
				hasBrokenSlave = true
				break
		if(hasBrokenSlave):
			setFlag("SlaveAuctionModule.s1hap", true)
			runScene("MirriS1IntroScene")
			return true
		return false
	
func getPriority():
	return 20
