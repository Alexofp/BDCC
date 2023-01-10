extends "res://Scenes/SceneBase.gd"

func getPossibleScenes():
	var newScenes = []
	var reusedScenes = []
	
	var tentacles = getModuleFlag("MedicalModule", "Mental_ExpTentacles", 0)
	if(tentacles >= 1):
		reusedScenes.append("MentalLatexParasite")
	else:
		newScenes.append("MentalLatexParasite")
	
	
	var obeyDrug = getModuleFlag("MedicalModule", "Mental_ExpObeyDrug", 0)
	if(obeyDrug >= 2):
		reusedScenes.append("MentalObedienceDrug2")
		reusedScenes.append("MentalObedienceDrug1")
	elif(obeyDrug == 1):
		newScenes.append("MentalObedienceDrug2")
		reusedScenes.append("MentalObedienceDrug1")
	else:
		newScenes.append("MentalObedienceDrug1")
		
	var ghostHands = getModuleFlag("MedicalModule", "Mental_ExpGhostHands", 0)
	if(ghostHands >= 3):
		reusedScenes.append("MentalGhostHands3")
		reusedScenes.append("MentalGhostHands2")
		reusedScenes.append("MentalGhostHands1")
	elif(ghostHands >= 2):
		newScenes.append("MentalGhostHands3")
		reusedScenes.append("MentalGhostHands2")
		reusedScenes.append("MentalGhostHands1")
	elif(ghostHands >= 1):
		newScenes.append("MentalGhostHands2")
		reusedScenes.append("MentalGhostHands1")
	else:
		newScenes.append("MentalGhostHands1")
		
	if(newScenes.size() > 0):
		return newScenes
	return reusedScenes

func _init():
	sceneID = "MentalWardScene"

func _reactInit():
	GM.pc.setLocation("medical_paddedcell_player")

func _run():
	#if(state == ""):
		#addCharacter("eliza")
		
	if(state == ""):
		aimCameraAndSetLocName("medical_paddedcell_player")
		playAnimation(StageScene.Solo, "kneel")
		GM.pc.setLocation("medical_paddedcell_player")
		
		saynn("You’re stuck in a mental ward cell with nothing to do. Padded walls surround you, even the bulky door has a soft layer to it. The only thing connecting you to the outside world is a small reinforced window and an air vent that’s far above your reach.")
		
		if(GM.pc.hasBlockedHands()):
			saynn("You sit against a wall, constantly hugging yourself. Maybe this place isn’t that bad.")
		else:
			saynn("You sit against a wall, not constantly hugging yourself for once.")
		#addButton("Continue", "Time to go", "endthescene")
		
		var behavior = getModuleFlag("MedicalModule", "Mental_PCBehavior", 0.0)
		var sanity = getModuleFlag("MedicalModule", "Mental_PCSanity", 0.0)
		
		say("Your behavior: ")
		if(behavior <= 0.1):
			sayn("Staff thinks your behavior is awful")
		elif(behavior <= 0.3):
			sayn("You’re constantly being monitored by staff")
		elif(behavior <= 0.45):
			sayn("Staff is very careful with you")
		elif(behavior <= 0.7):
			sayn("Staff watches you")
		elif(behavior <= 0.8):
			sayn("Staff doesn’t track you very much")
		elif(behavior <= 0.9):
			sayn("You’re on very good terms")
		else:
			sayn("You’re a perfect test subject")
			
		say("Your sanity: ")
		if(sanity <= 0.1):
			sayn("Completely spaced out")
		elif(sanity <= 0.4):
			sayn("Very low")
		elif(sanity <= 0.6):
			sayn("Recovering")
		elif(sanity <= 0.8):
			sayn("Almost recovered")
		else:
			sayn("Clear mind")
			
		addButton("Wait", "Spend some time idling", "rest")
		addButton("Struggle", "Try to struggle out of your restraints", "struggle")
		if(getModuleFlag("MedicalModule", "Mental_HasKeycard", false)):
			addButton("Escape", "Use the keycard to escape", "doescape")
	
	if(state == "sleeping"):
		saynn("The light in your cell has turned off, signaling that it’s late. You lay down on the padded floor and try to get some sleep.")
		
		addButton("Sleep", "Don’t even have a pillow", "dosleep")
		
	if(state == "dosleep"):
		saynn("You sleep in your cell.")
		
		saynn("Welcome to day "+str(GM.main.getDays())+" of your sentence")
		
		addButton("Continue", "Time to wake up", "")

	if(state == "resting"):
		saynn("You spend some time idling in your cell..")
		
		addButton("Continue", "Isn't this cell nice", "afterrest")

