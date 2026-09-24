extends SceneBase

func _init():
	sceneID = "DomM3LostNpcFight"

func _run():
	if(state == ""):
		playAnimation(StageScene.GivingBirth, "idle")
		aimCameraAndSetLocName("medical_paddedcell_player")
		saynn("You've lost the fight!")

		saynn("Multiple nurses come soon after and apprehend you.")

		saynn("Then, you are thrown into the padded room where you don't have to worry about much anymore for a while. Whatever it is that they injected you with, it makes you feel nice and calm.")

		saynn("You failed to steal the lab stuff for Ferri. Looks like you will have to try again.")

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
