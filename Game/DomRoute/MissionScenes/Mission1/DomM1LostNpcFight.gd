extends SceneBase

func _init():
	sceneID = "DomM1LostNpcFight"

func _run():
	if(state == ""):
		playAnimation(StageScene.GivingBirth, "idle")
		aimCameraAndSetLocName("solitary_cell")
		saynn("You've lost the fight!")

		saynn("The guard calls others and together they apprehend you.")

		saynn("Soon after, you are thrown into solitary where you can think about your actions.")

		saynn("You didn't get to any working printers.. looks like you will have to do it all again.")

		saynn("Mission failed!")

		addButton("Continue", "Stop the mission", "stopthemission")
		addButton("Restart", "Try the mission again", "trymissionagain")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "stopthemission"):
		processTime(60*60*3)
		endScene()
		GM.pc.setLocation(GM.pc.getCellLocation())
		GM.main.MS.failCurrentMission()

	if(_action == "trymissionagain"):
		endScene()
		GM.main.MS.restartCurrentMission()
		return

	setState(_action)
