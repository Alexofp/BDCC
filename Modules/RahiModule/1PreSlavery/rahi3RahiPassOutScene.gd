extends SceneBase

var carrying_rahi = false

func _init():
	sceneID = "rahi3RahiPassOutScene"

func _run():
	if(state == ""):
		addCharacter("avy")
		playAnimation(StageScene.Duo, "stand", {npc="avy"})
		saynn("Another night full of pointless dreams gets spoiled by someone's voice.")

		saynn("[say=avy]Wake up. Don't make me kick you.[/say]")

		saynn("Whoever this is, you don't like their voice. So your brain just lets you keep your eyes closed.")

		saynn("That is, until you are suddenly dragged off your bed. A spike of pain echoes around your body as your back hits the floor. That helps you wake up, your eyes open and see an inmate wearing red colors. Did they come to kill you?")

		saynn("[say=pc]Ugh.. what do you..[/say]")

		if (getFlag("RahiModule.Rahi_CanteenSceneHappened") || getFlag("FightClubModule.AvyIntroduced")):
			saynn("[say=avy]You forgot about me already? I thought we had a thing going.[/say]")

		else:
			saynn("[say=avy]Get up already, I don't have all day.[/say]")

		saynn("You slowly raise yourself until you're sitting on the cold floor. Then you use your bed as support while getting up. All the while Avy is just shaking her head, her arms are crossed.")

		saynn("[say=pc]What do you want?[/say]")

		saynn("[say=avy]I just came to tell you that your cat is lying unconscious near the bench.[/say]")

		saynn("Huh? The senses, all of them suddenly become sharp. She is talking about the kitten. And her mean tone tells you that this fox might have something to do with it.")

		saynn("[say=pc]What did you do to her?[/say]")

		saynn("Avy rolls her eyes and leans against the wall.")

		saynn("[say=avy]I didn't do nothing. Just said hi. But then your drunk slut hit the floor.[/say]")

		saynn("[say=pc]Where is she?[/say]")

		saynn("Avy covers her eyes with her palm and just walks out of your cell.")

		saynn("Fuck.")

		addButton("Rush to Rahi", "She needs help", "rush_to_rahi")
	if(state == "rush_to_rahi"):
		removeCharacter("avy")
		addCharacter("rahi")
		playAnimation(StageScene.SexStart, "defeated", {npc="rahi"})
		aimCameraAndSetLocName("main_bench2")
		saynn("You rush out of your cell and quickly climb up the stairs that lead into the main hall. Rahi's bench, you sprint towards it and quickly find the unconscious feline there. The kitty is lying face-down on the cold floor, you're not even sure if she is breathing. There are a few inmates around but no one seems to care enough for a random cat.")

		saynn("You shake the girl. No reaction.")

		saynn("[say=pc]Kitty, can you hear me?[/say]")

		saynn("She is still lying on her belly. You slip your hands under her and flip her around to her back. The obvious cause of her state is a whiskey bottle that's in her paw. A completely empty bottle..")

		saynn("You put your ear to her chest.. Nothing? You're not sure.. You gotta get her to the medical wing, fast. Who knows how long she is unconscious already.")

		saynn("Your heart beats so fast..")

		addButton("Call for help", "Rush to the medical and tell nurses about Rahi", "call_for_help")
		addButtonWithChecks("Carry Rahi", "She is not the heaviest but you still need some strength to do this", "do_carry_rahi", [], [[ButtonChecks.StatCheck, Stat.Strength, 5]])
	if(state == "do_carry_rahi"):
		addCharacter("cp_guard")
		playAnimation(StageScene.Duo, "stand", {npc="cp_guard"})
		aimCameraAndSetLocName("hall_checkpoint")
		carrying_rahi = true
		saynn("You slip your hands under Rahi again and carefully lift her up, using your shoulder to support her head. She is not that heavy, this particular kitty seems to be quite fit. Or maybe that's the alcohol's fault. Either way, you barely feel her weight. The empty bottle falls out of Rahi's paw with a loud ringing sound.")

		saynn("You rush towards the elevator that will bring you to the medical wing.")

		saynn("But that's when the checkpoint guard blocks your path.")

		saynn("[say=cp_guard]Woah. Why the hurry?[/say]")

		saynn("[say=pc]Get out of the way. My friend is unconscious, I need help to save her.[/say]")

		saynn("The guard keeps blocking the path, his arms crossed.")

		saynn("[say=cp_guard]I don't care what happened but you're being awfully disrespectful to an officer of justice. You're not going anywhere until I frisk both of you.[/say]")

		saynn("Fuck. This will take too long. Especially if he will also frisk Rahi.")

		saynn("[say=pc]Listen, I really have no time for this. She might die if she doesn't get help. Now.[/say]")

		saynn("The guy keeps speaking in a monotone voice.")

		saynn("[say=cp_guard]Like I said, I don't give a fuck. Hands on the wall, inmate.[/say]")

		saynn("You carefully set Rahi on the floor.")

		saynn("He bares his weapon.")

		addButton("Fight", "The guy is asking for it", "start_fight")
		addButtonWithChecks("Cave his head in", "The guy is being really annoying", "cave_guard_head", [], [[ButtonChecks.StatCheck, Stat.Strength, 8]])
		addButtonWithChecks("Slip past", "You really have no time for this", "slip_past_guard", [], [[ButtonChecks.StatCheck, Stat.Agility, 10]])
	if(state == "call_for_help"):
		removeCharacter("rahi")
		addCharacter("cp_guard")
		playAnimation(StageScene.Duo, "stand", {npc="cp_guard"})
		aimCameraAndSetLocName("hall_checkpoint")
		saynn("Nurses probably know the best way to transport her. But you gotta get to them. You place Rahi on her side so she doesn't choke on something and take off towards the main elevator.")

		saynn("But that's when the checkpoint guard blocks your path.")

		saynn("[say=cp_guard]Woah. Why the hurry?[/say]")

		saynn("[say=pc]Get out of the way. My friend is unconscious, I need help to save her.[/say]")

		saynn("The guard keeps blocking the path, his arms crossed.")

		saynn("[say=cp_guard]I don't care what happened but you're being awfully disrespectful to an officer of justice. You're not going anywhere until I frisk you.[/say]")

		saynn("Fuck. This will take too long.")

		saynn("[say=pc]Listen, I really have no time for this. She might die if she doesn't get help. Now.[/say]")

		saynn("The guy keeps speaking in a monotone voice.")

		saynn("[say=cp_guard]Like I said, I don't give a fuck. Hands on the wall, inmate.[/say]")

		saynn("He bares his weapon.")

		addButton("Fight", "The guy is asking for it", "start_fight")
		addButtonWithChecks("Cave his head in", "The guy is being really annoying", "cave_guard_head", [], [[ButtonChecks.StatCheck, Stat.Strength, 8]])
		addButtonWithChecks("Slip past", "You really have no time for this", "slip_past_guard", [], [[ButtonChecks.StatCheck, Stat.Agility, 10]])
	if(state == "if_won"):
		removeCharacter("cp_guard")
		playAnimation(StageScene.Solo, "stand")
		if (carrying_rahi):
			saynn("The guard is defeated. But that's not why you're here so you just shove him away and grab Rahi before rushing for the elevator. You only hear him grunt and shittalk you while the doors close.")

		else:
			saynn("The guard is defeated. But that's not why you're here so you just shove him away and rush to the elevator. You only hear him grunt and shittalk you while the doors of the elevator close.")

		saynn("[say=cp_guard]Ugh.. what a bitch.[/say]")

		addButton("Continue", "See what happens next", "bring_rahi_to_medical")
	if(state == "if_lost"):
		playAnimation(StageScene.Solo, "stand")
		removeCharacter("cp_guard")
		saynn("The guard forces you against the wall and proceeds to frisk you, taking away anything illegal.")

		saynn("[say=cp_guard]See? Wasn't so fucking hard, bitch.[/say]")

		saynn("Still, you wasted a lot of time fighting him and then getting frisked. Hopefully Rahi can endure another few minutes.")

		if (carrying_rahi):
			saynn("As he lets you go, you grab Rahi again and rush for the elevator. You almost don't feel any pain.")

		else:
			saynn("As he lets you go, you rush for the elevator. You almost don't feel any pain.")

		addButton("Continue", "See what happens next", "bring_rahi_to_medical")
	if(state == "cave_guard_head"):
		saynn("The stupidity of the situation. It angers you. It angers you so much that you just reach your hands out, get a grasp on the guy's hair and slam his head against the metal wall with a satisfying boink.")

		saynn("He yelps before losing all senses of balance and collapsing.")

		saynn("[say=pc]I really. Really. Have no time for this.[/say]")

		saynn("The guy seems.. alive. He is breathing at least. You quickly go through his belt and find a personal medkit. Your hands sloppily wrap a bandage around his head before feeding him some painkillers. Now he should be fine for sure.")

		if (carrying_rahi):
			saynn("Then you just carry Rahi into the elevator and hit the button that claims to bring you to the medical wing.")

		else:
			saynn("Then you rush into the elevator and hit the button that claims to bring you to the medical wing.")

		addButton("Continue", "See what happens next", "bring_rahi_to_medical")
	if(state == "slip_past_guard"):
		playAnimation(StageScene.Duo, "dodge", {npc="cp_guard", npcAction="defeat"})
		removeCharacter("cp_guard")
		saynn("You keep creeping towards the guard, you really have no time for this. His hand clenches the stun baton tighter before his first attack. Your eyes spot it before he even commits to it, you react by recoiling away, causing him to overextend towards you.")

		saynn("That gives you a lot of options. Your hands catch him and pull him towards your direction even harder, causing the guy to trip. You help him by throwing him further. He grunts as he hits the floor and then rolls down the stairs that lead to the checkpoint.")

		saynn("[say=cp_guard]You.. Argh!..[/say]")

		if (carrying_rahi):
			saynn("No time to chat, you grab Rahi again and rush for the elevator before hitting the button that should bring you down to the medical.")

		else:
			saynn("No time to chat, you rush for the elevator before hitting the button that should bring you down to the medical.")

		addButton("Continue", "See what happens next", "bring_rahi_to_medical")
	if(state == "bring_rahi_to_medical"):
		removeCharacter("rahi")
		addCharacter("eliza")
		playAnimation(StageScene.Duo, "stand", {npc="eliza"})
		aimCameraAndSetLocName("med_lobby_start")
		if (carrying_rahi):
			saynn("You burst into the medical lobby and quickly get the attention of all the idling nurses.")

			saynn("[say=pc]She needs help, now![/say]")

			saynn("The doctor that was sitting behind the counter instantly springs up and rushes to you, she already gives orders to the sleepy staff.")

			saynn("[say=eliza]You and you, get her onto the stretcher.[/say]")

			saynn("After that, doctor Quinn checks the pulse of the feline in your hands.")

			saynn("[say=eliza]Very faint.[/say]")

			saynn("[say=pc]Alcohol, she emptied a whole bottle by herself.[/say]")

			saynn("[say=eliza]I see. I fear there is more to it than just heavy intoxication.[/say]")

			saynn("Nurses bring the stretcher out and wait for you to place unconscious Rahi onto it.")

			saynn("[say=eliza]Operating room, quick. Prepare her.[/say]")

			saynn("The nurses then rush the feline somewhere behind the staff only doors. You wanted to follow but Eliza stopped you, her claws digging into your shoulder.")

			saynn("[say=eliza]No you don't.[/say]")

			saynn("She then holds her paw onto her headset.")

			saynn("[say=eliza]Quinn speaking, I need the best surgeon we have. No, I don't care that it's the morning shift, there is no time, wake him up now.[/say]")

			saynn("She looks at you.")

			saynn("[say=eliza]You stay and let us take it from here, understand?[/say]")

			saynn("You nod and watch the doctor go.")

			saynn("What a day huh.")

		else:
			saynn("You burst into the medical lobby and quickly get the attention of all the idling nurses.")

			saynn("[say=pc]Main hall, one of the inmates is unconscious. She needs help, now![/say]")

			saynn("The doctor that was sitting behind the counter instantly springs up and rushes to you, she already gives orders to the sleepy staff.")

			saynn("[say=eliza]You and you, grab a stretcher and bring her here.[/say]")

			saynn("The elevator doors hide the two nurses that went after the feline. Eliza looks at you, deeply concerned.")

			saynn("[say=eliza]It's Rahi, isn't it? What happened?[/say]")

			saynn("[say=pc]Alcohol, a whole bottle of it.[/say]")

			saynn("Eliza bares her fangs and growls at you. But then shakes her head and focuses.")

			saynn("[say=eliza]I see. I fear there is more to it than just heavy intoxication then.[/say]")

			saynn("She holds her paw on her headset.")

			saynn("[say=eliza]Quinn speaking, I need the best surgeon we have. No, I don't care that it's the morning shift, there is no time, wake him up now.[/say]")

			saynn("After what feels like a few seconds, the elevator doors open, revealing a stretcher with an unconscious Rahi on it and the same two nurses. Eliza checks her pulse")

			saynn("[say=eliza]Very faint. Operating room, quick. Prepare her.[/say]")

			saynn("The nurses then rush the feline somewhere behind the staff only doors. You wanted to follow but Eliza stopped you, her claws digging into your shoulder.")

			saynn("[say=eliza]No you don't.[/say]")

			saynn("You recoil back and look at her.")

			saynn("[say=eliza]You stay and let us take it from here, understand?[/say]")

			saynn("You nod and watch the doctor go.")

			saynn("What a day huh.")

		addButton("Continue", "See what happens next", "rahi_in_surgery")
	if(state == "rahi_in_surgery"):
		removeCharacter("eliza")
		removeCharacter("rahi")
		playAnimation(StageScene.Solo, "sit")
		aimCameraAndSetLocName("med_lobbyse")
		GM.pc.setLocation("med_lobbyse")
		saynn("You find the nearest bench and take a seat. You just now realize how shaky your hands are.")

		saynn("Time drags on for what feels like forever. At least nothing is under your control anymore.")

		saynn("You lean forward, supporting your chin with your arms, and just wait..")

		addButton("Continue", "See what happens next", "eliza_saves_rahi")
	if(state == "eliza_saves_rahi"):
		addCharacter("eliza")
		playAnimation(StageScene.Duo, "stand", {npc="eliza"})
		saynn("Finally the staff-only automated doors open, revealing doctor Quinn. She approaches you, a datapad in her paws.")

		saynn("[say=pc]How is she?[/say]")

		saynn("[say=eliza]Rough. But she will be okay.[/say]")

		saynn("That's a relief. Somewhat.")

		saynn("[say=eliza]We.. cleaned out her stomach. Gastric lavage is the term. Wasn't enough though.[/say]")

		saynn("[say=pc]What do you mean?[/say]")

		saynn("Eliza sighs and scrolls through her datapad. She then flips it and shows you the rough outline of Rahi. There are green areas but most of her body is orange with her brain and stomach being bright red.")

		saynn("[say=eliza]Alcohol binging has a few destructive elements. It kills the liver first and foremost. And sadly, we don't have any transplants that are compatible. A synthetic one.. doesn't make sense for an inmate.. is what they say.[/say]")

		saynn("Well that sucks.")

		saynn("[say=eliza]So the surgeon had to work with what she had. Should be enough to keep her alive for now.. But another one of these.. and..[/say]")

		saynn("[say=pc]I understand. Why is her head red too?[/say]")

		saynn("[say=eliza]That's the other one. Alcohol has long-lasting effects on neurotransmitters. It destroys the brain cells and connections between them. We didn't dare to touch her brain, too much risk.[/say]")

		saynn("You nod subtly.")

		saynn("[say=pc]Could that be the reason why she talks like she does? Brain damage?..[/say]")

		saynn("Eliza scritches her chin and looks at the ceiling for some time.")

		saynn("[say=eliza]Damage to neurons usually leads to loss of memory. Maybe you're right though. Maybe she just forgot that she is Rahi.[/say]")

		saynn("[say=pc]So what now?[/say]")

		saynn("Eliza puts away her datapad.")

		saynn("[say=eliza]The surgeon is finishing up with her. So she will be out in an hour or two. She will need a lot of attention, okay?[/say]")

		saynn("You take a seat on the bench again.")

		saynn("[say=pc]I understand. Thank you.[/say]")

		saynn("Eliza nods and walks away, hiding behind the staff-only doors again.")

		addButton("Continue", "See what happens next", "wait_more_after_surgery")
	if(state == "wait_more_after_surgery"):
		removeCharacter("eliza")
		playAnimation(StageScene.Solo, "sit")
		saynn("You just sit and wait. Sit and wait..")

		saynn("Eventually doctor Quinn returns and sits behind the counter. Can't be long now..")

		addButton("Continue", "See what happens next", "rahi_is_alive")
	if(state == "rahi_is_alive"):
		addCharacter("rahi")
		playAnimation(StageScene.Duo, "stand", {npc="rahi", npcAction="sit"})
		saynn("Finally, the doors open, revealing Rahi, a barely standing one but Rahi nonetheless.")

		saynn("You quickly rush up to her and help her get to the nearest bench before making her sit.")

		saynn("The feline tilts her head down, her ears turned down.")

		saynn("[say=pc]How are you, kitty?[/say]")

		saynn("She nods subtly, her eyes.. emotionless.")

		saynn("[say=rahi]Could be worse.. She is alright..[/say]")

		saynn("[say=pc]You made us all very worried.[/say]")

		saynn("[say=rahi]Sorry..[/say]")

		saynn("Rahi unbuttons the lower part of her shirt, revealing a stitched up surgery line. You just carefully wrap your hands around her body and hug.")

		saynn("[say=pc]Doctor said..[/say]")

		saynn("[say=rahi]No alcohol.. she knows.. Under no circumstances. She is not allowed to drink.. or she will die..[/say]")

		saynn("You just nod slightly and embrace the feline harder.")

		saynn("[say=pc]What do you think about that?[/say]")

		saynn("You only get silence back. Kitty hugs you back and then slowly gets up.")

		saynn("[say=rahi]She is gonna go rest in her cell.. kitty hopes that's okay..[/say]")

		saynn("[say=pc]Of course. I will help you.[/say]")

		saynn("You offer the feline a pat on the head, resulting in her purring.")

		saynn("Rahi holds onto her stomach while stepping into the elevator with you. Her motions slow. Her face still didn't show much emotion. Probably because of what she had to suffer through.")

		addButton("Continue", "See what happens next", "bring_rahi_to_her_cell")
	if(state == "bring_rahi_to_her_cell"):
		playAnimation(StageScene.Duo, "stand", {npc="rahi"})
		aimCameraAndSetLocName("cellblock_orange_nearcell")
		GM.pc.setLocation("cellblock_orange_nearcell")
		saynn("You help Rahi get to her cell. The feline turns around and kisses your cheek. This kiss offers you hope, the thing that you lacked.")

		saynn("[say=rahi]Thank you.. Sorry for being like that..[/say]")

		saynn("[say=pc]Not your fault.[/say]")

		saynn("She stares into your eyes. Her lips, wordless. Sometimes silence speaks louder than words.")

		saynn("[say=pc]I will check on you tomorrow, okay?[/say]")

		saynn("Again, more silence. Rahi's eyes scan your face for a few seconds. After that she nods subtly and lays down onto her bed.")

		saynn("Gotta give her some rest.")

		addButton("Continue", "See what happens next", "endthescene")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "rush_to_rahi"):
		processTime(3*60)

	if(_action == "start_fight"):
		runScene("FightScene", ["cp_guard"], "guard_fight")
		return

	if(_action == "bring_rahi_to_medical"):
		processTime(2*60)

	if(_action == "rahi_in_surgery"):
		processTime(30*60)

	if(_action == "eliza_saves_rahi"):
		processTime(90*60)

	if(_action == "wait_more_after_surgery"):
		processTime(80*60)

	if(_action == "rahi_is_alive"):
		processTime(20*60)

	if(_action == "bring_rahi_to_her_cell"):
		processTime(10*60)

	setState(_action)

func _react_scene_end(_tag, _result):
	if(_tag == "guard_fight"):
		processTime(3 * 60)
		var battlestate = _result[0]
		
		if(battlestate == "win"):
			setState("if_won")
			addExperienceToPlayer(50)
		else:
			setState("if_lost")
			friskPlayer()

func saveData():
	var data = .saveData()

	data["carrying_rahi"] = carrying_rahi

	return data

func loadData(data):
	.loadData(data)

	carrying_rahi = SAVE.loadVar(data, "carrying_rahi", false)

func getDevCommentary():
	return "Another one of those Rahi's 'self-destruction' scenes.. Yeah, it all happens a little too fast maybe but otherwise it would be boring to read. The 'stakes' need to get higher each time. If Rahi's approach isn't changing - something else must change."

func hasDevCommentary():
	return true
