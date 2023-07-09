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
		playAnimation(StageScene.Solo, "defeat")
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

		saynn("[say=pc]Are we.. the bad guys?[/say]")

		saynn("Tavi looks at you and chuckles softly.")

		saynn("[say=tavi]If all your options are bad, might as well pick the fun one.[/say]")

		saynn("Tavi waits until the checkpoint is empty.")

		saynn("[say=tavi]Now is our time to act. Let's go finish this.[/say]")

		saynn("You nod.")

		addButton("Follow", "See what happens next", "after_kait")
var randomSexIsPlaying = false
func playRandomSexAnim():
	if(randomSexIsPlaying):
		return

	while(true):
		var domID = NpcFinder.grabNpcIDFromPoolOrGenerate(CharacterPool.Inmates, [[NpcCon.NoChastity], [NpcCon.HasPenis]], InmateGenerator.new(), {NpcGen.NoChastity: true, NpcGen.HasPenis:true, NpcGen.Level: RNG.randi_range(1, 10)})
		var subID = NpcFinder.grabNpcIDFromPoolOrGenerate(CharacterPool.Inmates, [[NpcCon.AvoidIDs, [domID ]]], InmateGenerator.new(), {NpcGen.Level: RNG.randi_range(1, 10)})
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
		getCharacter("tavi").getInventory().forceEquipStoreOther(GlobalRegistry.createItem("GuardArmorRiot"))
		getCharacter("tavi").getInventory().forceEquipStoreOther(GlobalRegistry.createItem("GuardHelmetRiot"))
		
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
