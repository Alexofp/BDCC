extends SceneBase

func _init():
	sceneID = "SocketHelp3Scene"

func _run():
	if(state == ""):
		addCharacter("socket")
		playAnimation(StageScene.Duo, "stand", {npc="socket"})
		saynn("You stand near Socket. You just noticed that there are a few boxes under her boots. And what is that.. she is holding something, some kind of little device that looks like a cover for something.")

		saynn("[say=pc]Anything I can help with now?[/say]")

		saynn("[say=socket]Oh, yeah! But I wanna show you this first.[/say]")

		addButton("Continue", "See what happens next", "socket_puts_on_portal")
	if(state == "socket_puts_on_portal"):
		playAnimation(StageScene.Duo, "stand", {npc="socket", npcAction=["hold_object", "res://Inventory/UnriggedModels/Fleshlight/FleshlightSocketStraw.tscn"]})
		saynn("Socket presses that little device against her crotch, hiding her pussy.. and.. somehow.. it just stays there when she activates it.")

		saynn("[say=socket]Alex helped me with it.[/say]")

		saynn("After that, she grabs a fancy fleshlight from her backpack and also.. a bottle.")

		saynn("She turns the fleshlight on.. which opens a little portal on it with her pussy sticking out of it.. more than usual, almost like the device is pulling on the petals to make them appear more plump.")

		saynn("[say=socket]I modified it for a tighter fit![/say]")

		saynn("That's not it though.. Socket opens the bottle.. and starts pouring the drink into her own pussy.. a very strange view for sure. After filling herself full, she adds a little drinking straw to top it off.")

		saynn("You're.. not sure how to feel about it. Socket sees your expression and smiles.")

		saynn("[say=socket]My pussy can hold it, I got it upgraded to hold substances even more acidic than that![/say]")

		saynn("[say=pc]Why not just.. drink it normally?[/say]")

		saynn("Socket shrugs and starts sipping the drink through the straw. At least the portal device that she is using is indeed providing quite a snug fit, nothing seems to be leaking out.")

		saynn("[say=socket]It's more fun that way. Want a sip?[/say]")

		saynn("She offers you the fleshlight.")

		addButton("Take a sip", "Why not", "take_a_sip")
		addButton("Refuse", "You'd rather not", "take_no_sip")
	if(state == "take_a_sip"):
		playAnimation(StageScene.Duo, ["hold_object", "res://Inventory/UnriggedModels/Fleshlight/FleshlightSocketStraw.tscn"], {npc="socket"})
		saynn("Well.. why the heck not.")

		saynn("You carefully grab the fleshlight from Socket's hand and move it close to your face. You catch the straw with your lips and start sipping on it.. Socket just silently watches you do it.")

		saynn("Tastes like.. sweet cider. But with a faint salty aftertaste. Not too bad, all things considered, the 'container' gives it a unique flavor for sure.")

		saynn("[say=socket]Like it?[/say]")

		saynn("You can feel the alcohol beverage taking effect, making the world a little.. brighter.")

		saynn("[say=pc]Sure.[/say]")

		saynn("You hand the fleshlight back to Socket.")

		saynn("[say=pc]What do you need help with?[/say]")

		saynn("Socket puts a cap on her pussy and puts the device away. Then she points at the cardboard box under her feet.")

		saynn("[say=socket]Can you help me carry it? The task is to restock the vendomats![/say]")

		addButton("Grab box", "Carry the box for Socket", "grab_box")
	if(state == "take_no_sip"):
		saynn("Drinking.. out of a pussy? Yeah, no. The taste is probably awful anyway.")

		saynn("[say=pc]Sorry, I'd rather not.[/say]")

		saynn("Socket shrugs and sips a bit more from the straw.")

		saynn("[say=socket]No problem. It's just apple cider though.[/say]")

		saynn("[say=pc]What do you need help with?[/say]")

		saynn("Socket puts a cap on her pussy and puts the device away. Then she points at the cardboard box under her feet.")

		saynn("[say=socket]Can you help me carry it? The task is to restock the vendomats![/say]")

		addButton("Grab box", "Carry the box for Socket", "grab_box")
	if(state == "grab_box"):
		playAnimation(StageScene.Duo, "walk", {npc="socket", flipNPC=true, npcAction="walk"})
		aimCameraAndSetLocName("mining_elevator")
		saynn("You grab the box. It's not too heavy. The manifest attached to it says that it came from the cargo.")

		saynn("[say=pc]Alright. Do you need me to show the way to the vendomats?[/say]")

		saynn("[say=socket]I think I know where the first one is.[/say]")

		saynn("Socket heads towards the lift. You follow behind, carrying some generic supplies.")

		saynn("You enter it. Your hands are busy so Socket selects the floor. The big metal room starts to move up with a screech.")

		saynn("[say=socket]I think I'm getting used to this prison's layout, thanks to you.[/say]")

		saynn("She smiles and looks up at you.")

		saynn("[say=pc]Anyone giving you trouble?[/say]")

		saynn("Socket shakes her head.")

		saynn("[say=socket]No, not yet.[/say]")

		saynn("Not yet?")

		saynn("The lift finally arrives at the main level.")

		addButton("Follow", "See where Socket brings you", "first_vendomat")
	if(state == "first_vendomat"):
		playAnimation(StageScene.Duo, "stand", {npc="socket"})
		aimCameraAndSetLocName("main_hallroom1")
		saynn("You follow Socket through the checkpoint. The guard that is protecting it is clearly too busy staring at the naked butt, he doesn't even check you.")

		saynn("Socket finds a way to the first vendomat.")

		saynn("[say=socket]This must be it.[/say]")

		saynn("She tries to find a way to get to its internal storage.. but there is no obvious way to do it. So she pulls out her giant wrench and..")

		saynn("[say=pc]Maybe you can use your badge?[/say]")

		saynn("Socket tilts her head, ready to hit something, holding the wrench high.")

		saynn("[say=socket]You think so?[/say]")

		saynn("She puts the wrench down and presses her staff badge against the vendomat's panel. And sure enough, the vendomat's menu now has some extra buttons including a 'resupply' one.")

		saynn("[say=socket]Yay.[/say]")

		saynn("Socket presses it and the vendomat opens up, revealing its internals.")

		saynn("And so you and her begin to restock it. Various snacks, energy drinks of different brands.. condoms.")

		addButton("Continue", "See what happens next", "sudden_risha")
	if(state == "sudden_risha"):
		addCharacter("risha")
		playAnimation(StageScene.Duo, "stand", {pc="socket", npc="risha"})
		saynn("While you were busy putting the supplies into the right slots, a guard sneaks up on you and Socket.")

		saynn("[say=risha]Wow, nice ass there.[/say]")

		saynn("She slaps Socket's rear and then reaches her hand into the unpacked box, grabbing one of the energy drinks.")

		saynn("Socket eeps and rubs her butt.")

		saynn("[say=socket]Hey, you shouldn't take that.[/say]")

		saynn("The guard was about to leave.. but hearing Socket's words made her stop and turn around.")

		saynn("[say=risha]Why not?[/say]")

		saynn("[say=socket]Because.. the system will think that I stole it![/say]")

		saynn("The guard tilts her head slightly.. and starts to slowly approach Socket, blatantly staring at her exposed private bits.")

		saynn("[say=socket]Just.. get one from the.. vendomat..[/say]")

		saynn("Socket is shivering while feeling those mean eyes explore her body.")

		saynn("[say=risha]Why don't I take you instead?[/say]")

		saynn("[say=socket]Uh.. if you say please?[/say]")

		saynn("The guard stays silent for a second.. and then chuckles.")

		saynn("[say=risha]What a slut. I guess it makes sense, you're constantly flashing everyone with your cunt. Bet you get off of that.[/say]")

		saynn("She was about to pop open the energy drink.. when she sees your stare.")

		saynn("[say=risha]What?[/say]")

		addButton("Put it back", "Tell Risha to put the can back into the box", "risha_angry")
		addButton("Nothing", "Let her have it", "no_touch_risha")
	if(state == "no_touch_risha"):
		removeCharacter("risha")
		playAnimation(StageScene.Duo, "stand", {npc="socket"})
		saynn("[say=pc]Nothing.[/say]")

		saynn("Risha opens the can with her claw and starts drinking it.")

		saynn("[say=risha]What I thought.[/say]")

		saynn("And just like that, she leaves you two be.")

		saynn("[say=pc]What a bitch.[/say]")

		saynn("[say=socket]It's okay.. it's only a few credits.[/say]")

		saynn("You finish restocking the vendomat, allowing Socket to close it back up. The box still has some supplies in it.")

		saynn("[say=socket]Only the one in the medical left.[/say]")

		saynn("[say=pc]What about the laundry?[/say]")

		saynn("[say=socket]That one is fine. Uniforms and underwear are being sewn on demand by the machines.[/say]")

		saynn("Huh, fancy.")

		addButton("Follow", "Follow Socket to the medical wing", "follow_medical")
	if(state == "risha_angry"):
		playAnimation(StageScene.Duo, "stand", {npc="risha"})
		saynn("You put on your meanest eyes.")

		saynn("[say=pc]Put it back where you took it.[/say]")

		saynn("The guard approaches you now, playing with the energy drink in her hand.")

		saynn("[say=risha]Really? You're ready to get your face smashed over some can?[/say]")

		saynn("She then gives Socket a quick glance.")

		saynn("[say=risha]Or maybe.. hmm. I think I know.[/say]")

		saynn("You clench your fists, the guard smiles.")

		saynn("[say=pc]I'm not gonna repeat myself, put it back.[/say]")

		saynn("[say=risha]Why don't I put you in your place instead.[/say]")

		saynn("She reaches for her stun baton. Looks like it's a fight..")

		addButton("Fight", "Start the first fight", "start_risha_fight")
	if(state == "lost_risha"):
		playAnimation(StageScene.Duo, "defeat", {npc="risha"})
		saynn("Defeated, you drop to your knees.")

		saynn("Risha walks up to you while enjoying her stolen energy drink.")

		saynn("[say=risha]My bad, I was stronger.[/say]")

		saynn("She kneels.. and grabs you by the collar. Not to choke.. she swipes her badge over it, deducting some credits from your account.")

		saynn("[say=risha]You paid for it. So now it's not stolen. Hope you and your slut are happy.[/say]")

		saynn("The lynx giggles and starts walking away. After finishing the can, she just throws it somewhere.")

		addButton("Continue", "See what happens next", "socket_helps_pc_after_loss")
	if(state == "socket_helps_pc_after_loss"):
		removeCharacter("risha")
		playAnimation(StageScene.Duo, "stand", {npc="socket"})
		saynn("Socket is quick to help you to get up.")

		saynn("[say=socket]Sorry..[/say]")

		saynn("[say=pc]It's okay. What a bitch though.[/say]")

		saynn("You catch your breath a little after that fight. Then you finish restocking the vendomat, allowing Socket to close it back up. The box still has some supplies in it.")

		saynn("[say=socket]Only the one in the medical left.[/say]")

		saynn("[say=pc]What about the laundry?[/say]")

		saynn("[say=socket]That one is fine. Uniforms and underwear are being sewn on demand by the machines.[/say]")

		saynn("Huh, fancy.")

		addButton("Follow", "Follow Socket to the medical wing", "follow_medical")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "take_a_sip"):
		GM.pc.addIntoxication(0.6)

	if(_action == "grab_box"):
		processTime(5*60)

	if(_action == "first_vendomat"):
		processTime(5*60)

	if(_action == "sudden_risha"):
		processTime(3*60)

	if(_action == "no_touch_risha"):
		processTime(3*60)

	if(_action == "follow_medical"):
		processTime(5*60)

	if(_action == "start_risha_fight"):
		runScene("FightScene", ["risha"], "rishaFight")
		return

	if(_action == "socket_helps_pc_after_loss"):
		GM.pc.addPain(-30)

	setState(_action)

func _react_scene_end(_tag, _result):
	if(_tag == "rishaFight"):
		processTime(20 * 60)
		var battlestate = _result[0]
		
		if(battlestate == "win"):
			setState("won_risha")
			addExperienceToPlayer(50)
		else:
			setState("lost_risha")
			addExperienceToPlayer(5)
			GM.pc.addCredits(-3)
			addMessage("You lost 3 credits")
