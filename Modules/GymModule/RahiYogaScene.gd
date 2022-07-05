extends "res://Scenes/SceneBase.gd"

func _init():
	sceneID = "RahiYogaScene"

func _run():
	if(state == ""):
		addCharacter("rahi")

	if(state == ""):
		saynn("You decide to instead sit down on the nearest bench and watch the kitty for a bit, she seems completely unaware of you, her back is turned towards you. Kitty is wearing her general inmate uniform, she is standing still on one of the mats, her whole body motion-less, even the tail.")

		saynn("Kitty closes her eyes and raises one of legs above the mat. She then bends it in the knee and presses against the second one, her footpads are brushing against her fur as she now has to keep careful balance. She connects her palms in a way that looks like she is praying. She assumes this pose and her body becomes motionless, again, for a while. Only her tail slightly tilts left and right to help counteract the gravity. You can hear kitty inhaling and exhaling, her breathing is slow and steady, with huge pauses in-between.")

		saynn("Then kitty assumes another position, she slowly lowers herself to her knees and places her arms on her thighs. Now, kneeling, she lowers her butt towards her feet even more as she stretches her upper body forward and down with her arms extended, her stomach seems to be comfortable resting on her girly thighs with her feline muzzle touching the mat. In that position she kinda looks like a girl showing off her submission to somebody. She inhales and exhales deeply..")

		saynn("After that pose, kitty raises her upper body again until she is standing but on all fours this time, it looks like she is doing a cat/cow pose. She inhales and rounds up her spine towards the ceiling while also lowering her chin as much as her bulky collar allows her. On the next inhale she instead arches her back the other way and lifts her butt and her head upwards. Oh wow, she is sticking out her covered up butt so much. If not for the shorts, it would look like she is presenting you her butt for something very lewd. As she is bending her back and stretching, you can hear noises coming from her maw. Is she.. moaning? That’s kinda cute.")

		saynn("Kitty then raises her body even more, now standing on her palms and feet, creating a round arch. Though she then lifts her hips higher until her body starts to resemble a V-shape instead, her legs are 90 degrees to her waist, giving you a great view of her crotch as she begins to stretch and make cute noises again, even her ears and her tail shake slightly as she produces a quiet moan.")

		addButton("Grab her attention", "Announce your presence", "grab_her_attention")

	if(state == "grab_her_attention"):
		saynn("[say=pc]Hi there, kitty.[/say]")

		saynn("[say=rahi]Oh? Meow..[/say]")

		saynn("Kitty, still holding the downward-facing dog pose, spreads her legs more and finally notices you. Deep red blush shows up on her cheeks as she realizes what happened. Her stance becomes wobbly as she struggles to keep balance.")

		saynn("[say=pc]You’re doing great, kitty.[/say]")

		saynn("[say=rahi]T-thanks.[/say]")

		addButton("Leave", "Enough starring", "leave")
		addButtonWithChecks("Help", "Ask if the kitty needs some help", "help", [], [[ButtonChecks.StatCheck, Stat.Agility, 10]])

	if(state == "leave"):
		saynn("You decide not to make the poor kitty look even more embarrassed and stand up from the bench.")

		# (scene ends)
		addButton("Continue", "Time to go", "endthescene")


	if(state == "help"):
		# (if agility is high?)

		saynn("You decide to break the awkward silence and move closer to kitty’s mat. You stand near her and slide your hand over her straight back.")

		saynn("[say=pc]Need some help, kitty?[/say]")

		saynn("[say=rahi]Meow..[/say]")

		saynn("[say=pc]C’mon, I have some experience.[/say]")

		saynn("Kitty gradually gets herself back to all fours and then lowers her chest even lower until she is lying on her belly.")

		saynn("[say=rahi]Kitty’s been sitting a lot on the bench and now struggles to do the bow pose..[/say]")

		saynn("[say=pc]Perfect. Show me.[/say]")

		saynn("Kitty mewls again and prepares to try. She arches her spine enough for her torse to be lifted off the ground. Then she bends her knees and tries to reach her feet with her hands. But she clearly struggles, no matter how much she tries, she can’t do it, she lets out some frustrated huffs and eventually gives up.")

		saynn("[say=pc]Alright. Let’s try again with my help.[/say]")

		saynn("Kitty sighs audibly and starts reaching for her feet again. You notice some mistakes in her pose, your hands slide under her exposed girly thighs and make her lift them slightly. Then they spread legs until they are parallel to each other. Kitty lets out a quiet noise but obeys your touch, she tries to hide her blush.")

		saynn("[say=pc]Legs must be lifted off the mat, knees in line with the hips. Ideally only your lower belly and the waist should rest on the mat. Keep your feet engaged.[/say]")

		saynn("Satisfied with that, you move your hands up to her torso and place one hand on her back while the second one gently presses into her chest, just below her C-cup breasts. Kitty squirms slightly under your attention and breathes deeply.")

		saynn("[say=pc]Don’t compress the spine, keep it mostly straight. Instead, use your back muscles to lift your torso up and pull your shoulders back. Try it.[/say]")

		saynn("Kitty, too embarrassed to say anything, follows your advice and begins stretching to try and reach her feet. She draws her shoulder blades back and extends her arms back while trying to keep her torso and legs off the mat. She quickly starts panting and making some kind of noises. You keep your hand just under her breasts, basically cupping them, and gently press, helping the kitty.")

		saynn("Eventually, kitty’s paws manage to reach her feet, her fingers get a grasp on her digi feet. And when she does that, a passionate moan escapes from kitty’s lips, the one that she probably didn’t wanna drop.")

		saynn("[say=rahi]Almost.. A-ah~..[/say]")

		saynn("Her cheeks blush even more, her body tries to squirm from embarrassment but that only causes kitty to let out some more little noises of pleasure.")

		saynn("[say=pc]You seem to like yoga, huh~[/say]")

		saynn("[say=rahi]Yes.. t-thank you..[/say]")

		saynn("You let her keep the pose and stand up. Right now the kitty kinda looks like she is hogtied. But without any ropes to keep her secure, kinda funny.")

		saynn("[say=pc]Ever thought that these inmate clothes are too constraining?[/say]")

		saynn("[say=rahi]Um.. Are they?[/say]")

		saynn("[say=pc]You know, something more skin-tight would be better[/say]")

		saynn("[say=rahi]Kitty doesn’t have anything like that..[/say]")

		saynn("[say=pc]Why not try it naked then?[/say]")

		saynn("[say=rahi]Noooo-.. Others are gonna sta-are.[/say]")

		saynn("Maybe one day.")

		addButton("Leave", "You helped kitty", "leave2")

	if(state == "leave2"):
		saynn("You offer the feline a headpat as a reward for her efforts. She mewls happily, still holding her pose.")

		addButton("Continue", "Time to go", "endthescene")
		# (scene ends)

func _react(_action: String, _args):
	
	if(_action == "endthescene"):
		processTime(60*60*1)
		
		endScene()
		return

	setState(_action)

