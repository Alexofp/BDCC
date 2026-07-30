extends SceneBase

func _init():
	sceneID = "AvyLoveOralSexScene"

func _run():
	if(state == ""):
		addCharacter("avy")
		playAnimation(StageScene.Duo, "stand", {npc="avy"})
		saynn("You lick your lips while watching Avy's bulging shorts.")

		saynn("She catches your obvious stare and chuckles.")

		saynn("[say=avy]You're drooling. Need some help with that?[/say]")

		saynn("You return eye contact and smile.")

		saynn("[say=pc]Yeah, I guess I just wanna suck on something.[/say]")

		saynn("The foxy puts her list away and catches your chin, her thumb brushing against your lower lip. You lick it.")

		saynn("[say=avy]I've got just the thing. Perfect for sucking. Comes with a choking hazard label though.[/say]")

		saynn("You nibble on her thumb too a bit.")

		saynn("[say=pc]Good.[/say]")

		saynn("You two are staring at each other, the tension is rising fast..")

		addButton("Continue", "See what happens next", "handjob")
	if(state == "handjob"):
		addCharacter("avy", ["naked"])
		aimCameraAndSetLocName("hideout_chill")
		playAnimation(StageScene.SexHandjob, "fast", {pc="avy", npc="pc", bodyState={naked=true, hard=true}, npcBodyState={hard=true}})
		saynn("Next moment you know it, you're on your knees in front of Avy, your hand gliding along her hard cock back and forth. You can feel it pulse against your palm softly, a bead of precum already welling up at the tip. You catch it with your thumb and spread it down along her length. Your other hand cups her heavy balls, caressing and feeling their weight.")

		saynn("[say=avy]Mhh-..[/say]")

		saynn("You lean in and give her shaft a long, teasing lick from the base of her sheath all the way to the pointy head. Her canine cock twitches when you do that.. followed by a low rumble from above. You keep stroking her and then lick again, tracing the veins near where the knot will be.")

		saynn("Avy's fingers brush against your cheek.")

		saynn("[say=avy]Feels nice. But I bet you could do more.[/say]")

		saynn("[say=pc]We're playing by my rules here.[/say]")

		saynn("[say=avy]Wow, hah. Sure.[/say]")

		saynn("You take the head of her member into your mouth, tasting her pre. Your tongue curls around her length as you begin to sink down..")

		addButton("Continue", "See what happens next", "bj_do")
	if(state == "bj_do"):
		playAnimation(StageScene.SexOral, "sex", {pc="avy", npc="pc", bodyState={naked=true, hard=true}, npcBodyState={hard=true}})
		saynn("You take her cock deeper, letting the tip go past your teeth and brush along your tongue before hitting the back of your mouth. You close your lips around it and suck some of the air out, creating a pleasurable-feeling void-like zone. Your eyes look up at hers as you do that. Avy smiles.")

		saynn("[say=avy]Not bad. Mmm..[/say]")

		saynn("She scritches you behind your ear as you slide your tongue along the veiny underside, coating it with wetness. Then you tilt your head to the side a bit and do it again. Your hands are still gently massaging her balls.")

		saynn("After all the teasing, you begin to push yourself, letting her cock to curve down your throat. A gag reflex instantly reminds you of its existence.. but you fight it.. taking her deeper. Avy grips your hair as she feels your throat clenching around her.")

		saynn("[say=avy]Oh fuck..[/say]")

		saynn("You hold yourself there for as long as possible.. before you can't endure it anymore. That's when you pull back slowly, letting her member drag along your tongue, savoring the texture and the taste. Then you sink down again, a little further this time, taking her deeper. You hear a low growl rumbling above you.. Avy's breath catching, her hips really want to push to meet your motions.")

		saynn("[say=avy]Such a tease..[/say]")

		saynn("You hum in response, the vibration making her legs tremble. You do the whole process again, bobbing your head at a steady pace now, gradually stretching your throat to take more of her cock each time. Your tongue keeps tracing the lines along the underside of the shaft and curling around it occasionally. Her fingers go through your hair, brushing.")

		saynn("Avy's hips start to move, just a little.. a subtle push forward. You match it, going deeper, allowing her cock to fill your throat. You begin to feel the gag reflex fighting you again, your eyes watering. You push through it, taking her as deep as you can, your nose meeting her crotch. Wet slurps and noises of gagging start escaping you.. while Avy is moaning instead, her back arching, her body squirming slightly.")

		saynn("[say=avy]Mhh~.. I'm gonna take over now.[/say]")

		saynn("If you let her, she will most likely cum inside..")

		addButton("Let her", "Let Avy fuck your face fast", "let_fast")
		addButton("Facials", "Keep doing it yourself and make Avy cum all over your face instead", "facials_instead")
	if(state == "let_fast"):
		playAnimation(StageScene.SexOralForced, "suckfast", {pc="avy", npc="pc", bodyState={naked=true, hard=true}, npcBodyState={hard=true}})
		saynn("Her hand catches yours and pulls them above your head, stealing some control from you. With that, she starts rolling her hips back and forth, making her cock slide inside your throat. And this time, she is the one setting the pace.")

		saynn("[say=avy]Breathe through your nose. Here we go..[/say]")

		saynn("She goes fast, pulling out until only the head of her member remains inside your mouth.. before thrusting back in with a wet noise, triggering your gag reflex almost instantly. Your throat starts clenching as you choke..")

		saynn("[say=avy]Mmmf.. yeah..[/say]")

		saynn("Your neck bulges slightly with each thrust. Avy keeps increasing the pace, fucking your face raw.. Your eyes are watering again.. but you don't pull away.. you take it, allowing yourself to choke on her shaft, letting her use you.")

		saynn("Her breathing grows heavier, a low growl building in her chest. Her knot inflates but she doesn't dare to shove it in..")

		saynn("[say=avy]Gonna.. fuck.. gonna cum..[/say]")

		addButton("Continue", "See what happens next", "bj_inside")
	if(state == "bj_inside"):
		playAnimation(StageScene.SexOralForced, "suckinside", {pc="avy", npc="pc", bodyState={naked=true, hard=true}, npcBodyState={hard=true}})
		saynn("Her cock starts throbbing in your mouth.. And then.. you begin to feel her hot, thick spurts of cum flooding your throat! Avy keeps doing shallow thrusts while pumping her load down your throat, forcing you to swallow as much as you can.")

		saynn("You can't breathe during this, relying only on what little oxygen you had when she got pushed over the edge. Your throat keeps clenching, milking her balls for every last drop of her seed.")

		saynn("[say=avy]Ahh.. take it all.[/say]")

		saynn("She is panting heavily, her orgasm begins to fade.. just like your vision.")

		addButton("Continue", "See what happens next", "bj_inside_after")
	if(state == "bj_inside_after"):
		playAnimation(StageScene.SexOralForced, "tease", {pc="avy", npc="pc", bodyState={naked=true, hard=true}, npcBodyState={hard=true}})
		saynn("Finally, she pulls out, letting you cough and grab air with your mouth. A few lines of her jizz hang between your lips and her softening length. You lick them off and then show what cum you still have in your mouth.")

		saynn("[say=avy]Cute.[/say]")

		saynn("Then you close your mouth and swallow it, your eyes looking high and spaced out.")

		saynn("[say=avy]Good job. Milked me dry.[/say]")

		saynn("You smile.")

		saynn("And that was it. You take your time to come back to senses before returning back into the arena.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "facials_instead"):
		playAnimation(StageScene.SexOral, "fast", {pc="avy", npc="pc", bodyState={naked=true, hard=true}, npcBodyState={hard=true}})
		saynn("Just as Avy tries to grab your hands and pull them above your head, you yank them back and plant them firmly on her thighs, digging your nails in while giving her angry eyes.")

		saynn("[say=avy]Ah.. I get it, jeez.[/say]")

		saynn("You feel her tense, low growl of frustration. But as you dive back down and take her cock deep into your throat, her growling gets replaced with panting.")

		saynn("You hold her member inside your throat for as long as it's comfortable.. before moving your head back, your tongue working every inch of her shaft. You feel her legs trembling a bit, her breathing getting ragged, her hips trying to thrust. But you hold her firmly.")

		saynn("[say=avy]Mhh-..[/say]")

		saynn("You feel her knot beginning to inflate, swelling against your lips. That's your cue.")

		addButton("Facials", "Time to receive them!", "facials_cum")
	if(state == "facials_cum"):
		playAnimation(StageScene.SexHandjob, "sex", {pc="avy", npc="pc", bodyState={naked=true, hard=true}, npcBodyState={hard=true}, pcCum=true})
		saynn("You pull away with a wet pop, your hand immediately wrapping around her slick, throbbing length. You stroke fast and mercilessly.")

		saynn("[say=avy]Oh fuck.. ahh.[/say]")

		saynn("Your other hand cups her balls, feeling them tighten.")

		saynn("It doesn't take long before the first thick ropes of her cum land across your cheeks, warm and sticky. The next one hits your lips and splatter across your closed eyes and forehead. You keep stroking Avy off, milking every last spurt as she groans and squirms.")

		saynn("[say=avy]F-fuck..[/say]")

		saynn("You wait until she is done.")

		saynn("Carefully, you begin opening your eyes, blinking through the mess. A line of her seed drips down from your nose and onto your tongue. You lick your lips and smile at the panting foxy.")

		saynn("[say=avy]Could have avoided the mess.[/say]")

		saynn("You wipe a bit of her cum from her cheek.")

		saynn("[say=pc]Maybe I like it.[/say]")

		saynn("She laughs, breathless.")

		saynn("[say=avy]Of course you do.[/say]")

		saynn("And that was it. That's how you return back to the arena, all messy and lewd..")

		addButton("Continue", "See what happens next", "endthescene")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "handjob"):
		processTime(3*60)
		#GM.pc.gotThroatFuckedBy("avy")

	if(_action == "bj_do"):
		processTime(3*60)

	if(_action == "facials_instead"):
		GM.pc.gotThroatFuckedBy("avy")

	if(_action == "bj_inside"):
		GM.pc.cummedInMouthBy("avy", FluidSource.Penis)
		GM.pc.gotThroatFuckedBy("avy")

	if(_action == "facials_cum"):
		processTime(3*60)
		GM.pc.cummedOnBy("avy", FluidSource.Penis)

	setState(_action)
