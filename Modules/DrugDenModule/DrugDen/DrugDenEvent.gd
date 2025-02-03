extends EventBase

func _init():
	id = "DrugDenEvent"

func registerTriggers(es):
	es.addTrigger(self, Trigger.EnteringRoom)

func run(_triggerID, _args):
	if(GM.main.DrugDenRun == null):
		return
	
	if(GM.pc.getLocation() == GM.main.DrugDenRun.getNextLevelRoom()):
		addButton("Next level", "Go to the next level!", "go")
	
func react(_triggerID, _args):
	if(GM.main.DrugDenRun == null):
		return false
	
	if(GM.main.DrugDenRun.hasEncounterInRoom(GM.pc.getLocation())):
		runScene("DrugDenEncounterInstantFightScene")
		return true
	
	return false
	
func getPriority():
	return 0

func onButton(_method, _args):
	if(_method == "go"):
		GM.main.DrugDenRun.nextLevel()
