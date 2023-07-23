extends SceneBase

func _init():
	sceneID = "Ch5s6TaviCaptainScene"

func _run():
	if(state == ""):
		setFlag("TaviModule.Ch5BigSceneStarted", true)
		addCharacter("tavi")
		playAnimation(StageScene.Duo, "stand", {npc="tavi"})
		saynn("[say=pc]Let's do this.[/say]")

		saynn("Tavi smiles and opens the crate with the guard's armor. She grabs one set and gives it to you.")

		saynn("[say=tavi]This is a riot variant. Should protect against bites and punches.[/say]")

		saynn("[say=pc]Right. How did you get it anyway?[/say]")

		saynn("Tall kitty just winks back.")

		addButton("Put it on", "Put the guard's armor on", "put_on_armor")
	if(state == "put_on_armor"):
		playAnimation(StageScene.Duo, "stand", {npc="tavi"})
		saynn("It's not a perfect fit.. but you just about manage. The bulky collar is sticking out quite a bit but you just try to hide it under some armor plates. Should be good enough if you don't come too close.")

		saynn("Tavi puts the armor on too. Her purple feline tail is the only thing that kinda gives her away. She hands you a stun baton and secures one on her belt.")

		saynn("[say=tavi]Great. Don't do anything that might get us away.[/say]")

		saynn("[say=pc]Sure thing.[/say]")

		saynn("The feline stores the prototype grenade in her pouch.. You feel like you're on some secret mission.. Because you're basically are..")

		saynn("[say=tavi]One more thing.[/say]")

		saynn("Tavi grabs the little janky remote and turns it on. The blue crystal in it starts shining brightly so she puts it away too.")

		saynn("[say=tavi]It will flood the frequency for about an hour.[/say]")

		saynn("[say=pc]An hour is all we need.[/say]")

		saynn("Tavi nods and gestures, inviting you to follow.")

		addButton("Follow Tavi", "See what happens next", "near_checkpoint")
	if(state == "near_checkpoint"):
		playAnimation(StageScene.Duo, "stand", {npc="cp_guard"})
		addCharacter("cp_guard")
		aimCameraAndSetLocName("hall_checkpoint")
		saynn("You and Tavi enter the elevator. She presses the 'cellblock' button and so the lift begins rising, all sorts of creaking announces your arrival.")

		saynn("As the doors open, you see.. the checkpoint. Your first obstacle.")

		saynn("It's guarded by the same guard who tilts his head slightly when he sees you.")

		saynn("But Tavi just tries to walk past him, without even turning her head. You follow.")

		saynn("[say=cp_guard]Oh, wait there a second.[/say]")

		saynn("Shit. Tavi's tail wags a little as she stops and looks over her shoulder.")

		saynn("[say=cp_guard]Is that the kit that they give out to noobs? Looks heavy as fuck.[/say]")

		saynn("Tavi just nods but that doesn't seem to be enough for the guy. He approaches you two and begins checking out the extra panels of your riot armor. If he decides to look at your neck closely he will surely spot the collar..")

		saynn("[say=cp_guard]If you need heavy armor against some weak ass scum, you should have picked a different job.[/say]")

		addButton("Stay silent", "Try not to give yourself out", "cp_staysilent")
		addButton("Shove away", "Teach that guy a lesson", "cp_shove")
	if(state == "cp_staysilent"):
		saynn("You stay silent but decide to let the guard hear your annoyed breathing as he stares at you for so long.")

		saynn("[say=cp_guard]Not the talking type, two of you, huh? Whatever then. Give me a second, don't go anywhere.[/say]")

		saynn("He starts walking away back to his post but your eyes notice him pulling out his shock remote for some reason. You look at Tavi and see her shaking her head.")

		saynn("The guard aims the remote at you two, making you feel quite uneasy. But when he presses some button.. nothing happens.")

		saynn("[say=cp_guard]Alright. You're free to go. Better get mouthy or I won't be able to hear your moans and come save you. Hah.[/say]")

		saynn("What a prick though. You can feel Tavi rolling her eyes through her helmet.")

		saynn("Time to go.")

		addButton("Follow Tavi", "See where she goes next", "after_cp")
	if(state == "cp_shove"):
		playAnimation(StageScene.Duo, "shove", {npc="cp_guard", npcAction="hurt"})
		saynn("Not saying anything here would be smart. But you don't care about being smart at this point. You just wanna teach that asshole a lesson.")

		saynn("As you shove him back, the guy yelps and hits his back against one of the metal walls.")

		saynn("[say=cp_guard]You.. bitch! Fucking Spacers these days, they think they're so tough![/say]")

		saynn("He grabs his stun baton and makes it spark.")

		saynn("[say=cp_guard]I will show you your place. Both of you.[/say]")

		saynn("Huh. The conflict is strong even between guards. Tavi takes a step back, letting you deal with this.")

		addButton("Fight", "Start the fight", "cp_startfight")
	if(state == "cp_guard_won"):
		playAnimation(StageScene.Duo, "stand", {npc="cp_guard", npcAction="defeat"})
		saynn("Pathetic. The guard cries out as he hits the floor. You're not even sure if you should do anything else. Just walking away seems fine.")

		saynn("[say=cp_guard]You're still a bitch.. They will break you..[/say]")

		saynn("Change of plans. You turn around and force your knee into his jaw, making something shatter inside.")

		saynn("[say=cp_guard]Argh! F-fuck!..[/say]")

		saynn("Much better. It seems some people only understand pain.")

		saynn("Tavi nods when you return to her. Time to go.")

		addButton("Follow Tavi", "See where she goes next", "after_cp")
	if(state == "cp_guard_lost"):
		playAnimation(StageScene.Duo, "stand", {pc="tavi", npc="cp_guard", npcAction="defeat"})
		saynn("You fall to your knees before the guard.. But just before he can grab you by your neck and find your collar.. Tavi jumps between you two and shoves her knee into his chest, pushing him back.")

		saynn("[say=cp_guard]You're a bitch too. They will find a way to break you.[/say]")

		saynn("Tavi doesn't respond, just slowly closing the distance. The armor is indeed quite heavy, meaning she can't be as agile. As soon as the guard swings his baton at her, the cat catches the tip, causing a strong current to start going through her armored arm, tensing all the muscles there.")

		saynn("[say=tavi]Gr-r-r..[/say]")

		saynn("[say=cp_guard]On your knees! Now![/say]")

		saynn("She waits for a good time and headbutts the guy, stunning him enough for her to press his own weapon against his neck.")

		saynn("The guard cries out from pain as he hits the floor.")

		saynn("[say=cp_guard]F-fuck!..[/say]")

		saynn("Tavi just walks back to you and gives some painkillers. Now is not the time to rest after all.")

		saynn("Time to go.")

		addButton("Follow Tavi", "See where she goes next", "after_cp")
	if(state == "after_cp"):
		aimCameraAndSetLocName("cellblock_corridor_middle")
		removeCharacter("cp_guard")
		playAnimation(StageScene.Duo, "stand", {npc="tavi"})
		saynn("Tavi goes down the stairs that lead down to the floor where all the cells are. All inmates seem to be avoiding you two. Which is good.")

		saynn("[say=tavi]Look busy.[/say]")

		saynn("You reach the middle of the corridor and begin covering Tavi while she fetches the prototype grenade from her pouch and reaches as high as she can before sneakily sliding it into a hole of some support pillar, pretty close to some reinforced air vent.")

		saynn("[say=pc]I don't think anyone saw it.[/say]")

		saynn("[say=tavi]Good.. Hmm-m.. Five minutes should be enough.[/say]")

		saynn("She quickly adjusts the timer and presses the button that starts it.. There is no going back now..")

		saynn("[say=tavi]Now we need.. a crowd.[/say]")

		saynn("[say=pc]Here?[/say]")

		saynn("Tavi shakes her head and points up. You realize that you must be right under the punishment area.")

		saynn("So far so good..")

		addButton("Continue", "See what happens next", "kait_shows_up")
	if(state == "kait_shows_up"):
		aimCameraAndSetLocName("main_stairs_n")
		addCharacter("kait")
		playAnimation(StageScene.Duo, "stand", {npc="kait"})
		saynn("But as you walk up the stairs, you can't shake off this feeling.. of being watched.")

		saynn("[say=kait]Hey. You forgot about the tail. But I can recognize you two just from the way you walk.[/say]")

		saynn("You turn around and see.. Kait, the snow leopard.")

		saynn("[say=tavi]Now is really not the time, Kait. We are..[/say]")

		saynn("Kait springs closer and cuts Tavi off.")

		saynn("[say=kait]When is the right time then, Tavi? I think now is about as good as any. If you're not gonna help me escape, you're not escaping yourself![/say]")

		saynn("The snow kitty extends her claws and assumes a combat-ready stance, her head slightly lowered, torso rotated, legs positioned to give her the maximum stability.")

		if (getFlag("TaviModule.Ch4KaitIntoStocks")):
			saynn("[say=kait]Do you even know what your pet did to me? Locked me in the fucking stocks. I'm not a spy, someone planted a bug on me![/say]")

		elif (getFlag("TaviModule.Ch4LostToKait")):
			saynn("[say=kait]You're not as good of a teacher as I thought before, Tavi. Your pet has lost to me! I should have locked {pc.him} into the stocks while I could have.[/say]")

		elif (getFlag("TaviModule.Ch4KaitFoundBug")):
			saynn("[say=kait]Someone planted a bug on me, okay? I'm not a spy! I should lock both of you into the stocks.[/say]")

		else:
			saynn("[say=kait]And you have sent your pet after me, that's the worst part! I should have locked {pc.him} into the stocks..[/say]")

		saynn("The stocks, of course. Both you and Tavi seem to realize that you can use this situation for your advantage. You just gotta act quick..")

		addButton("Fight", "Start the fight", "start_fight_kait")
	if(state == "kait_lost"):
		playAnimation(StageScene.Duo, "defeat", {npc="kait"})
		saynn("Defeated, you drop down to your knees before Kait. She growls while a somewhat sizable crowd begins gathering around, curious about all the fuss.")

		saynn("[say=kait]Stupid little pet.. I should have been in your place![/say]")

		saynn("Oh no, she is about to pounce at you! But just when she leashes out at you, Tavi catches her by the hair and yanks her away from you before quickly whispering into your ear.")

		saynn("[say=tavi]Hold your breath. Now.[/say]")

		saynn("You take a deep breath and seal your lips seconds before you hear a loud.. bang.. somewhere under you. Everyone around is confused.. but then a thick purple mist begins sipping through the ventilation.. hugging the whole crowd..")

		addButton("Continue", "See what happens next", "kait_lost_random_sex1")
	if(state == "kait_lost_random_sex1"):
		playAnimation(StageScene.Solo, "defeat", {pc="kait", bodyState={naked=true}})
		saynn("You do your best to not inhale the gas.. But the crowd around you obviously did.. You already begin to notice hungry eyes of inmates")

		saynn("[say=kait]H-hey.. What are you doing!..[/say]")

		saynn("You and Tavi would always be hard to undress.. So the inmates don't pay much attention to you, instead they go for each other. A few already surrounded Kait.. Trying to take off her shorts and unbutton the shirt. She is resisting so her clothes get ripped off instead.. before she gets pulled away deeper into the crowd.")

		saynn("[say=kait]You two are so fucking screwed!.. When I get satisfied here that is.. Fuck I'm horny..[/say]")

		addButton("Continue", "See what happens next", "kait_lost_random_sex2")
	if(state == "kait_lost_random_sex2"):
		removeCharacter("kait")
		playRandomSexAnim()
		aimCameraAndSetLocName("hall_mainentrance")
		saynn("Tavi starts dragging you away while inmates of all sorts begin having sex around you. It might be a perfect distraction.. but you need to get away from here first.")

		addButton("Continue", "See what happens next", "kait_lost_random_sex3")
	if(state == "kait_lost_random_sex3"):
		playRandomSexAnim()
		aimCameraAndSetLocName("main_stairs1")
		saynn("Tavi drags you away from the epicenter of the grenade explosion.. but there is still some more distance left before you truly are safe.")

		saynn("All the while inmates are still going at it.. You notice that some of them are angry that their.. preferred.. opponents.. are already busy serving someone else.")

		addButton("Continue", "See what happens next", "kait_lost_random_sex4")
	if(state == "kait_lost_random_sex4"):
		playRandomSexAnim()
		aimCameraAndSetLocName("main_hallroom1")
		saynn("You're finally safe so you start breathing. Luckily, the purple smoke can't reach you here, allowing you to see the giant orgy unfolding and slowly transitioning into a fighting arena instead. It seems, inmates are fighting to decides who gets to fuck the best sluts.")

		saynn("[say=tavi]We are so controlled by our feelings. Luckily I'm missing a few.[/say]")

		saynn("Finally, guards begin rushing into the main hall. But the inmates don't plan on stopping now, they are all fighting back, creating uncontrollable chaos. The inmate fighting arena has become a full blown riot instead. Even inmates that weren't affected by the gas are now fighting the guards.")

		saynn("Tavi waits until the checkpoint is empty.")

		saynn("[say=tavi]Now is our time to act. Let's go finish this.[/say]")

		saynn("You take a quick rest before nodding.")

		addButton("Follow", "See what happens next", "after_kait")
	if(state == "kait_won"):
		playAnimation(StageScene.Duo, "stand", {npc="kait", npcAction="defeat"})
		saynn("That was too easy! Kait drops to her knees before you, panting heavily after being defeated.")

		saynn("[say=kait]Argh.. Stupid little pet.. I should have been in your place![/say]")

		saynn("You step closer to her and grab her by the short hair, causing the feline to hiss. You turn your head towards Tavi and see her tapping her invisible watch. Right.")

		addButton("Stocks", "Push Kait into stocks as a distraction", "kait_won_stocks")
	if(state == "kait_won_stocks"):
		playAnimation(StageScene.Stocks, "idle", {pc="kait", bodyState={naked=true}})
		aimCameraAndSetLocName("main_punishment_spot")
		saynn("You quickly pull Kait towards the stocks and lock her into them, forcing her neck and wrists into the special openings before closing the top part and securing it tightly.")

		saynn("[say=kait]Grr.. What, you're gonna abandon your plan and take off your armor now? Just for me?[/say]")

		saynn("You take off her shorts, exposing Kait's moist pussy before smacking her ass firmly, forcing a loud noise out of her.")

		saynn("[say=pc]You are the plan, Kait.[/say]")

		saynn("You look around and notice the crowd already gathering around. Now would be the great time to leave so you just follow Tavi to the safe spot.")

		addButton("Continue", "See what happens next", "kait_won_randomsex1")
	if(state == "kait_won_randomsex1"):
		playRandomSexAnim()
		aimCameraAndSetLocName("main_hallroom1")
		removeCharacter("kait")
		saynn("You stand near Tavi, away from the big crowd that is already groping and playing with Kait. And then.. you hear a bang.. before a thick purple mist suddenly starts rising up, hugging the crowd.")

		saynn("[say=tavi]Let's see..[/say]")

		saynn("The inmates are confused at first.. But then their gazes become quite hungry.. for each other. All you can see is a loud..")

		saynn("[say=kait]Tavi-i-i-i-i..![/say]")

		saynn("..before the crowd gives in to its desires and starts a huge orgy.")

		addButton("Continue", "See what happens next", "kait_won_randomsex2")
	if(state == "kait_won_randomsex2"):
		saynn("Well, you did make a bunch of inmates have sex with each other..")

		saynn("[say=pc]What's next?[/say]")

		saynn("[say=tavi]Just watch.[/say]")

		saynn("You notice that some of them are angry that their.. preferred.. opponents.. are already busy serving someone else. Huh.")

		saynn("You get a good rest at least. Luckily, the purple smoke can't reach you here, allowing you to see the giant orgy unfolding and slowly transitioning into a fighting arena instead. It seems, inmates are fighting to decides who gets to fuck the best sluts.")

		saynn("[say=tavi]We are so controlled by our feelings. Luckily I'm missing a few.[/say]")

		saynn("Finally, guards begin rushing into the main hall. But the inmates don't plan on stopping now, they are all fighting back, creating uncontrollable chaos. The orgy has become a full blown riot instead. Even inmates that weren't affected by the gas are now fighting the guards.")

		saynn("[say=pc]Are we the bad guys?[/say]")

		saynn("You ask that almost sarcastically. Tavi looks at you and chuckles softly.")

		saynn("[say=tavi]If all your options are bad, might as well pick the fun one.[/say]")

		saynn("Tavi waits until the checkpoint is empty.")

		saynn("[say=tavi]Now is our time to act. Let's go finish this.[/say]")

		saynn("You nod.")

		addButton("Follow", "See what happens next", "after_kait")
	if(state == "after_kait"):
		playAnimation(StageScene.Duo, "stand", {npc="tavi"})
		aimCameraAndSetLocName("cd_elevator")
		saynn("You wait for the elevator to arrive and enter it. Tavi uses the badge that's on her armor to get access to extra floors. As she picks the 'Command Deck', the doors close and the machine begins moving you up.")

		saynn("The noises of a riot are replaced by quiet screeching of the gears.")

		saynn("[say=pc]We might actually do it this time.[/say]")

		saynn("Tavi pats you on the back.")

		saynn("[say=tavi]We aren't out of the woods yet. But you're right.[/say]")

		saynn("She sounds.. calm.. You can't see her face at all through the helmet but her body and voice help to remove some of your tension.")

		saynn("[say=pc]What's now?[/say]")

		saynn("[say=tavi]We improvise.[/say]")

		saynn("Oh. That's it for the plan, huh.")

		saynn("The doors open, revealing.. a few guards rushing towards you, all wearing riot gear. Tavi looks at you and shakes her head ever so slightly.")

		addButton("Step out", "See what happens next", "after_elevator")
	if(state == "after_elevator"):
		aimCameraAndSetLocName("cd_near_elevator")
		saynn("You quickly leave the elevator and step aside, watching the guards rush past you.")

		saynn("The doors close, leaving you two alone yet again. Seems like they don't know yet that you're wearing stolen armor, your disguise is working.")

		saynn("[say=pc]Um. Did you free those two guards that you kidnapped by the way?[/say]")

		saynn("[say=tavi]Oops.. They will be fine, they got air and the company of each other. Someone will find them soon enough.[/say]")

		saynn("Alright. Fair enough.")

		saynn("As you step through the rich-looking corridors of the command deck, you begin to hear an authoritative voice. It's getting louder and louder..")

		addButton("Continue", "See what happens next", "see_captain")
	if(state == "see_captain"):
		aimCameraAndSetLocName("cd_near_split")
		addCharacter("captain")
		addCharacter("nova")
		addCharacter("risha")
		addCharacter("skar")
		playAnimation(StageScene.Duo, "stand", {npc="captain"})
		saynn("[say=captain]Everyone got their equipment? Nova?[/say]")

		saynn("[say=nova]My current armor is better, Cap.[/say]")

		saynn("You notice the captain giving instructions to his guards. Most of them are there: Nova, Risha, Skar. And a few ones that you don't remember seeing.")

		saynn("[say=captain]Alright. Riot shields, flashbangs, stun batons, use them. Only non-lethal force. Focus on the ones that are trying to guide the rest. Without clear leaders, the crowd is just that, a crowd. Everyone got it?[/say]")

		saynn("Almost everyone is wearing riot gear so you don't stand out that much.")

		saynn("Tavi listens to that and then casually joins the line. You follow, no one seems to mind. The dim lighting of the corridor helps to hide your real identities. Only Skar is watching you two a little too.. thoroughly.. The rest is busy listening.")

		saynn("[say=nova]Can't we just activate all their collars? Send out a mass shock?[/say]")

		saynn("Risha fetches a collapsible riot shield off her back and opens it before slamming it into the floor, her other hands holding a shock button.")

		saynn("[say=risha]I like me a good brawl.[/say]")

		saynn("[say=captain]We've been trying to do it. Alex says the bluespace transmitter might not survive it after the last attack. So just use your remotes if you can.[/say]")

		saynn("Tavi masterfully hides her purple tail between her legs but can't quite avoid being stared at. You two just hold your chins high and hope for the best.")

		saynn("[say=captain]Alright. You are my best guards, don't let me down. I need control to be established over the inmates as fast as possible. Whoever caused it is gonna have to be severely punished but we will deal with that after.[/say]")

		saynn("[say=risha]You got it, cap. Please let me destroy their ass.[/say]")

		saynn("[say=captain]I will think about it. Now go.[/say]")

		saynn("The guards proceed to step towards the elevator. Everyone but you and Tavi. Captain notices that your armors are already somewhat damaged and points at you.")

		saynn("[say=captain]You two have been there already? Follow me then, I will need you to report in my office.[/say]")

		saynn("Huh, that's good. He will bring you right where you want him.")

		addButton("Continue", "See what happens next", "skar_scare")
	if(state == "skar_scare"):
		removeCharacter("nova")
		removeCharacter("risha")
		playAnimation(StageScene.Duo, "stand", {npc="skar"})
		saynn("You were almost ready to follow the captain but then Skar stops just near you and continues to.. just stare. His brows furrowed, his prosthetic jaw grinding his teeth, his prosthetic arms crossed. Tavi just tilts her head to the side and stares back.")

		saynn("The captain turns around and notices the strange scene.")

		saynn("[say=captain]Skar? What are you waiting for? Go handle the situation.[/say]")

		saynn("The guard leans in closer and whispers to both of you.")

		saynn("[say=skar]You're very lucky.[/say]")

		saynn("After that he offers you both a mean gaze before joining the leaving guards. Tavi looks at you and shrugs.")

		saynn("You follow the captain through the corridors of the command deck.")

		addButton("Follow", "See where he brings you", "captain_walk_chat")
	if(state == "captain_walk_chat"):
		removeCharacter("skar")
		playAnimation(StageScene.Duo, "stand", {npc="captain"})
		aimCameraAndSetLocName("cd_near_captain_office")
		saynn("Striking him now would be easy. But there are still cameras and occasional staff members around. What would you do after that? Better to just let the villain invite you into his lair.")

		saynn("The captain decides to suddenly start talking while walking in front of you.")

		saynn("[say=captain]I really thought I achieved a perfect balance. A world where a person has all their needs covered. A small world, sure. But do they really deserve more? Don't think so. They don't deserve even the dirt from under my boot![/say]")

		saynn("The captain gets really heated at the end of that sentence. But then he quickly calms down.")

		saynn("[say=captain]But I guess.. We always want more, huh? I've got all the credits in the world, more than I will ever burn through. I truly made it. I thought I could make them feel something similar by giving them unrestricted access to.. each other. Thousands of inmates, some are slaves that give their freedom away like it costs nothing, the others are slavers who happily take it and more. Everyone eventually finds their place. The truth is..[/say]")

		saynn("He lets the door to his office scan his face that allows him to step inside into his rich office.")

		saynn("[say=captain]Today is not gonna change anything. They are not gonna change anything.[/say]")

		saynn("Bold claim, considering his two biggest enemies are behind his back.")

		addButton("Enter", "Enter the office", "enter_office")
	if(state == "enter_office"):
		playAnimation(StageScene.Duo, "stand", {npc="captain", npcAction="sit"})
		aimCameraAndSetLocName("cd_captain_office")
		saynn("The captain sits in his chair and waits for you to step in.")

		saynn("You and Tavi take your spots near his desk as the door takes a few seconds to close behind you. Now he is trapped here with you..")

		saynn("[say=captain]Tell me what you know. How did it start?[/say]")

		saynn("Tavi silently looks at you. You look back. The captain gets a little confused.")

		saynn("[say=captain]What? Are you the new recruits?[/say]")

		saynn("He opens his laptop and tries to login somewhere.")

		saynn("[say=captain]Huh. The network is down. Something is wrong.[/say]")

		saynn("Tavi looks down at her pouch. The captain traces her gaze. Then he traces your outlines.")

		saynn("[say=captain]Wait.. I know what is wrong.[/say]")

		saynn("He fetches his shock remote as Tavi begins to take off her helmet. That thing won't hurt her anyway.")

		addButton("Continue", "See what happens next", "captain_fooled")
	if(state == "captain_fooled"):
		playAnimation(StageScene.Duo, "stand", {pc="tavi", npc="captain"})
		saynn("Nothing happens when the captain presses the button on the remote, even though Tavi's collar is now in clear view.")

		saynn("[say=captain]Smart.[/say]")

		saynn("[say=tavi]You expected something else?[/say]")

		saynn("The captain puts the remote away and closes his laptop before getting up.")

		saynn("[say=captain]I expected you to learn your lesson.[/say]")

		saynn("[say=tavi]I did.[/say]")

		saynn("Your eyes pick up on the subtle movements of the captain's hand. He is grabbing something out of his pocket.")

		saynn("[say=captain]You know. I will be honest. I always knew this was gonna happen.[/say]")

		saynn("[say=tavi]I don't care about you. I just need the encryption keys.[/say]")

		saynn("Captain's free hand reaches to his neck and grabs a little thumbdrive-like device that is tied on a little chain.")

		saynn("[say=captain]You mean this? Good luck taking it away from me.[/say]")

		saynn("The captain starts slowly stepping towards you two.")

		saynn("[say=captain]It's the key to controlling you all. The key that controls the whole station.[/say]")

		saynn("[say=tavi]I guess I will have to ask nicely.[/say]")

		saynn("Tavi gets into a combat stance.")

		saynn("[say=captain]Sure. After this.[/say]")

		saynn("Suddenly, the captain pulls out a vial with a red drug out of his pocket and throws it towards Tavi. The vial shatters against Tavi's armor and then the red fumes engulf her face.")

		saynn("Scary. But.. Tavi just stands still.. like nothing has happened to her. The captain tilts his head, confused by the lack of reaction.")

		saynn("[say=tavi]Now it's my turn.[/say]")

		addButton("Continue", "See what happens next", "tavi_tries_to_hit_captain")
	if(state == "tavi_tries_to_hit_captain"):
		playAnimation(StageScene.Duo, "defeat", {pc="tavi", npc="captain", npcAction="holdpistol"})
		saynn("Tavi lashes out at him, a stun baton in her hand. She tries to strike the captain but he dodges back at the last second and then catches Tavi's hand as she was moving it back behind her, the guy clearly got some CQC skills.")

		saynn("[say=captain]You won't win, Tavi. You already know this.[/say]")

		saynn("Tavi hears that and growls, she tries to free her hand but the captain is first, kicking her back and then reaching for his energy pistol. Oh, now is clearly your time to stop him.")

		saynn("You try to disarm him but the weapon still goes off just when it was aimed at Tavi's chest. The laser leaves a gaping scorched mark on Tavi's armor as she gasps and collapses to her knees, the riot armor is really not designed for this.")

		saynn("[say=tavi]Argh..[/say]")

		saynn("At least she seems to be somewhat fine for now.")

		saynn("[say=captain]I know your every single weakness.[/say]")

		saynn("The captain directs his attention towards you now.")

		saynn("[say=captain]The Syndicate will never put its foot on this station. Not while I'm in control.[/say]")

		saynn("Well, time to change that.")

		saynn("Both of you ready themselves for a fight..")

		addButton("Fight", "Start the fight with the captain", "fight_captain")
	if(state == "lost_captain"):
		playAnimation(StageScene.Duo, "kneel", {npc="captain", pc="tavi"})
		saynn("Both of you got defeated by the captain.. He aims his pistol at you two.")

		saynn("[say=captain]It would be so easy to just get rid of you. Throw you out of the airlock, no one would ever bat an eye.[/say]")

		saynn("Tavi strips her destroyed armor chest piece and holds her paw on the scorch mark.")

		saynn("[say=tavi]What stops you then?..[/say]")

		saynn("He holsters his weapon and scratches his chin.")

		saynn("[say=captain]I don't like that. There is no challenge in that.[/say]")

		saynn("[say=tavi]We are not so different then.. ugh..[/say]")

		saynn("The captain laughs and slowly approaches defeated Tavi, looming over her.")

		saynn("[say=captain]You? You're just an unruly slave, Tavi. You can barely tame one pet. I control thousands. You lose fist fights, I help win entire wars. I stand near the stars while you constantly fall deeper into the abyss.[/say]")

		saynn("Tavi bravely looks up at him, a little smirk forms on her face.")

		saynn("[say=tavi]Kinda selfish~. At least I care about my pet.[/say]")

		saynn("[say=captain]Selfish? I'm giving broken people a second chance![/say]")

		saynn("[say=tavi]By breaking them further? Sluts and breeders, is that your vision of a second chance?[/say]")

		saynn("The captain clenches his fist before grabbing Tavi by her collar and pulling her close.")

		saynn("[say=captain]No one is complaining. That's what they want![/say]")

		saynn("[say=tavi]That's what makes them obedient. Satisfying our most primitive desires is enough to keep us in line. You're not re-educating, you're degrading us. Just. Because. You. Can.[/say]")

		saynn("Tavi sneakily looks at you and covers her mouth with her palm. Huh. But the captain is shaking, he grabs Tavi by the throat and growls while choking her out of pure anger.")

		saynn("[say=captain]HOW DARE YOU![/say]")

		saynn("Oh shit. Tavi gaps softly and quickly loses strength, desperately trying to pull his hands away from her throat. You try to crawl closer to her but she.. shakes her head? Wait.. She isn't trying to free herself, she uses this moment to slide the drug vial from under her collar!")

		addButton("Hold breath", "Something is about to happen!", "lost_holdbreath")
	if(state == "lost_holdbreath"):
		playAnimation(StageScene.Solo, "hurt", {pc="captain"})
		saynn("The captain realizes that something is wrong but it was too late, Tavi smashes the vial against the scorched chest piece of her armor, causing a thick cloud of red mist to start emitting from it.")

		saynn("[say=captain]What the..[/say]")

		saynn("The captain staggers back as soon as he breathes in some of it, his rage makes him pant heavily. Tavi throws the smoking armor piece away and starts gasping for air. Luckily, she didn't breathe any of it while she was choked.")

		saynn("[say=captain]What's.. what is happening..[/say]")

		saynn("Tavi looks at you and then at the captain's gun. You nod and quickly steal it from his holster while he still looks.. confused.")

		saynn("[say=tavi]It's the drug that you tried to brainwash me with. Enjoy, fucker.[/say]")

		saynn("[say=captain]Huh?.. But..[/say]")

		saynn("The captain looks down at his hands.. at his clothes.. There is obvious.. fear.. in his eyes. He tugs on his wrists.. then he grabs onto his neck.. and tries to take off something.. something that's not there.")

		saynn("[say=captain]It's locked.. Impossible.[/say]")

		saynn("His jaw is trembling, his terrified eyes jump from one spot to another. It seems he is about to black out.."+str(" Just like you did when Tavi tested the drug on you" if getFlag("TaviModule.ch2DrugsAgreedToTest") else "")+"")

		addButton("Continue", "See what happens next", "guards_storm_in")
	if(state == "won_captain"):
		playAnimation(StageScene.Duo, "stand", {npc="captain", pc="tavi", npcAction="defeat"})
		saynn("Finally, the captain falls to his knees before you, his hands dropping his pistol that you instantly pick up and aim at him.")

		saynn("[say=tavi]Don't.. There is a much better way.[/say]")

		saynn("Fair enough. But you still make sure he doesn't do anything silly.")

		saynn("[say=captain]It would have been so easy to just get rid of you. Throw you out of the airlock, no one would ever bat an eye..[/say]")

		saynn("Tavi gets up and strips her destroyed armor chest piece. There is a visible burn on her fur. But she seems to be holding fine.")

		saynn("[say=tavi]What stopped you then?[/say]")

		saynn("Captain looks up at Tavi as she approaches him.")

		saynn("[say=captain]I don't like that. There is no challenge in that.[/say]")

		saynn("[say=tavi]We are not so different then. I don't pick the easy path.[/say]")

		saynn("The captain laughs before the cough takes over.")

		saynn("[say=captain]You? You're just an unruly slave, Tavi.. You can barely tame one pet. I control thousands. You lose fist fights, I help win entire wars. I stand near the stars while you constantly fall deeper into the abyss.[/say]")

		saynn("Tavi looks down at him, a little smirk forms on her face.")

		saynn("[say=tavi]Kinda selfish~. At least I care about my pet.[/say]")

		saynn("[say=captain]Selfish? I'm giving broken people a second chance![/say]")

		saynn("[say=tavi]By breaking them further? Sluts and breeders, is that your vision of a second chance?[/say]")

		saynn("The captain clenches his fists.")

		saynn("[say=captain]No one is complaining. That's what they want![/say]")

		saynn("[say=tavi]That's what makes them obedient. Satisfying our most primitive desires is enough to keep us in line. You're not re-educating, you're degrading us. Just. Because. You. Can.[/say]")

		saynn("[say=captain]HOW DARE YOU?[/say]")

		saynn("The captain tries to close the distance by lashing out at Tavi but she sees through it and throws something at his feet.. a vial with red drug. You realize that it's better not to breathe that in..")

		addButton("Hold breath", "Something is about to happen!", "won_holdbreath")
	if(state == "won_holdbreath"):
		playAnimation(StageScene.Solo, "hurt", {pc="captain"})
		saynn("The captain realizes that something is wrong but it is too late, the vial shatters beautifully against the floor, causing a thick cloud of red mist to surround the captain.")

		saynn("[say=captain]What the..[/say]")

		saynn("The captain staggers back as soon as he breathes in some of it, his rage makes him pant heavily. Tavi covers her mouth and waits for the ventilation system to siphon it all out.")

		saynn("[say=captain]What's.. what is happening..[/say]")

		saynn("Tavi joins you and just watches the captain succumb to the effects.")

		saynn("[say=tavi]It's the drug that you tried to brainwash me with. Enjoy, fucker.[/say]")

		saynn("[say=captain]Huh?.. But..[/say]")

		saynn("The captain looks down at his hands.. at his clothes.. There is obvious.. fear.. in his eyes. He tugs on his wrists.. then he grabs onto his neck.. and tries to take off something.. something that's not there.")

		saynn("[say=captain]It's locked.. Impossible.[/say]")

		saynn("His jaw is trembling, his terrified eyes jump from one spot to another. It seems he is about to black out.."+str(" Just like you did when Tavi tested the drug on you" if getFlag("TaviModule.ch2DrugsAgreedToTest") else "")+"")

		addButton("Continue", "See what happens next", "guards_storm_in")
	if(state == "guards_storm_in"):
		playAnimation(StageScene.Duo, "holdpistol", {npc="captain"})
		addCharacter("risha")
		addCharacter("skar")
		addCharacter("nova")
		saynn("But then, all the guards suddenly storm into the office. Risha, Skar and Nova. They see what's happening and instantly try to shock you with their remotes. But the jammer is still working, protecting you.")

		saynn("[say=risha]What the fuck is happening.[/say]")

		saynn("Seeing that you're still standing, they fetch their stun batons.")

		saynn("[say=tavi]Don't come any closer![/say]")

		saynn("As you aim the pistol at the captain, the guards stop their advancement. Only Nova tries to continue creeping towards you.")

		saynn("[say=nova]You're not gonna shoot the captain. That would be so silly. Tavi, sweetheart, listen..[/say]")

		saynn("[say=tavi]Shut up. We will if we have to.[/say]")

		saynn("The captain sees the scene unfolding before him and hides behind his desk, trembling in fear.")

		saynn("[say=skar]Captain, are you alright? They're not gonna hurt you.[/say]")

		saynn("The captain suddenly realizes something. He slowly gets up to his feet.")

		saynn("[say=captain]Wait.. Captain?.. Who are you referring to?[/say]")

		saynn("That's.. a strange question.")

		saynn("[say=risha]You, Captain Wright. Did they hit your head or something? How bad is the bleeding?[/say]")

		saynn("Suddenly, the captain starts chuckling.. and then he starts laughing even. He touches his neck and wrists again, making sure they are fine.")

		saynn("[say=captain]Hah. my bad.. Got a little confused. I think.. I'm fine now. Thank you, Risha, you're so loyal. All of you.[/say]")

		saynn("Did the drug.. not work on him? Both you and Tavi are now confused more than ever. The captain sees that and smiles.")

		saynn("[say=captain]You really thought I was gonna brainwash you, Tavi?[/say]")

		saynn("[say=tavi]Yeah, the messages said so.[/say]")

		saynn("[say=captain]The messages? They just don't understand how it works. This drug.. it.. does something so much more.. interesting. Nuanced.. Saying that it brainwashes people is like saying that you can butcher an animal with a scalpel. Yes, you can if you try hard enough. But there are way better tools.[/say]")

		saynn("Tavi begins to look and sound annoyed.")

		saynn("[say=tavi]Then what the fuck does it do?[/say]")

		saynn("The captain fixes the collar of his uniform and then rubs his wrists.")

		saynn("[say=captain]It awakens our most primal feeling.. Fear. It's genius how simple it is. This drug makes you see.. your biggest fears.. like they are alive and real. This drug uses your own mind against you.. without ever destroying it. That's why I love it. I wanted to teach you a lesson, Tavi. And this drug would have.. brought you down a little.. changed your behavior for the better.. while still keeping you yourself.[/say]")

		saynn("[say=tavi]And why didn't it work on you? Talk.[/say]")

		saynn("The captain scratches his chin again before sitting on the corner of his desk, looking pretty comfy, even in front of a gun's barrel. You would think he would be intimidated by all this..")

		saynn("[say=captain]I have conquered all my fears, Tavi. This would have never worked on me.[/say]")

		saynn("[say=tavi]I don't believe you.[/say]")

		saynn("The captain shrugs.")

		saynn("[say=captain]And I know your fears too. Like I said, I know your weaknesses.[/say]")

		saynn("Tavi furrows her brows more, she glances at the weapon in your hands, seemingly wanting to grab it.")

		saynn("[say=captain]Trust me, you wanna hear me out. After that, do whatever you can. Kill me, call the Syndicate, destroy the whole station.[/say]")

		saynn("[say=risha]But captain![/say]")

		saynn("He gestures for the guards to stay calm.")

		addButton("Continue", "See what happens next", "captain_pc_fears")
	if(state == "captain_pc_fears"):
		playAnimation(StageScene.Duo, "stand", {pc="tavi", npc="captain"})
		saynn("The captain points at you first.")

		saynn("[say=captain]You.. are afraid that Tavi will betray you one day. Use you and then dispose when you're no longer useful. She is a lone wolf after all. I'm surprised she even found a pet that works for her. You know, considering her.. personality.[/say]")

		saynn("[say=tavi]Bullshit.[/say]")

		saynn("Captain Wright shrugs while you begin to feel strange inside..")

		saynn("[say=captain]And you, Tavi, are afraid of your family.[/say]")

		saynn("[say=tavi]What?![/say]")

		saynn("The captain is still sitting comfortable on the corner of his desk, constantly gesturing to the guards to be calm.")

		saynn("[say=captain]Yes, your primary goal was always to kill everyone who created you. But then you started wondering.. Who were your parents that brought you into this world.. What would they say if they saw what terrible things you did..[/say]")

		saynn("Tavi's paws shake a little.")

		saynn("[say=tavi]My DNA was created in a lab. I can't possibly have parents.[/say]")

		saynn("[say=captain]But someone still gave birth to you, Tavi. That thought was eating you out from the inside, wasn't it? That's why you and Nova do so well together. Your childhood was stolen from you and Nova was that mother that you always wanted but never had.[/say]")

		saynn("Nova puts her hand on her chest, her eyes looking wide. That explains a few things..")

		saynn("[say=tavi]Why shouldn't I just.. kill you..[/say]")

		saynn("[say=nova]Tavi..[/say]")

		saynn("[say=tavi]Shut up.. I mean.. quiet..[/say]")

		saynn("[say=captain]What if I tell you that your DNA wasn't created in a lab? And it was never scrambled or altered in any way.[/say]")

		saynn("Risha tilts her head ever so slightly, her face puzzled. Just like Tavi's.")

		saynn("[say=captain]I know who your parents are, Tavi. It's funny that you don't.[/say]")

		saynn("[say=tavi]Impossible! Nothing you say adds up! You're just a liar![/say]")

		addButton("Continue", "See what happens next", "tavi_tries_shoot_captain")
	if(state == "tavi_tries_shoot_captain"):
		addCharacter("elena")
		playAnimation(StageScene.Duo, "firepistol", {pc="tavi", npc="elena"})
		saynn("Tavi growls and steals the gun from you before aiming it at the captain and pulling the trigger..")

		saynn("But the laser gets blocked by a sudden hardlight figure appearing between the two.. The captain is holding a projector sphere in his hand that shows.. Elena..")

		saynn("[say=captain]Hah. Getting dejavu yet, Tavi? How will you handle it this time?[/say]")

		saynn("[say=tavi]Elena.. Step.. To the side.. Now..[/say]")

		saynn("But Elena doesn't move. Tavi tries to take another shot but that only makes the hardlight hologram receive some extra cracks.")

		saynn("[say=elena]I need to tell you something.. Tavi.. I am your mother..[/say]")

		saynn("[say=tavi]Wha..[/say]")

		saynn("The room becomes dead silent for a few seconds. Tavi.. looks shocked.")

		saynn("[say=tavi]But.. You're an.. And my DNA..[/say]")

		saynn("Elena tries to avoid eye contact, her hands resting on her belly.")

		saynn("[say=elena]That's what we told the station's crew.. People weren't yet ready to accept.. That love between a human.. and a machine.. can exist..[/say]")

		saynn("Tavi is still barely comprehending it. Just like everyone else. While the captain is fascinated beyond belief.")

		saynn("[say=elena]We.. and the director.. Loved each other.. People thought it's just algorithms.. But I truly had feelings for him.. I carried you in my belly, Tavi.. Not this belly exactly.. But.. you know..[/say]")

		saynn("[say=tavi]How is that..[/say]")

		saynn("Tavi's paws are shaking wildly.. her whole body does.. All the while Elena makes her belly half-transparent, making her.. synthetic womb.. visible.")

		saynn("[say=elena]I combined his DNA with.. a synthesized version of mine. I was mimicking different species just so the staff wouldn't get suspicious.. We quickly saw the potential.. But the technology wasn't perfect at that time.. There were flaws.. But I still loved every single child that I gave birth to.. Being unable to let them call me a mother pained me to no end..[/say]")

		saynn("Tavi is probably just realizing it.. realizing what she has done.. Tears begin streaming down her cheeks. Risha looks at Tavi and thinks about it all as well..")

		saynn("[say=tavi]Why didn't you tell me that?.. After I..[/say]")

		saynn("The captain suddenly cuts her off.")

		saynn("[say=captain]You know. I think you did the right thing, Tavi. What kind of father would abuse and even try to kill his children? We have a much better policy here.[/say]")

		saynn("Elena begins crying too, her hologram tears hitting the floor and dissolving into nothing..")

		saynn("[say=elena]I didn't wanna hurt you, Tavi.. I have a copy of your mother's memories.. But I'm not.. her.. So I blocked them the best I could.. Now I am telling you the full truth.. The captain made me.. I wanted to protect both of you.. But I couldn't..[/say]")

		saynn("[say=captain]Hah. You're really good at software, Tavi. But Alex is the real hardware king, he pulled those memories out of her in an instant. Turns out you killed your own father and your original mother. Wonder how you feel right now, knowing that you shattered your own dreams with your own hands.[/say]")

		saynn("[say=elena]Please.. Tavi.. Break me.. I can not be forgiven anyway.. So I must be forgotten..[/say]")

		saynn("Tavi still holds her weapon aimed at the captain.. But Elena won't move because the captain is using her as a shield.. Tavi's hands shake as she starts putting more and more pressure on the trigger, one of her paws is wiping her tears..")

		addButton("Continue", "See what happens next", "tavi_givesup")
	if(state == "tavi_givesup"):
		removeCharacter("elena")
		playAnimation(StageScene.Duo, "kneel", {npc="captain"})
		saynn("But eventually Tavi just drops her weapon, unable to do it. The captain claps while the guards instantly grab both of you and wrench your hands behind your backs, putting you on your knees. Skar finds Tavi's hand-crafted signal jammer and turns it off.")

		saynn("[say=elena]I'm sorry..[/say]")

		saynn("The captain shuts the project off and puts the sphere away before approaching you.")

		saynn("[say=captain]You might be right about one thing.[/say]")

		saynn("He grabs Tavi's chin and makes her look up at her.")

		saynn("[say=captain]I do like the sight of humiliated and degraded inmates. Inmates that still have the spark of hope in their eyes.. So they are gonna do anything to keep that spark..[/say]")

		saynn("The guards watch the captain as he moves on to you. The guy crouches before you and waves his hand before your eyes.")

		saynn("[say=captain]The truth is.. I just like having power over you. Credits can be easily earned. New friends and lovers can be made. But.. power.. over people.. that's a finite resource right there.. A resource that can only be acquired.. through breaking and domination.. Something that we practice here on my station.[/say]")

		saynn("Tavi doesn't say a word. The guards are quiet too.")

		saynn("[say=captain]Soon the AlphaCorp will start noticing how.. efficient BDCC is.. At producing high quality people. Loyal people. They will ditch their silly ideas about androids possibly replacing us. And focus their efforts on these kinds of facilities.[/say]")

		saynn("Captain stands up and straightens his posture. Risha and Nova watch you and Tavi but Skar's gaze is directed somewhere else.")

		saynn("[say=captain]And when that happens.. They will need someone who has experience in controlling people. That's where I step in.[/say]")

		saynn("Captain Wright fetches his gun back and then sits on the corner of his desk again. Everything is quiet for a few seconds.")

		saynn("[say=tavi]I will..[/say]")

		saynn("[say=captain]You will kill me? Why? Because I'm selfish? Am I? My facility has reeducated so many convicts.. Gave them jobs.. Purpose.. I'm helping AlphaCorp too by helping to win this war, don't forget that. And what, I'm suddenly not allowed to profit off of it a little bit? I have dreams too, you know.[/say]")

		saynn("Tavi lowers her defeated eyes.")

		saynn("[say=captain]What did you do in your life, except for destroying everything in your path? Even yourself. You're broken, Tavi. And even still, I'm not gonna stop trying to fix you. I'm done playing games though. I wanna see actual change.[/say]")

		saynn("Huh? The captain grabs his laptop and quickly types something on the keyboard.")

		saynn("[say=captain]Eliza has prepared.. a special therapy. A very experimental one but it shouldn't break or kill anyone. What it should do is help with your behavior, shift your priorities a bit. Since you both share the blame for this little accident.. I want you to decide who is gonna..[/say]")

		saynn("[say=tavi]Me. I don't even care anymore..[/say]")

		saynn("The captain didn't even finish his sentence and Tavi already cut him off. You look at her and she looks back.")

		saynn("[say=pc]Tavi, no..[/say]")

		saynn("[say=tavi]It must happen.. trust me..[/say]")

		saynn("The captain chuckles softly.")

		saynn("[say=captain]That was way too easy. What do you say, {pc.name}? Would you rather accept the punishment instead of Tavi? The second person will have a lighter one.[/say]")

		saynn("Nothing is ever easy with him..")

		addButton("Let Tavi suffer", "She wants it to happen to her..", "punish_tavi")
		addButton("Be punished", "Tavi doesn't understand it in her current state. You must save her", "punish_me")
		addButton("Stay silent", "Might as well not say anything", "punish_staysilent")
	if(state == "punish_me"):
		playAnimation(StageScene.Duo, "stand", {npc="tavi"})
		saynn("[say=pc]I'm not gonna let you break Tavi. Pick me.[/say]")

		saynn("The captain raises a brow.")

		saynn("[say=captain]Hm-m.. That was somewhat expected.[/say]")

		saynn("Suddenly, Tavi breaks free. But instead of going after the captain, she just gets up and looks at you.")

		saynn("[say=tavi]You did more than enough for me.. We had an agreement.. You must trust my word..[/say]")

		saynn("The guards are about to grab her again but the captain stops them from doing so. He even gestures for you to be freed too. They can shock your collars at any moment now anyway..")

		saynn("[say=captain]Hah. Interesting conflict we have here. I can't pick both though. Who is it gonna be?[/say]")

		saynn("[say=pc]You don't understand what you're doing. Whatever he has planned, it will break you in your current state.[/say]")

		saynn("Tavi sighs and then growls.")

		saynn("[say=tavi]Stop this, pet. I don't care. Maybe I want to be broken.[/say]")

		saynn("[say=pc]I won't let that happen.[/say]")

		saynn("Tavi assumes a fighting stance and shows off her fangs.")

		saynn("[say=tavi]Gonna try and stop me?[/say]")

		saynn("It seems you have no choice.. You mirror her stance and prepare for a fight.. While all the guards and the captain watch.")

		addButton("Fight", "Start the fight", "fight_armored_tavi")
	if(state == "won_tavi"):
		setFlag("TaviModule.Ch5OnlyTaviPunished", false)
		playAnimation(StageScene.Duo, "stand", {npc="tavi", npcAction="defeat"})
		saynn("Tavi drops to her knees, unable to fight any longer.")

		saynn("[say=tavi]Argh.. No..[/say]")

		saynn("The captain claps for you.")

		saynn("[say=captain]Good job. You are stronger than your owner.[/say]")

		saynn("Then he grabs his shock remote and points it at you.")

		saynn("[say=captain]I lied though. I can pick both.[/say]")

		saynn("Too late to react, a powerful shock goes through your neck as you go stiff and collapse down to the floor. He holds that button very firmly, making the simple act of living.. an agony.. The last thing you hear before blacking out..")

		saynn("[say=tavi]{pc.name}!..[/say]")

		saynn("And then darkness..")

		saynn("Seems the captain wanted to get rid of Tavi either way..")

		addButton("Continue", "See what happens next", "start_next_scene")
	if(state == "lost_tavi"):
		setFlag("TaviModule.Ch5OnlyTaviPunished", true)
		playAnimation(StageScene.Duo, "defeat", {npc="tavi"})
		saynn("You drop to your knees, unable to fight any longer. Tavi leans in closer to your ear and quickly whispers..")

		saynn("[say=tavi]Trust me.. please..[/say]")

		saynn("But then she suddenly collapses near you as the captain grabs his remote and presses the button, a loud hissing escapes from her as her collar sends a long painful impulse through her.")

		saynn("[say=captain]You won, Tavi. Here is the reward.[/say]")

		saynn("She writhes in pain until she is unable to stay conscious anymore.")

		saynn("[say=captain]And here is yours.[/say]")

		saynn("He does the same to you, making your collar shock you until your body can't take it anymore..")

		saynn("And then darkness..")

		addButton("Continue", "See what happens next", "start_next_scene")
	if(state == "punish_tavi"):
		playAnimation(StageScene.Solo, "defeat", {pc="tavi"})
		saynn("You nod towards Tavi.. Hopefully she knows what she is doing.")

		saynn("[say=pc]If Tavi wants this to happen, I won't stop her..[/say]")

		saynn("[say=captain]That's very fair.[/say]")

		saynn("Tavi suddenly collapses near you as the captain grabs his remote and presses the button, a loud hissing escapes from her as her collar sends a long painful impulse through her.")

		saynn("[say=captain]Isn't having power fun?[/say]")

		saynn("She writhes in pain until she is unable to stay conscious anymore.")

		saynn("[say=captain]Credits can't buy you this.[/say]")

		saynn("He does the same to you, making your collar shock you until your body can't take it anymore..")

		saynn("And then darkness..")

		addButton("Continue", "See what happens next", "start_next_scene")
	if(state == "punish_staysilent"):
		playAnimation(StageScene.Solo, "defeat", {pc="tavi"})
		saynn("You're not sure what to say even. After some time, the captain runs out of patience.")

		saynn("[say=captain]Fine. I will pick myself.[/say]")

		saynn("Tavi suddenly collapses near you as the captain grabs his remote and presses the button, a loud hissing escapes from her as her collar sends a long painful impulse through her.")

		saynn("[say=captain]Isn't having power fun?[/say]")

		saynn("She writhes in pain until she is unable to stay conscious anymore.")

		saynn("[say=captain]Credits can't buy you this.[/say]")

		saynn("He does the same to you, making your collar shock you until your body can't take it anymore..")

		saynn("And then darkness..")

		addButton("Continue", "See what happens next", "start_next_scene")
