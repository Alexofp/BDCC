extends "res://Scenes/SceneBase.gd"


func _init():
	sceneID = "MentalWardScene"

func _run():
	if(state == ""):
		addCharacter("eliza")
		
	if(state == ""):
		saynn("You’re stuck in a mental ward cell with nothing to do. Padded walls surround you, even the bulky door has a soft layer to it. The only thing connecting you to the outside world is a small reinforced window and an air vent that’s far above your reach.")
		
		if(GM.pc.hasBlockedHands()):
			saynn("You sit against a wall, constantly hugging yourself. Maybe this place isn’t that bad.")
		else:
			saynn("You sit against a wall, not constantly hugging yourself for once.")
		#addButton("Continue", "Time to go", "endthescene")
		
		var behavior = getFlag(MedicalModule.Mental_PCBehavior, 0.0)
		var sanity = getFlag(MedicalModule.Mental_PCSanity, 0.0)
		
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
			
		addButton("Rest", "Spend some time idling", "rest")
		addButton("Struggle", "Try to struggle out of your restraints", "struggle")
	
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
			GM.pc.addStamina(20)
			processTime(60*60*2)
		return

	if(_action == "endthescene"):
		endScene()
		return
		
	if(_action == "struggle"):
		runScene("StrugglingScene")
		setState("")
		return
	
	setState(_action)

