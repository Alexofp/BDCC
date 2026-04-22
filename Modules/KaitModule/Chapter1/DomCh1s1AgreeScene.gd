extends SceneBase

func _init():
	sceneID = "DomCh1s1AgreeScene"

func _run():
	if(state == ""):
		addCharacter("kait")
		playAnimation(StageScene.Duo, "stand", {npc="kait"})
		saynn("[say=pc]I think I'd like to team up with you.[/say]")

		saynn("[say=kait]Haha. Yes. Perfect. You made the right choice, trust me. We will make these corporate rats our subby bitches.[/say]")

		saynn("You nod. Kait seems excited. Maybe a bit too much. You haven't done anything yet.")

		saynn("[say=kait]Since I started this whole thing.. that means.. I'm gonna be in charge. Yeah?[/say]")

		saynn("She doesn't sound entirely sure about it. Her feline eyes look slightly anxious, waiting for your answer. Her tail is alert too.")

		saynn("[say=pc]You're gonna tell me the plan first. And then we will see.[/say]")

		saynn("Kait blinks and looks around. So many ears. So many loud noises.")

		saynn("[say=kait]Fine. But not here.[/say]")

		addButton("Continue", "See what happens next", "near_hideout")
	if(state == "near_hideout"):
		aimCameraAndSetLocName("hideout_enter")
		saynn("Behind the raised platform, there is a doorframe, half-hidden in shadow. Kait walks through it and invites you to follow.")

		saynn("You do.")

		saynn("You enter the Announcer's office. This room clearly was a maintenance space of some sorts before.. maybe even a storage bay. But now someone has shoved a make-shift desk, a chair and a few shelves into it. It was cramped and dim.. but also cozy in a weird way.")

		saynn("[say=kait]Ans has been kind enough to let me use his secret room.[/say]")

		saynn("You look around. There is only enough space for the two of you to stand without bumping into each other. Only a single metal wall was separating you from the chaos of the arena outside.")

		saynn("[say=pc]This room isn't exactly secret, is it?[/say]")

		saynn("Kait snorts softly and nods towards the far corner.")

		saynn("[say=kait]That one is.[/say]")

		saynn("You followed her gaze. Kait moves some of the janky-looking shelves made out of metal panels.. uncovering an airlock door.")

		saynn("You approach it. The door has huge dents and a bunch of torn-off panels. The wiring is all exposed too.. like someone has tried to hack it. It has certainly seen better days. There is a small window on it.. but it's really hard to see what's behind. It's all dark and dusty.")

		saynn("[say=pc]Is that your job?[/say]")

		saynn("[say=kait]Some of it, sure. Don't ask me how many times it shocked me. I think I started to like it by the end.[/say]")

		saynn("[say=pc]Could have stolen some insulated gloves.[/say]")

		saynn("[say=kait]Uh..[/say]")

		saynn("She scratches behind her head.")

		saynn("[say=pc]Or let someone else from your team steal it.[/say]")

		saynn("[say=kait]Uhh-h-h-h..[/say]")

		saynn("[say=pc]You have a team, right?[/say]")

		saynn("[say=kait]Yes. We will talk about it. But first..[/say]")

		saynn("You raise a brow and watch as Kait grabs a long metal bar and shoves it into a crack between the two unpowered doors.")

		saynn("[say=kait]I managed to raise the bolts and cut off the power. Now we just need to force it open. Care to help?[/say]")

		addButton("Help", "Help Kait to force-open the door", "help_force_open")
	if(state == "help_force_open"):
		saynn("meow")


func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "near_hideout"):
		processTime(5*60)

	if(_action == "help_force_open"):
		processTime(10*60)

	setState(_action)
