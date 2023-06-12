extends SceneBase

func _init():
	sceneID = "NuraFirstTimeScene"

func _run():
	if(state == ""):
		saynn("You enter a room that can be described as a robotics lab. Although, this one seems to be completely abandoned. Machinery and equipment is left in disarray, most of the lights are flickering, desperately trying to enlighten the room but failing again and again, instead giving you a sense of unease.")

		saynn("You realize that you probably won't find anything useful here.")

		addButton("Go back", "Return to the main corridor", "go_back")
	if(state == "go_back"):
		saynn("You turn around and proceed to step out of the room. But as you do so, your foot hits something metal and you hear a faint whirring sound. You notice a body lying on the floor! Completely motionless. And naked. The blinking lights make this look like a scene straight out of a horror film.")

		addButton("Look closer", "Did someone die here?", "look_closer")
		addButton("Leave", "Time to leave this place!", "leave")
	if(state == "leave"):
		GM.pc.setLocation("eng_nearnura")
		aimCameraAndSetLocName("eng_nearnura")
		saynn("You quickly make your way the heck out of that room. Phew.")

		addButton("Continue", "Time to go", "endthescene")
	if(state == "look_closer"):
		addCharacter("nura")
		playAnimation(StageScene.Duo, "stand", {npc="nura"})
		saynn("You step closer and realize that it's a humanoid android, lying face down among the rubble. You bend down to get a closer look, and notice that it has a label on its shoulder that you can't read due to many scratches.")

		saynn("As you reach to turn it over, the android's eyes snap open and it quickly stands up, startling you in the process.")

		saynn("The android stares at you and speaks in a calm, robotic voice.")

		saynn("[say=nura]Hello, I am Nur-A. How may I assist you?[/say]")

		saynn("Nur-A, huh.")

		saynn("[say=pc]You're an android?[/say]")

		saynn("You hear servos screeching slightly as the android tries to nod.")

		saynn("[say=nura]My purpose is to provide medical assistance to those in need. I can administer medication, perform basic medical procedures, and monitor vital signs. I am also programmed to provide emotional support to patients, as well as assist in their rehabilitation.[/say]")

		saynn("Her speech is completely emotionless, just word after word without even a single pause.")

		saynn("Interesting. You decide to look around some more to make sure there is no one else around.")

		addButton("Continue", "See what happens next", "endtalk")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "endtalk"):
		setFlag("CellblockModule.FoundNura", true)
		endScene()
		return

	setState(_action)

func getDevCommentary():
	return "Nur-A. Short for Nurse Android if you didn't realize it x3.\n\nNura was just a quick test of a new scene converter that converts raw text from Google Docs into basically complete coded scenes for the game. I wrote her stuff in one day thanks to that.\n\nIs there future for Nura? Maybe.. If you wanna expand her yourself - go ahead, this character is a complete blank slate x3"

func hasDevCommentary():
	return true
