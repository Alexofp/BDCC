extends SceneBase

func _init():
	sceneID = "SocketHelp2Mineshaft"

func _run():
	if(state == ""):
		addCharacter("socket")
		playAnimation(StageScene.Duo, "stand", {npc="socket"})
		saynn("[say=pc]How is your acclimation going?[/say]")

		saynn("Socket stares into her datapad.")

		saynn("[say=socket]Um.. I need to get to the bathroom.[/say]")

		saynn("[say=pc]Sure, I can wait for you here.[/say]")

		saynn("Socket tilts her head at you.")

		saynn("[say=socket]Not in that way, I need to check the ventilation in the bathroom. Could you please show me where it is?[/say]")

		saynn("Wait..")

		saynn("[say=pc]You don't know where it is? How do you.. pee.. then?[/say]")

		saynn("Socket smiles.")

		saynn("[say=socket]I can show you some other time.[/say]")

		saynn("Oh no. She sees your face deforming from disgust and decides to explain herself.")

		saynn("[say=socket]A device! I can show you a device that helps with that.. not show how I pee..[/say]")

		saynn("That makes it.. slightly better.")

		saynn("[say=socket]Although if you want to see me..[/say]")

		saynn("You grab her hand and pull her towards the lift.")

		saynn("[say=pc]Let's go![/say]")

		addButton("Lift", "Enter it", "bring_socket_lift")
	if(state == "bring_socket_lift"):
		aimCameraAndSetLocName("mining_elevator")
		saynn("You and Socket step into the lift. You press the 'cellblock' button and watch as the room begins to move up with a screech.")

		saynn("[say=socket]Thanks![/say]")

		saynn("[say=pc]Do you really need me though?[/say]")

		saynn("She nods many times.")

		saynn("[say=socket]I used to spend most of my time in cyberspace. There are no.. walls there.. you know?[/say]")

		saynn("Makes sense that she is struggling here now.")

		saynn("[say=pc]What does it look like?[/say]")

		saynn("[say=socket]Cyberspace? It's handmade by people. So it's pretty. It's like a spider web that you can run through! I have some implants that help me do that. Wanna see?[/say]")

		saynn("[say=pc]Sure?[/say]")

		saynn("Suddenly, Socket does a vertical split, raising her leg high and showing you her private bits in great detail.")

		saynn("[say=pc]Uh..[/say]")

		saynn("[say=socket]It's in there![/say]")

		saynn("She casually spreads the petals of her pussy and tries her best to show the depths of it. There is something metal in there.. some kind of.. port.. exactly where her cervix should be.")

		saynn("[say=pc]What's that in your.. womb.[/say]")

		saynn("[say=socket]That's the implant![/say]")

		saynn("Technically.. She is not wrong. It is implanted into her.")

		saynn("[say=pc]Does that mean you can't get pregnant?[/say]")

		saynn("Socket blinks many times.")

		saynn("[say=socket]Probably? Is that a problem?[/say]")

		saynn("You shrug. Socket lowers her leg and stands near.")

		saynn("[say=socket]Most places I worked at prohibit breeding. So it was.. kind of an advantage. Helps against people that really want to stretch the unstretchable too![/say]")

		saynn("Right.. One uncomfortable talk later, the lift finally arrives.")

		addButton("Bathroom", "Show Socket where the bathroom is", "socket_goes_bathroom")
	if(state == "socket_goes_bathroom"):
		aimCameraAndSetLocName("main_bathroom1")
		playAnimation(StageScene.Duo, "stand", {npc="socket", npcAction="crawl"})
		saynn("You walk Socket through the main hall and show her where the closest bathroom is. The door opens automatically, inviting you two in.")

		saynn("[say=socket]Thanks! Now I just need access to the vent.[/say]")

		saynn("Socket begins to follow the walls of the big room, trying to find any covered openings in the walls.")

		saynn("[say=socket]Where is it..[/say]")

		saynn("At some point she gets on all fours and starts crawling around, pushing her head into each corner.")

		saynn("[say=pc]Do you need help or?[/say]")

		saynn("[say=socket]I'm good![/say]")

		saynn("She crawls under the sinks, wiggling her ass a lot in the process.")

		saynn("You notice a panel on one of the walls.. a big metal panel that has an orange trim to it.. a trim that says.. maintenance.. You point at it.")

		saynn("[say=pc]Is that it?[/say]")

		saynn("Socket tilts her head.")

		saynn("[say=socket]Yep![/say]")

		addButton("Continue", "See what happens next", "socket_approaches_vent")
	if(state == "socket_approaches_vent"):
		playAnimation(StageScene.Duo, "stand", {npc="socket", flipNPC=true})
		saynn("Socket gets up and approaches it. She tries to use her access badge to open it.. but the maintenance door only buzzes, the motors inside it spinning loudly and fruitlessly.")

		saynn("[say=pc]Looks like it got stuck.[/say]")

		saynn("[say=socket]Yep! I know what to do.[/say]")

		saynn("Socket fetches a giant wrench from her backpack.. and, with one big swing, hits the door.. bonk!")

		saynn("The wrench bounces off the vent.. but the impact was enough to make something inside it shift and unlock the mechanism. The maintenance door opens, presenting.. a small square vent, slightly above floor..")

		saynn("[say=pc]Is that how you solve problems?[/say]")

		saynn("[say=socket]Yes.[/say]")

		saynn("If it works, it works..")

		saynn("[say=socket]That's not the task though. Need to check something inside.[/say]")

		saynn("Socket sticks her head inside the vent and tries to reach something.")

		addButton("Continue", "See what happens next", "socket_gets_stuck")
	if(state == "socket_gets_stuck"):
		# (( Anim here
		saynn("Socket reaches further and further, trying to poke something that's far away with her wrench.")

		saynn("[say=pc]Don't get stuck in it.[/say]")

		saynn("[say=socket]I won't![/say]")

		saynn("She crawls more and more into it. Seconds later..")

		saynn("[say=socket]I think I'm stuck..[/say]")

		saynn("Her wide hips are perfectly squeezed the walls of the vent, making it so she can't crawl in further or out.")


func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "bring_socket_lift"):
		processTime(3*60)

	if(_action == "socket_goes_bathroom"):
		processTime(3*60)

	if(_action == "socket_approaches_vent"):
		processTime(3*60)

	setState(_action)
