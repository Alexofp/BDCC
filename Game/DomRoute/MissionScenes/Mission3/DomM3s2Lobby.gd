extends SceneBase

func _init():
	sceneID = "DomM3s2Lobby"

func _run():
	if(state == ""):
		playAnimation(StageScene.Duo, "stand", {npc="eliza", pc="captain"})
		addCharacter("captain")
		addCharacter("eliza")
		addCharacter("risha")
		aimCameraAndSetLocName("med_lobbymain")
		saynn("The moment you step inside the medical lobby, you see a curious scene.")

		saynn("The captain.. the captain himself.. is standing near the counter, facing the only doctor in the whole lobby.")

		saynn("[say=eliza]Welcome, captain! Dr. Quinn here. What can I do for you?[/say]")

		saynn("There are some nurses around, minding their own business. But the biggest threat seems to be coming from Risha, a familiar guard that is standing by the cap's side.")

		saynn("[say=captain]Yes, hey hey. Just wanted to check on you all. Things running smoothly?[/say]")

		saynn("Risha leans against the counter, putting her paws all over it. The doctor gives her a quick glare.")

		saynn("[say=kait]Psst![/say]")

		saynn("What's that noise?")

		saynn("[say=eliza]Well, yeah. I would say so. Things going great.[/say]")

		saynn("[say=kait]Psst-psst! Get your butt over here.[/say]")

		saynn("Oh. You turn your head and see the whole group chilling in the corner of the lobby, on two inconspicuous benches. Kait.. Ferri.. even Avy is here this time.")

		addButton("Join", "Join your team", "join_team")
	if(state == "join_team"):
		addCharacter("kait")
		addCharacter("avy")
		addCharacter("ferri")
		aimCameraAndSetLocName("med_lobbyse")
		saynn("You place your rear on one of the benches but continue watching the trio near the counter.")

		saynn("[say=eliza]We had a shipment arrive from cargo not that long ago. So we should be good for a while.[/say]")

		saynn("Kait seems to be hardly staying still. She is whispering to you all.")

		saynn("[say=kait]Why don't we jump him? Here and now.. get it over with.[/say]")

		saynn("[say=avy]That's a dumb idea. A really stupid one.[/say]")

		saynn("[say=kait]Why? We can take him, all of us. Him and his stupid guard.. I'm sure that yellow pussy cat will skadoodle as soon as the action starts.[/say]")

		saynn("Kait tries to get up but Avy yanks her back.")

		saynn("[say=avy]Sit. Your. Ass. Still.[/say]")

		saynn("[say=ferri]If the captain is down here with us.. he probably knows that he can protect himself. Mew.[/say]")

		saynn("Kait grumbles to herself.")

		saynn("[say=captain]The shipment has arrived? Good. One of the inmates has been a bit.. troublesome. Did that special order arrive too?[/say]")

		saynn("[say=eliza]One second![/say]")

		saynn("Eliza leans down to type something on her laptop.")

		saynn("[say=avy]The fuck is he talking about. Is he talking about me?[/say]")

		saynn("[say=kait]The world does not revolt around you, Avy.[/say]")

		saynn("Risha seems to be getting quite bored, rolling her stun baton along the surface of the counter. It makes the other feline tap away on the metal with her claws with her free paw.")

		saynn("[say=eliza]Oh. Yes, it did. Do you need it now?[/say]")

		saynn("[say=captain]No. Keep it for now. Somewhere secure. We would rather bring them down to you. If things get worse that is.[/say]")

		saynn("[say=eliza]Sure. I will be waiting then~![/say]")

		saynn("Eliza offers the captain a little smile.")

		saynn("With that, the captain exchanges goodbyes.. and heads back to the elevator. His guard lingers a bit to show a middle finger to the doctor.. but then follows him as well.")

		addButton("Continue", "See what happens next", "captain_leaves")
	if(state == "captain_leaves"):
		removeCharacter("captain")
		removeCharacter("risha")
		playAnimation(StageScene.Duo, "sit", {pc="kait", npc="avy", npcAction="sit"})
		saynn("[say=kait]Are we getting into a trap?[/say]")

		saynn("It's all confusing indeed. Some things just don't fit in.")

		saynn("[say=pc]This might not be about us at all. We're a group, not a single person.[/say]")

		saynn("[say=kait]Yeah.. but now they have.. whatever it is that they have.. down here.[/say]")

		saynn("A special order.. It'd be nice to know what it is.")

		saynn("[say=avy]Is your tail shivering, pussy cat? You were roaring into battle. Thinking of pulling out?[/say]")

		saynn("[say=kait]No? Obviously.. Duh. But we missed the chance to get the captain.[/say]")

		saynn("Eliza catches your direct glance. Her brow raises as she looks at your group, corners of her mouth getting tighter. Seeing a bunch of inmates just sitting together.. her suspension is rising no doubt.")

		saynn("You gotta make a move. Any move.")

		saynn("[say=pc]Ferri, up. Follow me. Avy and Kait, you sit tight for now. Try not to kill each other.[/say]")

		addButton("Counter", "Approach the counter with Ferri", "approach_counter")
	if(state == "approach_counter"):
		removeCharacter("avy")
		removeCharacter("kait")
		playAnimation(StageScene.Duo, "stand", {npc="eliza"})
		aimCameraAndSetLocName("med_lobbymain")
		saynn("You slowly approach the counter. Ferri assumes the position by your side, blinking at the feline.")

		saynn("[say=eliza]Doctor Quinn here. What can I do to you?[/say]")

		saynn("The question coupled with her cunning, curious eyes made the dracat swallow.")

		saynn("[say=pc]Hey there, Dr. Quinn. Haven't seen the captain down here before.[/say]")

		saynn("[say=eliza]Hah. He is a nice guy, isn't he? Pays us a visit ever so often. Always a pleasant surprise.[/say]")

		saynn("[say=pc]Certainly. Excuse me for eavesdropping a bit but I got curious. Someone is bugging him?[/say]")

		saynn("She raises a brow again. Then she smiles and leans in closer, her voice gets quieter.. deeper.. slower.")

		saynn("[say=eliza]You better pay no mind to his words, inmate. It is so sad when some inmates develop short-term amnesia, so unfortunate. Good thing we have all the facilities required to treat such patients, at our fancy mental ward wing.[/say]")

		saynn("Ferri's ears turn down, her cheeks blushing.")

		saynn("You could respond to her threats. Start a huge fight. Something tells you that this isn't a good idea. You just squint a bit and take her words.")

		saynn("Eliza is quick to change her tone as she looks at Ferri.")

		saynn("[say=eliza]Ohh~. That's a cute dracat you got here. Look at those horns, they just make me wanna rub them~.[/say]")

		saynn("[say=ferri]Mew..[/say]")

		saynn("[say=eliza]I bet you brought her to be milked~? Please say yes, the hybrids always taste the best.[/say]")

		saynn("This.. could be your way in.")

		saynn("[say=pc]Sure, yes. But I wanna watch, control the process.[/say]")

		saynn("[say=eliza]Ohh, you're a possessive one~. Fair enough. Is she lactating?[/say]")

		saynn("Ferri looks down at her clothed chest.")

		saynn("[say=ferri]Nyo..[/say]")

		saynn("[say=eliza]Not a problem! We got all the prolactin in the world here~. Gonna get that cutie dripping in no time.[/say]")


func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "join_team"):
		processTime(2*60)

	setState(_action)
