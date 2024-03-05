extends EventBase

func _init():
	id = "SlaverySlaveStuckInStocksEvent"

func registerTriggers(es):
	es.addTrigger(self, Trigger.EnteringRoom, "main_punishment_spot")

func run(_triggerID, _args):
	var slaves = GM.main.getDynamicCharacterIDsFromPool(CharacterPool.Slaves)
	
	for charID in slaves:
		var character:DynamicCharacter = getCharacter(charID)
		var npcSlavery:NpcSlave = character.getNpcSlavery()
		if(npcSlavery == null):
			continue
		
		if(npcSlavery.getActivityID() != "StuckInStocks"):
			continue
		addButton(("(!) " if npcSlavery.hasRandomEventToTrigger() else "")+character.getName(), "Check on this "+character.getSpeciesFullName(), "do_check", [character])

	
func getPriority():
	return 0

func onButton(_method, _args):
	if(_method == "do_check"):
		if(GM.ES.triggerReact("TalkedWithSlave", [_args[0].getID(), "PunishSlaveryStocksTalkScene"])):
			return
		
		runScene("PunishSlaveryStocksTalkScene", [_args[0].getID()])
