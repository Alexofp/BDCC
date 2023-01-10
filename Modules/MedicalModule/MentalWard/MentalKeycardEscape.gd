extends "res://Scenes/SceneBase.gd"

func _init():
	sceneID = "MentalKeycardEscape"

func _run():
	#if(state == ""):
		#addCharacter("eliza")
		
	if(state == ""):
		# (if no hands)
		if(GM.pc.hasBlockedHands()):
			saynn("You can’t use your hands at all so you have to.. wiggle.. until the keycard falls out. You grab it with your mouth. Hmm. You look around. Padded walls, floor.. You don’t see any spots to use the card. Was it all for nothing?")

		# (if hands)
		else:
			saynn("You pull out the keycard and look around. Hmm. You look around. Padded walls, floor.. You don’t see any spots to use the card. Was it all for nothing?")

		saynn("You sigh and lean against the padded door. You try to slip the card between the frame and the door but nothing happens.")

		saynn("You become desperate and begin prodding the card at the random spots. Suddenly you hear a beep. And the door starts to open. Seems like there was a card reader under one of the tiles.")

		addButton("Slip out", "Time to run", "slip_out")

	if(state == "slip_out"):
		aimCamera("medical_firstcorridorcross")
		playAnimation(StageScene.Solo, "walk")
		setLocationName("Corridors")
		
		saynn("Seems like no one has noticed you so far, you escape your cell and look around, the mental ward consists of many corridors and rooms, you look from behind one of the corners and notice nurses and guards patrolling them.")

		saynn("You wait for a good moment and rush it to the exit. Or what you think the direction of the exit is.")

		addButton("Continue", "See where you end up", "continue")

	if(state == "continue"):
		aimCamera("med_lobbyne")
		playAnimation(StageScene.Solo, "walk")
		setLocationName("Medical lobby")
		GM.pc.setLocation("med_lobbyne")
		setModuleFlag("MedicalModule", "Mental_PlayerEscaped", true)
		
		# (if no hands)
		if(GM.pc.hasBlockedHands()):
			saynn("Luckily you seem to have found the airlock that leads to the lobby. There is a button on the wall you can’t press with your hands so lean down to its level and boop it with your face. The airlock opens.")

		# (if hands)
		else:
			saynn("Luckily you seem to have found the airlock that leads to the lobby. There is a button on the wall, you press it. The airlock opens.")

		saynn("Sweet freedom. Kinda.")

		addButton("Yay", "You escaped", "endthescene")

func _react(_action: String, _args):

	if(_action == "endthescene"):
		endScene()
		return
	
	setState(_action)
