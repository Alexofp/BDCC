extends EventBase

func _init():
	id = "SlaveEventEvent"

func registerTriggers(es):
	es.addTrigger(self, "TalkedWithSlave")

func react(_triggerID, _args):
	var character:DynamicCharacter = getCharacter(_args[0])
	var npcSlavery:NpcSlave = character.getNpcSlavery()
	
	if(npcSlavery != null && npcSlavery.hasRandomEventToTrigger()):
		runScene("SlaveEventWrapperScene", [character.getID(), _args[1]])
		return true
	
	return false
	
func getPriority():
	return 11
