extends "res://Scenes/SceneBase.gd"

func _init():
	sceneID = "AlexRynardPantiesQuestReturnFleshlightsScene"

func _run():
	if(state == ""):
		addCharacter("alexrynard")
		playAnimation(StageScene.Duo, "stand", {npc="alexrynard"})

	if(state == ""):
		# (You return him the things. Foxy thanks you and gives some credits)

		# (He asks if you wanna keep the panties too.)

		saynn("You place the fleshlights onto foxy’s table with a loud thump.")

		saynn("[say=pc]Here.[/say]")

		saynn("Foxy raises his brow as he looks at you and then at the sex toys.")

		saynn("[say=alexrynard]You found them?[/say]")

		saynn("[say=pc]No thanks to you.[/say]")

		saynn("He grabs one and tinkers with its internals, switching off some hidden switch with a screwdriver.")

		saynn("[say=alexrynard]Here, unlocked.[/say]")

		saynn("[say=pc]You can’t imagine what I went through.[/say]")

		saynn("[say=alexrynard]In fact, I can. You forgot that they are monitored. The data that got collected was quite valuable already for the R&D folks.[/say]")

		saynn("You can’t help but to frown. Does that mean they monitored your every sexual intercourse and didn’t do anything?")

		addButton("Continue", "See what happens next", "continue")

	if(state == "continue"):
		saynn("[say=pc]So what now?[/say]")

		saynn("[say=alexrynard]You can keep them if you want. It’s a rough prototype anyway, it served its purpose.[/say]")

		saynn("You tug at your panties, they don’t seem to be ‘glued’ to your crotch anymore.")

		addButton("Keep them", "You kinda like them", "keep_them")
		addButton("Take them off", "(Ends portal panties content) Give him the portal panties", "take_them_off")


	if(state == "keep_them"):
		# (You ask to keep the panties. He agrees but says that there might be more tests then)

		# (You shrug and secretly excited about that)

		saynn("You sway your {pc.masc} hips to the sides a bit while holding onto the sides of the panties.")

		saynn("[say=pc]I guess I can keep them.[/say]")

		saynn("The guy shrugs.")

		saynn("[say=alexrynard]Sure, whatever. There might be more tests done to you then.[/say]")

		saynn("[say=pc]The tests weren’t too bad. At least I can take them off myself now.[/say]")

		saynn("[say=alexrynard]We might also ‘lose’ the fleshlights again. You know how it is, scientists can be very forgetful.[/say]")

		saynn("He sounds very cunning, smiling even. You sigh and just walk away. Your face is blushing slightly though, maybe that’s exactly what you’re counting on.")

		# (scene ends, quest ends)
		addButton("Continue", "That was easy", "endthescene")

	if(state == "take_them_off"):
		# (You take off the panties and give them to him. He says that it was fun watching some tests)

		# (You blush and walk away)

		saynn("You take off your portal panties and leave on the work table. Foxy shrugs.")

		saynn("[say=alexrynard]It was entertaining to watch at least.[/say]")

		saynn("You pout and blush from his words. You did notice that all the security cameras were pretty much glued to you.")

		saynn("[say=alexrynard]I will give the prototype to the medical wing, they might find some use for it.[/say]")

		saynn("Instead of answering, you decide to just leave him alone. Free, at last.")

		# (scene ends, quest ends)

		addButton("Continue", "That was easy", "endthescene")


func _react(_action: String, _args):
	if(_action in ["take_them_off", "keep_them"]):
		addMessage("Quest completed!")
		addExperienceToPlayer(50)
	
	if(_action == "take_them_off"):
		setFlag("PortalPantiesModule.Panties_FleshlightsReturnedPanties", true)
		var item:ItemBase = GM.pc.getInventory().getEquippedItem(InventorySlot.UnderwearBottom)
		if(item.id == "PortalPanties"):
			item.destroyMe()
	
	if(_action == "endthescene"):
		endScene()
		return

	setState(_action)

