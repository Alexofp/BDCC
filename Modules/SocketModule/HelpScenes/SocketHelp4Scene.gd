extends SceneBase

var hasAccess = false
var knowsBull = false

func _init():
	sceneID = "SocketHelp4Scene"

func _run():
	if(state == ""):
		addCharacter("socket")
		playAnimation(StageScene.Duo, "stand", {npc="socket"})
		saynn("You feel like helping a fennec today.")

		saynn("[say=pc]How is your tasklist looking today, Socket? Anything I can help with?[/say]")

		saynn("[say=socket]Oh! Yes, there is something. Another vent to check![/say]")

		saynn("She sounds awfully excited for something so.. boring.")

		saynn("[say=pc]You're gonna get stuck in it again?[/say]")

		saynn("Socket giggles and shrugs.")

		saynn("[say=socket]Depends on how big it is, let's go![/say]")

		saynn("It's never that easy with her, is it.")

		addButton("Follow", "See where she brings you", "socket_walks_into_gym")
	if(state == "socket_walks_into_gym"):
		playAnimation(StageScene.Duo, "walk", {npc="socket", flipNPC=true, npcAction="walk"})
		aimCameraAndSetLocName("hall_elevator")
		GM.pc.setLocation("gym_secret")
		hasAccess = getFlag("FightClubModule.BulldogBypassed", false)
		knowsBull = getFlag("FightClubModule.BulldogFirstTimeHappened", false)
		saynn("You enter the lift with Socket and ride it up to the cellblock.")

		saynn("[say=socket]Seems to be a special vent. I tried looking for it myself but couldn't find it.[/say]")

		saynn("[say=pc]Where is it?[/say]")

		saynn("[say=socket]Somewhere in the gym![/say]")

		if (knowsBull):
			saynn("You realize that you might know what vent she is talking about.")

		else:
			saynn("You think about it for a bit.. Nah, there aren't vents that you know about in the gym.")

		addButton("Follow", "Follow Socket more", "follow_socket_more")
	if(state == "follow_socket_more"):
		playAnimation(StageScene.Duo, "stand", {npc="socket"})
		aimCameraAndSetLocName("gym_nearbathroom")
		saynn("Socket gets a little lost while walking you through the yard.. but eventually you manage to find the gym.")

		saynn("It's as busy of a place as ever. As soon as Socket takes a single step inside, many eyes instantly get glued to her and her.. exposed forms.")

		saynn("[say=socket]Hey everyone! Don't mind us, just doing some maintenance.[/say]")

		saynn("You feel like you only have so much time before they get horny enough so you better work quickly.")

		saynn("[sayMale]How about you do some maintenance on my COCK![/sayMale]")

		saynn("The audience chuckles hearing that. Socket turns towards the source of the brave voice.")

		saynn("[say=socket]Sure! Let's do some tinkering![/say]")

		saynn("Socket whips her giant wrench out.. and the crowd goes quiet.")

		saynn("[say=socket]Where are you?[/say]")

		saynn("[sayMale]Uh.. I changed my mind.[/sayMale]")

		saynn("Socket turns towards you and shrugs. You shrug back.")

		saynn("[say=socket]Let's look for the vent.[/say]")

		if (knowsBull):
			saynn("You are pretty sure you know which one she is talking about.. but maybe there is another one nearby. Most of the walls here are made up out of greenery which obviously can not house a vent.")

			saynn("You look everywhere, near the gym equipment, under the yoga mats, in the corners. Sadly, there was nothing interesting, just sweaty inmates staring at Socket's ass as she was crawling around everywhere again.")

			saynn("[say=socket]Found anything?[/say]")

			saynn("Might as well tell her and see what happens.")

			saynn("[say=pc]I think you're looking for that one.[/say]")

			saynn("You point at the wall behind some bushes. Wall that has a hidden big hatch on it. A hatch that is protected by a certain someone.")

			saynn("[say=socket]Yes![/say]")

		else:
			saynn("Most of the walls here are made up out of greenery which obviously can not house a vent.")

			saynn("You look everywhere, near the gym equipment, under the yoga mats, in the corners. Sadly, there was nothing interesting, just sweaty inmates staring at Socket's ass as she was crawling around everywhere again.")

			saynn("[say=socket]Found anything?[/say]")

			saynn("[say=pc]Not yet.[/say]")

			saynn("Huh. You try looking behind some tall bushes.. and find something. A wall. But not just a wall. A wall that is guarded by some inmate. He is standing right in front of some hatch.")

			saynn("[say=pc]This might be what you're looking for.[/say]")

			saynn("[say=socket]Yes![/say]")

		addButton("Continue", "See what happens next", "bulldog_talk")
	if(state == "bulldog_talk"):
		addCharacter("bulldog")
		playAnimation(StageScene.Duo, "stand", {pc="socket", npc="bulldog"})
		saynn("You and Socket approach him.")


func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "socket_walks_into_gym"):
		processTime(5*60)

	if(_action == "follow_socket_more"):
		processTime(5*60)

	if(_action == "bulldog_talk"):
		processTime(5*60)

	setState(_action)

func saveData():
	var data = .saveData()

	data["hasAccess"] = hasAccess
	data["knowsBull"] = knowsBull

	return data

func loadData(data):
	.loadData(data)

	hasAccess = SAVE.loadVar(data, "hasAccess", false)
	knowsBull = SAVE.loadVar(data, "knowsBull", false)
