extends EventBase

func _init():
	id = "DomM1ElevatorEvent"

func registerTriggers(es):
	es.addTrigger(self, Trigger.InsideElevator)

func run(_triggerID, _args):
	if(!GM.main.MS.isDoingMission("Mission1")):
		return
	
	if(GM.pc.getLocation() == "cd_elevator"):
		return
	addButton("Command deck", "Where all the higher-ups live", "commanddeck")

func getPriority():
	return 0

func onButton(_method, _args):
	if(_method == "commanddeck"):
		GM.pc.setLocation("cd_elevator")
		GM.main.endCurrentScene()
		GM.main.reRun()
