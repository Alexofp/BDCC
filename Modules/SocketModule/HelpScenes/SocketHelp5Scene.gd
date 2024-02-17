extends SceneBase

func _init():
	sceneID = "SocketHelp5Scene"

func _run():
	if(state == ""):
		addCharacter("socket")
		playAnimation(StageScene.Duo, "stand", {npc="socket"})
		saynn("Maybe Socket has some other things she needs help with.")

		saynn("[say=pc]Need any help today?[/say]")

		saynn("She looks at her datapad and smiles.")

		saynn("[say=socket]We actually went through the whole backlog of tasks! Everything is done! Thank you![/say]")

		saynn("[say=pc]So.. that means..[/say]")

		saynn("Her smile fades quickly after that.")

		saynn("[say=socket]Aw.. yeah.. Just the boring maintenance left.[/say]")

		saynn("Socket scratches her nose, the awkward silence begins to settle in.")

		saynn("But then her datapad beeps.")

		saynn("[say=socket]Oh! A few cameras aren't responding. Canteen.. bathroom.. laundry.[/say]")

		saynn("[say=pc]Three at the same time?[/say]")

		saynn("Socket shrugs.")

		saynn("[say=socket]You know what everyone says, some things are just designed to break![/say]")

		saynn("Hard to reason with that logic.")

		saynn("[say=socket]Shouldn't take long![/say]")

		addButton("Follow", "See where she brings you", "first_camera")
	if(state == "first_camera"):
		aimCameraAndSetLocName("hall_canteen")
		saynn("You arrive at the canteen, a spacious room with plenty of tables and uncomfortable benches for inmates to use while they consume their food. There are a bunch of inmates here at all times. Today is not any different, you catch a few gazes.. hungry ones.. hungry for something for sure.")

		saynn("Socket steps to the corner and starts inspecting the bulky reinforced security camera that doesn't seem to respond, its small little red LED not shining like it usually does.")

		saynn("The camera is pretty high up so you move one of the free tables to it and help Socket climb it.")

		saynn("[say=pc]Any signs of what broke it?[/say]")

		saynn("The fennec hums while watching the camera from up close.")

		saynn("[say=socket]Not sure. It might just be old. What do you think?[/say]")

		saynn("It does seem to have some damage.. but it's hard to see from afar, you gotta get closer.")

		addButton("Get closer", "Take a better look", "first_better_look")
	if(state == "first_better_look"):
		playAnimation(StageScene.SexStealth, "tease", {pc="pc", npc="socket"})
		saynn("You climb the table and take a better look. It doesn't have much space on it so you have to watch over Socket's shoulder. Hm..")

		saynn("The camera certainly looks like someone has thrown a chair at it, the reinforced frame is all dented and the lens is smashed.")

		saynn("[say=pc]Yeah, it wasn't like this before.[/say]")

		saynn("Socket nods.")

		saynn("[say=socket]Could you open my backpack please? I think I brought the required parts. Bending over many times on this unstable.. table.. seems dangerous.[/say]")

		saynn("Yeah, the less movement, the better.")

		addButton("Backpack", "Help Socket", "first_backpack")
	if(state == "first_backpack"):
		playAnimation(StageScene.SexStealth, "teasebusy", {pc="pc", npc="socket"})
		saynn("You open the zipper on her backpack, revealing.. lots of tools and spare parts, unsurprisingly. The big wrench is there as well..")

		saynn("[say=pc]Yeah, what do you need?[/say]")

		saynn("Socket starts to tell you which tool or thing she needs. You pass it to her and watch her work.")

		addButton("Just watch", "See what happens next", "first_justwatch")
		addButton("Grope casually", "Might as well", "first_grope")
	if(state == "first_justwatch"):
		saynn("You just keep watching Socket work, disassembling the broken camera and repairing it. While doing so, she keeps rubbing her round butt against you and your crotch.. making it very hard to focus. And yet, you have to be there to pass her what she needs.")

		saynn("[say=socket]Oh, I got a great idea![/say]")

		saynn("[say=pc]What's that?[/say]")

		saynn("[say=socket]I can check the camera's feed and see who did that.[/say]")

		saynn("Sounds like a plan.")

		addButton("Continue", "See what happens next", "socket_puts_on_visor")
	if(state == "first_grope"):
		# (( Anim maybe
		playAnimation(StageScene.SexStealth, "teasebusy", {pc="pc", npc="socket", bodyState={hard=true}})
		saynn("You put your hands on Socket and casually grope and fondle her butt and play with her breasts while she continues her work, disassembling and repairing the camera. Occasionally you have to stop and give Socket the tool that she needs.. but then it's back to groping.")

		if (GM.pc.hasReachablePenis()):
			saynn("You're getting quite hard from this.. but she doesn't seem to mind your member poking her rear.")

		saynn("[say=socket]Oh, I got a great idea![/say]")

		saynn("[say=pc]What's that?[/say]")

		saynn("[say=socket]I can check the camera's feed and see who did that.[/say]")

		saynn("Sounds like a plan.")

		addButton("Continue", "See what happens next", "socket_puts_on_visor")
	if(state == "socket_puts_on_visor"):
		playAnimation(StageScene.SexStealth, "teasebusy", {pc="pc", npc="socket"})
		saynn("[say=pc]Do we have to go to one of those rooms that have lots of screens?[/say]")

		saynn("[say=socket]No, watch me![/say]")

		saynn("Socket reaches for her VR headset.. and pulls a little wire out of it. She then connects it to the camera's exposed electric board.")

		saynn("[say=socket]Lots of static.. I have to go through all the footage, it will take some time..[/say]")

		saynn("You do have time..")

		saynn("While Socket is searching for the right moment.. Maybe you can play with her? Yeah, there are lots of eyes on you.. but maybe you can try to be stealthy about it..")

		addButton("Stay horny", "Avoid doing anything with Socket at all costs", "first_stay_horny")
		addButton("Stealth fingering", "Have some fun with Socket", "first_stealth_fingering")
		addButtonWithChecks("Stealth sex", "Have some fun with Socket", "first_stealth_sex", [], [[ButtonChecks.HasReachablePenis]])
	if(state == "first_stay_horny"):
		saynn("It does take some willpower.. a lot of willpower.. but you manage to avoid touching Socket.")

		saynn("You just watch her.. while she watches the camera's stored footage..")

		saynn("[say=socket]Oh, I think I see it. Hold on.[/say]")

		saynn("She presses some buttons on her headset and turns her head around a lot.")

		saynn("[say=socket]Yep.. it's one of the inmates.[/say]")

		saynn("[say=pc]Anyone that we know?[/say]")

		saynn("She shrugs.")

		saynn("[say=socket]I don't recognize them.. I will mark them for punishment though, no one is allowed to vandalize the station's property![/say]")

		saynn("She sure likes the station..")

		saynn("After that, she takes off her headset and finishes repairing the camera. The little red LED lights up as she turns it on.")

		saynn("[say=socket]Yay. Now to the next one.[/say]")

		saynn("Somehow you can guess what happened to the other two..")

		addButton("Follow", "Follow Socket to the next camera", "second_camera")
	if(state == "second_camera"):
		aimCameraAndSetLocName("main_dressing1")
		playAnimation(StageScene.Duo, "stand", {npc="socket"})
		saynn("You and Socket enter the bathroom. Seems to be quiet.")

		saynn("The camera near the stalls works so you walk further into the dressing room.")

		saynn("[say=socket]There it is![/say]")

		saynn("Socket walks up to the broken camera. The damage on it.. looks similar. No surprises there.")

		saynn("[say=pc]Someone doesn't want them to be seen.[/say]")

		saynn("[say=socket]Yeah, weird. Whoever does it, they're gonna regret it![/say]")

		saynn("She seems pretty upset.")

		saynn("[say=pc]You're usually not so.. bloodthirsty.[/say]")

		saynn("She grabs some tools and starts fixing the camera. The ceiling here is not that high which allows Socket to reach it easily.")

		saynn("[say=socket]Blood? No, just a punishment is fine. No one is gonna break this space station while I'm here![/say]")

		saynn("[say=pc]You care about the station this much?[/say]")

		saynn("She looks at you and shrugs for a second.")

		saynn("[say=socket]Sure. I will protect it with my body if I have to.[/say]")

		addButton("Continue", "See what happens next", "second_scary")
	if(state == "second_scary"):
		playAnimation(StageScene.SexStandRide, "tease", {pc="pc", npc="socket"})
		saynn("Socket checks the footage using her vr headset again.")

		saynn("[say=socket]Yep, it's the same inmate. Probably got caught by now already.[/say]")

		saynn("While she does that, you hear a noise.. someone's steps.. someone's cough. Someone's eyes stare at you from the far away shadow.. disappearing a few seconds later. Makes you feel uneasy. Very uneasy..")

		saynn("After she is done scrubbing through the footage, Socket raises the headset and notices your tensed up body. For whatever reason, she decides to suddenly raise her leg up high and put her hind paw on your shoulder, doing a vertical split.")

		saynn("[say=socket]We got one more camera to fix, will you help me? Or do you want some.. convincing?[/say]")

		saynn("She is showing you her pussy so casually by now..")

		addButton("Resist it", "Resist any kind of temptation", "second_resist")
		addButtonWithChecks("Casual sex", "Why not let her convince you", "second_sex", [], [[ButtonChecks.HasReachablePenis]])
		addButton("Touch her", "She is so exposed right now. Why not touch her in some places?", "second_rub")
	if(state == "second_resist"):
		playAnimation(StageScene.Duo, "stand", {npc="socket"})
		saynn("It's hard.. but you manage to resist the temptation and carefully slide Socket's leg from your shoulder and help put it on the floor.")

		saynn("[say=pc]I feel like someone is watching us, I don't think it's a good idea.[/say]")

		saynn("Socket shrugs.")

		saynn("[say=socket]I don't mind..[/say]")

		saynn("A few seconds of silence.")

		saynn("[say=socket]Either way, let's go to.. laundry![/say]")

		saynn("[say=pc]Need help finding it?[/say]")

		saynn("[say=socket]I think I know how to find it. Just gotta follow the brr-r-rr noise.[/say]")

		saynn("Yeah, that's one way.")

		saynn("Socket primes her locator dishes.. ears.. and starts walking somewhere. You're fast to follow.")

		addButton("Follow", "See where she brings you", "third")
	if(state == "third"):
		aimCameraAndSetLocName("main_laundry")
		playAnimation(StageScene.Duo, "stand", {npc="socket"})
		saynn("Doesn't take long for Socket to triangulate the location of the laundry room. It's a relatively small space with a few rows of washing machines and big plastic bins.")

		saynn("There doesn't seem to be any inmates here. The security camera is in one of the corners.. heavily damaged.")

		saynn("[say=pc]Looks pretty bad.[/say]")

		saynn("[say=socket]Should be salvageable.[/say]")

		addButton("Continue", "See what happens next", "third_repair")
	if(state == "third_repair"):
		playAnimation(StageScene.Duo, "stand", {npc="socket", flipNPC=true})
		saynn("Socket takes off her backpack and puts it on one of the benches.. she grabs a screwdriver and strats disassembling the camera's dented frame.")

		saynn("All the while, you just watch her work. She doesn't seem to need your help with her current task.")

		saynn("Your ear picks up on the familiar footsteps..")

		saynn("You turn your head..")

		saynn("..and see that one of the inmates has grabbed Socket's backpack.")

		saynn("[say=pc]Hey![/say]")

		saynn("Socket turns her head.")

		saynn("[say=socket]Hi! Wait. It's you![/say]")

		saynn("The inmate sees that he got spotted.. and starts escaping away with Socket's backpack!")

		saynn("[say=socket]My backpack![/say]")

		saynn("Socket stops what she was doing and runs after the inmate.")

		addButton("Run!", "Try to catch them", "third_try_catch")
	if(state == "third_try_catch"):
		removeCharacter("socket")
		addCharacter("avy")
		playAnimation(StageScene.Duo, "kick", {npc="avy", npcAction="kick"})
		saynn("You run out of the laundry.. but then you feel your collar getting grabbed by some strong woman.. before she kicks you back into the room. You hit your back on one of the washing machines as.. Avy.. steps in.")

		saynn("[say=avy]Not so fast, pretty {pc.boy}. We got some things to talk about.[/say]")

		saynn("You're alone with her, Socket has run off to catch the thief. And Avy is blocking the only exit.")

		saynn("[say=pc]You did all of that? The broken cameras?[/say]")

		saynn("You realize that the one in this room is still broken..")

		saynn("Avy looks at her claws, a little mean smile shines on her face.")

		saynn("[say=avy]Why would I take that risk myself? Hah.[/say]")

		saynn("She starts to slowly walk towards you, glaring at you now.")

		saynn("[say=avy]You put the entire arena under danger, did you know that?[/say]")

		saynn("[say=pc]You're still mad about that? We fixed everything.[/say]")

		saynn("[say=avy]You attacked Bulldog.[/say]")

		saynn("To be fair, he was barely even bonked.")

		saynn("[say=avy]And you made me look bad and evil.[/say]")

		saynn("You feel like that's the main reason that she is here..")

		saynn("[say=pc]You're not evil?[/say]")

		saynn("Avy chuckles.")

		saynn("[say=avy]I'm not that evil compared to her.[/say]")

		saynn("Her?")

		addButton("Continue", "See what happens next", "third_risha")
	if(state == "third_risha"):
		addCharacter("risha")
		playAnimation(StageScene.Duo, "stand", {npc="risha"})
		saynn("Right on que, a guard steps into the room.")

		saynn("[say=risha]Hey there~.[/say]")

		saynn("Oh fuck, it's her.")

		saynn("[say=pc]You brought a friend, huh?[/say]")

		saynn("The guard stands near Avy and puts her armored arm around the foxy's waist.")

		saynn("[say=risha]I was just walking by. And then, it just so happened.. that I saw you two.[/say]")

		if (getFlag("SocketModule.h3BeatRisha")):
			saynn("Looks like she is still salty for you beating her.")

		else:
			saynn("Looks like just taking that energy drink wasn't enough.")

		saynn("Avy shakes off the guard's arm and takes another step forward.")

		saynn("[say=pc]So. What do you want?[/say]")

		saynn("[say=avy]Not much. Apology would be nice for a start~.[/say]")

		saynn("[say=risha]Your ass. I want your ass.[/say]")

		saynn("Avy looks back at the horny lynx guard. The guard shrugs and smiles.")

		saynn("[say=avy]Your ass will do too. What's it gonna be?[/say]")

		addButton("Fight", "You're not going down without a fight", "third_fight")
		addButton("Submit", "Why fight it", "third_submit")
	if(state == "third_submit"):
		playAnimation(StageScene.Duo, "kneel", {npc="avy"})
		saynn("Why fight it, it's two against one..")

		saynn("Instead, you lower your eyes and slowly get on your knees.")

		saynn("[say=avy]Good {pc.girl}, you know that you're nothing but a subby fucktoy. Just like that Socket.[/say]")

		saynn("Risha and Avy approach you, your eyes already spot their crotches bulging..")

		if (GM.pc.hasReachableVagina()):
			saynn("[say=risha]{pc.His} cunt is mine.[/say]")

			saynn("Avy tilts her head.")

			saynn("[say=avy]Nu huh. It's mine, pick another hole.[/say]")

		else:
			saynn("[say=risha]{pc.His} ass pussy is mine.[/say]")

			saynn("Avy tilts her head.")

			saynn("[say=avy]Nu huh. It's mine, pick another hole.[/say]")

		saynn("They're glaring at each other.. You feel like something good is happening..")

		addButton("Let them fight", "Just stay quiet", "third_submit_letfight")
		addButton("Help decide", "You didn't choose to submit just for them to start fighting over this!", "third_submit_helpdecide")
	if(state == "third_submit_letfight"):
		playAnimation(StageScene.Duo, "hurt", {pc="avy", npc="risha", npcAction="shove"})
		saynn("You decide to stay quiet and let them talk it out..")

		saynn("Risha glares at Avy. The two dickgirls are surrounding you.. but their attention is fully directed to each other.")

		saynn("[say=risha]You pick another hole, weak ass bitch.[/say]")

		saynn("Avy growls softly.")

		saynn("[say=avy]It was my plan, I did everything. Fuck off, why did I even invite you.[/say]")

		saynn("Risha growls too and reaches out to shove Avy.")

		saynn("[say=risha]Because you're too afraid that you're gonna eat shit by yourself! I'm the muscles of this operation.[/say]")

		saynn("[say=avy]Fuck you![/say]")

		saynn("[say=risha]Fuck you too, whore.[/say]")

		saynn("Avy gets into a combat stance.. Risha reaches for her stun baton..")

		addButton("Continue", "See what happens next", "socket_saves_pc")
	if(state == "socket_saves_pc"):
		addCharacter("socket")
		playAnimation(StageScene.Duo, ["stunbaton", "res://Inventory/UnriggedModels/BigWrench/BigWrench.tscn"], {pc="socket", npc="risha", npcAction="defeat"})
		saynn("Suddenly, Socket rushes into the room. She sees you, Risha and Avy.. and is quick to bonk them both with her huge wrench.")

		saynn("[say=risha]Ow, fuck.[/say]")

		saynn("Avy tried to block it but the pain was enough to make her grunt and drop to her knees. Risha's armor softens the blow.. but it's still enough to bring her down too.")

		saynn("[say=avy]Argh!..[/say]")

		saynn("Socket is panting.")

		saynn("[say=socket]You are bad girls! Two.. meanies![/say]")

		saynn("The fennec is wearing her backpack. She walks up to you and makes sure you're alright.")

		saynn("[say=socket]How are you?..[/say]")

		saynn("[say=pc]Well enough..[/say]")

		saynn("[say=socket]Yay. I managed to catch the other inmate. They looked behind them, saw me running.. and hit a wall for some reason..[/say]")

		saynn("Looking at Socket.. you can guess why..")

		saynn("[say=pc]These two wanted to punish me, I guess.[/say]")

		saynn("[say=socket]Well, are you gonna do it again?[/say]")

		saynn("Socket raises her wrench.")

		saynn("[say=avy]No, fuck off..[/say]")

		saynn("[say=risha]I got a million other sluts to fuck..[/say]")

		saynn("Socket smiles and puts the wrench away. She then grabs your hand and pulls you away from this mess.")


