extends SceneBase

func _init():
	sceneID = "DomM5s1Intro"

func _run():
	if(state == ""):
		playAnimation(StageScene.Duo, "stand", {npc="avy", pc="kait"})
		addCharacter("kait")
		addCharacter("avy")
		addCharacter("announcer")
		saynn("The core of your team gathers around the mission board.")

		saynn("[say=avy]So what's the next step of your genius plan, cat?[/say]")

		saynn("[say=kait]Hold onto your panties. Let me think..[/say]")

		saynn("[say=avy]What panties.[/say]")

		saynn("Time passes. Awkward silence starts to settle in.")

		saynn("[say=avy]Did that nerd doctor take away your last braincell? What did she do to you, anyway?[/say]")

		saynn("[say=kait]Shut up, she didn't do nothing. I'm fine! I know what we have to do.[/say]")

		saynn("She turns towards you all.")

		saynn("[say=kait]We have control over the medical wing now, correct?[/say]")

		saynn("[say=announcer]Me and Eliza had a chat. She understands our mission. She will give out orders to the nurses if we need her to.[/say]")

		saynn("[say=kait]Good. Thanks. Then.. now..[/say]")

		saynn("You look at the board. There is an obvious next target.")

		saynn("[say=pc]Collars?[/say]")

		saynn("[say=kait]Yes! We gotta do something about the collars next.[/say]")

		saynn("[say=avy]About fucking time.[/say]")

		saynn("Kait taps on the stolen staff records.")

		saynn("[say=kait]Alex Rynard. We need to find him. And then we need to break him.[/say]")

		saynn("[say=avy]Leave that to me. I can break him in half.[/say]")

		saynn("[say=kait]No, Avy. We need him alive so he can take off our collars.[/say]")

		saynn("[say=avy]He will be fine. He can take some damage.[/say]")

		saynn("[say=kait]No damage.[/say]")

		addButton("Continue", "See what happens next", "ans_talks")
	if(state == "ans_talks"):
		playAnimation(StageScene.Duo, "stand", {npc="announcer", pc="kait"})
		saynn("[say=announcer]Alex is always down in the workshop, working on his prototypes. How about we try a different approach this time?[/say]")

		saynn("[say=kait]Different approach?[/say]")

		saynn("[say=announcer]I can try to convince him. Use words rather than punches.[/say]")

		saynn("[say=kait]It won't work. You will just blow our cover.[/say]")

		saynn("[say=announcer]I will be careful.[/say]")

		saynn("[say=kait]Too risky.[/say]")

		saynn("[say=announcer]We're already playing a very risky game. Your last operations didn't exactly go as planned. Give me a chance to shine, babe?[/say]")

		saynn("[say=kait]..fine. But we will be near.[/say]")

		saynn("[say=announcer]Perfect. Let's all meet near the workshop and see what we can do.[/say]")

		saynn("It is decided. Time to move.")

		saynn("Kait is the fastest, she zooms out of the room.")

		addButton("Continue", "See what happens next", "endthescene")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	setState(_action)