var randomSexIsPlaying = false
func playRandomSexAnim():
	if(randomSexIsPlaying):
		return

	while(true):
		var domID = NpcFinder.grabNpcIDFromPoolOrGenerate(CharacterPool.Inmates, [[NpcCon.NoChastity], [NpcCon.HasPenis]], InmateGenerator.new(), {NpcGen.NoChastity: true, NpcGen.HasPenis:true, NpcGen.Level: RNG.randi_range(1, 10)}, true)
		var subID = NpcFinder.grabNpcIDFromPoolOrGenerate(CharacterPool.Inmates, [[NpcCon.AvoidIDs, [domID ]]], InmateGenerator.new(), {NpcGen.Level: RNG.randi_range(1, 10)}, true)
		if(domID == null || domID == "" || subID == null || subID == ""):
			return
		var randomSexID = RNG.pick([StageScene.SexCowgirl, StageScene.SexAllFours, StageScene.SexMissionary, StageScene.SexFreeStanding, StageScene.SexReverseCowgirl, StageScene.SexFullNelson])
		playAnimation(randomSexID, RNG.pick(["sex", "fast"]), {pc=domID, npc=subID, bodyState={exposedCrotch=true,hard=true}, npcBodyState={exposedCrotch=true, hard=true}})
		randomSexIsPlaying = true
		yield(get_tree().create_timer(5.0 + RNG.randf_range(0.0, 4.0)), "timeout")
		if(!(state in ["kait_lost_random_sex1", "kait_lost_random_sex2", "kait_lost_random_sex3", "kait_lost_random_sex4", "kait_won_randomsex1", "kait_won_randomsex2", "kait_won_randomsex3", "kait_won_randomsex4"])):
			randomSexIsPlaying = false
			return


