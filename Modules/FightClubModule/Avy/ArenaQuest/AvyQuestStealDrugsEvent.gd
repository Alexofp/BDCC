extends EventBase

func _init():
	id = "AvyQuestStealDrugsEvent"

func registerTriggers(es):
	es.addTrigger(self, Trigger.EnteringRoom, "main_greenhouses")
	
func run(_triggerID, _args):
	if(getFlag("FightClubModule.StolePlantForEliza")):
		return
	if(getFlag("FightClubModule.GotTaskToStealPlant")):
		saynn("You notice the glowing pink plants that doctor Quinn has talked about.")

		addButton("Pink plant", "Steal it!", "stealplant")

func getPriority():
	return 0

func onButton(_method, _args):
	if(_method == "stealplant"):
		setFlag("FightClubModule.StolePlantForEliza", true)
		addMessage("You stole the pink plant, task updated!")
		addExperienceToPlayer(50)
		GM.main.reRun()
