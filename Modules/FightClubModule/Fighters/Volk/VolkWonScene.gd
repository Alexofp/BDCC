extends "res://Scenes/SceneBase.gd"

func _init():
	sceneID = "VolkWonScene"

func _run():
	if(state == ""):
		addCharacter("volk")
		playAnimation(StageScene.Duo, "stand", {npc="volk", npcAction="kneel"})

	if(state == ""):
		saynn("Volk drops his weapon and grunts as he hits the floor. As you approach him, his hand starts reaching for his shiv but you swiftly stop that by stepping on his palm and pinning it to the floor.")

		saynn("[say=volk]Aghrr. Suka![/say]")

		saynn("[say=pc]What? Don’t you like the pain?[/say]")

		saynn("Growling can be heard from him.")

		addButton("Let him be", "You won and that all that matters", "let_him_be")
		addButton("Weapon play", "Let him taste his own medicine", "weapon_play")
		GM.ES.triggerRun("ArenaFighterPCWon", ["volk"])

	if(state == "let_him_be"):
		saynn("You raise your foot and then kick his shiv away so he won’t use it against you.")

		saynn("[say=pc]Bad. You are the suka, not me.[/say]")

		saynn("Then you just get over the fence and go get your reward.")

		addButton("Continue", "Time to leave", "endthescene")

	if(state == "weapon_play"):
		playAnimation(StageScene.SexStart, "start", {npc="volk", pc="pc"})
		
		saynn("You lean down and pick up his makeshift weapon. It looks like a piece of glass with some cloth wrapped around so it can be held.")

		saynn("[say=volk]Hey. That’s mine![/say]")

		saynn("[say=pc]Not anymore it’s not. You were gonna accidentely cut yourself with that.[/say]")

		saynn("You raise your leg but then shove into Volk’s chest, pinning him to the floor.")

		saynn("[say=volk]Suka![/say]")

		saynn("[say=pc]What does that even mean.[/say]")

		saynn("[say=volk]Bitch![/say]")

		saynn("You apply more pressure to his chest, creating lots of discomfort for him and his ability to breathe. Then you crouch and move the shiv near his neck.")

		saynn("[say=pc]Am I now?[/say]")

		saynn("He recoils back and tries to avoid that dangerous piece of glass like its fire.")

		saynn("[say=volk]You don’t know what you are doing![/say]")

		saynn("The shiv gets pressed against his throat. The guy raises his chin high and grits his teeth.")

		saynn("[say=pc]Yeah. That makes it more exciting, doesn’t it? One wrong move from you or me and goodbye world.[/say]")

		saynn("The guy is silent but you can tell he is shivering.")

		saynn("[say=pc]So who’s suka here?[/say]")

		saynn("[say=volk]You![/say]")

		saynn("Before he can even finish spitting out his word, you grab his jaw and stick the piece of glass into his mouth, sharp tip is applying lots of pressure onto this canine tongue.")

		saynn("[say=pc]Would be such a shame to lose your tongue, wouldn’t it? No more shit-talking, no more polishing cocks and asses.[/say]")

		saynn("You gradually apply more pressure until his tongue starts bleeding. Hissing and painful noises can be heard from him, he is forced to taste his own blood. You put on your meanest gaze and watch the guy’s courage melt before your very eyes.")

		saynn("[say=pc]So. You are the suka, right?[/say]")

		saynn("He winces from pain and nods subtly, causing bigger bleeding. Ow. You finally pull the shiv away from his mouth and wipe the blood against his uniform. Volk closes his mouth and suckles on his own tongue.")

		saynn("[say=volk]Fucking maniac..[/say]")

		saynn("You chuckle and get over the fence, ready to go claim your reward.")

		# (scene ends)

		addButton("Continue", "Time to leave", "endthescene")


func _react(_action: String, _args):
	
	if(_action == "endthescene"):
		endScene()
		return

	setState(_action)

