extends "res://Scenes/SceneBase.gd"

# Heavy work in progress, the text is just to get a feel for how the game is gonna start

func _init():
	sceneID = "IntroWakeup"

func _run():
	if(state == ""):
		addCharacter("risha")
		playAnimation(StageScene.Duo, "stand", {npc="risha"})
		
		saynn("You were too tired to see any dreams tonight but you managed to get some good sleep at least. The sound of inmate chatter and their footsteps on concrete floors wake you up. You open your eyes and see a guard behind the window, the one that was protecting the captain yesterday. She knocks on the window and turns on the intercom.")

		saynn("[say=risha]Up, inmate. I won’t ask twice.[/say]")

		saynn("You willingly obey and get off the bed, it wasn’t very comfortable anyways. The guard opens the cell and steps inside.")

		saynn("[say=risha]Lazy time is over, inmate, I want you to go to the mineshafts level and do actual work[/say]")

		if(GM.pc.getInventory().hasSlotEquipped(InventorySlot.Mouth)):
			saynn("The guard also takes a note of your head harness.")

			saynn("[say=risha]Ha, it seems like no one has taken it off since yesterday. And so won’t I, that's what you get for being bitey, brat.[/say]")

		addButton("Fine", "Tell her you will do it", "fine")
		addButton("Fuck off", "Tell her you’re not happy", "fuck_off")

	if(state == "fine"):
		saynn("[say=pc]You’re the boss[/say]")

		saynn("The guard smirks and gives you a cold head pat.")

		saynn("[say=risha]Stay obedient and maybe you will even enjoy it here.[/say]")

		saynn("She leans down bringing your heads to the same level.")

		saynn("[say=risha]As my fucktoy~[/say]")

		saynn("She suddenly gives your butt a good spank, forcing a gasp out of you.")

		saynn("[say=risha]But for now, use the lift to get to the mineshafts[/say]")

		saynn("The guard exits your cell and continues on her way, leaving you alone with your thoughts.")
		
		addButton("Continue", "Time to do the do", "endTheScene")

	if(state == "fuck_off"):
		saynn("[say=pc]Why don’t you fuck off and pester someone else instead[/say]")

		saynn("The guard is not very surprised, though she keeps her hand on her stun baton in your clear view now.")

		saynn("[say=risha]You want me to put a leash on you and personally drag you off to the mines myself? I can also just put you into stocks and let every inmate have a turn at using you, sex toys are very popular here, you lazy slut.[/say]")

		if(GM.pc.getInventory().hasSlotEquipped(InventorySlot.Mouth)):
			saynn("You grit your teeth but stay quiet, messing with the guard doesn’t seem like the best idea. And besides, being muzzled doesn't help with that either.")
		else:
			saynn("You grit your teeth but stay quiet, messing with the guard doesn’t seem like the best idea.")

		saynn("[say=risha]Another fuck up like that near me and I will personally put you into stocks for everyone to fuck, that will show how big of a whore you are. Now go and use the lift to get to the mineshafts[/say]")

		saynn("The guard exits your cell and continues on her way, leaving you alone with your thoughts.")
		
		addButton("Continue", "Time to do the do", "endTheScene")



func _react(_action: String, _args):
	if(_action == "endTheScene"):
		GM.main.setFlag("Game_CompletedPrologue", true)
		runScene("WorldScene")
		endScene()
		
	setState(_action)

func _react_scene_end(_tag, _result):
	pass

func getDevCommentary():
	return "This small scene was added just to tell the players that skipped most of the reading: Go to the fucking mineshaft!\n\nYeah, it's written in a way that implies that Risha will come after you if you don't do that. Why doesn't she? I'm lazy x3. And also.. I dunno, she would just fuck you or something. What if you want to explore around first without being fucked by some dickgirl if you press one wrong button? Yeah, I can make it optional or something.."

func hasDevCommentary():
	return true
