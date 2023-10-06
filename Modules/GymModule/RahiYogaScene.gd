extends "res://Scenes/SceneBase.gd"

func _init():
	sceneID = "RahiYogaScene"

func _run():
	if(state == ""):
		addCharacter("rahi")
		playAnimation(StageScene.Yoga, "catcow", {pc="rahi"})
		#playAnimation(StageScene.Duo, "sit", {npc="rahi", npcAction="allfours"})

	if(state == ""):
		saynn("You decide to instead sit down on the nearest bench and watch the kitty for a bit, she seems completely unaware of you, her back is turned towards you. Kitty is wearing her general inmate uniform, she is standing still on one of the mats, her whole body motion-less, even the tail.")

		saynn("Kitty closes her eyes and raises one of legs above the mat. She then bends it in the knee and presses against the second one, her footpads are brushing against her fur as she now has to keep careful balance. She connects her palms in a way that looks like she is praying. She assumes this pose and her body becomes motionless, again, for a while. Only her tail slightly tilts left and right to help counteract the gravity. You can hear kitty inhaling and exhaling, her breathing is slow and steady, with huge pauses in-between.")

		saynn("Then kitty assumes another position, she slowly lowers herself to her knees and places her arms on her thighs. Now, kneeling, she lowers her butt towards her feet even more as she stretches her upper body forward and down with her arms extended, her stomach seems to be comfortable resting on her girly thighs with her feline muzzle touching the mat. In that position she kinda looks like a girl showing off her submission to somebody. She inhales and exhales deeply..")

		saynn("After that pose, kitty raises her upper body again until she is standing but on all fours this time, it looks like she is doing a cat/cow pose. She inhales and rounds up her spine towards the ceiling while also lowering her chin as much as her bulky collar allows her. On the next inhale she instead arches her back the other way and lifts her butt and her head upwards. Oh wow, she is sticking out her covered up butt so much. If not for the shorts, it would look like she is presenting you her butt for something very lewd. As she is bending her back and stretching, you can hear noises coming from her maw. Is she.. moaning? That’s kinda cute.")

		saynn("Kitty then raises her body even more, now standing on her palms and feet, creating a round arch. Though she then lifts her hips higher until her body starts to resemble a V-shape instead, her legs are 90 degrees to her waist, giving you a great view of her crotch as she begins to stretch and make cute noises again, even her ears and her tail shake slightly as she produces a quiet moan.")

		addButton("Grab her attention", "Announce your presence", "grab_her_attention")

	if(state == "grab_her_attention"):
		playAnimation(StageScene.Yoga, "dog", {pc="rahi"})
		
		saynn("[say=pc]Hi there, kitty.[/say]")

		saynn("[say=rahi]Oh? Meow..[/say]")

		saynn("Kitty, still holding the downward-facing dog pose, spreads her legs more and finally notices you. Deep red blush shows up on her cheeks as she realizes what happened. Her stance becomes wobbly as she struggles to keep balance.")

		saynn("[say=pc]You’re doing great, kitty.[/say]")

		saynn("[say=rahi]T-thanks.[/say]")

		addButton("Leave", "Enough starring", "leave")
		addButtonWithChecks("Help", "Ask if the kitty needs some help", "help", [], [[ButtonChecks.StatCheck, Stat.Agility, 5]])

	if(state == "leave"):
		saynn("You decide not to make the poor kitty look even more embarrassed and stand up from the bench.")

		# (scene ends)
		addButton("Continue", "Time to go", "endthescene")


	if(state == "help"):
		# (if agility is high?)
		playAnimation(StageScene.Hogtied, "idle", {pc="rahi"})

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
		addButtonWithChecks("Stretching", "(lewd) Help Rahi do an advanced exercise", "stretching", [], [[ButtonChecks.StatCheck, Stat.Agility, 10]])

	if(state == "leave2"):
		saynn("You offer the feline a headpat as a reward for her efforts. She mewls happily, still holding her pose.")

		addButton("Continue", "Time to go", "endthescene")
		# (scene ends)

	if(state == "stretching"):
		# (needs even more agility)

		saynn("You offer the feline a headpat as a reward for her efforts. She mewls happily, still holding her pose.")

		saynn("[say=pc]Let’s try something else. Work on other parts of your body.[/say]")

		saynn("Kitty produces a curious mewl and then a cute moan as her paws slip off, causing her to break the pose and lie down flat.")

		saynn("[say=rahi]Ah.. like what?[/say]")

		saynn("Your hand slides over kitty’s leg and taps on her shorts.")

		saynn("[say=pc]Are you able to do leg splits?[/say]")

		saynn("[say=rahi]Uh.. maybe?[/say]")

		saynn("Hearing her doesn’t give you much confidence, better to check it. You use your hands to guide the kitty to lay flat on her back with her paws by her sides, she seems to be quite used to your touch by now. Kitty is now ready so you get a hold of her right ankle and make her raise it while keeping the leg straight.")

		saynn("[say=rahi]Ohh-hh..[/say]")

		saynn("It goes pretty well up to a certain point, Kitty’s feline flexibility allows her to raise her leg to about 150 degrees compared to the other one. Anything past that and kitty starts struggling, her legs shivering, knees bending.")

		saynn("[say=pc]Not bad, I bet we can get there with some extra warming up. Hold your leg like this, kitty.[/say]")

		saynn("[say=rahi]Ah.. Kitty doesn’t know..[/say]")

		saynn("Brown kitty wraps her arm under her raised knee and tries to hold her leg high for you. She tilts her head down, probably realizing how exposed it makes her crotch look even with shorts. You put your hands on kitty’s exposed fluffy thighs and begin kneading them, giving a little massage to make that blood flow better. Kitty reacts by squirming slightly and mewling, she is so tensed up that your touches seem to set off little uncontrollable reactions in her body. You notice a little damp spot appearing on kitty’s shorts roughly where her sensitive folds would be, seems like the sexual tenstion is high in her as well. That puts a smile on your face.")

		saynn("You decide to be a bit more bold and slide your hand over the kitty’s shorts, your digits brush right over where her clit would be under the cloth. Kitty reacts by looking around and blushing red.")

		saynn("[say=rahi]O-others are w-watching..[/say]")

		saynn("[say=pc]So? They’re busy lifting heavy chunks of metal.[/say]")

		saynn("Your hand slides over the girl’s shorts again but this time it stops and boldly lands on them, your digit starts tracing little circles around where her pussy is, rubbing the sensitive folds through the fabric and watching her reaction. Kitty only squirms and blushes more, little soft moans escape from her as the damp spot on her shorts becomes bigger. But she still tries to hold the pose, holding her leg high for you.")

		saynn("Your digits focus on rubbing kitty’s folds and her sensitive clit, all through the clothing. A second hand joins and moves down to the feline’s rear, a single finger gets a feel for the girl’s tailhole and starts prodding at it, making kitty open her mouth and produce moans more often.")

		saynn("[say=pc]So much tension inside you. You gotta let it out sometimes, kitty.[/say]")

		saynn("[say=rahi]Ah.. If you c-continue.. kitty w-will..[/say]")

		saynn("And sure enough, she cuts the end of her sentence short and lets out a passionate pleasure noise as her body squirms from sudden orgasmic waves washing over her and resonating near her crotch. As you continue rubbing her through the cloth, kitty’s shorts receive a shower of her juices as she cums hard, you see her curling her toes and arching her back.")

		saynn("[say=pc]Good~. It’s a good way to work out, isn’t it.[/say]")

		saynn("You lick your digits and smile at the girl. Kitty pants softly and covers her face with her free hand, she is clearly feeling embarrassed. You let her close her legs and stand up, kitty obeys and follows you, leaving a wet spot on the yoga mat too where she was.")

		saynn("[say=rahi]Kitty will.. go wash herself..[/say]")

		# (scene ends)
		addButton("Continue", "Time to go", "endthescene")

func _react(_action: String, _args):
	
	if(_action == "endthescene"):
		processTime(60*60*1)
		
		endScene()
		return

	setState(_action)

func getDevCommentary():
	return "Rahi yoga scene. I should make some yoga animations I think x3. It's hard to describe yoga poses in words. But I'm lazy. And I never did any yoga x3. But this particular Rahi would totally do yoga to keep her feline agility in check. Felines just like to stretch, you know? ^^"

func hasDevCommentary():
	return true
