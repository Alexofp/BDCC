extends "res://Scenes/SceneBase.gd"

func _init():
	sceneID = "ElizaCaughtEscapedPC"

func _run():
	if(state == ""):
		addCharacter("eliza")
		playAnimation(StageScene.Duo, "kneel", {npc="eliza", npcAction="stand"})
		
	if(state == ""):
		aimCamera("medical_near_pccell")
		GM.pc.setLocation("medical_near_pccell")
		setLocationName("Near cells")
		
		saynn("Eliza holds your leash, you try to look brave even with that straitjacket on.")

		saynn("[say=eliza]So silly..[/say]")

		saynn("Eliza walks circles around you, your eyes track her while you try to get that latex restraint off. She gives your {pc.thick} ass a firm swat. You whine from pain and stop.")

		saynn("[say=eliza]Stand still.[/say]")

		saynn("She slowly wraps the leash around your neck, above the collar, cold chain links press on your throat with pressure that gradually increases. She stops in front of you and looks you into your eyes.")

		saynn("[say=eliza]I’m giving you one chance. Get on your knees and promise to behave.[/say]")

		saynn("You can feel her hot breath, deep growling as she decides what to do with you. You feel very uneasy, uncomfortable.")

		addButton("Submit", "Behave for once", "submit")
		addButton("Resist", "She will torture you..", "resist")

	if(state == "submit"):
		saynn("You get on your knees like she ordered you.")

		saynn("[say=pc]I will behave, I promise.[/say]")

		saynn("Eliza slowly unwraps the leash and gives you a cold head pat.")

		saynn("[say=eliza]Much better. I will still do this though.[/say]")

		saynn("She grabs some syringe off of her belt and injects you with it. You suddenly feel very sleepy..")

		addButton("Sleep", "Time to go bye bye", "sleep1")

	if(state == "resist"):
		saynn("You have made up your mind, you’re not gonna listen to some insane bitch. Eliza exhales audibly as she keeps wrapping more of the leash around your neck.")

		saynn("[say=eliza]Brain can survive up to 10 minutes without any oxygen. After that the damage is irreversible.[/say]")

		saynn("[say=pc]You're gonna kill me?[/say]")

		saynn("[say=eliza]If one little meaningless life needs to be taken away in order to push science further - so be it. Millions can benefit from the death of a single test subject..[/say]")

		saynn("[say=pc]You’re not gonna do it.[/say]")

		saynn("[say=eliza]See if I care.[/say]")

		saynn("Suddenly she grabs your collar with one hand while using the other to pull on the leash, the chain links bury themselves into your skin, leaving many painful bruises and little cuts. You realize that you can’t breathe, you can’t even produce a cry, the leash is choking you.")

		saynn("[say=eliza]I’ve devoted my whole life to this, I will make any sacrifice for the greater good.[/say]")

		saynn("Her mean eyes watch you struggle for air, you can’t even protect yourself, your arms are bound by that straitjacket. Eliza tilts her head to the side slightly, she has a face of a maniac.")

		saynn("Seconds pass, one by one, each one making you weaker and weaker.. Corners of your vision darken.. heart beats like hell.. Eliza drills you with her gaze.")

		addButton("Continue", "Is that how you die?..", "continue")

	if(state == "continue"):
		saynn("Eliza growls and lets go of the leash. It unwraps itself enough to let you breathe, you drop to your knees, coughing and gasping for air.")

		saynn("[say=eliza]I’m not a murderer, this kind of suffering doesn’t bring joy to me.[/say]")

		saynn("She pulls out a syringe and injects you with it. It makes you feel sleepy..")

		saynn("[say=eliza]Think about your behavior, I will see you tomorrow.[/say]")

		addButton("Sleep", "Time to go bye bye", "sleep1")

	if(state == "sleep1"):
		aimCamera("medical_paddedcell_player")
		GM.pc.setLocation("medical_paddedcell_player")
		playAnimation(StageScene.Solo, "kneel")
		setLocationName("Padded cell")
		
		saynn("You wake up in your padded cell. You have a little headache, such a familiar feeling.")

		saynn("Welcome to day "+str(GM.main.getDays())+" of your sentence")
		# (scene ends)
		
		addButton("Continue", "What next..", "startmental")
		


func _react(_action: String, _args):
	if(_action == "resist"):
		GM.pc.addPain(100)
		GM.pc.addStamina(-200)
	
	if(_action == "sleep1"):
		getModule("MedicalModule").preparePCForMentalWard()

	if(_action == "endthescene"):
		endScene()
		return
		
	if(_action == "startmental"):
		runScene("MentalWardScene")
		endScene()
		return
		
	if(_action == "sleep1"):
		GM.main.startNewDay()
		GM.pc.afterSleepingInBed()
	
	setState(_action)
