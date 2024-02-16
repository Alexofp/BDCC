extends SceneBase

func _init():
	sceneID = "SocketHelp5Scene"

func _run():
	if(state == ""):
		addCharacter("socket")
		playAnimation(StageScene.Duo, "stand", {npc="socket"})
		saynn("Maybe Socket has some other things she needs help with.")

		saynn("[say=pc]Need any help today?[/say]")

		saynn("She looks at her datapad and smiles.")

		saynn("[say=socket]We actually went through the whole backlog of tasks! Everything is done! Thank you![/say]")

		saynn("[say=pc]So.. that means..[/say]")

		saynn("Her smile fades quickly after that.")

		saynn("[say=socket]Aw.. yeah.. Just the boring maintenance left.[/say]")

		saynn("Socket scratches her nose, the awkward silence begins to settle in.")

		saynn("But then her datapad beeps.")

		saynn("[say=socket]Oh! A few cameras aren't responding. Canteen.. bathroom.. laundry.[/say]")

		saynn("[say=pc]Three at the same time?[/say]")

		saynn("Socket shrugs.")

		saynn("[say=socket]You know what everyone says, some things are just designed to break![/say]")

		saynn("Hard to reason with that logic.")

		saynn("[say=socket]Shouldn't take long![/say]")

		addButton("Follow", "See where she brings you", "first_camera")
	if(state == "first_camera"):
		aimCameraAndSetLocName("hall_canteen")
		saynn("You arrive at the canteen, a spacious room with plenty of tables and uncomfortable benches for inmates to use while they consume their food. There are a bunch of inmates here at all times. Today is not any different, you catch a few gazes.. hungry ones.. hungry for something for sure.")

		saynn("Socket steps to the corner and starts inspecting the bulky reinforced security camera that doesn't seem to respond, its small little red LED not shining like it usually does.")

		saynn("The camera is pretty high up so you move one of the free tables to it and help Socket climb it.")

		saynn("[say=pc]Any signs of what broke it?[/say]")

		saynn("The fennec hums while watching the camera from up close.")

		saynn("[say=socket]Not sure. It might just be old. What do you think?[/say]")

		saynn("It does seem to have some damage.. but it's hard to see from afar, you gotta get closer.")

		addButton("Get closer", "Take a better look", "first_better_look")
	if(state == "first_better_look"):
		playAnimation(StageScene.SexStealth, "tease", {pc="pc", npc="socket"})
		saynn("You climb the table and take a better look. It doesn't have much space on it so you have to watch over Socket's shoulder. Hm..")

		saynn("The camera certainly looks like someone has thrown a chair at it, the reinforced frame is all dented and the lens is smashed.")

		saynn("[say=pc]Yeah, it wasn't like this before.[/say]")

		saynn("Socket nods.")

		saynn("[say=socket]Could you open my backpack please? I think I brought the required parts. Bending over many times on this unstable.. table.. seems dangerous.[/say]")

		saynn("Yeah, the less movement, the better.")

		addButton("Backpack", "Help Socket", "first_backpack")
	if(state == "first_backpack"):
		playAnimation(StageScene.SexStealth, "teasebusy", {pc="pc", npc="socket"})
		saynn("You open the zipper on her backpack, revealing.. lots of tools and spare parts, unsurprisingly. The big wrench is there as well..")

		saynn("[say=pc]Yeah, what do you need?[/say]")

		saynn("Socket starts to tell you which tool or thing she needs. You pass it to her and watch her work.")

		addButton("Just watch", "See what happens next", "first_justwatch")
		addButton("Grope casually", "Might as well", "first_grope")
	if(state == "first_justwatch"):
		saynn("You just keep watching Socket work, disassembling the broken camera and repairing it. While doing so, she keeps rubbing her round butt against you and your crotch.. making it very hard to focus. And yet, you have to be there to pass her what she needs.")

		saynn("[say=socket]Oh, I got a great idea![/say]")

		saynn("[say=pc]What's that?[/say]")

		saynn("[say=socket]I can check the camera's feed and see who did that.[/say]")

		saynn("Sounds like a plan.")

		addButton("Continue", "See what happens next", "socket_puts_on_visor")
	if(state == "first_grope"):
		# (( Anim maybe
		playAnimation(StageScene.SexStealth, "teasebusy", {pc="pc", npc="socket", bodyState={hard=true}})
		saynn("You put your hands on Socket and casually grope and fondle her butt and play with her breasts while she continues her work, disassembling and repairing the camera. Occasionally you have to stop and give Socket the tool that she needs.. but then it's back to groping.")

		if (GM.pc.hasReachablePenis()):
			saynn("You're getting quite hard from this.. but she doesn't seem to mind your member poking her rear.")

		saynn("[say=socket]Oh, I got a great idea![/say]")

		saynn("[say=pc]What's that?[/say]")

		saynn("[say=socket]I can check the camera's feed and see who did that.[/say]")

		saynn("Sounds like a plan.")

		addButton("Continue", "See what happens next", "socket_puts_on_visor")
	if(state == "socket_puts_on_visor"):
		playAnimation(StageScene.SexStealth, "teasebusy", {pc="pc", npc="socket"})
		saynn("[say=pc]Do we have to go to one of those rooms that have lots of screens?[/say]")

		saynn("[say=socket]No, watch me![/say]")

		saynn("Socket reaches for her VR headset.. and pulls a little wire out of it. She then connects it to the camera's exposed electric board.")

		saynn("[say=socket]Lots of static.. I have to go through all the footage, it will take some time..[/say]")

		saynn("You do have time..")

		saynn("While Socket is searching for the right moment.. Maybe you can play with her? Yeah, there are lots of eyes on you.. but maybe you can try to be stealthy about it..")

		addButton("Stay horny", "Avoid doing anything with Socket at all costs", "first_stay_horny")
		addButton("Stealth fingering", "Have some fun with Socket", "first_stealth_fingering")
		addButtonWithChecks("Stealth sex", "Have some fun with Socket", "first_stealth_sex", [], [[ButtonChecks.HasReachablePenis]])
	if(state == "first_stay_horny"):
		saynn("It does take some willpower.. a lot of willpower.. but you manage to avoid touching Socket.")

		saynn("You just watch her.. while she watches the camera's stored footage..")

		saynn("[say=socket]Oh, I think I see it. Hold on.[/say]")

		saynn("She presses some buttons on her headset and turns her head around a lot.")

		saynn("[say=socket]Yep.. it's one of the inmates.[/say]")

		saynn("[say=pc]Anyone that we know?[/say]")

		saynn("She shrugs.")

		saynn("[say=socket]I don't recognize them.. I will mark them for punishment though, no one is allowed to vandalize the station's property![/say]")

		saynn("She sure likes the station..")

		saynn("After that, she takes off her headset and finishes repairing the camera. The little red LED lights up as she turns it on.")

		saynn("[say=socket]Yay. Now to the next one.[/say]")

		saynn("Somehow you can guess what happened to the other two..")

		addButton("Follow", "Follow Socket to the next camera", "second_camera")
	if(state == "second_camera"):
		aimCameraAndSetLocName("main_dressing1")
		playAnimation(StageScene.Duo, "stand", {npc="socket"})
		saynn("You and Socket enter the bathroom. Seems to be quiet.")

		saynn("The camera near the stalls works so you walk further into the dressing room.")

		saynn("[say=socket]There it is![/say]")

		saynn("Socket walks up to the broken camera. The damage on it.. looks similar. No surprises there.")

		saynn("[say=pc]Someone doesn't want them to be seen.[/say]")

		saynn("[say=socket]Yeah, weird.[/say]")


func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "first_camera"):
		processTime(5*60)

	if(_action == "first_better_look"):
		processTime(5*60)

	if(_action == "first_backpack"):
		processTime(5*60)

	if(_action == "first_justwatch"):
		processTime(10*60)
		GM.pc.addLust(30)

	if(_action == "first_grope"):
		processTime(10*60)

	if(_action == "socket_puts_on_visor"):
		getCharacter("socket").getInventory().forceEquipRemoveOther(GlobalRegistry.createItem("SocketVisor"))

	if(_action == "first_stay_horny"):
		processTime(5*60)
		GM.pc.addLust(30)
		GM.pc.addStamina(-30)

	if(_action == "second_camera"):
		getCharacter("socket").resetEquipment()

	setState(_action)
