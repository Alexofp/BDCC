extends "res://Scenes/SceneBase.gd"

func _init():
	sceneID = "Ch3s1TaviAndKaitScene"

func _run():
	if(state == ""):
		addCharacter("tavi")
		
	if(state == ""):
		playAnimation(StageScene.Duo, "stand", {npc="tavi"})

		saynn("[say=pc]I think we have everything. I managed to steal the drug that they were gonna use on you and I know that they keep the bluespace transmitter in the engineering block. I know the code to get there.[/say]")

		saynn("Tavi stands up and reaches her paw out to brush it over your cheek.")

		saynn("[say=tavi]Don’t know what I would do without you. Can’t wait to leave this place for good.[/say]")

		saynn("[say=pc]What are you gonna do after?[/say]")

		saynn("Tavi glances away for a second.")

		saynn("[say=tavi]It will.. take too long to explain. If we get through this, I will tell you.[/say]")

		saynn("She pauses, deep in thought before looking back at you.")

		saynn("[say=tavi]Are you ready for this, cutie? This won’t be a simple walk.[/say]")

		# (Options are Ready and Not ready)

		addButtonWithChecks("Ready", "Let’s go do this", "ready", [], [ButtonChecks.NotBlindfolded, ButtonChecks.NotGagged])
		addButton("Not ready", "You need to do something first", "not_ready")

	if(state == "not_ready"):
		saynn("You tell Tavi that you still have some things to take care of first.")

		saynn("[say=tavi]Sure. I’m not going anywhere without you.[/say]")

		addButton("Leave", "Time to go", "endthescene")

	if(state == "ready"):
		setFlag("TaviModule.ch3StartedInfiltration", true)
		aimCameraAndSetLocName("mining_nearentrance")
		
		saynn("[say=pc]I’m ready, Miss Tavi. You have a plan?[/say]")

		saynn("You walk just beside Tavi. You two exit her little hideout and traverse the catwalk towards the engineering block.")

		saynn("[say=tavi]Plan? We get to the bluespace transmitter and send a message to the Syndicate. Risky move but we have no other choice.[/say]")

		saynn("Tavi is talking quietly, her eyes scanning ahead.")

		saynn("[say=pc]Uh. What if we get caught?[/say]")

		saynn("Tavi nods.")

		saynn("[say=tavi]We will be caught. But hopefully not before we set the gears into motion.[/say]")

		saynn("[say=pc]The captain will probably kill us though. You know, space us.[/say]")

		saynn("She chuckles and stops before looking at you.")

		saynn("[say=tavi]Empty threats. I've been trying to understand how his mind works since I got here. I think the guy has a thing for ‘fixing’ inmates rather than killing. That will be his downfall. Just don’t let him change your mind, okay?[/say]")

		saynn("You nod. Tavi pats you on the head and prepares to continue her step when you two suddenly hear a female voice behind you.")

		saynn("[say=kait]Tavi.[/say]")

		addButton("Huh?", "Look at her", "huh?")

	if(state == "huh?"):
		playAnimation(StageScene.Duo, "stand", {pc="tavi", npc="kait"})
		addCharacter("kait")
		
		saynn("You turn around and see one of the lilacs. A snow leopard. Tavi slowly fixates her gaze on the new figure, her smile fades away.")

		saynn("[say=tavi]Kait.[/say]")

		saynn("Kait is noticeably smaller than Tavi, her body looks more slim too under all her white dotted fur.")

		saynn("[say=kait]That’s not how you called me before.[/say]")

		saynn("[say=tavi]Same for you.[/say]")

		saynn("Kait crosses her arms and drills you with her gaze before rolling her eyes away.")

		saynn("[say=kait]So what are you two up to?[/say]")

		saynn("[say=tavi]Stuff.[/say]")

		saynn("Kait nods a few times. Her tail is slowly wagging behind her back, sometimes doing a quick motion.")

		saynn("[say=kait]I’m not allowed to know anymore, right?[/say]")

		saynn("Tavi takes one step towards the other cat.")

		saynn("[say=tavi]Listen..[/say]")

		saynn("Kait growls and points at Tavi.")

		saynn("[say=kait]No, you listen. You avoided me for so long that I don’t care now. Because you clearly don’t![/say]")

		saynn("Tavi recoils. You watch the exchange from the side. But then Kait points at you too.")

		saynn("[say=kait]I see. You found a new pet. That explains everything.[/say]")

		saynn("Tavi glances at you with sorry eyes before directing her attention back to Kait. Tall cat steps closer to her again.")

		saynn("[say=tavi]That has nothing to do with it, pussy cat. You must understand this. We would never have been able to work together.[/say]")

		saynn("Kait reaches out and shoves Tavi back. You hear soft growling.")

		saynn("[say=kait]Why?! Because I wanted my input to be heard? We could have been a great team! We could have worked together! But no! You didn’t trust me with anything![/say]")

		saynn("Kait tries to shove Tavi again but this time her paws get caught. Tavi gracefully wrenches them behind the snow leopard’s back and then gets a grasp on her hair, causing the feline to hiss from pain. Tavi switches to a more intimidating tone now that is in control.")

		saynn("[say=tavi]Don’t lie, pussy cat. I trusted you completely. But someone must have the final say. Always. Otherwise your little team is gonna collapse under its own disagreements. And I’m sorry, pussy cat. But I am more experienced than you.[/say]")

		addButton("Continue", "See what happens next", "continue")

	if(state == "continue"):
		# (Tavi falls)
		playAnimation(StageScene.Duo, "defeat", {pc="tavi", npc="kait"})

		saynn("Suddenly Kait steps on Tavi’s digi feet and then frees her paws enough to pry the fingers off of her hair. During that, she forces her powerful knee into Tavi’s chest before shoving back, causing the tall feline to trip.")

		saynn("[say=kait]Are you?[/say]")

		saynn("Tavi hisses and rubs her new bruises.")

		saynn("[say=tavi]Ugh.. I taught you that.[/say]")

		addButton("Continue", "See what happens next", "continue1")

	if(state == "continue1"):
		# (PC + Kait)
		playAnimation(StageScene.Duo, "stand", {npc="kait"})

		saynn("Kait skips Tavi and goes straight for you now. She crosses her arms and circles around you.")

		saynn("[say=kait]So you are her personal pet now. Do you have a name? Or just a humiliating title?[/say]")

		# (Options are Say and Intimidate)

		addButton("Say it", "Introduce yourself to this fine cat", "say_it")
		addButton("Intimidate", "That cat is being awfully rude", "intimidate")


	if(state == "say_it"):
		saynn("[say=pc]My name is {pc.name}. I don’t know what history you two have but I think now is not the time to fight over it.[/say]")

		saynn("Kait listens to your words and nods a few times, her tail lagging behind, disapprovingly.")

		saynn("[say=kait]Pleasure to meet you, {pc.name}. I’m Kait. I guess Tavi never told you about me. Because that would mess everything up, right, Miss Tavi?[/say]")

		saynn("Tavi slowly gets up and approaches you two.")

		saynn("[say=tavi]Kait, enough.[/say]")

		saynn("[say=kait]I know, I know, I’m sorry. I’m the villain here, the unruly stupid cat that wants to bitch over the past. I should move on, right?[/say]")

		saynn("Kait stands between you and Tavi, blocking her from you.")

		saynn("[say=kait]I only have one last question for you. What’s gonna happen after you serve your purpose?[/say]")

		saynn("Tavi reaches out for Kait’s shoulder but she just avoids it and starts to walk away. She does turn around to say one last thing though.")

		saynn("[say=kait]Others are tools for you, right, Tavi? And you only have so many hands.[/say]")

		saynn("After that, Kait leaves you two alone.")

		addButton("Wow", "That was something", "wow")

	if(state == "intimidate"):
		# (sets a flag)
		setFlag("TaviModule.ch3IntimidatedKait", true)

		saynn("[say=pc]None of your business. And if you touch Tavi again, you will have to deal with me. Understand?[/say]")

		saynn("Kait listens to your words and nods a few times, her tail lagging behind, disapprovingly.")

		saynn("[say=kait]I see. Fine. Whatever. Enjoy sucking on her feet while you can.[/say]")

		saynn("Tavi slowly gets up and approaches you two. You can’t help but to bare your teeth at the rude cat.")

		saynn("[say=tavi]Kait, enough.[/say]")

		saynn("[say=kait]I know, I know, I’m sorry. I’m the villain here, the unruly stupid cat that wants to bitch over the past. I should move on, right?[/say]")

		saynn("Kait stands between you and Tavi, blocking her from you.")

		saynn("[say=kait]I only have one last question for you. What’s gonna happen after you serve your purpose?[/say]")

		saynn("Tavi reaches out for Kait’s shoulder but she just avoids it and starts to walk away. She does turn around to say one last thing though.")

		saynn("[say=kait]Others are tools for you, right, Tavi? And you only have so many hands.[/say]")

		saynn("After that, Kait leaves you two alone.")

		saynn("[say=pc]Should I go beat her up?[/say]")

		saynn("[say=tavi]No.. stay..[/say]")

		addButton("Wow", "That was something", "wow")

	if(state == "wow"):
		removeCharacter("kait")
		playAnimation(StageScene.Duo, "stand", {npc="tavi"})
		
		saynn("Tavi stands still, glancing down at the floor, probably thinking. There is no one around in this dimly-lit corridor but you two. You only hear the faint noises of people working in the mines.")

		saynn("[say=pc]She seemed very upset.[/say]")

		saynn("[say=tavi]We should go..[/say]")

		saynn("[say=pc]You don’t wanna talk about it?[/say]")

		saynn("Tavi doesn’t answer.")

		# (Options are Follow, Interrogate)

		addButton("Interrogate", "She wasn’t honest with you, keep asking", "interrogate")
		addButton("Follow", "See what happens next", "follow")

	if(state == "interrogate"):
		# (sets a flag)
		setFlag("TaviModule.ch3InterogatedTavi", true)

		saynn("Tavi tries to skip the topic but you don’t let her. You stop and take a demanding stance.")

		saynn("[say=pc]I need to know. It sounds a lot like you betrayed her. And you never told me about your other pet.[/say]")

		saynn("Tavi pauses her step and slowly turns around to face you. Her eyes shine with anger.")

		saynn("[say=tavi]Cause it doesn’t matter.[/say]")

		saynn("[say=pc]It does to me? What happened to being honest with each other?[/say]")

		saynn("She is frowning. But her gaze slowly directs itself down again.")

		saynn("[say=tavi]It’s not my first time trying to escape. I knew I couldn’t do it alone. But we and Kait didn’t.. connect.[/say]")

		saynn("You step closer to Tavi.")

		saynn("[say=pc]Why not?[/say]")

		saynn("Tavi’s voice softens.")

		saynn("[say=tavi]We’re too different.[/say]")

		saynn("You reach your hand out and brush it over Tavi’s cheek. She tries to avoid your touch so you quickly give up.")

		saynn("[say=pc]Huh. I see.[/say]")

		saynn("[say=tavi]Let’s just focus on this for now.[/say]")

		addButton("Follow", "See what happens next", "follow")

	if(state == "follow"):
		aimCameraAndSetLocName("eng_bay_corridor")
		
		saynn("You and Tavi pass the entrance of the engineering corridor. Metal walls here have orange trim to them and many supports that you can use to hide behind. The door that leads to the secure corridor seems to be unguarded.")

		saynn("[say=tavi]That’s the one?[/say]")

		saynn("[say=pc]Yeah.[/say]")

		saynn("Tavi approaches it and looks around. You notice that Alex Rynard is in the lobby on the opposite side.")

		saynn("[say=pc]The engineer is busy, I think we can do it.[/say]")

		saynn("[say=tavi]Mhm.[/say]")

		saynn("You look through the little reinforced window that the door has and wait for a good moment.")

		addButton("Enter code", "Enter the staff-only area", "enter_code")

	if(state == "enter_code"):
		aimCameraAndSetLocName("eng_bay_nearbreakroom")
		
		saynn("Your hand reaches for the number pad.. 4125.. the suspense is killing you.")

		saynn("It worked, the door slid open with a cool mechanical noise and let you two inside.")

		saynn("[say=tavi]What now?[/say]")

		saynn("Feels strange to be in charge. Kinda. You wait for the door to close behind you and hide behind one of the pillars.")

		saynn("[say=pc]Well, I heard that the bluespace crystal is very prone to cause EMP impulses. So they hold it deep inside the rock.[/say]")

		saynn("[say=tavi]Let’s look around then. Follow me.[/say]")

		saynn("Tavi proceeds to slowly creep forward. You two hear some speech so you quickly hide behind some crates. You notice that she avoids shadows and prefers hard cover.")

		addButton("Hide", "See what happens next", "hide")

	if(state == "hide"):
		playAnimation(StageScene.Duo, "kneel", {npc="tavi", npcAction="kneel"})
		
		saynn("Two engineers walk past you.")

		saynn("[sayMale]Wanna go grab some lilac slut?[/sayMale]")

		saynn("[sayMale]Nah, it’s fine. I got enough people twisting my balls.[/sayMale]")

		saynn("They go out of sight as they enter the breakroom. You both were crouching and luckily they didn’t spot you. Tavi grabs you by the collar and tugs behind as she creeps further.")

		saynn("[say=tavi]Only a matter of time before we get noticed.[/say]")

		addButton("Follow", "See where she brings you", "follow1")

	if(state == "follow1"):
		playAnimation(StageScene.Duo, "stand", {npc="tavi"})
		aimCameraAndSetLocName("eng_firstjunction")
		
		saynn("You reach a junction. Both are just plain metal corridors but you notice the handy directional signs on the wall. One of them says ‘Control room’ and the other one says ‘Telecomms’.")

		saynn("[say=pc]We need telecomms, right?[/say]")

		saynn("[say=tavi]Mhm. We need to send a message.[/say]")

		addButton("Telecomms", "See where that corridor brings you", "telecomms")

	if(state == "telecomms"):
		aimCameraAndSetLocName("eng_neartransmitter")
		GM.pc.setLocation("eng_neartransmitter")
		
		saynn("You follow this new corridor. Very soon the floor underneath switches to a metal catwalk going over some kind of rocky surface. The walls soon switch to stone too.")

		saynn("[say=tavi]We must be close.[/say]")

		saynn("You follow her steps, trying to avoid making too much noise.")

		saynn("And indeed, one turn later you see a giant door in front of you. This one looks much heavier and of a much older design, all the paint from it has long gone, exposing bare steel. And it’s not just a door, it’s like some of the cave has been carved out and made into a giant room. But you only see the entrance.")

		saynn("You approach it and realize that the door is locked and bolted down, there are a bunch of signs everywhere saying that’s a dangerous area.")

		saynn("Tavi finds a keypad and tries to use the same code but the console beeps angrily at her.")

		saynn("[say=pc]Can you hack it?[/say]")

		saynn("[say=tavi]Not without a giant drill. This is some old technology. From the times when they cared about security.[/say]")

		saynn("[say=pc]What do we do now?[/say]")

		saynn("[say=tavi]We gotta find a way to open it.[/say]")

		saynn("Suddenly you hear swift footsteps. They certainly don't care about the catwalk making so much noise under their boots.")

		addButton("Continue", "See what happens next", "continue2")

	if(state == "continue2"):
		removeCharacter("tavi")
		playAnimation(StageScene.Solo, "stand")
		
		saynn("[sayMale]Are you sure it’s not a rat?[/sayMale]")

		saynn("[sayMale]That would be one giant glowing rat. Hey! Stay where you are, dipshit! I see you![/sayMale]")

		saynn("Too late to hide. You slowly turn around and see two engineers glaring at you. But only you. Tavi is gone. Huh.")

		saynn("[sayMale]You said you saw something glowing? That ain’t it, chief.[/sayMale]")

		saynn("[sayMale]Whatever, man. Hey! The fuck is your problem. This area is off limits for bitches like you.[/sayMale]")

		saynn("They begin to slowly approach you, one has a shock remote in his hand.")

		# (Options are Intimidate, Seduce, Submit)

		addButton("Intimidate", "They’re clearly asking for a fight", "intimidate1")
		addButton("Seduce", "Use your body for your advantage", "seduce")
		addButton("Submit", "Well, why even try anymore", "submit")


	if(state == "intimidate1"):
		saynn("[say=pc]You two think you can take me on?[/say]")

		saynn("The one with the remote chuckles before spitting to the side.")

		saynn("[sayMale]I’m only wondering how many cocks can you take at once.[/sayMale]")

		saynn("[say=pc]Less than you I’m pretty sure. A big pussy like you can take a lot.[/say]")

		saynn("The guy growls and keeps squeezing his toy while the second guy continues to approach you. You catch something happening in the corner of your eye. Some kind of movement.. under the catwalk. The guys seem to be too busy looking at you to spot that.")

		saynn("[sayMale]Here is what's gonna happen. You're gonna explain nicely how you ended up here. And then we will decide your punishment. Depending on how nice you treat us.[/sayMale]")

		saynn("Well then. Seems like these guys won’t just let you go. Time for a fight.")

		addButton("Fight", "Make them regret it", "fight")

	if(state == "fight"):
		saynn("You clench your fists, ready to deliver the first strike when you suddenly notice Tavi climbing from under the catwalk onto it, far away behind the engineers. She is turned away, seemingly about to escape.")

		saynn("A few seconds feel like forever..")

		saynn("But after that, she turns around and starts creeping towards the guys, making sure to not make any noise, using her feline gracefulness to her advantage.")

		saynn("[say=pc]Well. Actually.. That sounds better than having my neck fried.[/say]")

		saynn("[sayMale]Good little whore. We will teach you why getting out of your little cage is a bad idea.[/sayMale]")

		saynn("Tavi reaches the guy with the shock remote and grabs him, her arms wrapped around his neck and choking the poor lad. He gasps and drops whatever he was holding. The remote makes a loud noise as it hits the floor, causing the second guy to turn.")

		addButton("Grab him", "Now is the best time for this", "grab_him")

	if(state == "grab_him"):
		addCharacter("tavi")
		playAnimation(StageScene.Duo, "stand", {npc="tavi"})
		
		saynn("You lunge towards the nearest guy and punch him in the face before pressing your wrists into his throat, same as what Tavi does.")

		saynn("[sayMale]B-bit-tch![/sayMale]")

		saynn("[say=pc]What now!?[/say]")

		saynn("[say=tavi]Kill him if you have to.[/say]")

		saynn("[say=pc]What? Why?[/say]")

		saynn("Tavi doesn’t let the guy go no matter how much he struggles. She tries to pacify him by smacking his head against the nearest railing. He stops struggling and just lets Tavi choke him out until he loses consciousness and falls limp.")

		saynn("[say=tavi]Fine.[/say]")

		saynn("She sprints up to you and grabs some zip ties from your engineer before tying his hands. Then she forces him onto the catwalk and ties his legs too before adding extra zip ties to bring his wrists and ankles together, hogtying the guy.")

		saynn("[sayMale]You will regret this![/sayMale]")

		saynn("[say=tavi]I regret I didn’t do this sooner my friend.[/say]")

		saynn("She slaps the guy’s face and then breaks his headset.")

		saynn("[say=pc]Did you kill him?[/say]")

		saynn("[say=tavi]He will be fine.[/say]")

		saynn("Tavi fetches more zip ties and proceeds to tie up the unconscious guy too.")

		addButton("Continue", "See what happens next", "preparetogo")

	if(state == "preparetogo"):
		saynn("Now that both of them carry no danger, you look around a bit. The giant bulky door is still there.")

		saynn("[say=pc]What now? How do we get there?[/say]")

		saynn("[sayMale]You won’t, bitches! This door opens only for maintenance. And no maintenance is scheduled for a while![/sayMale]")

		saynn("Tavi scratches her chin.")

		saynn("[say=tavi]Well then we will have to schedule one.[/say]")

		saynn("[sayMale]What?![/sayMale]")

		saynn("She points at you.")

		saynn("[say=tavi]Find the console that can initiate the maintenance protocol. There should be one in the control room. I will guard these two fuckers so they can’t escape and ruin our plans.[/say]")

		saynn("[say=pc]Alright.[/say]")

		saynn("[sayMale]You don’t understand how big of a hole you’re digging for yourself.[/sayMale]")

		saynn("Tavi sighs and sits on the engineer’s face.")

		saynn("[say=tavi]Shush and dig into this.[/say]")

		saynn("You hear muffled noises of protest coming from underneath her. You’re almost jealous. But it’s time to go.")

		# (scene ends)
		addButton("Continue", "Time to go", "endthescene")


	if(state == "seduce"):
		saynn("[say=pc]You two think you can take me on~?[/say]")

		saynn("The one with the remote chuckles but doesn’t drop his item so you proceed to do a little sensual dance with your {pc.masc} hips while your hands land on your sides and explore your {pc.thick} body for them, making sure to brush over your {pc.breasts}.")

		saynn("[sayMale]Huh. What do you think?[/sayMale]")

		saynn("The other engineer squints and crosses his arms. You catch something happening in the corner of your eye. Some kind of movement.. under the catwalk. The guys seem to be too busy looking at you to spot that.")

		saynn("[sayMale]How good are you at sucking?[/sayMale]")

		saynn("[say=pc]Oh, there is no one better than me.[/say]")

		saynn("You prove that by parting your lips and letting your tongue roll out. The sight of you rubbing yourself while also presenting your tongue seems to cause movement in their pants, it’s working.")

		saynn("[sayMale]That will be for us to decide, slut. No funny business.[/sayMale]")

		saynn("The guy keeps squeezing the remote while the second one continues to approach you. He is already unbuckling his belt, about to whip his cock out.")

		saynn("[sayMale]After that you're gonna explain nicely how you ended up here. And then we will decide your punishment. Depending on how nice you treat us.[/sayMale]")

		saynn("Well then. Seems like these guys won’t just let you go. Time for some action.")

		addButton("Sex?", "See what happens next", "sex?")

	if(state == "sex?"):
		playAnimation(StageScene.Solo, "kneel")
		
		saynn("You get on your knees, about to start sucking the guy’s cock when you suddenly notice Tavi climbing from under the catwalk back onto it, far away behind the engineers. She is turned away, seemingly about to escape.")

		saynn("A few seconds feel like forever..")

		saynn("But after that, she turns around and starts creeping towards the guys, making sure to not make any noise, using her feline gracefulness to her advantage. You stall a little bit longer while the guy slowly loses his patience.")

		saynn("[say=pc]So big.. Yeah.. Sure. I will do it. Sounds better than having my neck fried.[/say]")

		saynn("[sayMale]Well, do it already, little whore. We will teach you why getting out of your little cage is a bad idea.[/sayMale]")

		saynn("Tavi reaches the guy with the shock remote and grabs him, her arms wrapped around his neck and choking the poor lad. He gasps and drops whatever he was holding. The remote makes a loud noise as it hits the floor, causing the second guy to turn.")

		# (Option is to Grab him)

		addButton("Grab him", "Now is the best time for this", "grab_him")

	if(state == "submit"):
		saynn("With no Tavi anywhere in sight you feel like fighting is useless.")

		saynn("[say=pc]You caught me, I give up.[/say]")

		saynn("The one with the remote chuckles before spitting to the side.")

		saynn("[sayMale]The fuck you doing here?[/sayMale]")

		saynn("[say=pc]I got lost.[/say]")

		saynn("The guy growls and keeps squeezing his toy while the second guy continues to approach you. You catch something happening in the corner of your eye. Some kind of movement.. under the catwalk. The guys seem to be too busy looking at you to spot that.")

		saynn("[sayMale]Of course you did. Here is what's gonna happen. You're gonna explain nicely how exactly you ended up here. And then we will decide your punishment. Depending on how nice you treat us.[/sayMale]")

		saynn("Well then. Seems like these guys won’t just let you go.")

		addButton("Raise hands", "Let them do whatever", "raise_hands")

	if(state == "raise_hands"):
		saynn("You raise your hands and are about to kneel when you suddenly notice Tavi climbing from under the catwalk back onto it, far away behind the engineers. She is turned away, seemingly about to escape.")

		saynn("You’re not sure what to do with this glimpse of hope. A few seconds feel like forever..")

		saynn("Luckily, she turns around and starts creeping towards the guys, making sure to not make any noise, using her feline gracefulness to her advantage. You stall a little bit longer while the guy takes his time producing some make-shift cuffs out of zip ties.")

		saynn("[say=pc]Do you have to do that?[/say]")

		saynn("[sayMale]Shut up and give me your hands. We will teach you why getting out of your little cage is a bad idea.[/sayMale]")

		saynn("Tavi reaches the guy with the shock remote and grabs him, her arms wrapped around his neck and choking the poor lad. He gasps and drops whatever he was holding. The remote makes a loud noise as it hits the floor, causing the second guy to turn.")

		# (Option is to Grab him)
		addButton("Grab him", "Now is the best time for this", "grab_him")

func _react(_action: String, _args):
	if(_action in ["ready", "continue1", "wow", "follow", "enter_code", "hide", "follow1", "telecomms", "continue2", "grab_him", "preparetogo"]):
		processTime(RNG.randi_range(3,5)*60)
	
	if(_action == "preparetogo"):
		addExperienceToPlayer(50)
		addMessage("Tasks updated")

	if(_action == "endthescene"):
		endScene()
		return

	setState(_action)

