extends "res://Scenes/SceneBase.gd"

func _init():
	sceneID = "FerriLostToScene"

func _run():
	if(state == ""):
		addCharacter("ferri")
		playAnimation(StageScene.Duo, "kneel", {npc="ferri"})

	if(state == ""):
		saynn("Unable to continue fighting, you cry out from pain and hit the floor. Ferri pounces at you and closes her muzzle around your throat, threatening to sink her fangs into it. You raise your hands, trying to avoid your neck being bitten.")

		saynn("[say=pc]I surrender.[/say]")

		saynn("Ferri raises her brow and tries to talk without closing her mouth.")

		saynn("[say=ferri]You ffure? Mew..[/say]")

		saynn("Judging from Ferri’s tone, she almost sounds disappointed. She lets go of your neck and straddles you, wondering about what she should do with you.")

		addButton("Get teased", "See what happens next", "get_teased")
		GM.ES.triggerRun("ArenaFighterPCLost", ["ferri"])

	if(state == "get_teased"):
		saynn("Ferri slides her paws teasingly over your {pc.masc} curves. Soft purring can be heard from her maw as she reaches your {pc.breasts} and then gives them a smack! Ow, you arch your back but she pins you back to the ground. The crowd behind the fence cheers for more fucking but the dracat’s plans are different.")

		saynn("[say=ferri]Who’s a bad pet?[/say]")

		saynn("[say=pc]You are?[/say]")

		saynn("She growls playfully and smacks your hands away before biting your shoulder, painfully enough for you to cry out a moan and wiggle desperately.")

		saynn("[say=pc]Hey! Fine.. I am?[/say]")

		saynn("Ferri quickly moves away from your shoulder and offers you some headpats as a reward.")

		saynn("[say=ferri]That’s right~. You are my soft bratty pillow. Say it or I will bite you again~[/say]")

		# (if not naked)
		if(!GM.pc.isFullyNaked()):
			saynn("Dracat extends the claws on her paw and uses them to open your clothing. Then she drags them over your skin while putting a moderate amount of pressure, threatening to pierce at any second.")

		# (if naked)
		else:
			saynn("Dracat extends the claws on her paw and drags them over your skin while putting a moderate amount of pressure, threatening to pierce at any second.")

		saynn("You stay quiet and squirm under Ferri while the pressure from her claws arises. Eventually her second paw joins, at first it feels like tickling but the painful sensations soon become more prominent.")

		saynn("[say=pc]You are the brat here.[/say]")

		saynn("Suddenly she bites into your shoulder again while using her claws to pinch your exposed sensitive nipples. You can’t help but to arch your back and let out a loud noise as your body shivers, you feel like a prey that got caught. The crowd cheers louder hearing your moans, so humiliating.")

		saynn("[say=ferri]That’s what you get~. Fight better next time, pain slut.[/say]")

		saynn("And with that, Ferri gets up and leaps over the metal fence, leaving you alone and exposed.")

		# (scene ends)

		addButton("Continue", "Time to leave", "endthescene")


func _react(_action: String, _args):
	
	if(_action == "get_teased"):
		GM.pc.addLust(30)
		GM.pc.addPain(5)
	
	if(_action == "endthescene"):
		endScene()
		return

	setState(_action)

