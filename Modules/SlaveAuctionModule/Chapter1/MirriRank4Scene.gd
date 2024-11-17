extends SceneBase

func _init():
	sceneID = "MirriRank4Scene"

func _run():
	if(state == ""):
		addCharacter("mirri")
		playAnimation(StageScene.Duo, "stand", {npc="mirri"})
		saynn("Mirri bounces happily, struggling to contain her excitement as she is looking into her laptop.")

		saynn("[say=mirri]Two more ranks.. and I will be the best slaver. In the whole galaxy! For real this time.[/say]")

		saynn("She takes her eyes from the laptop and looks at you. Your silent stare says a lot.")

		saynn("[say=mirri]You did help a lot, I will admit.[/say]")

		saynn("Oh wow, some recognition. Maybe she isn't as hopeless as you thought.")

		saynn("[say=pc]I sure did.[/say]")

		saynn("[say=mirri]Pff, but I could have done all of this myself![/say]")

		saynn("Aw, nah, she is hopeless.")

		saynn("[say=mirri]..it just would have taken me a long time.. long ass time..[/say]")

		saynn("At least she is realistic.")

		saynn("[say=mirri]You should be thankful too. I'm saving your silly prison from being destroyed, you know.. You also get paid. Just don't tell dad that you're getting paid.[/say]")

		saynn("[say=luxe]Khm.[/say]")

		saynn("[say=mirri]..oops..[/say]")

		saynn("Looks like you're not alone in Mirri's room.")

		addButton("Continue", "See what happens next", "luxe_comes_in")
	if(state == "luxe_comes_in"):
		addCharacter("luxe")
		playAnimation(StageScene.Duo, "stand", {npc="luxe"})
		saynn("Luxe is standing in the entrance, his usual cold aura surrounds his powerful form.")

		saynn("[say=mirri]Learn to knock already, dad.[/say]")

		saynn("[say=luxe]Don't tell me what to do.[/say]")

		saynn("Mirri rolls her eyes. Yeah, looks like he didn't come to praise her for doing so well.")

		saynn("The wolf steps deeper into the room, his eyes scan the surroundings.")

		saynn("[say=mirri]You won't find a single spec of dust. I keep everything clean, just for you![/say]")

		saynn("Luxe hears that and nods subtly.. before heading straight for the interesting wardrobe.")

		saynn("[say=mirri]Hey-hey, wait![/say]")

		saynn("He opens it.. and sees what can only be described as an avalanche of various sextoys coming out of it.")

		saynn("[say=mirri]..if you wanted a vibrator, you could have just asked.[/say]")

		saynn("[say=luxe]Hm.[/say]")

		saynn("Mirri rushes to the wardrobe and starts picking up all the toys while Luxe approaches you. His stare alone is making you shiver.")

		saynn("[say=luxe]Follow me.[/say]")

		saynn("The catgirl quickly shoves everything back into her wardrobe and slams the doors closed.")

		saynn("[say=mirri]Here, it's all neat again! Look, dad.[/say]")

		saynn("Luxe nods towards her.. and proceeds to head towards the exit from her room, his strong back is inviting you to be close to it.")

		addButton("Follow", "See what he has to say to you", "do_follow_mirri")
	if(state == "do_follow_mirri"):
		playAnimation(StageScene.Duo, "stand", {pc="luxe", npc="mirri"})
		saynn("Mirri's lips are trembling. You can just feel the pressure rising inside her with each second. Suddenly she pounces towards her dad.. but lands just in front of him, blocking the exit from her room.")

		saynn("[say=mirri]At least scold me or something! Make me feel like shit like you always do! Abuse me verbally, I don't care. Make me feel.. something.. you're my dad.. don't ignore me..[/say]")

		saynn("The whole world stays silent for a few seconds. Room gets hotter and hotter.. a bad sign.. Until Luxe finally looks at Mirri.")

		saynn("[say=luxe]How about a.. little family dinner. You and me.[/say]")

		saynn("[say=mirri]What?[/say]")

		saynn("Mirri is still shaking after her outburst of rageful energy. But she quickly realizes what was said to her.")

		saynn("[say=mirri]OH. A family dinner. That sounds great, yes. Dinner sounds good.[/say]")

		saynn("She leans to the side to look behind his dad.")

		saynn("[say=mirri]Can {pc.heShe} come too?[/say]")

		saynn("Luxe stays motionless for some time. But you can feel the heat radiating from him.. Each word takes a lot from him.")

		saynn("[say=luxe]Mhm. I will prepare it for the next time.[/say]")

		saynn("Mirri blinks, her lips are parted, mouth slightly opened in awe, her body seems paralyzed.")

		saynn("Luxe just stares at her until she snaps out of it and steps aside.")

		saynn("It's not exactly a family dinner if only two family members are invited.. and also a random person.. but oh well.")

		saynn("Getting hot in there, time to move..")

		addButton("Follow", "Now actually follow him", "follow_luxe_office")
	if(state == "follow_luxe_office"):
		removeCharacter("mirri")
		aimCameraAndSetLocName("market_luxe")
		playAnimation(StageScene.Duo, "stand", {pc="luxe", npcAction="sit"})
		saynn("Luxe enters his office.. you follow soon after, a slight breeze tickles your face. A familiar feeling.. but the unnatural warmth quickly comes back. You're almost sweating..")

		saynn("Unsure of where to stand.. you just stand in the middle of his office again. Luxe quickly reaches into his desk to get something. You hear a few beeps.. before he produces a pill bottle. He pops one.. and the room begins to cool.")

		saynn("Luxe closes his eyes and produces a sigh of relief.")

		saynn("[say=luxe]It's always like that with Mirri. The girl knows how to trigger my.. condition.[/say]")

		saynn("[say=pc]You do ignore her quite a bit, it only makes sense for her to get louder and louder in order to get to you.[/say]")

		saynn("[say=luxe]And, I guess, me giving in and offering dinner doesn't help.[/say]")

		saynn("You shrug.")

		saynn("[say=pc]Her pressure made you do it?[/say]")

		saynn("Luxe opens his eyes, his cold gaze directed at you.")

		saynn("[say=luxe]No. That's what I wanted to talk with you about.[/say]")

		saynn("He wants to talk with you? Of all people?")

		saynn("[say=luxe]Take a seat.[/say]")

		saynn("He gestures towards the fancy chair.")

		addButton("Sit", "Might as well get comfy", "do_sit_chair")
	if(state == "do_sit_chair"):
		playAnimation(StageScene.Duo, "sit", {pc="luxe", npcAction="stand"})
		saynn("You sit down.. while he gets up.")

		saynn("Luxe turns his back towards you, staring at the fancy hologram map on his wall.")

		saynn("[say=luxe]Despite who I am, I don't have a lot of people I can just talk with.[/say]")

		saynn("[say=pc]What are you talking about? You have a lot of kids, including Mirri who would probably love to talk with you, judging from what I see.[/say]")

		saynn("You hear a sigh, Luxe lowers his chin for a second.")

		saynn("[say=luxe]I'm a leader, I can not be seen as weak by my family. I don't have the strength to be weak.[/say]")

		saynn("Interesting situation he has found himself in.")

		saynn("[say=luxe]And Mirri.. She is a different kind of deal.[/say]")

		saynn("[say=pc]You always call her just Mirri. She is your daughter, isn't she?[/say]")

		saynn("The wolf stays silent for a solid five seconds.. before facing you again.")

		saynn("[say=luxe]Yes. But you would never hear me call her that.[/say]")

		saynn("[say=pc]Why not?[/say]")

		saynn("[say=luxe]It's complicated.[/say]")

		saynn("At least he is not denying it.")

		saynn("[say=pc]It's because you want those coords from her? You are giving her the silent treatment until she snaps?[/say]")

		saynn("[say=luxe]Coords? No.[/say]")

		saynn("He shakes his head and stands pacing behind his desk.")

		saynn("[say=luxe]She could do whatever she wants with your prison. Destroying it would be a preferred option for me. But ultimately, I don't care.[/say]")

		saynn("That.. doesn't exactly line up with his previous words.")

		saynn("[say=pc]You told me something else before.[/say]")

		saynn("[say=luxe]I'm trying to change.[/say]")

		saynn("His answer was snappy. He stares into one of the corners of his office, admiring the empty air.")

		saynn("[say=luxe]What's happening between me and Mirri, it's unhealthy. It shouldn't be like that.[/say]")

		saynn("A lot of good words are being said. Huh. Feels like Luxe is on the right track so far.")

		saynn("[say=pc]Why was it like that to begin with?[/say]")

		saynn("He looks at his hands and sighs..")

		saynn("[say=luxe]I think I know why. But it's a long story.[/say]")

		addButton("Hear it", "(Heavy Sexual Abuse) Live it through his eyes", "about_to_start_flashback")
		addButton("Short version", "Hear him out without getting too invested into it", "hear_luxe_out")
	if(state == "about_to_start_flashback"):
		saynn("Luxe grabs a standing picture frame from his desk.. and stares at it.")

		saynn("[say=luxe]Many years ago..[/say]")

		saynn("His words begin to paint a picture.. and you can't help yourself from getting drawn in..")

		addButton("Continue", "See how it happened..", "start_flashback")
	if(state == "after_flashback"):
		playAnimation(StageScene.Duo, "sit", {pc="luxe", npcAction="stand"})
		saynn("When Luxe ends his story.. you finally snap out of it..")

		saynn("[say=luxe]When I look at Mirri.. I see everything. I see my mistakes.[/say]")

		addButton("Be supportive", "Tell Luxe that he has to try to move on", "tell_moveon")
		addButton("Be antagonistic", "Tell Luxe that he deserves it", "tell_antag")
	if(state == "hear_luxe_out"):
		saynn("Luxe grabs a standing picture frame from his desk.. and stares at it.")

		saynn("[say=luxe]Many years ago, my wife and I went through an experimental procedure. Better heat resistance, extra protection against laser weapons. And these golden fur tips were a nice extra. It all sounded great on paper.[/say]")

		saynn("Yeah, you can tell that he just loves everything that's golden.")

		saynn("[say=luxe]It worked on me, mostly. But the love of my life wasn't so lucky.[/say]")

		saynn("He winces and puts the photo down.")

		saynn("[say=luxe]We figured out too late that the procedure had a nasty side effect.[/say]")

		saynn("Nothing is free in this world..")

		saynn("[say=luxe]We didn't have these pills back then.[/say]")

		saynn("Luxe stays quiet and motionless for a while. You can see him going through the moments of his life in his eyes.")

		saynn("[say=luxe]I watched her burn up from the inside.. in my hands.. While I had to.. I had to stay calm.. dead calm.. or the same would have happened to me.[/say]")

		saynn("That's rough. Extremely rough.")

		saynn("[say=luxe]I wanted this. I made her commit to the procedure.[/say]")

		saynn("He lowers his head.")

		saynn("[say=luxe]I felt destroyed. When I got the pills.. I walked to one of my slaves.. and went out on her in a blind rage. She got pregnant.[/say]")

		saynn("That's one way to cope..")

		saynn("[say=luxe]I sold her off, I simply couldn't look at her. But I kept the kid.[/say]")

		saynn("He did something right at least.")

		saynn("[say=luxe]When I look at Mirri.. I see everything. I see my mistakes.[/say]")

		addButton("Be supportive", "Tell Luxe that he has to try to move on", "tell_moveon")
		addButton("Be antagonistic", "Tell Luxe that he deserves it", "tell_antag")
	if(state == "tell_moveon"):
		saynn("[say=pc]Luxe, you will have to accept it. What happened - it happened, you can not undo it. But you have to continue living. And Mirri is not to blame for anything, I hope you understand that.[/say]")

		saynn("[say=luxe]I do.[/say]")

		saynn("[say=luxe]I will try.[/say]")

	if(state == "tell_antag"):
		saynn("[say=pc]I think you deserve what happened to you. You paid the price for all the pain and suffering that you caused to other people.[/say]")

		saynn("[say=luxe]Hm. I expected nothing more from someone like you.[/say]")

		saynn("[say=pc]I have no empathy for slavers.[/say]")

		saynn("[say=luxe]Look in the mirror first next time.[/say]")

		saynn("[say=pc]Ugh.. Your family is a bunch of crazy fucks..[/say]")

		saynn("[say=luxe]My family is the only thing that keeps me going.[/say]")


func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "luxe_comes_in"):
		processTime(3*60)

	if(_action == "do_follow_mirri"):
		processTime(2*60)

	if(_action == "follow_luxe_office"):
		processTime(3*60)

	if(_action == "do_sit_chair"):
		processTime(3*60)

	if(_action == "hear_luxe_out"):
		processTime(5*60)

	if(_action == "start_flashback"):
		runScene("LuxeBackstoryScene")
		setState("after_flashback")
		return

	setState(_action)
