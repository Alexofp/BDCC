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

		saynn("Project status: [cuss]Scrapped[/cuss]")

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