func _react(_action: String, _args):
	if(_action == "afterrest"):
		# Random scene checks
		if(!getModuleFlag("MedicalModule", "Mental_CheckupHappened", false) && GM.main.getTime() >= 9*60*60):
			setModuleFlag("MedicalModule", "Mental_CheckupHappened", true)
			
			if(isPCWearingAStraitjacket()):
				if(getModuleFlag("MedicalModule", "Mental_PCSanity", 0.0) >= 1.0):
					runScene("MentalCheckupFinal", [], "finalCheckup")
				else:
					# Random checkup scene
					var possibleScenes = ["MentalCheckup1", "MentalCheckup2"]
					
					runScene(RNG.pick(possibleScenes))
			else:
				runScene("MentalCheckupNoJacket", [], "mentalnojacketfight")
			
			setState("")
			return
		
		if(!getModuleFlag("MedicalModule", "Mental_ExperimentHappened", false) && GM.main.getTime() >= 14*60*60):
			setModuleFlag("MedicalModule", "Mental_ExperimentHappened", true)
			
			if(!isPCWearingAStraitjacket()):
				runScene("MentalCheckupNoJacket", [], "mentalnojacketfight")
			else:
				# Run random experiment scene
				var possibleScenes = getPossibleScenes()
				assert(possibleScenes.size() > 0)
				runScene(RNG.pick(possibleScenes))
			
			setState("")
			return
		
		if(!getModuleFlag("MedicalModule", "Mental_ShowerHappened", false) && GM.main.getTime() >= 19*60*60):
			setModuleFlag("MedicalModule", "Mental_ShowerHappened", true)
			
			if(isPCWearingAStraitjacket()):
				runScene("MentalShower")
			else:
				runScene("MentalCheckupNoJacket", [], "mentalnojacketfight")
			
			setState("")
			return
		
		setState("")
		return
		
	
	if(_action == "dosleep"):
		GM.main.startNewDay()
		GM.pc.afterSleepingInBed()
	
	if(_action == "rest"):
		if(GM.main.getTime() >= 21*60*60):
			setState("sleeping")
		else:
			setState("resting")
			processTime(60*60*2)
		MedicalModule.addPCSanity(RNG.randf_range(0.02, 0.04))
		GM.main.showLog()
		return

	if(_action == "endthescene"):
		endScene()
		return
		
	if(_action == "struggle"):
		runScene("StrugglingScene", [], "struggle")
		setState("")
		return
		
	if(_action == "doescape"):
		runScene("MentalKeycardEscape")
		setState("")
		endScene()
		return
	
	setState(_action)

func isPCWearingAStraitjacket():
	if(GM.pc.getInventory().hasItemIDEquipped("LatexStraitjacket")):
		return true
	return false

func _react_scene_end(_tag, _result):
	if(_tag == "struggle"):
		_react("rest", [])
	
	if(_tag == "finalCheckup"):
		if(_result.size() > 0):
			var res = _result[0]
			
			if(res == "escape" || res == "good"):
				if(res == "good"):
					GM.pc.getInventory().unequipSlotRemoveIfRestraint(InventorySlot.Body)
				
				endScene()
				
			if(res == "sleep"):
				_react("dosleep", [])
	
	if(_tag == "mentalnojacketfight"):
		if(_result.size() > 0):
			var shouldStop = _result[0]
			if(shouldStop):
				endScene()

func getDebugActions():
	return [
		{
			"id": "instantEscape",
			"name": "Instant escape",
			"args": [
			],
		},
	]

func doDebugAction(_id, _args = {}):
	if(_id == "instantEscape"):
		endScene()
		GM.pc.setLocation("med_lobbymain")
		GM.main.reRun()