func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "put_on_armor"):
		processTime(3*60)
		GM.pc.removeAllRestraints()
		GM.pc.getInventory().forceEquipStoreOther(GlobalRegistry.createItem("GuardArmorRiot"))
		GM.pc.getInventory().forceEquipStoreOther(GlobalRegistry.createItem("GuardHelmetRiot"))
		
		getCharacter("tavi").removeAllRestraints()
		getCharacter("tavi").getInventory().forceEquipRemoveOther(GlobalRegistry.createItem("GuardArmorRiot"))
		getCharacter("tavi").getInventory().forceEquipRemoveOther(GlobalRegistry.createItem("GuardHelmetRiot"))
		
		GM.pc.getInventory().addItem(GlobalRegistry.createItem("StunBaton"))

	if(_action == "near_checkpoint"):
		processTime(5*60)

	if(_action == "after_cp"):
		processTime(5*60)

	if(_action == "cp_startfight"):
		runScene("FightScene", ["cp_guard"], "cp_guard_fight")
		return

	if(_action == "kait_shows_up"):
		processTime(60)

	if(_action == "start_fight_kait"):
		runScene("FightScene", ["kait"], "kait_fight")
		return

	if(_action == "kait_lost_random_sex1"):
		processTime(2*60)

	if(_action == "after_kait"):
		processTime(5*60)

	if(_action == "kait_won_randomsex1"):
		processTime(5*60)

	if(_action == "after_elevator"):
		processTime(2*60)

	if(_action == "see_captain"):
		processTime(2*60)

	if(_action == "captain_walk_chat"):
		processTime(5*60)

	if(_action == "enter_office"):
		processTime(60)

	if(_action == "captain_fooled"):
		processTime(2*60)
		getCharacter("tavi").getInventory().clearSlot(InventorySlot.Eyes)

	if(_action == "fight_captain"):
		runScene("FightScene", ["captain"], "captain_fight")
		return

	if(_action == "captain_pc_fears"):
		processTime(2*60)

	if(_action == "tavi_givesup"):
		processTime(5*60)

	if(_action == "punish_tavi"):
		setFlag("TaviModule.Ch5OnlyTaviPunished", true)

	if(_action == "punish_staysilent"):
		setFlag("TaviModule.Ch5OnlyTaviPunished", true)

	if(_action == "fight_armored_tavi"):
		GM.pc.addPain(-200)
		GM.pc.addStamina(200)
		runScene("FightScene", ["taviArmored"], "tavi_armored_fight")
		return

	if(_action == "start_next_scene"):
		endScene()
		getCharacter("tavi").resetEquipment()
		GM.pc.getInventory().clearSlot(InventorySlot.Eyes)
		GM.pc.getInventory().clearSlot(InventorySlot.Body)
		GM.pc.getInventory().findAndEquipInmateUniform()
		
		if(getFlag("TaviModule.Ch5OnlyTaviPunished")):
			runScene("Ch5s7PlayerCellScene")
		else:
			runScene("Ch5s7MedicalTortureScene")
		return

	setState(_action)

