extends SceneBase

var luxeTimes = 0

func _init():
	sceneID = "PlayerSlaveryStartLuxeScene"

func _reactInit():
	GM.main.PSH.storePlayersItems()
	addMessage("All your items were safely stored")

func _run():
	if(state == ""):
		playAnimation(StageScene.GivingBirth, "idle", {pc="pc"})
		aimCameraAndSetLocName("market_luxe")
		luxeTimes = getFlag("PlayerSlaveryModule.luxeTimes", 0)
		saynn("Your head is ringing.. everything throbs in time with your heartbeat.. and not in a good way. The black wood under you offers cold support as your mind slowly comes back to senses.")

		saynn("Time to open your eyes.")

		saynn("You force your vision into focus. You're.. in a fancy-looking room. An office desk, rich wooden furniture that spots golden trims, a glowing holo-map.. Wait.. You very much know this room.")

		saynn("You try to get up.. but your collar stops you, yanking you back down. You are leashed to one of the floor's hooks.")

		if (luxeTimes <= 0):
			saynn("[say=pc]Shit.[/say]")

		else:
			saynn("[say=pc]Shit. Not again.[/say]")

		saynn("[say=luxe]Hm.[/say]")

		saynn("You can hear his growly voice.. his steps."+str(" You already know that your fate is sealed.." if luxeTimes >= 1 else "")+"")

		addButton("Continue", "See what happens next", "luxe_comes_in")
	if(state == "luxe_comes_in"):
		playAnimation(StageScene.Duo, "kneel", {npc="luxe", npcAction="sit", bodyState={chains=[["normal", "neck", "scene", "floor"]]} })
		addCharacter("luxe")
		if (luxeTimes <= 0):
			saynn("Luxe steps into the office and just walks past you.")

			saynn("[say=pc]Hey, uh.. someone chained me to the floor here.[/say]")

			saynn("He just sits in his chair. Feels like he didn't notice you.. but he totally did.")

			saynn("[say=luxe]That was me.[/say]")

			saynn("He? Luxe chained you to the corner of his office?")

			saynn("[say=pc]What?[/say]")

			saynn("[say=luxe]So that you wouldn't escape.[/say]")

			saynn("His voice is calm and cold.. while yours has audible nervous notes.")

			saynn("[say=pc]Escape what? Are you making me your bitch?[/say]")

			saynn("He shakes his head subtly.")

			saynn("[say=luxe]I don't need an AlphaCorp slave. Someone else might.[/say]")

			saynn("[say=pc]What are you implying?[/say]")

		else:
			saynn("Luxe steps into the office and just walks past you.")

			saynn("[say=pc]Hello to you too.[/say]")

			saynn("He just sits in his chair. Feels like he didn't notice you.. but he totally did.")

			saynn("[say=luxe]Mhm.[/say]")

			saynn("Luxe takes some time to go through his documents.")

			saynn("[say=pc]You're gonna sell me?[/say]")

			saynn("He gives you a quick but silent glance. Enough was said.")

			saynn("[say=pc]I see..[/say]")

		addButton("Continue", "See what happens next", "luxe_leashes_pc")
	if(state == "luxe_leashes_pc"):
		playAnimation(StageScene.Duo, "kneel", {npc="luxe", bodyState={leashedBy="luxe"}})
		if (luxeTimes <= 0):
			saynn("Luxe gets up and approaches you. One of his powerful hands gets a hold of your hair.. while the second one grabs the chain leash.")

			saynn("[say=luxe]We can do it the easy way. Or we can do it the brutal way.[/say]")

			saynn("You wince.. trying to pull his digits off only makes him dig his claws into your scalp.")

			saynn("[say=pc]Gh.. You are selling me? After what I did?[/say]")

			saynn("His hand pulls on your hair more and more, your pain level increasing.")

			saynn("[say=luxe]I'm selling you. Because that's what I do with slaves.[/say]")

			saynn("His voice rocks through your very core. You are squirming.. the discomfort makes you unable to stay still.. grunts escaping your lips.")

			saynn("[say=luxe]The auction is about to start. Up.[/say]")

		else:
			saynn("After Luxe is done with the documents, he gets up and approaches you. One of his powerful hands gets a hold of your hair.. while the second one grabs the chain leash.")

			saynn("[say=luxe]We can do it the easy way. Or we can do it the brutal way.[/say]")

			saynn("You wince.. trying to pull his digits off only makes him dig his claws into your scalp.")

			saynn("[say=pc]Easy way is fine..[/say]")

			saynn("His hand pulls on your hair more and more, your pain level increasing.")

			saynn("[say=luxe]I will keep selling you into slavery. Until you learn your place.[/say]")

			saynn("His voice rocks through your very core. You are squirming.. the discomfort makes you unable to stay still.. grunts escaping your lips.")

			saynn("[say=luxe]The auction is about to start. Up.[/say]")

		addButton("Follow", "See what happens next", "about_to_start")
	if(state == "about_to_start"):
		playAnimation(StageScene.HangingDuo, "idle", {pc="pc", npc="luxe", bodyState={naked=true}})
		aimCameraAndSetLocName("market_market")
		saynn("You get up and follow Luxe through the dimly-lit corridors.")

		saynn("[say=pc]Where are my things?[/say]")

		saynn("[say=luxe]AlphaCorp has them. I'm selling people, not running a garage sale.[/say]")

		saynn("Brutally honest. At least there is a chance of recovering them..")

		saynn("He brings you onto a stage.. and positions you in the middle of it. Your wrists get chained high above your head, making you stand on your toes.")

		saynn("Your heart is beating harder as you begin to hear voices appearing behind the thick curtains.")

		saynn("Luxe gets onto a small raised platform.. and waits for the right moment.")

		saynn("The auction is about to start.. and you are the first lot.")

		addButton("Auction", "See how it goes", "start_auction")
	if(state == "after_auction"):
		playAnimation(StageScene.Duo, "stand", {npc="luxe", bodyState={leashedBy="luxe"}, flipNPC=true})
		saynn("Everything has happened so quickly..")

		saynn("Luxe approaches you and lowers the chains before grabbing your leash.")

		saynn("Your {pc.feet} get fully planted onto the ground. A million thoughts rush through your head.")

		saynn("[say=luxe]Move.[/say]")

		saynn("Luxe walks you to your new owner.. before handing them the leash.")

		saynn("[say=luxe]Good choice. Enjoy the product.[/say]")

		saynn("The masked figure nods.. and brings you along onto their spaceship.")

		saynn("A few minutes later, you are already cruising the stars.. not as a free person.. but as someone's property.")

		addButton("Continue", "See what happens next", "start_slavery")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "luxe_comes_in"):
		processTime(3*60)

	if(_action == "luxe_leashes_pc"):
		processTime(3*60)

	if(_action == "about_to_start"):
		processTime(3*60)

	if(_action == "start_auction"):
		runScene("PlayerSlaveryAuctionScene", [{}, "luxe"])
		setState("after_auction")
		return

	if(_action == "start_slavery"):
		increaseFlag("PlayerSlaveryModule.luxeTimes")
		endScene()
		runScene("PlayerSlaveryPickScene")
		return

	setState(_action)

func saveData():
	var data = .saveData()

	data["luxeTimes"] = luxeTimes

	return data

func loadData(data):
	.loadData(data)

	luxeTimes = SAVE.loadVar(data, "luxeTimes", 0)
