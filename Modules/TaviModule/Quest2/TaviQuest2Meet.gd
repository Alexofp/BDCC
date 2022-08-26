extends "res://Scenes/SceneBase.gd"

func _init():
	sceneID = "TaviQuest2Meet"


func _run():
	if(state == ""):
		addCharacter("tavi")
		
	if(state == ""):
		saynn("You idle around until Tavi shows up, just on time. She walks up to you, her cunning smile greets you.")

		saynn("[say=tavi]We can’t reach the top deck without staff access.[/say]")

		saynn("[say=pc]So how are you gonna get it?[/say]")

		saynn("The tall feline chuckles and directs her gaze towards the checkpoint, a single guard is standing there. Tavi takes a feminine posture and proceeds to step towards him, putting an extra amount of sway into her hips.")

		addButton("Follow", "See what happens", "follow")

	if(state == "follow"):
		aimCameraAndSetLocName("hall_checkpoint")
		addCharacter("cp_guard")
		
		saynn("As Tavi approaches and seemingly tries to walk past, the guard blocks the path and gestures to her to stop. You stand nearby, watching the scene unfolding.")

		saynn("[say=cp_guard]Not so fast, sweetheart. Hands on the wall, I’m gonna check you. You both.[/say]")

		saynn("[say=tavi]No need, officer. I’m clean, outside and inside~.[/say]")

		saynn("She raises her paws, showing no threat, and then leans forward, whispering to his ear.")

		saynn("[say=tavi]I don’t even have panties~.[/say]")

		saynn("The guard raises his brow as he eyes the red block inmate out. Tavi wasn’t afraid to put herself out, she let him watch. But then the canine frowns and barks at her.")

		saynn("[say=cp_guard]I’m well aware of bullshit reds do, I’m only fucking sluts like you in stocks. Hands on the wall, inmate.[/say]")

		saynn("Tavi just keeps smiling as the guard steps towards her himself and tries to wrench her arms. But as he approaches her, the feline pulls her hands back and instead kicks him in the chest with full force, sending him back a full meter. The guy grunts and swiftly readies his stun baton.")

		saynn("[say=cp_guard]What a bitch![/say]")

		saynn("He swings at Tavi but she catches his hand and forces it into the nearby wall, disarming the guard. He tries to punch but she keeps him away again, this time causing the guy to drop to his knee. Tavi just stretches and gets into a feminine pose again, straight back, legs together, hands resting on her belt area.")

		saynn("[say=tavi]That’s a bad way to treat a lady~. How about you say sorry~.[/say]")

		saynn("The guard just growls back at her, he swiftly begins to look for his remote. He finally finds it and primes it but as he aims it at the feline, he sees her dashing towards him with a crazy smile and his weapon in her hand. Her swing connects faster, sending a sudden powerful shock through the guard's body and causing him to cry out from pain. He drops his remote and loses his consciousness not long after. You stand behind, having watched all that, looking pretty surprised.")

		saynn("[say=pc]Are you gonna get in trouble for that?[/say]")

		saynn("[say=tavi]Why should I? I’m better than every single one of them. Combined~.[/say]")

		saynn("She rips the badge off his uniform and heads towards the elevator, inviting you to follow.")

		addButton("Follow", "Enter the elevator", "follow1")

	if(state == "follow1"):
		aimCameraAndSetLocName("cd_elevator")
		removeCharacter("cp_guard")
		
		saynn("You join Tavi in the elevator, she presses the badge against the control panel and picks the command deck floor. The elevator begins to rise.")

		saynn("[say=pc]You think we will be able to call for help?[/say]")

		saynn("[say=tavi]We should be. The Syndicate would be happy to know where this prison is.[/say]")

		saynn("[say=pc]Syndicate?[/say]")

		saynn("[say=tavi]They’re at war with AlphaCorp. I don’t care about that whole intergalactic conflict bullshit but right now it’s a nice opportunity for me. And you.[/say]")

		saynn("The doors open. Outside area looks quite different from what you are used to in the prison. Many expensive-looking paintings on the walls, red cloth with golden accents everywhere. The tiled floor looks clean and shiny, it’s covered with a long carpet so your feet don’t feel cold as you step. The whole setup screams rich to you, even Tavi looks puzzled at first.")

		saynn("[say=tavi]Quite the contrast, huh.[/say]")

		saynn("[say=pc]Budget money well spent.[/say]")

		saynn("You both step out and look around, it seems the place is not guarded very well. Tavi gives you a head pat.")

		saynn("[say=tavi]I will meet you near the captain’s office. Here, use these in case you’re hurt.[/say]")

		saynn("She hands you some painkillers and then walks away.")

		# (add painkillers)

		# (scene ends)

		addButton("Continue", "Time to go", "endthescene")


func _react(_action: String, _args):
	if(_action == "follow1"):
		GM.pc.setLocation("cd_elevator")
		processTime(60*5)
		
		GM.pc.getInventory().addItem(GlobalRegistry.createItem("painkillers"))
		GM.pc.getInventory().addItem(GlobalRegistry.createItem("painkillers"))
		addMessage("You recieved 2 painkillers")
		
		setModuleFlag("TaviModule", "Tavi_Quest2MetHer", true)
	
	if(_action == "endthescene"):
		endScene()
		return


	setState(_action)

