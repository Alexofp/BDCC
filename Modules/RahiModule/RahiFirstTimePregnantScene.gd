extends "res://Scenes/SceneBase.gd"

func _init():
	sceneID = "RahiFirstTimePregnantScene"

func _run():
	if(state == ""):
		addCharacter("rahi")
		playAnimation(StageScene.Duo, "stand", {npc="rahi", npcAction="stand"})
		
	if(state == ""):
		# (if loc == main_bench2)
		if(GM.pc.getLocation() == "main_bench2"):
			saynn("While wandering around the prison you notice the familiar brown kitty, sitting on her bench.")

		# (if loc == cellblock_nearcells else)
		else:
			saynn("While leaving your cell you see the familiar brown kitty standing near a wall, idling.")

		saynn("She notices you and quickly runs up to you before giving you a tight hug. She pushes her head into your chest and purrs quietly. You didn’t expect it for sure so you just stood there, confused, before finally wrapping your hands around the kitty and hugging her back. She seems to be purring more.")

		saynn("[say=pc]What’s up kitty?[/say]")

		saynn("[say=rahi]Well.. Isn’t it obvious..[/say]")

		saynn("She escapes the hugs and takes a step back. You take a good look at her and don’t notice much of a difference. Maybe the belly is slightly more pronounced. Kitty’s face turns more red with each second.")

		saynn("[say=rahi]She thinks she is pregnant..[/say]")

		saynn("Oh.")

		addButton("Embrace her", "These are some very happy news", "embrace_her")
		addButton("Are you sure", "Maybe she is just confused", "are_you_sure")		

	if(state == "embrace_her"):
		saynn("You step up to her and give her a quick kiss on the lips.")

		saynn("[say=pc]That’s great. Really.[/say]")

		saynn("She catches your hand and puts it on her belly. You feel.. warmth. You lean forward and softly bump foreheads with the kitty. Then you gently place your second palm on her belly and get a better feel for how warm it is while she is hugging you back. Such an intimate moment.")

		saynn("[say=rahi]She.. had many partners.. and children.. already.. she hopes that’s okay..[/say]")

		saynn("That’s prison life for you. You nuzzle her face and hug her back.")

		saynn("[say=rahi]Sometimes she doesn't have a choice..[/say]")

		saynn("[say=pc]Shh.. it’s okay, kitty.[/say]")

		saynn("Her purring resumes. You both stay quiet for a minute, embracing each other. Finally she breaks the hug and takes a few steps back.")

		saynn("[say=rahi]Take care.. You don’t need to worry about anything.. Meow..[/say]")

		saynn("[say=pc]See you around, kitty.[/say]")

		# (scene ends)
		addButton("Continue", "Continue on your way", "endthescene")


	if(state == "are_you_sure"):
		saynn("You raise your brow.")

		saynn("[say=pc]Are you sure, kitty?[/say]")

		saynn("She steps closer to you again and grabs your hand before putting it on her belly. You feel.. warmth..")

		saynn("[say=rahi]Yes..[/say]")

		saynn("[say=pc]You sure it’s from me?[/say]")

		saynn("She looks into your eyes, still blushing.")

		saynn("[say=rahi]She only had you.. for quite a while..[/say]")

		saynn("Well then. You lean forward and softly bump foreheads with the kitty. Then you gently place both your palms on her belly and get a better feel for how warm it is while she is hugging you back. Such an intimate moment.")

		saynn("[say=rahi]She.. had many partners.. and children.. already.. she hopes that’s okay..[/say]")

		saynn("That’s prison life for you. You nuzzle her face and hug her back.")

		saynn("[say=rahi]Sometimes she doesn't have a choice..[/say]")

		saynn("[say=pc]Shh.. it’s okay, kitty.[/say]")

		saynn("Her purring resumes. You both stay quiet for a minute, embracing each other. Finally she breaks the hug and takes a few steps back.")

		saynn("[say=rahi]Take care.. You don’t need to worry about anything.. Meow..[/say]")

		saynn("[say=pc]See you around, kitty.[/say]")

		# (scene ends)

		addButton("Continue", "Continue on your way", "endthescene")
		

func _react(_action: String, _args):

	if(_action in ["are_you_sure", "embrace_her"]):
		processTime(RNG.randi_range(3, 10)*60)

	if(_action == "endthescene"):
		endScene()
		return
	
	setState(_action)
