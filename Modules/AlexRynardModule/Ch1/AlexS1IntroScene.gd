extends SceneBase

func _init():
	sceneID = "AlexS1IntroScene"

func _run():
	if(state == ""):
		addCharacter("alexrynard")
		playAnimation(StageScene.Duo, "stand", {npc="alexrynard", npcAction="sit"})
		saynn("Alex grabs one of the broken datapads and begins to fix it. He uses a screwdriver to open the cover and then starts poking the wiring in various spots with some multitool. It takes a while so he sits down.")

		saynn("Now is as good of a time as ever to ask something.")

		saynn("[say=pc]Do you do.. lewd stuff?[/say]")

		saynn("The foxy hears that.. and becomes motionless for a second, letting the awkward silence settle in. After that he just returns to tinkering with the broken device.")

		saynn("[say=pc]I mean..[/say]")

		saynn("[say=alexrynard]I know what you mean, trust me.[/say]")

		saynn("Sounds like a no.")

		addButton("Why not?", "Pester him a bit more", "why_not")
		addButton("Never mind", "The guy is clearly not gonna fuck you", "endthescene")
	if(state == "why_not"):
		saynn("[say=pc]Why not?[/say]")

		saynn("Alex doesn't show much emotion, he is clearly focussed on his task. He finds a wire that was causing the whole board to short-circuit and begins to fix it.")

		saynn("[say=pc]You don't like talking about that?[/say]")

		saynn("He growls as he accidentally cuts the wrong wire.")

		saynn("[say=alexrynard]Listen. If you wanna get fucked, go out there and pull your pants down.[/say]")

		saynn("He is kinda.. mean.. huh? But he is probably not wrong.")

		saynn("[say=alexrynard]Let me do some work in peace. Please.[/say]")

		saynn("The foxy begins to solder the cut wire back.")

		saynn("Maybe you should just wait until he is done?")

		addButton("Wait", "Watch him work", "do_wait")
	if(state == "do_wait"):
		playAnimation(StageScene.Duo, "sit", {npc="alexrynard", npcAction="sit"})
		saynn("You decide to sit down nearby and stay quiet for some time. Alex sighs when you do that.")

		saynn("Some time passes. The foxy finishes repairing the datapad and turns it on. He smiles when the thing seems to work fine after everything that it had to endure.")

		saynn("[say=pc]Are you.. done?[/say]")

		saynn("[say=alexrynard]Do I look done?[/say]")

		saynn("To be fair, he kinda does..")

		saynn("Alex puts the repaired datapad away.. and then opens one of the drawers, revealing.. what feels like hundreds more of those broken devices. He catches your surprised gaze.")

		saynn("[say=alexrynard]I told you already. You will have many more chances with someone else. I'm not into mindless rough sex anyway.[/say]")

		addButton("Not rough", "What about normal sex?", "ask_notrough")
		addButton("Asexual?", "Ask if he is asexual", "ask_asexual")
		addButton("Job too important?", "Ask if he values his job more than having some fun", "ask_job")
		addButton("Just watch", "Just continue watching", "just_watch_more")
	if(state == "ask_notrough"):
		saynn("[say=pc]What about.. normal sex then?[/say]")

		saynn("He shrugs.")

		saynn("[say=alexrynard]Still mindless.[/say]")

		saynn("[say=pc]Define mindless.[/say]")

		saynn("Foxy looks at you with his tired eyes.. and sighs.")

		saynn("[say=alexrynard]No.[/say]")

		saynn("Fair enough. You probably have to figure that out yourself.")

		addButton("Asexual?", "Ask if he is asexual", "ask_asexual")
		addButton("Job too important?", "Ask if he values his job more than having some fun", "ask_job")
		addButton("Just watch", "Just continue watching", "just_watch_more")
	if(state == "ask_asexual"):
		saynn("[say=pc]Are you.. asexual.. by any chance?[/say]")

		saynn("His ears perk when he hears that word.")

		saynn("[say=alexrynard]Asexual? Because I don't wanna fuck you on your first request?[/say]")

		saynn("[say=pc]So far most of the people here are..[/say]")

		saynn("[say=alexrynard]Yeah, everyone here cares only about non-stop fucking. More power to them. Can I do my job now?[/say]")

		saynn("Silence settles in again. Foxy sighs and looks at you.")

		saynn("[say=alexrynard]Sorry, okay?[/say]")

		addButton("Why sorry?", "Ask why did he apologize", "ask_whysorry")
		addButton("Not rough", "What about normal sex?", "ask_notrough")
		addButton("Job too important?", "Ask if he values his job more than having some fun", "ask_job")
		addButton("Just watch", "Just continue watching", "just_watch_more")
	if(state == "ask_whysorry"):
		saynn("[say=pc]Why sorry? You might have a point.[/say]")

		saynn("He lowers his gaze for a second.")

		saynn("[say=alexrynard]It came out mean.[/say]")

		saynn("[say=pc]Okay, well.. okay.[/say]")

		saynn("[say=alexrynard]I don't want to stick out. But I have enough things to fuck with for now.[/say]")

		saynn("Yeah, the foxy seems to be working non-stop. Makes you wonder what he actually likes then.. other than stressing out about his job.")

		addButton("May I help?", "Ask if you can help with the tasks", "ask_mayhelp")
		addButton("Not rough", "What about normal sex?", "ask_notrough")
		addButton("Job too important?", "Ask if he values his job more than having some fun", "ask_job")
		addButton("Just watch", "Just continue watching", "just_watch_more")
	if(state == "ask_mayhelp"):
		saynn("[say=pc]Can I help with something?[/say]")

		saynn("[say=alexrynard]I'm good.[/say]")

		saynn("That was.. a very snappy response. Oh well, it was worth a shot.")

		addButton("Not rough", "What about normal sex?", "ask_notrough")
		addButton("Job too important?", "Ask if he values his job more than having some fun", "ask_job")
		addButton("Just watch", "Just continue watching", "just_watch_more")
	if(state == "ask_job"):
		saynn("[say=pc]Is your job that important? Why not have some fun occasionally?[/say]")

		saynn("He tilts his head to the side.")

		saynn("[say=alexrynard]Because I get paid?[/say]")

		saynn("[say=pc]Are credits worth burning out over?[/say]")

		saynn("He stays silent for a few seconds. Then he looks at your collar.")

		saynn("[say=alexrynard]Do I look like I'm burning out? There is more to this job than just fixing the damn datapads.[/say]")

		saynn("[say=pc]Like what?[/say]")

		saynn("He reaches his hand to tap on your collar.")

		saynn("[say=alexrynard]Who do you think made those?[/say]")

		saynn("[say=pc]You?[/say]")

		saynn("Foxy chuckles.")

		saynn("[say=alexrynard]Fuck no. These collars are ancient. But I made them actually work like they are supposed to.[/say]")

		saynn("You tug on it. If being tight around your neck was a design requirement, they sure are working great.")

		saynn("[say=pc]So you know how to take them off?[/say]")

		saynn("[say=alexrynard]Yeah, it's very simple. You don't.[/say]")

		saynn("Aw. That would have been so easy.")

		saynn("[say=pc]So.. You fix stuff?[/say]")

		saynn("[say=alexrynard]I'm a station engineer. Does that answer your question?[/say]")

		saynn("You're not sure what the question was by this point..")

		saynn("[say=pc]This space station is not exactly your usual sort.[/say]")

		saynn("[say=alexrynard]Mhm. Like I said, there is more to it that makes it bearable.[/say]")

		saynn("What a sly fox.")

		addButton("Not rough", "What about normal sex?", "ask_notrough")
		addButton("Asexual?", "Ask if he is asexual", "ask_asexual")
		addButton("Just watch", "Just continue watching", "just_watch_more")
	if(state == "just_watch_more"):
		saynn("Oh well. You decide to just watch Alex work a bit more.")

		saynn("He grabs another broken datapad.. and begins to fix it. This one has a cracked screen so he takes off the frame and starts replacing, being careful to disconnect all of the connectors first.")

		saynn("Foxy is clearly working way faster while it's quiet. He is focussed on the device in his hands. But occasionally his gaze checks on you.. to make sure you're not doing anything bad probably.")

		saynn("After fixing that one.. he grabs another.. and then another.. Ohh, this one has similar damage to the last one. By now you can kinda guess what he is gonna do.")

		saynn("Still.. It's so.. boring.. you feel like you're about to fall asleep..")

		saynn("That work table sure looks comfy right now.. the cold metal surface starts to feel as soft as a pillow to your head.")

		addButton("Continue", "See what happens next", "after_nap")
	if(state == "after_nap"):
		playAnimation(StageScene.Duo, "sit", {npc="alexrynard"})
		saynn("..you wake up from Alex shaking your shoulder. He is holding a bin full of fixed tablets under his arm.")

		saynn("[say=alexrynard]Up, inmate.[/say]")

		saynn("[say=pc]Huh? How long did I..[/say]")

		saynn("[say=alexrynard]Long enough for me to actually get some stuff done. Now go away.[/say]")

		saynn("Still so cold. Maybe he is just fully content with not having any friends? Maybe his job and his prototypes are all that he needs.")

		saynn("Can't test your prototypes without someone else though..")

		saynn("Maybe you can pester him some other time. For now, you should indeed be heading off.")

		addButton("Leave", "See what happens next", "endthescene")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "why_not"):
		processTime(3*60)
		setFlag("AlexRynardModule.ch1IntroSceneHappened", true)

	if(_action == "do_wait"):
		processTime(30*60)

	if(_action == "just_watch_more"):
		processTime(30*60)

	if(_action == "after_nap"):
		GM.main.processTimeUntil(23*60*60)

	setState(_action)
