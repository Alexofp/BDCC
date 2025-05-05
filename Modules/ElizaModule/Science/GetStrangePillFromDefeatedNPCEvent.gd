extends EventBase

func _init():
	id = "GetStrangePillFromDefeatedNPCEvent"

func registerTriggers(es):
	es.addTrigger(self, Trigger.DefeatedDynamicNPC)
	es.addTrigger(self, Trigger.AfterSexWithDefeatedDynamicNPC)

func run(_triggerID, _args):
	var npcID = _args[0]
	var character:DynamicCharacter = getCharacter(npcID)
	
	if(!character.isDynamicCharacter()):
		return
	
	if(npcID == GM.main.SCI.peekRandomNpcIDForStrangeDrug()):
		addButton("Strange pill!", "Take it from them", "doTakePill")
	
func getPriority():
	return 0

func onButton(_method, _args):
	if(_method == "doTakePill"):
		GM.main.SCI.clearRandomNpcIDForStrangeDrug()
		GM.pc.getInventory().addItem(GlobalRegistry.createItem("TFPill"))
		addMessage("You search through their pockets and find a weird-looking pill!")
