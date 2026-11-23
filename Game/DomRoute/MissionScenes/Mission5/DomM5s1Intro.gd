extends SceneBase

func _init():
	sceneID = "DomM5s1Intro"

func _run():
	if(state == ""):
		playAnimation(StageScene.Duo, "stand", {npc="avy", pc="kait"})
		addCharacter("kait")
		addCharacter("avy")
		addCharacter("announcer")
		saynn("The core of your team gathers around the mission board. The lighting is still quite dim but it's enough to read it. Avy leans against one of the walls, watching Kait. Ans taps his mic-cane against the floor with a patient rhythm.")

		saynn("[say=avy]So what's the next step of your genius plan, cat?[/say]")

		saynn("Kait furrows her brows.. then turns to the board. Her fluffy tail flicks behind her.")

		saynn("[say=kait]Hold onto your panties. Let me think..[/say]")

		saynn("Avy snorts.")

		saynn("[say=avy]What panties.[/say]")

		saynn("Time passes. Kait is still staring at the board, a lonely sigh escapes her. Awkward silence starts to settle in. Avy shifts her weight, her tail swishing lazily.")

		saynn("[say=avy]Did that nerd doctor take away your last braincell? Or are you dreaming about being in a straitjacket again? We still have it somewhere.[/say]")

		saynn("Kait's fur stands on ends for a second.")

		saynn("[say=kait]Save it. I know what we have to do.[/say]")

		saynn("She turns towards you all and straightens her posture.")

		saynn("[say=kait]We have control over the medical wing now, correct?[/say]")

		saynn("Ans nods.")

		saynn("[say=announcer]Me and Eliza had a chat. She will obey and pass on our orders.[/say]")

		saynn("[say=kait]Good. Thanks. Then.. now..[/say]")

		saynn("She is still struggling it seems. You look at the board. There is an obvious next target.")

		saynn("[say=pc]Collars?[/say]")

		saynn("Kait's ears perk up.")

		saynn("[say=kait]Hm.. Sure. Yeah. We gotta do something about the collars next. Good idea.[/say]")

		saynn("Avy pushes off the wall.")

		saynn("[say=avy]About fucking time.[/say]")

		saynn("Kait taps on the stolen staff records.")

		saynn("[say=kait]Alex Rynard. We need to find him. And then we need to make him take off our collars.[/say]")

		saynn("The dark foxy cracks her knuckles.")

		saynn("[say=avy]Leave that to me. I can break him in half.[/say]")

		saynn("[say=kait]No, Avy. If he is dead, he can't help us.[/say]")

		saynn("Avy shrugs.")

		saynn("[say=avy]He will be fine. I'm sure he can take some damage.[/say]")

		saynn("[say=kait]No damage.[/say]")

		addButton("Continue", "See what happens next", "ans_talks")
	if(state == "ans_talks"):
		playAnimation(StageScene.Duo, "stand", {npc="announcer", pc="kait"})
		saynn("Ans clears his throat, gaining the attention of everyone.")

		saynn("[say=announcer]Alex is always down in the workshop, working on his prototypes.[/say]")

		saynn("[say=kait]Perfect. Let's pay him a visit.[/say]")

		saynn("[say=announcer]How about we try a different approach this time?[/say]")

		saynn("[say=kait]Different approach?[/say]")

		saynn("Ans tilts his head slightly, a small smile shines on his face.")

		saynn("[say=announcer]I can try to convince him. Talk to him.[/say]")

		saynn("Kait shakes her head immediately.")

		saynn("[say=kait]It won't work. You will just blow our cover.[/say]")

		saynn("[say=announcer]Depends on how I spin it. I have my ways with words.[/say]")

		saynn("[say=kait]I think that's still too risky.[/say]")

		saynn("Ans approaches Kait, leaning on his cane.")

		saynn("[say=announcer]We're already playing a very risky game. Talking is my one thing. Give me a chance to shine, babe?[/say]")

		saynn("Kait taps her claws against her uniform. She gives you and Avy a quick look.. Avy responds with an uncaring shrug. You do the same. Finally, after some time, she lets out a frustrated breath.")

		saynn("[say=kait]..fine. But we will be near.[/say]")

		saynn("[say=announcer]Perfect. Let's all meet near the workshop and see what we can do.[/say]")

		saynn("It is decided. Time to move.")

		saynn("Kait is the fastest, she zooms out of the room. The sound of her rapid footsteps fades quickly. Avy watches that.. and then sighs.")

		saynn("[say=avy]She is gonna get us all killed one day.[/say]")

		addButton("Continue", "See what happens next", "endthescene")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	setState(_action)
