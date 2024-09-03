extends EventBase

func _init():
	id = "SlaverySlaveStuckInStocksEvent"

func registerTriggers(es):
	#es.addTrigger(self, Trigger.EnteringRoom, "main_punishment_spot")
	es.addTrigger(self, Trigger.EnteringRoomWithSlave, "main_punishment_spot")
	#es.addTrigger(self, Trigger.EnteringRoom, "fight_slutwall")
	es.addTrigger(self, Trigger.EnteringRoomWithSlave, "fight_slutwall")


func run(_triggerID, _args):
	var slaves = GM.main.getDynamicCharacterIDsFromPool(CharacterPool.Slaves)
	
	if(_args[0] == "main_punishment_spot"):
		for charID in slaves:
			var character:DynamicCharacter = getCharacter(charID)
			var npcSlavery:NpcSlave = character.getNpcSlavery()
			if(npcSlavery == null):
				continue
			
			if(npcSlavery.getActivityID() != "StuckInStocks"):
				continue
			#if(_triggerID == Trigger.EnteringRoom):
			#	addButton(("(!) " if npcSlavery.hasRandomEventToTrigger() else "")+character.getName(), character.getSmallDescription(), "do_check", [character])
			#elif(_triggerID == Trigger.EnteringRoomWithSlave):
			addButton(character.getName(), "Let your slave fuck this "+character.getSpeciesFullName()+"\n\n"+character.getSmallDescription(), "do_slave_fuck", [_args[1], character.getID()])
	if(_args[0] == "fight_slutwall"):
		for charID in slaves:
			var character:DynamicCharacter = getCharacter(charID)
			var npcSlavery:NpcSlave = character.getNpcSlavery()
			if(npcSlavery == null):
				continue
			
			if(npcSlavery.getActivityID() != "StuckInSlutwall"):
				continue
			#if(_triggerID == Trigger.EnteringRoom):
			#	addButton(("(!) " if npcSlavery.hasRandomEventToTrigger() else "")+character.getName(), character.getSmallDescription(), "do_check_slut", [character])
			#elif(_triggerID == Trigger.EnteringRoomWithSlave):
			addButton(character.getName(), "Let your slave fuck this "+character.getSpeciesFullName()+"\n\n"+character.getSmallDescription(), "do_slave_fuck_slut", [_args[1], character.getID()])
	
	
func getPriority():
	return 0

func onButton(_method, _args):
	if(_method == "do_check"):
		if(GM.ES.triggerReact("TalkedWithSlave", [_args[0].getID(), "PunishSlaveryStocksTalkScene"])):
			return
		
		runScene("PunishSlaveryStocksTalkScene", [_args[0].getID()])
	
	if(_method == "do_slave_fuck"):
		runScene("SlaveryStocksLetFuck", [_args[0], _args[1]])

	if(_method == "do_check_slut"):
		if(GM.ES.triggerReact("TalkedWithSlave", [_args[0].getID(), "PunishSlaverySlutwallTalkScene"])):
			return
		
		runScene("PunishSlaverySlutwallTalkScene", [_args[0].getID()])
	
	if(_method == "do_slave_fuck_slut"):
		runScene("SlaveryStocksLetFuck", [_args[0], _args[1]])
