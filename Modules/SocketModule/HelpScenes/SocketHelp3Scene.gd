extends SceneBase

func _init():
	sceneID = "SocketHelp3Scene"

func _run():
	if(state == ""):
		addCharacter("socket")
		playAnimation(StageScene.Duo, "stand", {npc="socket"})
		saynn("You stand near Socket. You just noticed that there are a few boxes under her boots. And what is that.. she is holding something, some kind of little device that looks like a cover for something.")

		saynn("[say=pc]Anything I can help with now?[/say]")

		saynn("[say=socket]Oh, yeah! But I wanna show you this first.[/say]")

		addButton("Continue", "See what happens next", "socket_puts_on_portal")
	if(state == "socket_puts_on_portal"):
		# (( Anim where sips out of fleshlight
		saynn("Socket presses that little device against her crotch, hiding her pussy.. and.. somehow.. it just stays there when she activates it.")

		saynn("[say=socket]Alex helped me with it.[/say]")

		saynn("After that, she grabs a fancy fleshlight from her backpack and also.. a bottle.")

		saynn("She turns the fleshlight on.. which opens a little portal on it with her pussy sticking out of it.. more than usual, almost like the device is pulling on the petals to make them appear more plump.")

		saynn("[say=socket]I modified it for a tighter fit![/say]")

		saynn("That's not it though.. Socket opens the bottle.. and starts pouring the drink into her own pussy.. a very strange view for sure. After filling herself full, she adds a little drinking straw to top it off.")

		saynn("You're.. not sure how to feel about it. Socket sees your expression and smiles.")

		saynn("[say=socket]My pussy can hold it, I got it upgraded to hold substances even more acidic than that![/say]")

		saynn("[say=pc]Why not just.. drink it normally?[/say]")

		saynn("Socket shrugs and starts sipping the drink through the straw. At least the portal device that she is using is indeed providing quite a snug fit, nothing seems to be leaking out.")

		saynn("[say=socket]It's more fun that way. Want a sip?[/say]")

		saynn("She offers you the fleshlight.")

		addButton("Take a sip", "Why not", "take_a_sip")
		addButton("Refuse", "You'd rather not", "take_no_sip")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "socket_puts_on_portal"):
		pass

	if(_action == "take_a_sip"):
		# add intoxication
		pass

	setState(_action)
