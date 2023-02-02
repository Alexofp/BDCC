extends SceneBase

func _init():
	sceneID = "Ch3s5CaptainScene"

func _run():
	if(state == ""):
		addCharacter("captain")
		addCharacter("tavi")
		playAnimation(StageScene.Duo, "stand", {npc="captain"})
		saynn("Captain Wright steps into the room followed by a horde of guards, at least a dozen. They form a wall, blocking the only exit for you and Tavi. Many flashlights light you up.")

		saynn("Tavi straightens her posture and takes a step back, standing just in front of you now. The captain points at two of the guards and gestures them towards Alex. They quickly grab the broken engineer and pull him out of the room. There is a small pool of blood where he was.")

		saynn("[say=pc]How the hell did you know about this.[/say]")

		saynn("You'd understand if you were spotted by a patrol or something. But this isn't just a patrol, much more than that.")

		saynn("[say=captain]A little birdie told me.[/say]")

		saynn("Tavi turns her head towards you, her brows furrowed, her tail wagging. But her voice is low enough that only you hear her.")

		saynn("[say=tavi]Kait.[/say]")

		saynn("She looks back at the captain.")

		saynn("[say=captain]A little late but it seems I didn't miss much. Stay there, guards, I didn't get a chance to handle situations like these in so many years.[/say]")

		saynn("An entire team of guards is watching your every move. So you don't. The captain starts circling the blue crystal, the opposite direction from you.")

		saynn("[say=captain]You disabled the bluespace transmitter. Huh. That was pretty smart, I will admit. Getting here using nothing but your brain and your power of will.[/say]")

		saynn("He holds his hands behind his back.")

		saynn("[say=captain]I can respect when people are ready to apply so much effort to accomplish something.[/say]")

		saynn("Then he switches directions, now closing distance. You notice that Tavi is ever so slightly moving her paw behind her back.")

		saynn("[say=tavi]Thanks.[/say]")

		saynn("[say=captain]What was the full plan though? You thought the collars would just unlock themselves and fall off? That would be rather silly on my part. I trust you think better of me.[/say]")

		saynn("The captain continues to slowly approach you two. The guards stand still, each one holding a stun baton. Tavi holds something in her paw.. And she is smiling..")

		saynn("[say=captain]Yes. We lost the ability to pacify you. And look at what you did the moment we lost full control over you.[/say]")

		saynn("Captain approaches the pool of Alex's blood and slowly crouches, examining it. Some of it already drips through the holes in the catwalk.")

		saynn("[say=captain]So much pointless violence. Was it worth it? I doubt so.[/say]")

		saynn("[say=pc]You don't strike me as a pacifist, captain.[/say]")

		saynn("[say=captain]I said pointless.[/say]")

		saynn("Captain shakes his head and gets up before stepping around the blood, still holding his hands behind his back. He is not that far from you two now.. You notice a drug vile hidden in Tavi's paw.. she is slowly unscrewing the lid with her claw..")

		saynn("[say=tavi]You're right, captain.[/say]")

		saynn("He stops and directs his attention towards Tavi.")

		saynn("[say=tavi]Everything must have a reason.[/say]")

		saynn("This time it's Tavi's turn to slowly step forward. She halves the distance, there are only about 2 little steps left.. She probably knows what she is doing..")

		saynn("[say=tavi]I can tell you my reasons. I can share. I won't hold anything back.[/say]")

		saynn("[say=captain]I'm interested, really. Excited even. But let's figure out what we're gonna do with you two first.[/say]")

		saynn("The tension couldn't be higher.. The guy searches through his pouches, looking for some cuffs. But suddenly one of the guards steps out of the line.")

		saynn("[say=nova]Captain! Can I? Please! I know the tall cat well~.[/say]")

		saynn("The captain turns around and looks at Nova. He is busy, now would be the perfect moment.. But Tavi is standing still.. she looks.. almost paralyzed.. Her eyes..")

		saynn("[say=captain]Be my guest, Nova. For some reason I have a bad feeling about trying to cuff them myself.[/say]")

		saynn("Tavi whispers..")

		saynn("[say=tavi]..oh no..[/say]")

		addButton("Continue", "See what happens next", "nova_bully_tavi")
	if(state == "nova_bully_tavi"):
		addCharacter("nova")
		playAnimation(StageScene.Duo, "stand", {pc="tavi", npc="nova"})
		saynn("It's a husky, wearing some kind of advanced set of armor. She starts approaching you two while the captain retreats back to his guards.")

		saynn("[say=tavi]We don't have to do this.[/say]")

		saynn("[say=nova]Do what~?[/say]")

		saynn("Husky holds her personalized stun baton, this one had seen some battles based on all the scratches.")

		saynn("[say=tavi]Humiliating me won't end well for you.[/say]")

		saynn("[say=nova]Oh~? You're threatening me? Wanna try me, Tavi~?[/say]")

		saynn("Tavi frowns, her free paw extends its claws. Her other paw still holds the vial that she needs to somehow hide. You try to intervene by stepping forward and blocking Tavi from Nova but the husky stops you by pointing her weapon.")

		saynn("[say=nova]Stay there, cutie, I will get to you after I'm done with your friend~[/say]")

		saynn("[say=tavi]What do you want, Nova?[/say]")

		saynn("She lowers her weapon and looks at Tavi, her curled up tail wagging slightly.")

		saynn("[say=nova]Oh, I want many things~.[/say]")

		saynn("Tavi hums and raises her paws before bringing them behind her head, clearly surrendering. Nova can't help but to chuckle.")

		saynn("[say=nova]You make it too easy, sweetheart. I guess there is a subby slut in you after all~.[/say]")

		saynn("The guards behind the captain chuckle. Tavi glares at the husky while her paws begin to sneakily push the vial under her collar, concealing the dangerous item. Inmate collars don't leave your neck much space but that might be an advantage here. After she is done, she offers the husky a kind smile.")

		saynn("[say=tavi]Well come here and cuff me then~.[/say]")

		saynn("As soon as Nova takes another step, Tavi lowers her paws a bit, spooking the guard. Having the bluespace transmitter disabled allows her to do that.")

		saynn("[say=nova]You're always been a huge brat, Tavi.[/say]")

		addButton("Continue", "See what happens next", "tavi_defeat")
	if(state == "tavi_defeat"):
		playAnimation(StageScene.Duo, "kneel", {pc="tavi", npc="nova"})
		saynn("Tavi doesn't wait for another chance, she suddenly leaps forward and tries to sink her claws into the husky! But Tavi's paw collides with the tip of Nova's stun baton at the last moment. They're both stuck in this position, trying to overpower each other while keeping eye contact.")

		saynn("[say=nova]What happened to calling me Mommy, sweetheart?[/say]")

		saynn("Tavi suddenly changes her expression, the smirk quickly fades away.")

		saynn("[say=nova]We had so much fun together, you and I.[/say]")

		saynn("[say=tavi]Don't say that![/say]")

		saynn("[say=nova]What? Am I lying? Call me a liar then. But you know well enough that it would be a lie.[/say]")

		saynn("Tavi grits her teeth, she is growling. But her ears.. they're drooping. Her whole posture switches to a less confident one.")

		saynn("[say=tavi]Fuck.. you..[/say]")

		saynn("[say=nova]You were so happy being my little cutie, Tavi. What happened? Listen. It's okay to be weak sometimes, mommy will help you get through tough times. That's what mommies are for.[/say]")

		saynn("Tavi's eyes get watery. Is that tears? But she desperately continues trying to sink her claws into Nova's neck. She suddenly uses her other paw to scratch the guard's cheek, leaving a few bleeding wounds. Nova yelps.")

		saynn("[say=tavi]Look what you made me do..[/say]")

		saynn("Nova rubs her cheek and sees blood on her paw. Her voice is not so playful now.")

		saynn("[say=nova]Is that how you wanna act? Tavi's all grown up now? Such a brave girl.[/say]")

		saynn("She shoves Tavi back slightly and raises her weapon, about to strike. Tavi braces A few seconds of silence.")

		saynn("[say=nova]So all of that was for nothing. All the things we did together. Might as well be forgotten. That's it I guess.[/say]")

		saynn("Nova chooses not to strike and lowers her weapon instead. She then turns around and proceeds to step away. You notice a few tears forming under her eyes too.")

		saynn("[say=tavi]..wait. Nova![/say]")

		saynn("[say=nova]There is nothing left for me to say.[/say]")

		saynn("Tavi shakes. You saw her cunning, angry, exposed. But you never saw her so weak. She suddenly drops to her knees and struggles to keep herself from crying.")

		saynn("[say=tavi]..I'm sorry..[/say]")

		saynn("Nova stops. You catch her little smile as she looks back over her shoulder. All the guards look surprised. The captain claps quietly.")

		saynn("[say=nova]Thank you, cutie.[/say]")

		addButton("Protect Tavi", "You can't let this continue", "protect_tavi")
		addButton("Surrender", "No point in fighting", "surrender")
	if(state == "surrender"):
		setFlag("TaviModule.Ch3SurrenderedToNova", true)
		playAnimation(StageScene.Duo, "stand", {npc="nova"})
		saynn("Nova turns around and approaches you now. You raise your hands.")

		if (getFlag("NovaModule.Nova_Introduced") || getFlag("NovaModule.Nova_SawPC")):
			saynn("[say=nova]Good choice, cutie~.[/say]")

		else:
			saynn("[say=nova]Don't remember seeing you before. With Tavi especially. But you picked the right choice~.[/say]")

		saynn("[say=pc]No need for more humiliation.[/say]")

		saynn("Nova chuckles as her paws produce some cuffs before locking them around your hands.")

		saynn("[say=nova]Humiliation~? Is it really a humiliation if we both were enjoying it? Do you need a mommy by the way~?[/say]")

		saynn("[say=pc]I'm fine for now. I have bigger problems for now it seems.[/say]")

		saynn("Nova produces another pair of cuffs and starts locking them around Tavi's hands. The tall kitty has her head tilted down, her eyes watch Nova's heavy boots. The guard scritches the feline under her chin.")

		saynn("[say=nova]Yeah, any misbehaving needs a fitting punishment, someone here knows that very well. But I will let the captain know that you two were very compliant~.[/say]")

		saynn("Nova leashes both of you and brings you out of the room. It seems the engineers quickly fixed all the damage that you two caused because the light on your and Tavi's collars began working very soon.")

		saynn("While following Nova through all the corridors you can't throw this thought out of your head that all of this might have been for nothing. But asking Tavi now wouldn't be the best choice.")

		addButton("Continue", "See what happens next", "ending_surrendered")
	if(state == "ending_surrendered"):
		playAnimation(StageScene.HangingDuo, "idle", {npc="tavi", npcAction="kneel", bodyState={naked=true}, npcBodyState={naked=true}})
		removeCharacter("nova")
		removeCharacter("captain")
		aimCameraAndSetLocName("solitary_cell")
		saynn("You and Tavi got brought somewhere. Somewhere dark. Your hands got cuffed to something rigid. Tavi's hands too. Nova then just leaves you two alone.")

		saynn("[say=pc]What was..[/say]")

		saynn("Tavi cuts you off.")

		saynn("[say=tavi]Let's just.. rest.. Save any questions for tomorrow.. I'm tired..[/say]")

		saynn("[say=pc]Okay..[/say]")

		saynn("Well, might as well. The dim lighting doesn't let you see much but it sure makes you sleepy.")

		saynn("It was a hard day.. You close your eyes and almost instantly fall asleep.")

		addButton("Sleepy time", "Night night", "startSolitary")
	if(state == "protect_tavi"):
		setFlag("TaviModule.Ch3ProtectedTavi", true)
		playAnimation(StageScene.Duo, "stand", {npc="nova"})
		saynn("You make a call out towards Nova.")

		saynn("[say=pc]You enjoy it, don't you?[/say]")

		saynn("The husky turns out and tilts her head slightly. You take a spot between her and Tavi.")

		saynn("[say=tavi]Don't..[/say]")

		saynn("[say=nova]Excuse you?[/say]")

		saynn("[say=pc]Breaking inmates. Degrading and humiliating them. Abusing them verbally and through actions, manipulating until they're ready to serve whatever desires you have.[/say]")

		saynn("Nova frowns, her amber eyes drilling you.")

		saynn("[say=nova]You couldn't be more wrong.[/say]")

		saynn("You notice that the captain has his brow raised, he's been just carefully watching and observing the scene. But now he seemingly calls a few guards to him.")

		saynn("[say=pc]You think I'm blind? Or stupid? I won't let you do this to Tavi.[/say]")

		saynn("[say=nova]I don't think that, sweetie. I think you should ask her yourself when you get a chance.[/say]")

		saynn("Nova grabs her stun baton again and holds a warrior's pose, slightly swaying her girly hips.")

		saynn("[say=nova]But first. I think you owe me an apology.[/say]")

		saynn("You shake your head and raise your fists, clearly not ready to give in.")

		saynn("[say=nova]Well then.[/say]")

		saynn("Nova brings up a little screen that she has on her wrist. She presses a few buttons, causing the reactor on her back to engage. Her armor is now fully active.")

		saynn("[say=nova]If a brat needs to be taught a lesson..[/say]")

		saynn("[say=captain]Nova, let others handle it.[/say]")

		saynn("The captain suddenly sends a few guards towards you. Luckily, the catwalk is only wide enough for them to be able to fight you on at a time.")

		saynn("[say=nova]Aww, really?[/say]")

		saynn("First guard approaches you..")

		addButton("Fight", "Start the fight", "first_fight")
	if(state == "lost_to_guard"):
		setFlag("TaviModule.Ch3DefeatedByGuard", true)
		saynn("You got defeated by the guard. Unable to continue, you fall to your knees and then hit the floor. The captain walks up to you and crouches nearby. All the while Nova goes ahead and cuffs Tavi's paws.")

		saynn("[say=captain]Your passion is commendable, inmate.[/say]")

		saynn("[say=pc]T-thanks..[/say]")

		saynn("[say=captain]That's why you must be kept here, in BDCC.[/say]")

		saynn("Nova then straddles your chest and starts cuffing your hands too. She gives your cheeks some taps.")

		saynn("[say=nova]Yeah, like Tavi.[/say]")

		saynn("Nova leashes both of you and brings you out of the room. It seems the engineers quickly fixed all the damage that you two caused because the light on your and Tavi's collars began working very soon.")

		saynn("While following Nova through all the corridors you can't throw this thought out of your head that all of this might have been for nothing. But asking Tavi now wouldn't be the best choice.")

		addButton("Continue", "See what happens next", "ending_surrendered")
	if(state == "won_first_guard"):
		saynn("You defeated the first guard! They get quickly dragged away while another one starts approaching you.")

		saynn("The captain crosses his arms.")

		addButton("Fight", "Start the fight", "second_fight")
	if(state == "won_second_guard"):
		saynn("The second guard got defeated by your hand. They quickly get replaced by another one. How many of them are there?")

		saynn("The captain scratches his chin.")

		saynn("[say=nova]When is it gonna be my turn?[/say]")

		saynn("[say=captain]Patience, Nova.[/say]")

		addButton("Fight", "Start the fight", "third_fight")
	if(state == "won_third_guard"):
		playAnimation(StageScene.Duo, "stand", {npc="nova"})
		saynn("The third guard falls to their knees, unable to fight a second longer. And it seems.. that's all of the guards that were brave enough to try to fight you. But Nova is still there, smiling. She glances at the captain and receives a nod from him.")

		saynn("Tavi looks spaced out, just holding her head low.")

		saynn("[say=nova]Your streak ends with me, sweetheart.[/say]")

		addButton("Fight", "Start the fight", "nova_fight")
	if(state == "won_nova"):
		setFlag("TaviModule.Ch3DefeatedNova", true)
		playAnimation(StageScene.Duo, "defeat", {npc="captain", npcAction="firepistol"})
		saynn("Nova kneels before you. Before she can react you grab her stun stick and smack her. The armor absorbs some of the shock but not everything, the husky grunts.")

		saynn("[say=pc]This is for what you did to Tavi.[/say]")

		saynn("Weapon in hand, no ability to shock you through the collar, you might actually have a slight chance. But no, the captain pulls out his weapon, some kind of energy gun, and points it at you.")

		saynn("[say=captain]I suggest you drop the weapon and surrender, inmate.[/say]")

		saynn("[say=pc]Or what? You're gonna shoot me right here?[/say]")

		saynn("The captain listens to your words and nods to the side slightly before aiming at your leg and pulling the trigger. The gun shoots out a beam of electricity that hits your foot, causing a lot of pain. You drop to your knees and cry out from pain.")

		saynn("[say=pc]Ugh. Fuck off with that gun.[/say]")

		saynn("You don't drop the stick, instead attempting to make another swing at the guard. The captain shrugs and shoots you right in the chest. Your whole body locks up. The beam makes you grit your teeth while every muscle in your body tenses up uncontrollably. And the guy is persistent, he holds the trigger for way longer this time.")

		saynn("[say=captain]Your passion is commendable, inmate.[/say]")

		saynn("You can barely hear the captain. Your conciseness starts to fade away..")

		saynn("[say=captain]That's why you must be kept here, in BDCC.[/say]")

		saynn("He sees that you're getting weaker and stops. And as you collapse, everything goes dark..")

		addButton("Sleepy time", "Night night", "startSolitary")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "surrender"):
		GM.pc.getInventory().forceEquipStoreOtherUnlessRestraint(GlobalRegistry.createItem("inmatewristcuffs"))
		addExperienceToPlayer(200)

	if(_action == "ending_surrendered"):
		GM.pc.removeAllRestraints()
		processTime(60*60*3)

	if(_action == "first_fight"):
		var guard = GuardGenerator.new().generate({NpcGen.Level: 5, NpcGen.Temporary: true})
		playAnimation(StageScene.Duo, "stand", {npc=guard.getID()})
		runScene("FightScene", [guard.getID()], "first_fight")
		return

	if(_action == "second_fight"):
		var guard = GuardGenerator.new().generate({NpcGen.Level: 10, NpcGen.Temporary: true})
		playAnimation(StageScene.Duo, "stand", {npc=guard.getID()})
		runScene("FightScene", [guard.getID()], "second_fight")
		return

	if(_action == "third_fight"):
		var guard = GuardGenerator.new().generate({NpcGen.Level: 20, NpcGen.Temporary: true})
		playAnimation(StageScene.Duo, "stand", {npc=guard.getID()})
		runScene("FightScene", [guard.getID()], "third_fight")
		return

	if(_action == "nova_fight"):
		runScene("FightScene", ["novaArena"], "nova_fight")
		getCharacter("novaArena").addPain(5)
		return

	if(_action == "startSolitary"):
		GM.main.startNewDay()
		GM.pc.afterSleepingInBed()
		runScene("Ch4s1SolitaryScene")
		endScene()
		return

	setState(_action)

func _react_scene_end(_tag, _result):
	if(_tag == "first_fight"):
		processTime(20 * 60)
		var battlestate = _result[0]
		
		if(battlestate == "win"):
			setState("won_first_guard")
			addExperienceToPlayer(30)
		else:
			setState("lost_to_guard")

	if(_tag == "second_fight"):
		processTime(20 * 60)
		var battlestate = _result[0]
		
		if(battlestate == "win"):
			setState("won_second_guard")
			addExperienceToPlayer(60)
		else:
			setState("lost_to_guard")

	if(_tag == "third_fight"):
		processTime(20 * 60)
		var battlestate = _result[0]
		
		if(battlestate == "win"):
			setState("won_third_guard")
			addExperienceToPlayer(120)
		else:
			setState("lost_to_guard")

	if(_tag == "nova_fight"):
		processTime(20 * 60)
		var battlestate = _result[0]
		
		if(battlestate == "win"):
			GM.pc.addPain(200)
			setState("won_nova")
			addExperienceToPlayer(200)
		else:
			setState("lost_to_guard")
			addExperienceToPlayer(100)