func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "first_camera"):
		processTime(5*60)

	if(_action == "first_better_look"):
		processTime(5*60)

	if(_action == "first_backpack"):
		processTime(5*60)

	if(_action == "first_justwatch"):
		processTime(10*60)
		GM.pc.addLust(30)

	if(_action == "first_grope"):
		processTime(10*60)

	if(_action == "socket_puts_on_visor"):
		getCharacter("socket").getInventory().forceEquipRemoveOther(GlobalRegistry.createItem("SocketVisor"))

	if(_action == "first_stay_horny"):
		processTime(5*60)
		GM.pc.addLust(30)
		GM.pc.addStamina(-30)

	if(_action == "second_camera"):
		getCharacter("socket").resetEquipment()

	if(_action == "second_scary"):
		processTime(25*60)

	if(_action == "second_resist"):
		GM.pc.addLust(30)

	if(_action == "third"):
		processTime(10*60)

	if(_action == "third_repair"):
		processTime(5*60)
		getCharacter("socket").getInventory().clearSlot(InventorySlot.Torso)

	if(_action == "third_try_catch"):
		getCharacter("socket").resetEquipment()

	if(_action == "third_risha"):
		processTime(5*60)

	if(_action == "socket_saves_pc"):
		processTime(5*60)

	setState(_action)
