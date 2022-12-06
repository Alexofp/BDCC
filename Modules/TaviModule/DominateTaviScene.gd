extends "res://Scenes/SceneBase.gd"

func _init():
	sceneID = "DominateTaviScene"


func _run():
	if(state == ""):
		addCharacter("tavi")
		
	if(state == ""):
		playAnimation(StageScene.Duo, "stand", {npc="tavi", npcAction="kneel"})
		
		saynn("You cross your arms and give Tavi a strict gaze of your own.")

		saynn("[say=pc]On your knees.[/say]")

		saynn("She tilts her head at you and frowns.")

		saynn("[say=tavi]Why in the world would I do that. I’m not your fucking sextoy[/say]")

		saynn("Tavi is clearly not gonna do it willingly so you decide to help her. You walk up to the downed feline and reach your hand out to try and grab her hair. She tries to push you away but you overpower her and manage to get a good pull on her hair, causing her to hiss and let out a painful groan.")

		saynn("[say=tavi]Uh, you fucker![/say]")

		saynn("You pull her head back and forth, she holds onto your hand and grinds her teeth. Your second arm gives her a firm faceslap, calming her down. You’re rough but you clearly have a reason, that red tried to make you her subby pet.")

		saynn("[say=pc]At this rate you will quickly end up in the medbay. Just kneel, you bitch.[/say]")

		saynn("She is still on the floor, trying to break free from your grasp. In the end, Tavi manages to press her leg into you and push you away, it was painful for her but she managed to free herself. But she is still weak so she crawls back a few meters and then takes her time trying to stand up.")

		addButton("Let her go", "That was enough to teach her a lesson", "let_her_go")
		addButton("Break Tavi", "Apply extra pressure to make her submit to you. It’s not gonna be pretty", "break_tavi")

	if(state == "let_her_go"):
		saynn("You chuckle and cross your arms again.")

		saynn("[say=pc]Pathetic. You’re weak. Why did they even put you in red[/say]")

		saynn("Tavi gets up with her help of the nearest wall and glares at you.")

		saynn("[say=tavi]Go die in a fire.. With the rest of this fucking prison[/say]")

		saynn("The defeated cat swiftly makes her escape before you change your mind.")

		addButton("Continue", "She got what she deserved anyways", "endthescene")

	if(state == "break_tavi"):
		saynn("[say=pc]Where are you going? I’m not done with you yet[/say]")

		saynn("You slowly walk up to Tavi just in time for her to get up from the floor. You grab her by the collar and shove into the nearest wall, then your hand shifts up and closes around her neck instead, your second hand turns into a fist and threatens to punch her stomach. She growls into your face and tries to take your hand off her neck, her eyes show true hatred.")

		saynn("[say=pc]If I will have to break you before you start behaving - I will.[/say]")

		saynn("She keeps resisting, such a rebel. You start putting more pressure on her throat, making it harder for her to breathe if not impossible. She snarls back but after you start choking her out with the second hand too she becomes quiet, you start noticing signs of fear in her eyes. You put more mental pressure on her, your voice is strict and clear to make sure she understands.")

		saynn("[say=pc]Think you’re invincible? Nothing stops me from snapping your neck right now, what's another ten years, my sentence is indefinite anyways. Is that how you wanna die?[/say]")

		saynn("Tavi looks terrified, as each second passes she loses more and more strength, the corners of her vision darken, her resistance gets weaker. She shakes her head to your question and raises her paws, surrendering.")

		saynn("[say=pc]Good choice[/say]")

		saynn("You didn’t really give her any choice but oh well, it was you or her. You stop choking her and she falls to the floor, coughing and gasping for air, her breathing is all messed up. She then rubs her neck and looks at you, her eyes don’t show much, just fear.")

		saynn("You step back and point at the floor before you.")

		saynn("[say=pc]Kneel[/say]")

		saynn("Tavi tilts her head down and slowly crawls up to the spot before raising herself to her knees, still trying to catch her breath in the process. You lean down and grab her by the chin, she avoids any eye contact.")

		saynn("[say=pc]Look at me.[/say]")

		saynn("She looks you in the eyes but quickly turns her head away, you pull it back and give her face a slap, she grunts and obeys.")

		saynn("[say=pc]I see that you have some willpower, you’re not a simple girl. I will be very strict with you. Strict until you start to obey[/say]")

		saynn("She sits still and tries not to show her true emotion but her feline tail is betraying her by wagging around.")

		saynn("[say=tavi]Well. What do you want[/say]")

		saynn("[say=pc]You belong to me now. Say it[/say]")

		saynn("She rolls her eyes but the bruises on her neck give her a reminder. She sighs and looks down at the floor.")

		saynn("[say=tavi]I belong to you.[/say]")

		saynn("You give her some scritches behind the ear. Quiet purring can be heard from Tavi.")

		saynn("[say=pc]Hands behind back, lean forward on the floor[/say]")

		saynn("She thinks about your order but eventually obeys, putting her arms behind and lowering herself a bit. You see her struggling and decide to help by putting your foot on her back and pushing down, forcing her to be pretty much kissing the floor, her voice is muffled.")

		saynn("[say=tavi]Mgh-h. There you go. Enjoying yourself?[/say]")

		saynn("[say=pc]Seeing you like this? Yes. Your behaviour? No[/say]")

		saynn("[say=tavi]You get what you paid for.[/say]")

		saynn("You raise your leg and Tavi sits back on her knees again, looking at you. Seems like that wasn’t enough to fully break her but she definitely shows signs that she can be obedient. You leave her alone and walk away.")

		addButton("Leave", "She got what she deserved anyways", "endthescene")


func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		processTime(30*5)
		
		GM.main.increaseModuleFlag("TaviModule", "Tavi_Submissiveness")
		return


	setState(_action)

