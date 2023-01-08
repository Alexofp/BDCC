extends "res://Scenes/SceneBase.gd"

func _init():
	sceneID = "MedicalHealCryopodScene"

func _run():
	if(state == ""):
		addCharacter("eliza")
		playAnimation(StageScene.Duo, "stand", {npc="eliza", npcAction="stand", bodyState={naked=true}})
		
	if(state == ""):
		aimCameraAndSetLocName("med_researchlab")
		saynn("You let Eliza deduct enough credits for the cryopod treatment. She brings you into the lab and prepares the machine. You give her all your belongings, put on the breathing mask and enter the pod. Eliza presses some buttons and the hi-tech machine begins doing its magic, replacing the air inside with a blue heavy fluid.")

		addButton("Continue", "See what happens next", "continue")

	if(state == "continue"):
		playAnimation(StageScene.Cryopod, "idle", {bodyState={naked=true}})
		
		saynn("Very soon you find yourself floating above the floor, fully submerged. The strange liquid tickles you in all the random spots, including your private bits.")

		saynn("It feels so comfy.. Your eyes close as your mind drifts away into the subconsciousness. All the while your wounds are slowly being healed.")

		addButton("Continue", "See what happens next", "continue1")

	if(state == "continue1"):
		playAnimation(StageScene.Duo, "stand", {npc="eliza", npcAction="stand", bodyState={naked=true}})
		aimCameraAndSetLocName("med_nearlab")
		GM.pc.setLocation("med_nearlab")
		
		saynn("Time passes swiftly. Eventually Eliza wakes you up and turns off the machine before getting you out, healed and refreshed.")

		saynn("[say=eliza]You’re welcome~.[/say]")

		saynn("Doctor Quinn brings you out into the corridor before letting you go.")

		# (scene ends)
		addButton("Leave", "Time to go", "endthescene")
		


func _react(_action: String, _args):
	if(_action in ["continue1"]):
		processTime(60*10)
	
	if(_action == "continue"):
		GM.pc.afterCryopodTreatment()
		processTime(60*60*4)
	
	if(_action == "endthescene"):
		endScene()
		return
		
	setState(_action)
