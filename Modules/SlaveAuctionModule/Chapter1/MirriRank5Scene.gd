extends SceneBase

func _init():
	sceneID = "MirriRank5Scene"

func _run():
	if(state == ""):
		addCharacter("mirri")
		playAnimation(StageScene.Duo, "stand", {npc="mirri"})
		saynn("Mirri purrs contentedly as her feline eyes remain glued to her laptop screen, staring at some kind of leaderboards.")

		saynn("[say=mirri]I am a rank 5 bitch now! It's official! Do you know what that means?[/say]")

		saynn("[say=pc]You're gonna be even more insufferable?[/say]")

		saynn("[say=mirri]C'mon, I'm not that bad.[/say]")

		saynn("Debatable.")

		saynn("[say=pc]For a crazy slaver girl with some serious case of daddy issues.. sure, you're not that bad.[/say]")

		saynn("Mirri huffs and flicks her tail, her sharp claws tapping idly against the laptop.")

		saynn("[say=mirri]Hey, I didn't ask to be born into this, okay? I'm just trying to do the best with what cards I've been dealt with. And let me tell you, it's been a rigged game since day one.[/say]")

		saynn("She is not wrong. From what you've heard, her upbringing was less than ideal.")

		saynn("[say=pc]Alright. So what does rank 5 mean?[/say]")

		saynn("[say=mirri]It means that rank 6 is next![/say]")

		saynn("She sticks her tongue out, her grin growing wider.")

		saynn("[say=pc]Your math checks out.[/say]")

		saynn("Mirri playfully smacks your shoulder.")

		saynn("[say=mirri]You dummy, the number is not important. Important part is.. there are currently no rank 6 slavers![/say]")

		saynn("Looks like selling all those AlphaCorp slaves is more profitable than you thought..")

		saynn("[say=pc]So you'd be the first?[/say]")

		saynn("[say=mirri]Well, not ever. Rank 6 slavers exist, but it's like.. impossible to maintain. The requirements are crazy, most people burn out trying.[/say]")

		saynn("Sometimes you forget that you're talking about leaderboards for people traders.")

		saynn("[say=pc]And you feel like you can pull it off?[/say]")

		saynn("[say=mirri]I think WE can pull it off~. You love me, right? Because I totally love you, you silly AlphaCorp slave~.[/say]")

		saynn("Mirri brushes her half-naked hips against you.. a sign of affection.")

		saynn("[say=pc]Uh huh. Sure.[/say]")

		saynn("Mirri pouts dramatically.")

		saynn("[say=mirri]Aw, c'mon, don't break my heart. You don't want to do that. Woman's heart is very fragile, you know?[/say]")

		saynn("[say=pc]Pretty sure you're just manipulating me.[/say]")

		saynn("[say=mirri]Of course not! I'm just.. happy, you know? We're so close, I can almost taste it. One last push.. and I will be the best slaver in the whole galaxy. Dad will finally be proud.[/say]")

		saynn("Before you can respond, Luxe boldly steps into the room. He doesn't need any invitations, his piercing golden gaze settling on the two of you.")

		saynn("[say=pc]Speaking of.[/say]")

		saynn("[say=luxe]Everything is ready.[/say]")

		saynn("Mirri's face lights up as she hops to you and grabs you by the collar.")

		saynn("[say=mirri]Yay! I hope you didn't forget that we're having a family dinner.[/say]")

		saynn("[say=pc]How could I..[/say]")

		addButton("Follow", "Join their family dinner", "arrive_dinner")
	if(state == "arrive_dinner"):
		addCharacter("luxe")
		playAnimation(StageScene.Duo, "stand", {npc="luxe"})

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "arrive_dinner"):
		processTime(5*60)

	setState(_action)
