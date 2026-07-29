extends SceneBase

func _init():
	sceneID = "DomM2s1Intro"

func _run():
	if(state == ""):
		playAnimation(StageScene.Duo, "stand", {npc="kait"})
		addCharacter("kait")
		saynn("You're standing near Kait.")

		saynn("[say=kait]We have the records now![/say]")

		saynn("She turns around and begins attaching them to the planning board, her tail swishing excitedly.")

		saynn("[say=kait]Right so..[/say]")

		saynn("[say=pc]Should we gather everyone?[/say]")

		saynn("[say=kait]Yeah, I'm just thinking about it..[/say]")

		saynn("The snow leopard keeps staring at the lists, her head tilted. Her round ears twitch as she reads, her hand now holding a marker instead.")

		saynn("[say=kait]So many names.. How do we pick.. We probably don't want any traitors. Do we want murderers though? What about terrorists.. I guess we wanna capture this prison, not destroy it.[/say]")

		saynn("She skims the names, her glance seems to be caught by one of them.")

		saynn("[say=kait]Oh yeah, of course she would be on this list.[/say]")

		saynn("[say=pc]Who?[/say]")

		saynn("[say=kait]Eh, doesn't matter.[/say]")

		saynn("Kait crosses her arms and then scritches her chin, her tail wraps around her leg.")

		saynn("[say=kait]The staff too, how do we pick the best targets..[/say]")

		saynn("Suddenly, a familiar voice behind you.")

		saynn("[say=avy]I hear that someone is struggling! And she didn't even invite us, so rude.[/say]")

		addButton("Continue", "See what happens next", "avy_comes_in")
	if(state == "avy_comes_in"):
		addCharacter("avy")
		addCharacter("announcer")
		playAnimation(StageScene.Duo, "stand", {npc="avy", pc="kait"})
		saynn("It's Avy and Ans, the duo joins you. The fox strolls in swiftly but the guy takes his time, using his mic-cane for support as he walks.")

		saynn("[say=kait]I was doing the initial preparations![/say]")

		saynn("Avy smirks and leans against a wall.")

		saynn("[say=avy]Nu huh, it looks like you were doing the fun part without us.[/say]")

		saynn("Ans walks further and stops near the planning board, scanning the lists.")

		saynn("[say=announcer]We can help with the preparations.[/say]")

		saynn("[say=pc]We're thinking about our next targets.[/say]")

		saynn("[say=kait]Yeah.. and these lists are confusing.[/say]")

		saynn("Avy pushes off the wall and strides towards the board, snatching the marker from Kait's paw.")

		saynn("[say=avy]Bitch please. I am Avy, the master of lists. Let me through.[/say]")

		saynn("She pulls both lists from the board and starts quickly going over them.")

		saynn("[say=avy]Alright. You want this bitch, this bitch, this bitch.. fuck this one.. fuck this one too.. but this bitch is good.[/say]")

		saynn("That was quick.")

		saynn("[say=kait]So?[/say]")

		saynn("Avy gestures towards the crates and chairs placed around the room.")

		saynn("[say=avy]Sit your butts down![/say]")

		saynn("Then she points at Kait.")

		saynn("[say=avy]Including you, softie.[/say]")

		saynn("Looks like it's Avy's turn to do a presentation.")

		saynn("Avy writes the word 'Captain' on the board with bold letters. Below it, she writes 'Skar' with smaller letters, pressing hard enough to make the marker squeak.")

		addButton("Continue", "See what happens next", "show_skar")
	if(state == "show_skar"):
		playAnimation(StageScene.Solo, "stand", {pc="skar"})
		saynn("Skar.. There is a small picture of him in the list so you can kinda see how he looks.")

		saynn("[say=avy]Skar seems to be the one who is protecting the Captain's office. He is a guard, a wolf, lots of metal. Went through some wars. Guess he had enough.[/say]")

		saynn("Ans nods slowly, rubbing his chin.")

		saynn("[say=announcer]Can't be a hero if you don't sacrifice some part of yourself.[/say]")

		saynn("[say=kait]So he is our first priority target?[/say]")

		saynn("Avy waves dismissively.")

		saynn("[say=avy]Calm your tits, sugar cat. He is the one who protects the office. But the captain isn't always glued to his chair.[/say]")

		saynn("Avy starts writing more names besides that one.")

		addButton("Continue", "See what happens next", "risha_nova_showcase")
	if(state == "risha_nova_showcase"):
		playAnimation(StageScene.Duo, "stand", {pc="risha", npc="nova"})
		saynn("Risha and Nova.. that's the names she adds to the board.")

		saynn("[say=avy]Risha looks suspiciously like his personal guard. His bestie if you will.[/say]")

		saynn("Oh yeah, you saw Risha, multiple times in fact. She was the one who helped process you when you arrived.")

		saynn("[say=pc]I saw her. A real bitch. Got the muscles but dumb as bricks. Horny all the time too it seems.[/say]")

		saynn("Avy chuckles, her tail flicking.")

		saynn("[say=avy]I'm somewhat familiar with her too.[/say]")

		saynn("Kait's ears perk up.")

		saynn("[say=kait]Oh yeah?[/say]")

		saynn("[say=avy]Yes, shut up. The third guard is Nova. We all saw her.[/say]")

		saynn("A familiar husky indeed.")

		if (GM.main.MS.getSpecificFlag("helped", "") == "kait"):
			saynn("[say=kait]Oh yeah. She is the one we stole the badge from. She shouldn't pose much of a threat.[/say]")

			saynn("[say=avy]That's because we saved you. If {pc.name} didn't intervene, your neck would be fried.[/say]")

			saynn("Kait puffs out her chest.")

			saynn("[say=kait]Pff, I totally had it all under control.[/say]")

			saynn("[say=avy]Oh yeah?[/say]")

		else:
			saynn("[say=kait]Oh yeah, she is the one who dropped me. Ugh, I hate her already.[/say]")

			saynn("[say=avy]You just had to keep her busy for some time.[/say]")

			saynn("Avy shrugs as Kait growls..")

			saynn("[say=kait]Fuck you, you could have helped me.[/say]")

			saynn("[say=avy]You asked to do it alone. Got what you wanted.[/say]")

		saynn("Ans breaks the tension.")

		saynn("[say=announcer]I wonder why he would pick Risha over Nova or Skar to be his bestie.[/say]")

		saynn("Avy taps the marker against her chin.")

		saynn("[say=avy]Huh. Nova is an Ex-Inmate apparently. So he probably doesn't trust her. Skar.. I dunno, he just seems to be a husk of a man by this point.[/say]")

		saynn("Ans nods slowly.")

		saynn("[say=announcer]Our captain just doesn't have much of a choice it seems.[/say]")

		saynn("[say=kait]That's good. That's very good.[/say]")

		saynn("Kait paces around the chairs back and forth.")

		saynn("[say=kait]So we get our hands on Nova, Risha and Skar. Then we're golden, right? The captain is ours then, he would be exposed more than your bulge when you see a lilac slut walking past.[/say]")

		saynn("Avy checks her own shorts.. then shoots a glance back at Kait.")

		saynn("[say=avy]You're a lilac slut and yet my shorts aren't bulging.[/say]")

		saynn("[say=kait]Don't lie, I see it.[/say]")

		saynn("Kait's cheeks flush a bit.. she mumbles something to herself.")

		saynn("[say=kait]..I'm not a slut..[/say]")

		saynn("[say=avy]Haha. And no.[/say]")

		saynn("Ans grabs attentions by raising his cane.")

		saynn("[say=announcer]While they can just shock our necks, it's pointless to try to do anything big. We will only have one shot, realistically.[/say]")

		saynn("Kait stops pacing, her tail droop.s")

		saynn("[say=kait]Collars.. can we do something about that?[/say]")

		saynn("[say=avy]I've got just the man.[/say]")

		addButton("Continue", "See what happens next", "alex_eliza_intros")
	if(state == "alex_eliza_intros"):
		playAnimation(StageScene.Duo, "stand", {pc="alexrynard", npc="eliza"})
		saynn("She writes the name 'Alex Rynard' and a word 'collars' near it.")

		saynn("[say=avy]Alex Rynard. A foxy, wow, we got so much in common. Seems to be the one who is semi-responsible for the collars. He is also spineless. Perfect for breaking.[/say]")

		saynn("[say=kait]How are you gonna break someone who doesn't have a spine?[/say]")

		saynn("[say=avy]He has a prosthetic one, duh.[/say]")

		saynn("Kait hums.")

		saynn("[say=kait]Okay, we will have to pay him a visit then.[/say]")

		saynn("Avy adds another name.. 'Eliza Queen'.")

		saynn("[say=kait]A doctor? Why would she be useful to us?[/say]")

		saynn("[say=avy]Who is gonna drag your ass out of the mental ward when you're gonna fuck up? And who's gonna heal your broken pelvis after I'm done with you? It's good to have someone on the inside.[/say]")

		saynn("Kait squints at her.")

		saynn("[say=kait]Yeah? Maybe the real reason is that you want access to something, huh? I don't think she is just a generic doctor, is she?[/say]")

		saynn("[say=avy]What are you implying, bitch?[/say]")

		saynn("Kait takes a step closer.")

		saynn("[say=kait]Do you want me to say it?[/say]")

		saynn("Avy meets her actions with a step of hers.")

		saynn("[say=avy]Try me.[/say]")

		saynn("Ans gets up and steps between them, his voice calm but firm.")

		saynn("[say=announcer]Relax, girls. It's a dangerous game we're playing, we need to be able to rely on each other. I'm glad that you all seem to be getting along, at least a little bit.[/say]")

		saynn("[say=kait]It's all my leadership skills![/say]")

		saynn("Avy throws her head back and laughs.")

		saynn("[say=avy]HAHAHA.[/say]")

		saynn("[say=announcer]Having a doctor on our side might indeed be quite useful. Avy, what do you think should be our current target?[/say]")

		saynn("Avy raises a marker.")

		saynn("[say=avy]I was getting to it![/say]")

		saynn("She swiftly looks through the list of inmates.. and starts writing down a certain name..")

		saynn("[say=avy]Kait should obviously be our main priority, we gotta break that little brat. Other than that.. Let me present to you..[/say]")

		addButton("Continue", "See what happens next", "ferri_reveal")
	if(state == "ferri_reveal"):
		playAnimation(StageScene.Solo, "stand", {pc="ferri"})
		saynn("Avy writes the name 'Ferri'.")

		saynn("[say=avy]Meet Ferri. A red. A hybrid of two species apparently. A dragon and a cat. Huh, I'd watch that.[/say]")

		saynn("Kait rolls her eyes.")

		saynn("[say=kait]Of course you would. And why would we need this 'Ferri'?[/say]")

		saynn("[say=avy]It says here that she is a chemist. Did some nasty stuff. She is very much against AlphaCorp too so our targets align.[/say]")

		saynn("[say=kait]Can't we find a chemist in the medbay?[/say]")

		saynn("Avy shakes her head.")

		saynn("[say=avy]The one who is capable of making bombs or nerve agents? I doubt it. But this bitch has done stuff like that before.[/say]")

		saynn("[say=kait]I hate this prison but destroying it would also kill us, you know.[/say]")

		saynn("[say=avy]Who said anything about the whole prison? The captain can lock and bolt down all the doors with one button press. How do you plan on getting through to him then?[/say]")

		saynn("Kait scratches behind her head.")

		saynn("[say=kait]Well..[/say]")

		saynn("[say=avy]That's right, we need a special chemist so we're gonna break this slut next. She is a total doormat anyway, I fought her in the arena.[/say]")

		saynn("Ans raises his cane again.")

		addButton("Continue", "See what happens next", "final_remarks")
	if(state == "final_remarks"):
		playAnimation(StageScene.Duo, "stand", {npc="announcer"})
		saynn("[say=announcer]Sounds like a good plan. I will keep the hideout ready for her arrival. If she is a red, she is probably somewhere in the high-sec cellblock.[/say]")

		saynn("That's a fair guess.")

		saynn("[say=pc]High-sec cellblock, let's meet there then.[/say]")

		saynn("[say=kait]She might fight back so I will bring a leash and some cuffs.[/say]")

		saynn("[say=avy]And I will bring myself.[/say]")

		saynn("Time to make a move.")

		addButton("Continue", "See what happens next", "endthescene")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "avy_comes_in"):
		processTime(3*60)

	if(_action == "risha_nova_showcase"):
		processTime(3*60)

	setState(_action)
