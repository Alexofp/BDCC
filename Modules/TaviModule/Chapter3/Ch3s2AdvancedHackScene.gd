extends "res://Scenes/SceneBase.gd"

func _init():
	sceneID = "Ch3s2AdvancedHackScene"

func _run():

	if(state == ""):
		saynn("You take a look at a sturdy safe. It doesn’t even have your usual twists and nobs, it’s just a heavy-looking metal box with a door that doesn’t even have a handle. But you notice some wires connecting it to one of the consoles here. Cutting them obviously wouldn’t accomplish anything so you have to hack the console if you want to see what’s inside.")

		saynn("You get a feeling that this safe doesn’t have anything too important but it could be a nice practice for your hacking skills. This console is probably much harder to hack though.")

		saynn("Do you wanna try hacking this console?")

		addButton("Yes", "Try to hack it", "screen")
		addButton("Nah", "You did enough hacking", "endthescene")


	if(state == "after_completed"):
		setFlag("TaviModule.ch3CompletedDoorHack", true)
		
		saynn("Success! You hear mechanical noises coming from the safe as the gears inside begin to turn against each other, slowly opening the door and revealing you the contents..")

		# (scene ends)
		addButton("Look", "See what’s inside", "endthescene")
		#addButton("Look at", "See what’s inside", "look_at")

func _react(_action: String, _args):
	if(_action == "screen"):
		runScene("ComputerSimScene", ["TaviEngineeringSafeComputer"], "computerhack")
		setState("after_completed")
		return

	if(_action == "endthescene"):
		endScene()
		return

	setState(_action)

func _react_scene_end(_tag, _result):
	if(_tag == "computerhack"):
		if(_result is Array):
			if(_result[0] == true):
				processTime(10*60)
				addMessage("You got 50 credits! But there is something else too..")
				addItemToSavedItems(GlobalRegistry.createItem("HorsecockDildo"))
				GM.pc.addCredits(50)
				addExperienceToPlayer(100)
				setState("after_completed")
				setFlag("TaviModule.ch3CompletedSafeHack", true)
				return
		endScene()
