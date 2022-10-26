extends EventBase

func _init():
	id = "Ch2e1StealDrugsFromStorageEvent"

func registerTriggers(es):
	es.addTrigger(self, Trigger.EnteringRoom, "medical_storage")
	
func run(_triggerID, _args):
	if(GM.QS.isActive("Ch2ElizaQuest") && !getFlag("TaviModule.ch2PCStoleDrugs")):
		saynn("You notice a crate that had vials with the red drug that you need to steal.")
		
		addButtonUnlessLate("Tavi drugs", "Steal the drugs!", "stealdrugs")

func getPriority():
	return 0

func onButton(_method, _args):
	if(_method == "stealdrugs"):
		GM.main.addMessage("You open the crate and steal the special vials!")
		GM.main.addMessage("Task completed!")
		GM.pc.addExperience(100)
		setFlag("TaviModule.ch2PCStoleDrugs", true)
		GM.main.reRun()
