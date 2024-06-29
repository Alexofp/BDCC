extends SceneBase

func _init():
	sceneID = "Ch5s4EnablePowerScene"

func _run():
	if(state == ""):
		playAnimation(StageScene.Solo, "sit")
		saynn("Right. This office is placed near the assembly lab, there must be something on this computer that controls it.")

		saynn("You look through the data that it displays first. Oh, here is the [b]collar frequency that Tavi needs[/b]. It's just a series of letters and numbers so you try to remember it.")

		saynn("Then you go through the files. Documents, documents, more documents.. most of it is useless to you right now.")

		saynn("You do find some kind of dashboard that seems to show the current state of the assembly line.")

		addButton("Dashboard", "Take a look at it", "thedashboard")
	if(state == "thedashboard"):
		saynn("ASSEMBLY LINE STATUS")

		saynn("- Current Power Status: OFFLINE")

		saynn("- Maintenance Alert: Critical")

		saynn("- Last Maintenance: 255 days ago")

		saynn("- Urgent Repairs Required: Electrical Systems")

		saynn("-=-=-=-")

		saynn("PRODUCTION ACTIVITY")

		saynn("- Paused Active Projects: 1")

		saynn("- Pending Projects: 12")

		saynn("- Completed Projects: 3")

		saynn("-=-=-=-")

		saynn("LAB ENVIRONMENTAL CONTROL")

		saynn("- Temperature: Stable (23°C)")

		saynn("- Humidity: Moderate (56%)")

		saynn("- Air Quality: Acceptable")

		saynn("- Ventilation: Operational")

		saynn("-=-=-=-")

		saynn("NOTIFICATIONS")

		saynn("- 9+ unread messages ready to be played")

		saynn("- Power to the assembly line is currently disabled. To enable it back, touch this notification")

		addButton("Paused Projects", "Take a look at the paused project", "look_paused_project")
		addButton("Completed Projects", "Take a look at the completed projects", "look_completed_projects")
		addButton("Unread messages", "Listen to the messages", "look_unread_messages")
		if (getFlag("TaviModule.Ch5EnabledLabPower")):
			addButton("Leave", "Enough poking around", "start_sentinel_intro")
		else:
			addButton("Enable power", "Press the notification that will enable the power", "do_enable_power")
			addButton("Leave", "Enough poking around", "endthescene")
	if(state == "look_paused_project"):
		saynn("Current Active Projects: 1")

		saynn("Project name: Sentinel-X")

		saynn("Job: Advanced Android Guard")

		saynn("Unique Traits: A latex-based protective layer that allows for self-healing")

		saynn("Stage of Completion: Awaits final assembly. Paused due to power outage.")

		addButton("Back", "Look at something else", "thedashboard")
	if(state == "look_completed_projects"):
		saynn("Completed Projects: 3")

		saynn("Project name: Project [cuss]Rahi[/cuss]")

		saynn("Job: [cuss]Universal Feline Android[/cuss]")

		saynn("Description: [cuss]CLASSIFIED INFORMATION[/cuss]")

		saynn("Project status: Scrapped")

		saynn("-=-=-=-")

		saynn("Project name: Project Nur-A")

		saynn("Job: Nurse Android")

		saynn("Description: Second attempt at creating a fully autonomous artificial brain. Nur-A is designed as a highly upgradable base that can be expanded to fill almost any medical role.")

		saynn("Project status: Scrapped")

		saynn("-=-=-=-")

		saynn("Project name: [cuss]CLASSIFIED[/cuss]")

		saynn("Job: [cuss]CLASSIFIED[/cuss]")

		saynn("Description: [cuss]CLASSIFIED[/cuss]")

		saynn("Project status: Successful")

		addButton("Dashboard", "Take a look at it", "thedashboard")
	if(state == "look_unread_messages"):
		saynn("You get scared a little because the computer begins playing recorded voice messages as soon as you press that button. And voices.. all seem to be quite familiar.")

		saynn("[say=alexrynard]Captain. Are you being serious?[/say]")

		saynn("[say=captain]Yes.[/say]")

		saynn("[say=alexrynard]But we spent so much time on it. Time AND resources. Are now you're telling us to just.. stop. When we're at the finish line. Everything is almost working, we got the workflow down, that was the hardest part. Can I ask why?![/say]")

		saynn("[say=captain]I understand why you are upset, I truly do. But this is my final decision.[/say]")

		saynn("[say=alexrynard]This just doesn't make any sense. This can lift so much pressure off of our current staff. Guards, nurses, engineers.. even chiefs. Any kind of hard manual labor can be automated with ease. Androids are the future, how can you not understand?[/say]")

		saynn("[say=captain]Androids are.. unreliable.[/say]")

		saynn("[say=alexrynard]Sure, they will break a lot at first. But with enough time they will become extremely reliable. They don't need food or sleep. Only power and occasional repair.[/say]")

		saynn("[say=captain]I'm not talking about repairs. Androids can not be trusted. They can not be controlled.[/say]")

		saynn("[say=alexrynard]..what? But.. It's literally the opposite. Androids won't lie to you, there is no reason not to trust them ever. And they are literally made to be controlled, you can program them to do anything. I'm sorry, captain, but I don't understand your logic at all.[/say]")

		saynn("[say=captain]Have you noticed that after spending time with a person.. You begin to know them more? You learn what they like, dislike, what they can do and what they will never do, their limits, how they act and react. Some say that you can.. read a person. And even change them a little.[/say]")

		saynn("[say=alexrynard]With all due respect. What does that have to do with androids?[/say]")

		saynn("[say=captain]I can not read an android's mind. It's a black box. And if I can not do that.. What control do I have over it then? Let me give you an example. I, the captain, have upsetted you right now. What would stop you from reprogramming all those androids to attack my guards and me on sight?[/say]")

		saynn("[say=alexrynard]but..[/say]")

		saynn("[say=captain]An android will lie to you perfectly. A real person.. you can always tell. Trust me. I worked with people all my life. People. Are. Predictable. And being predictable is what makes you controllable. These bots? They're not. They're a danger.[/say]")

		saynn("[say=alexrynard]But then why? Why all of this? Why create an entire robotics lab? Why scan brains? Why make prototypes?[/say]")

		saynn("[say=captain]So you can write a report for AlphaCorp that will tell them that this initiative has failed. Because it was flawed to begin with.[/say]")

		saynn("[say=alexrynard]You want me to tell them that my life-long project is a failed initiative?..[/say]")

		saynn("[say=captain]Run the report by me before you send it. I might wanna make some changes.[/say]")

		saynn("The voice messages end there.")

		addButton("Dashboard", "Take a look at it", "thedashboard")
	if(state == "do_enable_power"):
		setFlag("TaviModule.Ch5EnabledLabPower", true)
		saynn("As you tap on the unhappy red notification, it suddenly turns green and then disappears. That was.. kinda easy.")

		saynn("A few seconds later you begin to hear a low-pitched hum coming from the assembly lab. Hopefully the protective glass lockers can now be accessed.")

		addButton("Continue", "See what happens next", "thedashboard")
	if(state == "start_sentinel_intro"):
		playAnimation(StageScene.Solo, "stand")
		aimCameraAndSetLocName("eng_assemblylab")
		GM.pc.setLocation("eng_assemblylab")
		saynn("You quickly glance through all the documents for the last time, looking for any codes for the keypads. There doesn't seem to be any sadly. But, worst case, you just find something to smash the reinforced glass.")

		saynn("Time to leave.")

		saynn("You get up and sneakily slip back into the lab, hoping that others won't notice that the abandoned room is suddenly powered up again.")

		saynn("And wow, this room is actually massive. High ceilings are illuminated from the glow of proper lighting, giving the whole lab a cold blue tint. It's kinda pretty actually.")

		saynn("But as you step closer to the lockers that now have little red lights on them, you realize.. that something else is happening. The assembly line has sprung to life! Conveyors have begun moving unfinished parts from one machine to another until some kind of mechanical arms grab each one and then weld them together, creating some kind of.. metal skeleton?")

		addButton("Continue", "See what happens next", "sentinel_wakesup")
	if(state == "sentinel_wakesup"):
		setFlag("TaviModule.Ch5SentinelXHappened", true)
		addCharacter("sentinelx")
		playAnimation(StageScene.Duo, "stand", {npc="sentinelx"})
		saynn("Who knows what will happen next so you hide behind one of the machines and just peek your head out. With each passing moment, the arms get closer and closer to finishing the assembly of some kind of mechanical skeleton.. until they're finally done.")

		saynn("As the last arm inserts some kind of power cell into its frame, the skeleton.. suddenly wakes up, the empty eye holes of its metal skull shining blue.")

		saynn("It's obviously some kind of.. android. But it still looks.. unfinished.. like it's missing its skin that is supposed to hide all of its internals.")

		saynn("But then this android gets up and looks around. Seeing no one.. the machine just starts speaking to itself.")

		saynn("[say=sentinelx]Core systems activated. Internal diagnostics complete. Warning, powercell is at 23% capacity. Initializing the Sentinel-X protocol..[/say]")

		saynn("Suddenly the empty space inside the machine.. has begun shrinking.. being filled with something quite shiny.. black goo? In fact, every component receives this shiny black finish to it. Contours of the machine slowly become more.. natural-looking. The animal skull now looks like a proper wolf muzzle, completed with a ponytail and a set of perky canine ears.")

		saynn("The android flexes its new artificial muscles while a canine tail appears behind it, constructed out of the same black goo material which gives it a cool drippy look. Between its legs there is also a sheath now, completed with a pair of black shiny balls.")

		saynn("[say=sentinelx]Shield layer has reached its optimal thickness. Fetching equipment and preparing for station-wide patrol.[/say]")

		saynn("Huh. It's like they forgot to disable its debug output, allowing you to read its mind. But.. at the same time.. it's a miracle that this android is functional at all. You decide to just wait it out instead of engaging it.")

		saynn("It seems you will have to do something after all. You notice the android approaching one of the glass lockers, opening it just by looking at its keypad and then grabbing.. the prototype grenades that you need.. Fuck.")

		saynn("The machine then begins to just.. absorb them? It basically just sticks them into its chest and waits for the black goo to pull them deeper into itself. You must stop it!")

		addButton("Intervene", "Try to stop it", "sentinel_try_stop")
	if(state == "sentinel_try_stop"):
		playAnimation(StageScene.Duo, "throw", {npc="sentinelx"})
		saynn("You grab a wrench from one of the workbenches and throw it towards the android!")

		saynn("[say=pc]Hey![/say]")

		saynn("The wrench hits the machine directly into the back of its head.. and sticks to it.")

		saynn("[say=sentinelx]Unauthorized physical interaction detected. Searching for potential threats.[/say]")

		saynn("Black goo coats the wrench.. and then just spits it back. The android turns around, it's blue eyes noticing you.")

		saynn("[say=sentinelx]Target acquired. Unauthorized presence detected. Initiating threat assessment.[/say]")

		saynn("The machine scans you. And then assumes a combat stance.")

		saynn("[say=sentinelx]Unauthorized intruder in restricted area. Prepare for confrontation.[/say]")

		saynn("Well.. Time to authorize yourself.")

		addButton("Fight", "Start the fight", "do_fight_sentinel")
	if(state == "won_sentinelx"):
		playAnimation(StageScene.Duo, "stand", {npc="sentinelx", npcAction="defeat", npcBodyState={hard=true}})
		saynn("The android falls to its knees before you, seemingly unable to continue fighting. Its protective layer doesn't look quite so shiny anymore, there is a visible.. dent.. in its chest.")

		saynn("[say=sentinelx]Structural integrity compromised. Vulnerability exposed.[/say]")

		saynn("You can just about make out the outlines of the prototype grenades. You can try forcing your hand in there and ripping them out but who knows what will happen to the machine.")

		saynn("[say=sentinelx]Attempting to redirect intruder's attention as a last counter-measure.[/say]")

		saynn("Huh. You notice that the android's sheath becomes more defined as a perfectly black canine shaft gets erected between its legs. It looks smooth and shiny with only pulsing blue veins adding more texture to it. There is already a visible black pearl-shaped drop hanging off its tip..")

		addButton("Rip grenades out", "Who cares. It's just a machine.", "sentinel_ripgrenades")
		addButton("Ride it..", "Well. Might as well", "sentinel_pickride")
		addButton("Submit to", "Let it take control for a bit..", "sentinel_submit_to")
	if(state == "sentinel_ripgrenades"):
		playAnimation(StageScene.SexStart, "defeated", {npc="sentinelx"})
		saynn("Nah, the android's dirty tricks won't work on you. After crouching before it, you press your hand against its chest.. and apply more and more pressure.. until your digits begin disappearing into its shiny layer. Black goo already starts to coat your wrist so you gotta act quick!")

		saynn("[say=sentinelx]Warning. Core component is critically damaged. Estimated time before complete shutdown: 30 seconds.[/say]")

		saynn("Oops. Well, what can you do? Your hand catches something that vague resembles a grenade and yanks it out! As soon as you do that, the machine.. just goes limp in your hands, its latex layer losing its tension and just dripping off, exposing the broken metal skeleton that's underneath. Blue lights in its eyes quickly fade..")

		saynn("Kinda grim.")

		saynn("But at least you now have what Tavi needs. Great. Time to go.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "sentinel_pickride"):
		saynn("How do you wanna ride it?")

		addButtonWithChecks("Pussy", "Ride the android's cock with your pussy", "sentinel_ride_pussy", [], [ButtonChecks.HasReachableVagina])
		addButton("Ass", "Ride the android's cock with your ass", "sentinel_ride_ass")
	if(state == "sentinel_ride_pussy"):
		playAnimation(StageScene.SexCowgirl, "tease", {npc="pc", pc="sentinelx", bodyState={exposedCrotch=true,hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("Might as well have some fun and see what this android can do..")

		saynn("As you expose your {pc.pussyStretch} pussy and straddle its frame.. your thighs already feel the cold touch of the latex teasing them.")

		saynn("[say=sentinelx]Switching to service top mode. Warning, powercell is at 7% capacity.[/say]")

		saynn("Better make those 7% count then. Your digits receive a thin layer of latex on them as you get a grasp on the android's cock and guide it towards your inviting pussy slit while also slowly lowering yourself onto it..")

		addButton("Continue", "See what happens next", "sentinel_ride_pussy_go")
	if(state == "sentinel_ride_pussy_go"):
		playAnimation(StageScene.SexCowgirl, "sex", {npc="pc", pc="sentinelx", bodyState={exposedCrotch=true,hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("That black canine member.. feels cold.. but only at first. As it coats your sensitive petals with its sticky shiny precum, your pussy entrance gets spread open with ease, allowing you to bury that shaft inside you..")

		saynn("You begin to ride it, allowing its cock to explore you deeper and deeper. You notice that the latex layer is slowly expanding onto you.. Feels weird.. you feel little electrical impulses piercing your sensitive flesh.. stimulating it.. almost corrupting even..")

		saynn("It feels so good that moans begin escaping your lips. You place your hands on the machine's chest and feel your digits slowly phasing through and also receiving this latex layer that slowly expands further, giving your limbs a shiny new appearance.")

		saynn("[say=sentinelx]Transformation protocols disallowed, powercell capacity is critically low.[/say]")

		saynn("At least it won't turn you into one of itself.. Wait, it could do that?! These thoughts get forgotten instantly when you begin to feel android's knot inflating and already slapping against your folds, on the verge of being able to fit inside you..")

		addButton("Ride it faster", "Might as well see how it will cum..", "sentinel_ride_pussy_cum")
	if(state == "sentinel_ride_pussy_cum"):
		playAnimation(StageScene.SexCowgirl, "fast", {npc="pc", pc="sentinelx", pcCum=true, npcCum=true, bodyState={exposedCrotch=true,hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("Even though the android can't transform you.. it can still surely try.. Almost your whole body is now coated in this black shiny latex-like goo.. That keeps stimulating you with little bursts of electricity, making you more eager to ride it. Only your womb seems to still be untouched..")

		if (GM.pc.isWearingChastityCage()):
			saynn("Weirdly enough, instead of just coating your chastity cage, the black goo chooses to construct a little.. sphere around it.. and creating such a high amount of air pressure in it that your cock just.. gets forced to be limp.")

		elif (GM.pc.hasReachablePenis()):
			saynn("Weirdly enough, instead of just coating your {pc.penis}, the black goo chooses to construct a little.. sphere around it.. and creating such a high amount of air pressure in it that your cock just.. gets forced to be limp.")

		saynn("Very soon you find yourself bouncing on that cock while rubbing your body that feels so different.. Even your {pc.breasts} are all encased in this latex material that seems to.. make your nipples extremely sensitive.")

		saynn("[say=sentinelx]Orgasm imminent. Nanobot assimilation sequence initialized. DNA infusion primed and commencing.[/say]")

		saynn("Wait? Did it lie?! You weren't planning to become an android today.. But it feels so fucking good.. Too late to back off now..")

		saynn("A loud moan escapes your lips as the android's knot slips inside you, locking you two together. Your body shivers as the android starts pumping you full of some kind of thick sticky black goo.. claiming your womb and coating its walls.. It feels like it's about to.. start changing you..")

		addButton("Continue", "See what happens next", "sentinel_ride_pussy_debait")
	if(state == "sentinel_ride_pussy_debait"):
		playAnimation(StageScene.SexCowgirl, "inside", {npc="pc", pc="sentinelx", bodyState={exposedCrotch=true,hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("[say=sentinelx]Warning.. Powercell loses charge in 3.. 2.. 1..[/say]")

		saynn("But then the machine suddenly turns off and goes limp. All the sensations that the new latex coating was giving you.. gone completely..")

		saynn("In fact, this shiny rubber-like material has lost its sticky properties and begins dripping off of you.. revealing your actual self. Phew.")

		saynn("As you get up, this same black goo begins dripping out of your used spread pussy.. it will probably take a while because your womb is full of it.. The android was talking about some kind of DNA infusion.. making you wonder if this substance.. is virile.")

		addButton("Continue", "See what happens next", "after_sex")
	if(state == "sentinel_ride_ass"):
		playAnimation(StageScene.SexCowgirl, "tease", {npc="pc", pc="sentinelx", bodyState={exposedCrotch=true,hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("Might as well have some fun and see what this android can do..")

		saynn("As you expose your {pc.thick} ass and straddle its frame.. your thighs already feel the cold touch of the latex teasing them.")

		saynn("[say=sentinelx]Switching to service top mode. Warning, powercell is at 7% capacity.[/say]")

		saynn("Better make those 7% count then. Your digits receive a thin layer of latex on them as you get a grasp on the android's cock and guide it towards your inviting asshole while also slowly lowering yourself onto it.. The black goo is usually quite sticky but the.. precum?.. that its cock is producing is slippery instead, allowing you to use it as lube.")

		addButton("Continue", "See what happens next", "sentinel_ride_ass_go")
	if(state == "sentinel_ride_ass_go"):
		playAnimation(StageScene.SexCowgirl, "sex", {npc="pc", pc="sentinelx", bodyState={exposedCrotch=true,hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("That black canine member.. feels cold.. but only at first. As it coats your sensitive flesh with its shiny precum, your anal entrance gets spread open with ease, allowing you to bury that shaft inside you..")

		saynn("You begin to ride it, allowing its cock to explore you deeper and deeper. You notice that the latex layer is slowly expanding onto you.. Feels weird.. you feel little electrical impulses piercing your sensitive flesh.. stimulating it.. almost corrupting even..")

		saynn("It feels so good that moans begin escaping your lips. You place your hands on the machine's chest and feel your digits slowly phasing through and also receiving this latex layer that slowly expands further, giving your limbs a shiny new appearance.")

		saynn("[say=sentinelx]Transformation protocols disallowed, powercell capacity is critically low.[/say]")

		saynn("At least it won't turn you into one of itself.. Wait, it could do that?! These thoughts get forgotten instantly when you begin to feel android's knot inflating and already slapping against your ring, on the verge of being able to fit inside you..")

		addButton("Ride it faster", "Might as well see how it will cum..", "sentinel_ride_ass_cum")
	if(state == "sentinel_ride_ass_cum"):
		playAnimation(StageScene.SexCowgirl, "fast", {npc="pc", pc="sentinelx", pcCum=true, npcCum=true, bodyState={exposedCrotch=true,hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("Even though the android can't transform you.. it can still surely try.. Almost your whole body is now coated in this black shiny latex-like goo.. That keeps stimulating you with little bursts of electricity, making you more eager to ride it. Only your depths seem to still be untouched..")

		if (GM.pc.isWearingChastityCage()):
			saynn("Weirdly enough, instead of just coating your chastity cage, the black goo chooses to construct a little.. sphere around it.. and creating such a high amount of air pressure in it that your cock just.. gets forced to be limp.")

		elif (GM.pc.hasReachablePenis()):
			saynn("Weirdly enough, instead of just coating your {pc.penis}, the black goo chooses to construct a little.. sphere around it.. and creating such a high amount of air pressure in it that your cock just.. gets forced to be limp.")

		saynn("Very soon you find yourself bouncing on that cock while rubbing your body that feels so different.. Even your {pc.breasts} are all encased in this latex material that seems to.. make your nipples extremely sensitive.")

		saynn("[say=sentinelx]Orgasm imminent. Nanobot assimilation sequence initialized. DNA infusion primed and commencing.[/say]")

		saynn("Wait? Did it lie?! You weren't planning to become an android today.. But it feels so fucking good.. Too late to back off now..")

		saynn("A loud moan escapes your lips as the android's knot slips inside you, locking you two together. Your body shivers as the android starts pumping you full of some kind of thick sticky black goo.. claiming your insides and coating the inner walls.. It feels like it's about to.. start changing you..")

		addButton("Continue", "See what happens next", "sentinel_ride_ass_debait")
	if(state == "sentinel_ride_ass_debait"):
		playAnimation(StageScene.SexCowgirl, "inside", {npc="pc", pc="sentinelx", bodyState={exposedCrotch=true,hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("[say=sentinelx]Warning.. Powercell loses charge in 3.. 2.. 1..[/say]")

		saynn("But then the machine suddenly turns off and goes limp. All the sensations that the new latex coating was giving you.. gone completely..")

		saynn("In fact, this shiny rubber-like material has lost its sticky properties and begins dripping off of you.. revealing your actual self. Phew.")

		saynn("As you get up, this same black goo begins dripping out of your used spread tailhole.. it will probably take a while because you're full of it.. The android was talking about some kind of DNA infusion.. making you wonder if this substance.. is virile.")

		addButton("Continue", "See what happens next", "after_sex")
	if(state == "sentinel_submit_to"):
		playAnimation(StageScene.SexMissionary, "tease", {pc = "sentinelx", npc="pc", bodyState={exposedCrotch=true,hard=true}})
		saynn("You can just retrieve what you need from the android.. but now you're kinda curious about what it would do to you..")

		saynn("And so instead of doing anything to it, you just lie down on the floor and wait for it to recover.")

		saynn("[say=sentinelx]Distraction successful. Intruder's status: completely submissive. Securing.[/say]")

		saynn("Wow, rude. You almost change your mind but then the machine pins you to the floor, its hands grabbing yours and.. forming some kind of organic-looking handcuffs around your wrists, made entirely out of latex.")

		saynn("[say=sentinelx]Administering a fitting punishment.[/say]")

		saynn("Huh. You would ask the machine about the punishment but then it grabs your face.. and produces a ball made out of this same rubber material before pushing it into your mouth and securing it with some latex straps.")

		saynn("You would think that this is it but then it covers your eyes and forms some kind of.. mask.. around your whole face.. a mask that blocks any vision and only lets you breathe through your nose stills. You are now completely helpless.")

		saynn("[say=sentinelx]First step completed.[/say]")

		saynn("That was only the first step? What's next then..")

		addButtonWithChecks("Vaginal", "It will fuck your pussy..", "sentinel_submit_pussy", [], [ButtonChecks.HasReachableVagina])
		addButton("Anal", "It will fuck your ass..", "sentinel_submit_ass")
		if (GM.pc.hasReachableVagina()):
			addButton("Random", "Let it pick", "sentinel_submit_random")
	if(state == "lost_sentinelx"):
		playAnimation(StageScene.SexMissionary, "tease", {pc = "sentinelx", npc="pc", bodyState={exposedCrotch=true,hard=true}})
		saynn("Defeated, you fall to your knees. But then the sticky android pins you to the floor!")

		saynn("[say=sentinelx]Confrontation ended successfully. Intruder's status: completely submissive. Securing.[/say]")

		saynn("Wow, rude. You try to hit the android more but its hands catch yours and.. begin forming some kind of organic-looking handcuffs around your wrists, made entirely out of latex.")

		saynn("[say=sentinelx]Administering a fitting punishment.[/say]")

		saynn("Huh. You would ask the machine about the punishment but then it grabs your face.. and produces a ball made out of this same rubber material before pushing it into your mouth and securing it with some latex straps.")

		saynn("You would think that this is it but then it covers your eyes and forms some kind of.. mask.. around your whole face.. a mask that blocks any vision and only lets you breathe through your nose stills. You are now completely helpless.")

		saynn("[say=sentinelx]First step completed.[/say]")

		saynn("That was only the first step? What's next then..")

		addButtonWithChecks("Vaginal", "It will fuck your pussy..", "sentinel_submit_pussy", [], [ButtonChecks.HasReachableVagina])
		addButton("Anal", "It will fuck your ass..", "sentinel_submit_ass")
		if (GM.pc.hasReachableVagina()):
			addButton("Random", "Let it pick", "sentinel_submit_random")
	if(state == "sentinel_submit_pussy"):
		playAnimation(StageScene.SexMissionary, "tease", {pc = "sentinelx", npc="pc", bodyState={exposedCrotch=true,hard=true}, npcBodyState={exposedCrotch=true,hard=true}})
		saynn("The android positions itself between your legs, your thighs feeling the cold rubber touch.. The machine aligns its canine member against your sensitive folds and lets the tip cover your flesh with this latex material by brushing against it. Wait.. It's spreading..")

		saynn("It goes both ways, up from your thighs and down from your mask, slowly coating your whole body with this shiny layer.. You can feel it because this layer sends little electrical impulses through your skin.. stimulating.. almost corrupting.")

		saynn("It feels so good that you try to moan. But as you fail at that, the ballgag starts to coat your throat too..")

		saynn("[say=sentinelx]Transformation protocols disallowed, powercell capacity is critically low.[/say]")

		saynn("At least it won't turn you into one of itself.. Wait, it could do that?! These thoughts get forgotten instantly when you feel the android's canine cock spreading your pussy and forcing itself inside!")

		addButton("Continue", "Feel what happens next", "sentinel_submit_pussy_fuck")
	if(state == "sentinel_submit_pussy_fuck"):
		playAnimation(StageScene.SexMissionary, "fast", {pc = "sentinelx", npc="pc", bodyState={exposedCrotch=true,hard=true}, npcBodyState={exposedCrotch=true,hard=true}})
		saynn("Even though the android can't transform you.. it can still surely try.. Gradually, your whole body gets coated in this black shiny latex-like goo.. Which keeps stimulating you with little bursts of electricity, adding to the sensations of being fucked by an android's cock. Only your womb seems to still be untouched..")

		if (GM.pc.isWearingChastityCage()):
			saynn("Weirdly enough, instead of just coating your chastity cage, the black goo chooses to construct a little.. sphere around it.. and creating such a high amount of air pressure in it that your cock just.. gets forced to be limp.")

		elif (GM.pc.hasReachablePenis()):
			saynn("Weirdly enough, instead of just coating your {pc.penis}, the black goo chooses to construct a little.. sphere around it.. and creating such a high amount of air pressure in it that your cock just.. gets forced to be limp.")

		saynn("Very soon you find yourself squirming hard while the machine holds you pinned, ramming its shaft deep inside.. The mask, gag and handcuffs make you unable to resist even if you wanted to.. but all the stimulation makes it so pleasurable, your inner walls clenching around that cock hard.. So much that its knot begins to grow and inflate..")

		saynn("[say=sentinelx]Orgasm imminent. Nanobot assimilation sequence initialized. DNA infusion primed and commencing.[/say]")

		saynn("Wait? Did it lie?! You weren't planning to become an android today.. But it feels so fucking good.. It's not like you can say no now anyway..")

		addButton("Continue", "See what happens next", "sentinel_submit_pussy_cum")
	if(state == "sentinel_submit_pussy_cum"):
		playAnimation(StageScene.SexMissionary, "inside", {pc = "sentinelx", npc="pc", pcCum=true, npcCum=true, bodyState={exposedCrotch=true,hard=true}, npcBodyState={exposedCrotch=true,hard=true}})
		saynn("A loud muffled noise escapes your lips as the android's knot slips inside you, locking you two together. Your body shivers as the android starts pumping you full of some kind of thick sticky black goo.. claiming your insides and stuffing your womb to the brim.. It feels like it's about to.. start changing you..")

		saynn("You arch your back as best as your restraints allow and cum hard, every thought in your head is only about how good this feels. Maybe being like.. it.. won't be the worst thing that happened in your life..")

		saynn("[say=sentinelx]Warning.. Powercell loses charge in 3.. 2.. 1..[/say]")

		saynn("But then the machine suddenly turns off and goes limp. All the sensations that the new latex coating was giving you.. gone completely..")

		saynn("In fact, this shiny rubber-like material has lost its sticky properties and begins dripping off of you.. revealing your actual self. Phew. You suddenly realize that your throat is full of this stuff and begin coughing it all out. The handcuffs around your wrist melt, allowing you to free yourself.")

		saynn("That was.. wow. You're still trying to catch your breath while trying to push this machine off you.")

		saynn("As you get up, this same black goo begins dripping out of your used spread pussy.. it will probably take a while because you're full of it.. The android was talking about some kind of DNA infusion.. making you wonder if this substance.. is virile.")

		addButton("Continue", "See what happens next", "after_sex")
	if(state == "sentinel_submit_ass"):
		playAnimation(StageScene.SexMissionary, "tease", {pc = "sentinelx", npc="pc", bodyState={exposedCrotch=true,hard=true}, npcBodyState={exposedCrotch=true,hard=true}})
		saynn("The android positions itself between your legs, your thighs feeling the cold rubber touch.. The machine aligns its canine member against your backdoor and lets the tip cover your flesh with this latex material by brushing against it. Wait.. It's spreading..")

		saynn("It goes both ways, up from your thighs and down from your mask, slowly coating your whole body with this shiny layer.. You can feel it because this layer sends little electrical impulses through your skin.. stimulating.. almost corrupting.")

		saynn("It feels so good that you try to moan. But as you fail at that, the ballgag starts to coat your throat too..")

		saynn("[say=sentinelx]Transformation protocols disallowed, powercell capacity is critically low.[/say]")

		saynn("At least it won't turn you into one of itself.. Wait, it could do that?! These thoughts get forgotten instantly when you feel the android's canine cock spreading your anal ring and forcing itself inside!")

		addButton("Continue", "Feel what happens next", "sentinel_submit_ass_fuck")
	if(state == "sentinel_submit_ass_fuck"):
		playAnimation(StageScene.SexMissionary, "fast", {pc = "sentinelx", npc="pc", bodyState={exposedCrotch=true,hard=true}, npcBodyState={exposedCrotch=true,hard=true}})
		saynn("Even though the android can't transform you.. it can still surely try.. Gradually, your whole body gets coated in this black shiny latex-like goo.. Which keeps stimulating you with little bursts of electricity, adding to the sensations of being fucked by an android's cock. Only your deep nethers seem to still be untouched..")

		if (GM.pc.isWearingChastityCage()):
			saynn("Weirdly enough, instead of just coating your chastity cage, the black goo chooses to construct a little.. sphere around it.. and creating such a high amount of air pressure in it that your cock just.. gets forced to be limp.")

		elif (GM.pc.hasReachablePenis()):
			saynn("Weirdly enough, instead of just coating your {pc.penis}, the black goo chooses to construct a little.. sphere around it.. and creating such a high amount of air pressure in it that your cock just.. gets forced to be limp.")

		saynn("Very soon you find yourself squirming hard while the machine holds you pinned, ramming its shaft deep inside.. The mask, gag and handcuffs make you unable to resist even if you wanted to.. but all the stimulation makes it so pleasurable, your inner walls clenching around that cock hard.. So much that its knot begins to grow and inflate..")

		saynn("[say=sentinelx]Orgasm imminent. Nanobot assimilation sequence initialized. DNA infusion primed and commencing.[/say]")

		saynn("Wait? Did it lie?! You weren't planning to become an android today.. But it feels so fucking good.. It's not like you can say no now anyway..")

		addButton("Continue", "See what happens next", "sentinel_submit_ass_cum")
	if(state == "sentinel_submit_ass_cum"):
		playAnimation(StageScene.SexMissionary, "inside", {pc = "sentinelx", npc="pc", pcCum=true, npcCum=true, bodyState={exposedCrotch=true,hard=true}, npcBodyState={exposedCrotch=true,hard=true}})
		saynn("A loud muffled noise escapes your lips as the android's knot slips inside you, locking you two together. Your body shivers as the android starts pumping you full of some kind of thick sticky black goo.. claiming your insides and painting your guts black.. It feels like it's about to.. start changing you..")

		saynn("You arch your back as best as your restraints allow and cum hard, every thought in your head is only about how good this feels. Maybe being like.. it.. won't be the worst thing that happened in your life..")

		saynn("[say=sentinelx]Warning.. Powercell loses charge in 3.. 2.. 1..[/say]")

		saynn("But then the machine suddenly turns off and goes limp. All the sensations that the new latex coating was giving you.. gone completely..")

		saynn("In fact, this shiny rubber-like material has lost its sticky properties and begins dripping off of you.. revealing your actual self. Phew. You suddenly realize that your throat is full of this stuff and begin coughing it all out. The handcuffs around your wrist melt, allowing you to free yourself.")

		saynn("That was.. wow. You're still trying to catch your breath while trying to push this machine off you.")

		saynn("As you get up, this same black goo begins dripping out of your used spread tailhole.. it will probably take a while because you're full of it.. The android was talking about some kind of DNA infusion.. making you wonder if this substance.. is virile.")

		addButton("Continue", "See what happens next", "after_sex")
	if(state == "after_sex"):
		removeCharacter("sentinelx")
		playAnimation(StageScene.Solo, "stand")
		saynn("You take a look at the android.. and realize that its protective layer is dripping away too, revealing the metal skeleton underneath.. and also the grenades that Tavi needed! Perfect.")

		saynn("You yank some out of its chest cavity and prepare to leave. It seems this machine won't wake up anytime soon.. or ever.")

		saynn("Time to go.")

		addButton("Continue", "See what happens next", "endthescene")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "sentinel_wakesup"):
		processTime(3*60)

	if(_action == "sentinel_try_stop"):
		processTime(3*60)

	if(_action == "do_fight_sentinel"):
		runScene("FightScene", ["sentinelx"], "sentinelx_fight")
		return

	if(_action == "sentinel_ripgrenades"):
		processTime(3*60)
		addMessage("Task updated!")
		addExperienceToPlayer(100)

	if(_action == "sentinel_ride_pussy"):
		processTime(3*60)

	if(_action == "sentinel_ride_ass"):
		processTime(3*60)

	if(_action == "sentinel_ride_pussy_go"):
		processTime(5*60)

	if(_action == "sentinel_ride_pussy_cum"):
		GM.pc.cummedOnBy("sentinelx", FluidSource.Penis, 0.5)
		processTime(6*60)
		GM.pc.gotVaginaFuckedBy("sentinelx")
		GM.pc.cummedInVaginaBy("sentinelx")
		GM.pc.orgasmFrom("sentinelx")

	if(_action == "sentinel_ride_pussy_debait"):
		processTime(3*60)

	if(_action == "after_sex"):
		processTime(3*60)
		addMessage("Task updated!")
		addExperienceToPlayer(100)

	if(_action == "sentinel_ride_ass_go"):
		processTime(5*60)

	if(_action == "sentinel_ride_ass_cum"):
		GM.pc.cummedOnBy("sentinelx", FluidSource.Penis, 0.5)
		processTime(6*60)
		GM.pc.gotAnusFuckedBy("sentinelx")
		GM.pc.cummedInAnusBy("sentinelx")
		GM.pc.orgasmFrom("sentinelx")

	if(_action == "sentinel_ride_ass_debait"):
		processTime(3*60)

	if(_action == "sentinel_submit_random"):
		setState(RNG.pick(["sentinel_submit_pussy", "sentinel_submit_ass"]))
		return

	if(_action == "sentinel_submit_pussy_fuck"):
		processTime(5*60)

	if(_action == "sentinel_submit_pussy_cum"):
		GM.pc.cummedOnBy("sentinelx", FluidSource.Penis, 0.5)
		processTime(6*60)
		GM.pc.gotVaginaFuckedBy("sentinelx")
		GM.pc.cummedInVaginaBy("sentinelx")
		GM.pc.orgasmFrom("sentinelx")

	if(_action == "sentinel_submit_ass_fuck"):
		processTime(5*60)

	if(_action == "sentinel_submit_ass_cum"):
		GM.pc.cummedOnBy("sentinelx", FluidSource.Penis, 0.5)
		processTime(6*60)
		GM.pc.gotAnusFuckedBy("sentinelx")
		GM.pc.cummedInAnusBy("sentinelx")
		GM.pc.orgasmFrom("sentinelx")

	setState(_action)

func _react_scene_end(_tag, _result):
	if(_tag == "sentinelx_fight"):
		processTime(20 * 60)
		var battlestate = _result[0]
		
		if(battlestate == "win"):
			setState("won_sentinelx")
			addExperienceToPlayer(100)
		else:
			setState("lost_sentinelx")
			addExperienceToPlayer(50)

func getDevCommentary():
	return "This encounter is pretty cool I think ^^. And the computer part is nice too, it explores many things, provides some interesting lore I think x3.\n\nHow did I come up with Sentiel-X? Well.. I needed the player to get that lust grenade from somewhere. I could have made it lootable from the guards but that'd be boring. I didn't wanna use Alex Rynard again too, I explored him enough in this route already x3. So.. Androids it is.\n\nI added the abandoned assembly and robotics labs just cause I needed to fill some space in the engineering. But I'm sooo glad that I did ^^. I managed to incorporate it into the station's lore perfectly. I think at least x3.\n\nDrones are the present. And so the androids will be the future. That's my prediction x3. What's the difference? Androids have more intelligence. Drones just run on algorithms or are controlled remotely.\n\nPeople are already falling in love with chatbots.. Imagine what happens when they will also be able to fuck them.."

func hasDevCommentary():
	return true
