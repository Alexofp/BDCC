extends EventBase

func _init():
	id = "Ch5s4EnablePowerEvent"

func registerTriggers(es):
	es.addTrigger(self, Trigger.SceneAndStateHook, ["EngineeringLoreComputerScene", ""])
	
func run(_triggerID, _args):
	if(getFlag("TaviModule.Ch5NewPlanSceneHappend") && !getFlag("TaviModule.Ch5SearchedLabFirstTime")):
		saynn("You get a feeling that this computer might be useful.. But you gotta check the adjacent room first.")
		
		addDisabledButton("Mission", "Check the other room first")
	
	if(getFlag("TaviModule.Ch5NewPlanSceneHappend") && getFlag("TaviModule.Ch5SearchedLabFirstTime") && !getFlag("TaviModule.Ch5EnabledLabPower")):
		addButton("Mission", "Search for the prototype grenade", "startscene")

func getPriority():
	return 0

func onButton(_method, _args):
	if(_method == "startscene"):
		GM.main.endCurrentScene()
		runScene("Ch5s4EnablePowerScene")
		
