extends SceneBase

var didFuck = false
var didSave = false

func _init():
	sceneID = "jackiCh2s1Intro"

func _run():
	if(state == ""):
		addCharacter("jacki")
		didFuck = getFlag("JackiModule.Jacki_StocksPunishedByPC", false)
		didSave = !getFlag("JackiModule.Jacki_StocksPCLostFight", false)
		playAnimation(StageScene.Solo, "kneel", {pc="jacki"})
		if (didFuck):
			saynn("Huh. You look around and suddenly your gaze finds a familiar wolfie. The one that you.. had fun with.. before.")

			saynn("Her name was.. Jacki.. wasn't it? Eh, it doesn't matter much. This time she is looking way less.. constrained.. She is just sitting on one of the yoga mats, her eyes closed. Might as well say hi to her and see her reaction.")

		elif (didSave):
			saynn("Huh. You look around and suddenly your gaze finds a familiar wolfie. The one that you managed to save from some hungry inmates!")

			saynn("Her name was.. Jacki.. wasn't it? Yeah, it must be. She is just sitting on one of the yoga mats, her eyes closed. Might as well check on her and see if she is alright.")

		else:
			saynn("Huh. You look around and suddenly your gaze finds a familiar wolfie. The one that you tried to save.. but couldn't quite do it. Oh well, can't save them all, right?")

			saynn("Her name was.. Jacki.. wasn't it? Yeah, it must be. She is just sitting on one of the yoga mats, her eyes closed. Might as well check on her and see if she is alright.")

		addButton("Say Hi", "Talk with the wolfie", "say_hi")
	if(state == "say_hi"):
		playAnimation(StageScene.Duo, "stand", {npc="jacki", npcAction="kneel"})
		if (didFuck):
			saynn("You walk up to her and shake her shoulder. Wolfie instantly jerks to the side, spooked by your sudden gesture.")

			saynn("[say=pc]Well, hello there.[/say]")

			saynn("She opens her eyes wide.. and then frowns.")

			saynn("[say=jacki]It's you.[/say]")

			saynn("[say=pc]Aw, you sound disappointed.[/say]")

			saynn("She shows off her canine fangs. The wolfie can certainly.. bite.")

			saynn("[say=jacki]Why wouldn't I be? You fucked me.[/say]")

			saynn("You can't deny that it's a fair point.")

			addButton("Threats", "Let the wolfie know where her place is", "do_threat")
			addButton("Apology", "Try to smooth it out", "do_apology")
		elif (didSave):
			saynn("You walk up to her, careful not to scare her away.")

			saynn("[say=pc]Hey, it's me.[/say]")

			saynn("Jacki shivers when she hears someone's voice, her tail puffing up. But then she opens her eyes and.. calms down.")

			saynn("[say=jacki]Oh. Heya.[/say]")

			saynn("[say=pc]How are you doing?[/say]")

			saynn("Wolfie shrugs.")

			saynn("[say=jacki]I'm okay, thank you. What about you?[/say]")

			saynn("Looks like she is still a little jumpy after that incident.")

			addButton("I'm fine", "Say that you're okay", "say_okay")
			addButton("I'm horny", "Say that you are quite horny", "say_horny")
		else:
			saynn("You walk up to her, keeping a fair amount of distance to not scare her away.")

			saynn("[say=pc]Hey..[/say]")

			saynn("Jacki shivers when she hears someone's voice, her tail puffing up. But then she opens her eyes and.. calms down somewhat.")

			saynn("[say=jacki]Oh. Hi.[/say]")

			saynn("She seems quite cold to you.")

			saynn("[say=pc]About last time..[/say]")

			saynn("[say=jacki]You did your best, I know. It was just.. not quite enough to save me.[/say]")

			saynn("That was.. quite direct. Her words make you feel somewhat guilty. But was it even your fault though?")

			addButton("Apologize", "Say that you're sorry about it", "say_sorry")
			addButton("Her fault", "Say that she got herself into that situation", "say_herfault")
	if(state == "do_threat"):
		setFlag("JackiModule.jackiAnger", 0.7)
		saynn("You chuckle softly.")

		saynn("[say=pc]And I would have done it again. That ass deserves to be used.[/say]")

		saynn("Jacki squints and growls at you. She clearly isn't happy about your actions.")

		saynn("As you try to reach your hand out and pat her, she snarls at you.")

		saynn("[say=pc]What? You think your orange uniform will keep you from becoming a slut? Hah.[/say]")

		saynn("[say=jacki]Go away already.[/say]")

		saynn("You tilt your head slightly and keep eye contact with her for a few seconds. She got the message.")

		saynn("[say=pc]What? You won't let me watch whatever you're doing here?[/say]")

		saynn("[say=jacki]Go. Away.[/say]")

		saynn("You look around. Eyes of some inmates are directed towards you, making you feel uneasy. You will make her understand. When the time is right.")

		addButton("Step back", "Enough threats", "start_talk")
	if(state == "do_apology"):
		setFlag("JackiModule.jackiAnger", 0.3)
		saynn("You lower your head a little and look at the floor.")

		saynn("[say=pc]Well. My bad.[/say]")

		saynn("Jacki hears your attempt at an apology.. and huffs.")

		saynn("[say=jacki]That's all?[/say]")

		saynn("[say=pc]Your ass was just.. too inviting. You know? It's too nice.[/say]")

		saynn("Your weird compliment confuses the wolfie.")

		saynn("[say=pc]Still. I'm sorry.[/say]")

		saynn("She sighs.. and still frowns at you. Just a little less than before.")

		addButton("Step back", "Enough apologies", "start_talk")
	if(state == "say_okay"):
		setFlag("JackiModule.jackiAnger", -0.2)
		saynn("[say=pc]I'm doing fine. Was just checking if you're alright.[/say]")

		saynn("Jacki offers you a small kind smile.")

		saynn("[say=jacki]Yeah. Just preparing to do some yoga.[/say]")

		saynn("You nod and prepare to leave. But Jacki stops you.")

		saynn("[say=jacki]You can watch if you want.[/say]")

		saynn("Huh. Being kind to her did help her to open up somewhat it seems.")

		addButton("Stay", "See what you can do", "start_talk")
	if(state == "say_horny"):
		setFlag("JackiModule.jackiAnger", 0.3)
		saynn("[say=pc]Yeah, I'm okay too. Just.. horny.. you know?[/say]")

		saynn("Jacki tilts her head and frowns while looking at you.")

		saynn("[say=pc]Do you still have your pussy stitched up? Just curious.[/say]")

		saynn("Oops, that made her growl at you. Looks like the answer is probably yes.")

		saynn("[say=pc]What?[/say]")

		saynn("[say=jacki]I'm not a slut. Go away.[/say]")

		saynn("Oh well. She is not a slut right now, Jacki is right on that one.")

		addButton("Step back", "Enough talking", "start_talk")
	if(state == "say_sorry"):
		setFlag("JackiModule.jackiAnger", -0.1)
		saynn("[say=pc]Yeah. Sorry for that. I understand if you would want me to leave.[/say]")

		saynn("You turn around and prepare to leave.. But Jacki stops you.")

		saynn("[say=jacki]It's okay. I'm sorry too. Went a little too hard on you.[/say]")

		saynn("You offer her an understanding smile.")

		saynn("[say=pc]Whatcha doing?[/say]")

		saynn("Jacki looks at herself.")

		saynn("[say=jacki]Preparing to do some yoga. You're gonna watch?[/say]")

		saynn("[say=pc]I don't know.[/say]")

		saynn("Jacki smiles.")

		saynn("[say=jacki]I'm not hiding.[/say]")

		saynn("Well, fair enough.")

		addButton("Stay", "Enough apologizing", "start_talk")
	if(state == "say_herfault"):
		setFlag("JackiModule.jackiAnger", 0.3)
		saynn("[say=pc]Well.. It's kinda your fault though, isn't it?[/say]")

		saynn("Jacki gets caught a little off guard by your sudden accusation.")

		saynn("[say=jacki]What? What do you mean?[/say]")

		saynn("[say=pc]If you didn't pee where you weren't supposed to, all of it wouldn't happen to you.[/say]")

		saynn("Jacki parts her lips but no words come out. She tilts her head.. and then growls instead.")

		saynn("[say=jacki]You mean I should have pissed my pants?[/say]")

		saynn("You shrug.")

		saynn("[say=pc]I could have just walked past, you know? But I tried to save you.[/say]")

		saynn("[say=jacki]Yeah, maybe you should have.[/say]")

		saynn("Ouch. She is kinda rude, isn't she? Might be worth teaching her a lesson or two. But her growling makes everyone around look at you. Makes you feel uneasy. Might as well let her calm down.")

		addButton("Step back", "Enough talking", "start_talk")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "say_hi"):
		processTime(3*60)

	if(_action == "start_talk"):
		runScene("jackiCh2s2GymScene")
		endScene()
		return

	setState(_action)

func saveData():
	var data = .saveData()

	data["didFuck"] = didFuck
	data["didSave"] = didSave

	return data

func loadData(data):
	.loadData(data)

	didFuck = SAVE.loadVar(data, "didFuck", false)
	didSave = SAVE.loadVar(data, "didSave", false)
