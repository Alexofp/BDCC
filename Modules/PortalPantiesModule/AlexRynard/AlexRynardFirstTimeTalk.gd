extends "res://Scenes/SceneBase.gd"

func _init():
	sceneID = "AlexRynardFirstTimeTalk"

func _run():
	if(state == ""):
		addCharacter("alexrynard")
		playAnimation(StageScene.Duo, "stand", {npc="alexrynard"})

	if(state == ""):
		saynn("The engineer was busy tinkering with his datapad when you approached him again.")

		saynn("[say=alexrynard]What else do you want, inmate? Go find some work, I’m busy.[/say]")

		saynn("[say=pc]The mines aren’t exactly the most fun place to work.[/say]")

		saynn("The fox looks at you and shrugs once before returning to his datapad. With such a cold response, you don’t have much of a choice but to leave him alone. But as you make your way, you hear him calling you.")

		saynn("[say=alexrynard]Actually, I have something. Come here.[/say]")

		saynn("These words gave you some faith, you spring back to him and wait patiently. The fox puts his datapad away and points at a metal case near him.")

		saynn("[say=alexrynard]Grab it and follow me.[/say]")

		saynn("Huh. You’re not sure if you wanna obey him but you can at least look at the case. It’s not too big but it just feels bulky and heavy, spotting lots of sharp angles and a few orange lines to show how dangerous the contents are. You try to pick it up by the handle but struggle.")

		saynn("[say=pc]Why is it so heavy?[/say]")

		saynn("[say=alexrynard]Careful with it. And I don’t have all day.[/say]")

		addButton("Obey", "Do as he says", "obey")
		addButton("Refuse", "You don’t wanna do it", "refuse")


	if(state == "obey"):
		saynn("You carefully grab the case and hold it. Foxy shows you the way.")

		saynn("[say=alexrynard]Follow.[/say]")

		saynn("[say=pc]Why can’t you do it?[/say]")

		saynn("[say=alexrynard]Saving my back.[/say]")

		saynn("Huh, you do hear a slight mechanical noise coming from his spine.")

		addButton("Continue", "See what happens next", "continue")

	if(state == "refuse"):
		playAnimation(StageScene.Duo, "defeat", {npc="alexrynard"})
		
		saynn("You raise the case a bit just to drop it after. The foxy sighs audibly and rolls his eyes.")

		saynn("[say=pc]I carried enough today, you can do it yourself.[/say]")

		saynn("[say=alexrynard]Now it’s an order. Pick it up.[/say]")

		saynn("You clench your fist and step towards him just to be met with a sudden shock that drops you to your knees. The guy holds his digit on a remote until he hears a cry of pain coming from your lips. You grab onto your warm collar and pant heavily. Foxy crouches nearby.")

		saynn("[say=alexrynard]I don’t care about your wellbeing, honestly, I don’t. Wanna lose all your credits? Wanna get locked into stocks?[/say]")

		saynn("You shake your head, the path of least resistance seems like the only one at the moment. Foxy pats you on the back.")

		saynn("[say=pc]Mean fucker..[/say]")

		saynn("[say=alexrynard]Am I? Huh. You clearly don’t understand who you are yet.[/say]")

		saynn("You finally catch your breath and get up. Picking up that case is even more tricky now that your muscles are all tired. But you just about manage and then follow the foxy. Strange, you hear a slight mechanical noise coming from his spine as he steps.")

		addButton("Continue", "See what happens next", "continue")

	if(state == "continue"):
		playAnimation(StageScene.Duo, "stand", {npc="alexrynard"})
		aimCameraAndSetLocName("eng_workshop")
		
		saynn("You carry the case and follow the guy through some corridors. The yellow colors suggest that this area is somehow related to engineering. Indeed, you walk past the lobby and enter some kind of workshop. Lots of tables with spare parts, lots of machinery.")

		saynn("[say=alexrynard]Leave it here.[/say]")

		saynn("You leave the case on one of the workstations and take a step back.")

		saynn("[say=pc]You never said what is inside it.[/say]")

		saynn("[say=alexrynard]A bluespace wormhole creation device. A prototype. One of the first stable ones, still needs testing.[/say]")

		saynn("Huh. Instead of leaving, you decide to stay and watch him a bit. Foxy inputs some code to make the case unlock and grabs a few things out of it. Mostly some kind of tube-like devices and a few strange crystals. Foxy then looks at you.")

		saynn("[say=alexrynard]Oh yeah, right.[/say]")

		saynn("He throws some kind of chip at you. You manage to catch it and look at it from up close.")

		saynn("[say=alexrynard]Your credits for the work.[/say]")

		saynn("Huh, your collar seems to be able to accept such chips. You insert it into the slot and hear it beep, probably transfering credits to your inmate number. It wasn’t much but you are happy either way.")

		# (receive 2 credits)

		# (scene ends)

		addButton("Continue", "That was easy", "endthescene")


func _react(_action: String, _args):
	if(_action == "continue"):
		GM.pc.addCredits(2)
		GM.pc.setLocation("eng_workshop")
		
	if(_action == "refuse"):
		GM.pc.addPain(100)
		addMessage("Ow, that really hurt")
	
	if(_action == "endthescene"):
		endScene()
		return

	setState(_action)

