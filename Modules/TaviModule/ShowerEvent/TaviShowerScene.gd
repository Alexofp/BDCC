extends "res://Scenes/SceneBase.gd"

func _init():
	sceneID = "TaviShowerScene"


func _run():
	if(state == ""):
		addCharacter("tavi", ["naked"])
		playAnimation(StageScene.SexStanding, "tease", {
			pc="tavi", npc="pc", 
			bodyState={naked=true,},
			npcBodyState={naked=true,hard=true,},
		})
		
	if(state == ""):
		saynn("You are standing under the shower, completely naked, cleaning yourself. You were about done with washing your {pc.breasts} when you felt someone hugging you from behind.")

		saynn("[say=tavi]Hey there~.[/say]")

		saynn("It’s Tavi. Purple soft paws rub your chest, you can feel her squishy breasts pressing against your back, she doesn’t seem to be wearing anything as well. The tall feline exposes her claws and starts gently dragging them across your {pc.thick} {pc.masc} curves.")

		saynn("[say=pc]Miss Tavi?..[/say]")

		saynn("[say=tavi]Surprised? I take showers too sometimes, silly.[/say]")

		saynn("She rests her chin on your shoulder and gazes down at her pet, her paws keep teasing you, brushing over your exposed nips, softly tickling your belly. You let her do it, her touch seems quite pleasant, voice soothing you down. All the while the running water washes over both of you.")

		saynn("[say=pc]What do you want, Miss?[/say]")

		saynn("[say=tavi]Just playing with my pet~[/say]")

		# (if has penis)
		if(GM.pc.hasPenis()):
			saynn("One of her paws slides down to your {pc.cock} and starts teasing the tip. She then wraps her digits around your shaft and gives it a few strokes, helping you to get hard. You don’t wanna stop her..")

		# (else if has vagina)
		else:
			saynn("One of her paws slides down to your slit and starts teasing the clit. She then uses her digits to spread and rub the petals themselves, causing you to become aroused. You don’t wanna stop her..")

			# (end)

		saynn("[say=tavi]Feels good, huh~. I wonder. Does my pet like to be humiliated?[/say]")

		# (yes, a bit, no)

		addButton("Yes", "This will involve light watersports..", "yes")
		addButton("No", "You’re not into heavy humiliation", "no")

	if(state == "yes"):
		saynn("[say=pc]Yes, Miss Tavi..[/say]")

		saynn("The tall kitty purrs into your ear and lightly tugs on it with her teeth. She seems to be enjoying playing with you.")

		# (if has penis)
		if(GM.pc.hasPenis()):
			saynn("Her paw has a grasp on your {pc.cock}, her big finger keeps rubbing the shaft to keep you hard.")

		# (else)
		else:
			saynn("Her digits keep your pussy spread with one gently rubbing the entering. You feel yourself becoming wet.")

		saynn("[say=tavi]We’re under a shower.. With drainage underneath us. Tell me, cutie, do you wanna pee?[/say]")

		saynn("That’s a question you didn’t expect. You shiver just from the thought, a deep red blush appears on your face. All the while the feline keeps hugging and teasing you. Seems like running away is not even an option.")

		saynn("[say=pc]I don’t think I do..[/say]")

		saynn("[say=tavi]Aww~. Really though?[/say]")

		# (if has penis)
		if(GM.pc.hasPenis()):
			saynn("Her big thumb switches from rubbing the shaft to teasing the tip, going over exactly the spot where you pee from. It’s like she is.. tickling you there. You can’t help but to start squirming in her hands, the more she does it, the more your urge builds up. Tavi notices your reactions and purrs more deeply, she keeps rubbing your peehole non-stop until you start moaning.")

		# (else)
		else:
			saynn("Two of her digits hold your pussy open while another one starts teasing the little hole.. the one that is just below the clit, the one you are peeing from.  It’s like she is.. tickling you there. You can’t help but to start squirming in her hands, the more she does it, the more your urge builds up. Tavi notices your reactions and purrs more deeply, she keeps rubbing your peehole non-stop until you start moaning.")

		saynn("[say=tavi]C’mon, just give in~. Do it for me, for your Miss. Nothing bad will happen if you wet yourself in the shower~[/say]")

		addButton("Let it happen", "Listen to your Miss..", "let_it_happen")
		addButton("Try to hold it", "Use all of your willpower.", "try_to_hold_it")


	if(state == "let_it_happen"):
		saynn("Your embarrassed gaze directed away, there is only so much teasing you can endure so you decide to let go..")

		# (if has penis)
		if(GM.pc.isWearingChastityCage()):
			saynn("You let out a passionate moan before a stream of piss emerges from your cock. Tavi quickly moves away her thumb but she keeps her other digits wrapped around your chastity cage.")
		elif(GM.pc.hasPenis()):
			saynn("You let out a passionate moan before a stream of piss emerges from your cock. Tavi quickly moves away her thumb but she keeps her other digits wrapped around your member.")

		# (else)
		else:
			saynn("You let out a passionate moan before a stream of piss emerges from your slit. Tavi quickly moves away her finger but she keeps your pussy spread open with the other two.")

		saynn("Tavi chuckles, it’s extremely humiliating but you can’t stop yourself anymore, you just keep pissing while Tavi watches you do it. Luckily all of it quickly gets washed away by the stream of water. On the other hand, your yellow stream is slowly dying down as your bladder becomes empty. You feel.. a sense of relief..")

		saynn("[say=tavi]I see that you enjoyed it~[/say]")

		saynn("[say=pc]Nn-no..[/say]")

		saynn("[say=tavi]Don’t lie to me, cutie. Just look at yourself~.[/say]")

		saynn("Maybe she is right, maybe you are this humiliation slut. Tavi puts her hand on your neck, just above the collar. Then she offers you a little kiss on the cheek.")

		saynn("[say=tavi]See you around, pet~[/say]")

		saynn("And with that, Tavi leaves you alone with your thoughts.")

		# (scene ends)
		addButton("Continue", "That was a thing that happened", "endthescene")

	if(state == "try_to_hold_it"):
		saynn("You gather all of your strength and try to push away the urge. While cheeky Tavi is being relentless, she is rubbing your little peehole, trying to force you to give up. Any time you try to grab her hand she just slaps yours away.")

		# (if survived)

		saynn("You grunt a lot but you don’t leak a single drop. Tavi sees the efforts you went through and sighs. She stops teasing you.")

		# (if dick)
		if(GM.pc.isWearingChastityCage()):
			saynn("Instead she switches to teasing. Her paw tugs and pulls on your {pc.cock} until it’s getting more hard under the chastity.")
		elif(GM.pc.hasPenis()):
			saynn("Instead she switches to stroking you off. Her paw slides along your {pc.cock} until it’s fully hard again.")

		# (if else)
		else:
			saynn("Instead she switches to fingering you off, her paw rubs your cute slit and spreads it open so a few digits can fit.")

		saynn("[say=tavi]Awww. But I bet you would enjoy it.[/say]")

		# (if dick)
		if(GM.pc.isWearingChastityCage()):
			saynn("You begin moaning for her. Tavi quickly reaches the full pace, she strokes and tugs on your cage so fast you think you won’t last for much longer. But just when you think you will go over your peak, Tavi suddenly stops, cutting off the supply of instant pleasure and causing you to squirm in desperation. Tavi welcomes it, she holds you still, hand on your cage, stroking it so slowly that it feels like a torture.")
		elif(GM.pc.hasPenis()):
			saynn("You begin moaning for her. Tavi quickly reaches the full pace, she strokes you so fast you think you won’t last for much longer. But just when you think you will go over your peak, Tavi suddenly stops, cutting off the supply of instant pleasure and causing you to squirm in desperation. Tavi welcomes it, she holds you still, hand on your cock, stroking you so slowly that it feels like a torture.")

		# (else)
		else:
			saynn("You begin moaning for her. Tavi shoves a few digits into your slit and quickly reaches the full pace, fingering you so hard that you think that you won’t last for too long. Your snatch starts making wet noises but just when you think you will go over your peak, Tavi suddenly stops, cutting off the supply of instant pleasure and forcing you to start squirming in desperation. Tavi welcomes it, she holds you still, digits in your slit, teasing you to lightly that it feels like a torture.")

		saynn("[say=tavi]That’s what you get, little bitch~[/say]")

		saynn("Tavi pulls her hand away, denying you completely. And when you try to reach for your crotch, she catches your arms and wrenches them behind your back. She giggles while you slowly lose your horny mood under the cold water.")

		saynn("[say=pc]Why not let me cum, Miss..[/say]")

		saynn("[say=tavi]Because you didn’t even ask~. Too late now, cutie. See you around.[/say]")

		saynn("She leaves a little kiss on your cheek before leaving the shower room, leaving you alone with your thoughts.")

		# (scene ends)
		addButton("Continue", "That was a thing that happened", "endthescene")

	if(state == "no"):
		saynn("[say=pc]Not really, no..[/say]")

		saynn("[say=tavi]Well it’s a shame that you’re stuck with me then, pet~.[/say]")

		# (if dick)
		if(GM.pc.hasReachablePenis()):
			saynn("She begins stroking you off. Her paw slides along your {pc.cock}, catching any precum and spreading it along the full length.")

		# (if else)
		else:
			saynn("She begins to finger you, her paw rubs your cute slit and spreads it open so a few digits can fit.")

		saynn("[say=tavi]Because I can be mean when I don’t get what I want~.[/say]")

		# (if dick)
		if(GM.pc.hasReachablePenis()):
			saynn("You can’t hold your moans from escaping. Tavi quickly reaches the full pace, she strokes you so fast you think you won’t last for much longer. But just when you think you will go over your peak, Tavi suddenly stops, cutting off the supply of instant pleasure and causing you to squirm in desperation. Tavi welcomes it, she holds you still, hand on your cock, stroking you so slowly that it feels like a torture.")

		# (else)
		else:
			saynn("You can’t hold your moans from escaping. Tavi shoves a few digits into your slit and quickly reaches the full pace, fingering you so hard that you think that you won’t last for too long. Your snatch starts making wet noises but just when you think you will go over your peak, Tavi suddenly stops, cutting off the supply of instant pleasure and forcing you to start squirming in desperation. Tavi welcomes it, she holds you still, digits in your slit, teasing you to lightly that it feels like a torture.")

		saynn("[say=tavi]That’s what you get, little bitch~[/say]")

		saynn("Tavi pulls her hand away, denying you completely. And when you try to reach for your crotch, she catches your arms and wrenches them behind your back. She giggles while you slowly lose your horny mood under the cold water.")

		saynn("[say=pc]Why not let me cum, Miss..[/say]")

		saynn("[say=tavi]Because you didn’t even ask~. Too late now, cutie. See you around.[/say]")

		saynn("She leaves a little kiss on your cheek before leaving the shower room, leaving you alone with your thoughts and a red face.")

		# (scene ends)
		addButton("Continue", "That was a thing that happened", "endthescene")


func _react(_action: String, _args):
	if(_action in ["try_to_hold_it", "let_it_happen", "no", "yes"]):
		processTime(RNG.randi_range(5, 20)*60)
	
	if(_action == "let_it_happen"):
		GM.pc.orgasmFrom("tavi")
		GM.pc.addStamina(100)
		
	if(_action == "try_to_hold_it"):
		GM.pc.addStamina(-50)
		
	if(_action in ["no", "try_to_hold_it"]):
		GM.pc.addLust(50)
	
	if(_action == "endthescene"):
		endScene()
		return

	setState(_action)

