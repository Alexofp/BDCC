extends "res://Scenes/SceneBase.gd"

func _init():
	sceneID = "Ch3s2ControlRoomScene"

func _run():

	if(state == ""):
		saynn("This room is filled with consoles and blinking lights. You quickly scan the labels, looking for the one that controls the station’s schedules. You spot a promising one and make your way over, keeping an eye out for any engineers or guards that might come in.")

		saynn("You reach an old-looking console that has a screen with a green back-lit and a visible scanline going through it every few seconds. There is a fancy clicky keyboard you can use but what command should you type?")

		saynn("Time to do some hacking.")

		addButton("Screen", "Look at the screen", "screen")


	if(state == "after_completed"):
		setFlag("TaviModule.ch3CompletedDoorHack", true)
		
		saynn("Seems like you did it. No way to check but to go back to Tavi. You carefully scan the room for the last time. Nothing interesting apart from another console you might try tinkering with, this one seems to be connected to a big safe that’s inside a wall.")

		# (scene ends)
		addButton("Continue", "See what happens next", "endthescene")

func _react(_action: String, _args):
	if(_action == "screen"):
		runScene("ComputerSimScene", ["TaviEngineeringComputer"], "computerhack")
		setState("after_completed")
		return

	if(_action == "endthescene"):
		endScene()
		return

	setState(_action)

func _react_scene_end(_tag, _result):
	if(_tag == "computerhack"):
		processTime(10*60)
		addMessage("Task updated")
		addExperienceToPlayer(100)
		setState("after_completed")
	
