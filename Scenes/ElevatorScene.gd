extends "res://Scenes/SceneBase.gd"

func _init():
	sceneID = "ElevatorScene"

func _run():
	if(state == ""):
		saynn("You enter the lift and look at the panel, your inmate access allows you to go only to certain floors")
		
		saynn("Where do you want the lift to go?")

		var floors = [
			["Cellblock", "hall_elevator", "Main level where all the inmate cells are"],
			["Mineshafts", "mining_elevator", "Lower level where the prison is attached to an asteroid"],
			["Medical", "med_elevator", "Floor that has all the medical and science facilities"],
		]
		
		for fl in floors:
			if(fl[1] == GM.pc.location):
				addDisabledButton(fl[0], "You are already here")
			else:
				addButton(fl[0], fl[2], "gofloor", [fl[1]])
				
		GM.ES.triggerRun(Trigger.InsideElevator)
				
		addButton("Get out", "You don't feel like going anywhere", "endthescene")
	
	if(state == "gofloor"):
		saynn("With a screeching noise, the doors close and the lift begins to move towards some other floor")
		
		saynn("You lean against one of the walls and just wait for the lift to arrive which it eventually does")
		
		addButton("Continue", "Step out of the lift", "endthescene")

func _react(_action: String, _args):
	if(_action == "gofloor"):
		var newloc = _args[0]
		
		processTime(5*60)
		GM.pc.setLocation(newloc)
		aimCamera(newloc)

	if(_action == "endthescene"):
		endScene()
		return
	
	setState(_action)

func supportsShowingPawns() -> bool:
	return true
