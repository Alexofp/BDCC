extends "res://Scenes/SceneBase.gd"

var savedBehavior = 0.0

func _init():
	sceneID = "MentalCheckup1"

func _run():
	if(state == ""):
		addCharacter("eliza")
		playAnimation(StageScene.Duo, "stand", {npc="eliza"})
		
	if(state == ""):
		saynn("You hear a static noise as the intercom turns on.")

		# (if best behaviour)
		if(getModuleFlag("MedicalModule", "Mental_PCBehavior", 0.0) >= 0.8):
			saynn("[say=eliza]How is my cutie doing?[/say]")

			saynn("[say=pc]Yeah, I’m doing good.[/say]")

		# (if medium behaviour)
		elif(getModuleFlag("MedicalModule", "Mental_PCBehavior", 0.0) >= 0.3):
			saynn("[say=eliza]How are we doing, test subject?[/say]")

			saynn("[say=pc]I’m okay.[/say]")

		# (if bad behaviour)
		else:
			saynn("[say=eliza]Are you gonna behave today, inmate? Still there?[/say]")

			saynn("[say=pc]Sure, whatever.[/say]")

		saynn("[say=eliza]I will open the door in a second, I want you to stand away from it.[/say]")

		saynn("Eliza takes a look through the little window to make sure you’re there and then starts the door opening sequence. It’s bulky so it takes some time to unlock all the mechanical locks after which the main motors kick in and the door slowly opens, revealing the outside corridor with Eliza blocking the door frame.")

		addButton("Continue", "See what happens next", "continue")

	if(state == "continue"):
		saynn("[say=eliza]Let’s check on your behavior. I can’t let unwilling test subjects anywhere close to the equipment.[/say]")

		saynn("Eliza enters the cell, she is wearing her normal white labcoat, long skirt and a green top. She has a digitigrade posture, her bare feet have big animal toes, black transparent thighs cover her legs. She is sipping coffee, clearly it’s a part of her routine.")

		saynn("The doctor is watching you, sitting there, against a wall, helpless with that straitjacket on. She fixes her glasses and puts on a cunning grin.")

		saynn("[say=eliza]Crawl to me. Kneel before me.[/say]")

		addButton("Obey", "Do as she orders. Behavior+", "obey")
		addButton("Refuse", "You are not gonna do that! Behavior-", "refuse")

	if(state == "refuse"):
		saynn("You shake your head.")

		saynn("[say=pc]I won’t do that.[/say]")

		# (if was good behavior)
		if(savedBehavior >= 0.8):
			saynn("[say=eliza]Why is that? Is my cutie being a brat? Well then, no pets for you.[/sat]")

		# (if medium)
		elif(savedBehavior >= 0.3):
			saynn("[say=eliza]That’s disappointing. Guess you don’t want head pats from me.[/say]")

		# (if bad behaviour)
		else:
			saynn("[say=eliza]I know you wouldn’t. Too stubborn.[/say]")

		saynn("[say=eliza]Gonna check others now. You stay right here.[/say]")

		saynn("Eliza leaves you alone and presses the button to shut the door.")

		addButton("Continue", "See what happens next", "endthescene")

	if(state == "obey"):
		playAnimation(StageScene.Duo, "kneel", {npc="eliza"})
		
		saynn("You lay on the floor and wiggle towards Eliza’s legs. She smirks watching you struggle with your bound hands. You prop yourself up using a nearby wall and get on your knees. You tilt your head down, showing obedience.")

		saynn("[say=eliza]Very good~.[/say]")

		saynn("Eliza leans down and lays her hand on your head. She pets you and scritches behind the ear.")

		saynn("[say=eliza]Gonna go check on others now.[/say]")

		saynn("Eliza leaves the cell and presses the button to close the door.")
		
		addButton("Continue", "See what happens next", "endthescene")

func _react(_action: String, _args):

	if(_action == "refuse"):
		savedBehavior = getModuleFlag("MedicalModule", "Mental_PCBehavior", 0.0)
		
		MedicalModule.addPCBehavior(-0.1)
		
	if(_action == "obey"):
		MedicalModule.addPCBehavior(0.05)

	if(_action == "endthescene"):
		endScene()
		return

	
	setState(_action)

func saveData():
	var data = .saveData()
	
	data["savedBehavior"] = savedBehavior
	
	return data
	
func loadData(data):
	.loadData(data)
	
	savedBehavior = SAVE.loadVar(data, "savedBehavior", 0.0)