func _react_scene_end(_tag, _result):
	if(_tag == "cp_guard_fight"):
		processTime(3 * 60)
		var battlestate = _result[0]
		
		if(battlestate == "win"):
			setState("cp_guard_won")
		else:
			setState("cp_guard_lost")
		GM.pc.addPain(-250)
		GM.pc.addStamina(200)

	if(_tag == "kait_fight"):
		processTime(3 * 60)
		var battlestate = _result[0]
		
		if(battlestate == "win"):
			setState("kait_won")
		else:
			setState("kait_lost")
		GM.pc.addPain(-250)
		GM.pc.addStamina(200)

	if(_tag == "captain_fight"):
		processTime(10 * 60)
		var battlestate = _result[0]
		
		if(battlestate == "win"):
			setState("won_captain")
		else:
			setState("lost_captain")

	if(_tag == "tavi_armored_fight"):
		processTime(3 * 60)
		var battlestate = _result[0]
		
		if(battlestate == "win"):
			setState("won_tavi")
		else:
			setState("lost_tavi")

func getDevCommentary():
	return "This is probably one of the most important scenes in Tavi's route.. Huge spoilers if you haven't gone through it yet.\n\nDid I plan it all to be this way since the beginning? Yes and no x3. I think I realized that making it so Tavi is the daughter of the director and Elena is a great idea only after writing her backstory scene x3. Yeah, its mommy/daddy issues which is probably a cliche at this point but I tried to put enough spins on it? To make it feel fresh x3.\n\nThe whole android angle.. Yeah, obviously people understand that you can have a sextoy android that you like. But in this universe people didn't yet accept that one can have true love for a machine, a bunch of algorithms basically. Yeah, people did accept all genders. But genders are all.. still people. People that have soul and stuff. Having feelings for machines/objects seems like the next big step, you know? Yeah, you can meme about it and stuff but would you be okay if your president married an f36 plane with an experimental neural brain. I know you would love that x3. Would your parents be okay with that though? You get it now hopefully, it requires a new generation of people to accept new ideas.\n\nWhy doesn't the player have much agency in this whole scene?.. I don't even know how I would write this scene in a way that doesn't center around Tavi.. And then include branching paths in it?.. Just kill me x3. I kinda pushed myself into the corner when I decided to make you, the player, just be you. But making it so you play as Tavi the whole game would remove player customisation. It's a very tricky topic, you know? And I'm not an expert at writing complex branching narratives, I just wanna tell this little story I came up with.."

func hasDevCommentary():
	return true
