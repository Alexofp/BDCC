extends SceneBase

var howManyTimes = 0

func _init():
	sceneID = "AlexS4FixingDatapadsScene"

func _initScene(_args = []):
	addCharacter("alexrynard")
	howManyTimes = getFlag("AlexRynardModule.ch1HowMoreIdles", 0)
	
	if(howManyTimes == 0):
		setState("first_time")
		increaseFlag("AlexRynardModule.ch1HowMoreIdles")
		return
	if(howManyTimes == 1):
		setState("time2")
		increaseFlag("AlexRynardModule.ch1HowMoreIdles")
		return
	if(howManyTimes == 2):
		setState("time3")
		increaseFlag("AlexRynardModule.ch1HowMoreIdles")
		return
	if(howManyTimes == 3 || true):
		setState("time4")
		increaseFlag("AlexRynardModule.ch1HowMoreIdles")
		return

func _run():
	if(state == ""):
		addCharacter("alexrynard")
	if(state == "first_time"):
		playAnimation(StageScene.Duo, "sit", {npc="alexrynard", npcAction="sit"})
		saynn("You join Alex. And today is the first time you are allowed to help!")

		saynn("[say=alexrynard]Don't get too excited. See these ones? Replace the batteries.[/say]")

		saynn("That's pretty easy. Even if boring.")

		saynn("You begin by grabbing one of the broken devices, removing the battery cover and pulling out the old battery. This one was particularly leaky so you grab some alcohol wipes and quickly clean it all before slotting in the new battery.")

		saynn("Alex checks your every action. Makes you feel uneasy a bit. But it also causes you to be very careful.")

		saynn("After you replace a few batteries, he nods and proceeds to try to repair the most destroyed datapads. Ones that are pretty unsalvageable.")

		saynn("You wonder if you could ask him stuff now.")

		saynn("[say=pc]Why aren't other engineers helping you?[/say]")

		saynn("[say=alexrynard]It's a hard and tedious task. Engineers here don't have the patience. Can't blame them, I wouldn't be doing this either if the captain didn't order me to.[/say]")

		saynn("Huh.")

		saynn("[say=pc]Was that some kind of punishment?[/say]")

		saynn("[say=alexrynard]Punishment? Nah. Cap just wants to keep me busy I guess.[/say]")

		saynn("[say=pc]Any reason why?[/say]")

		saynn("Alex frowns.")

		saynn("[say=alexrynard]Are you here to help or distract?[/say]")

		saynn("Fair enough. You decide to stay quiet for now, just replacing the batteries.")

		addButton("Continue", "See what happens next", "skiphours_check")
	if(state == "toolate"):
		saynn("Time flies.. The engineer's shift comes to an end, just on time.")

		if (!getFlag("AlexRynardModule.ch1CommentedPay")):
			setFlag("AlexRynardModule.ch1CommentedPay", true)
			saynn("[say=alexrynard]Here.[/say]")

			saynn("Alex hands you a chip.")

			saynn("[say=pc]Huh?[/say]")

			saynn("[say=alexrynard]One work credit. I figured I might as well pay you something.[/say]")

			saynn("Not a lot for a whole day.. but better than nothing.")

		else:
			saynn("[say=alexrynard]Here. Thanks for the help.[/say]")

			saynn("Alex hands you a chip.")

		saynn("Time to go..")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "aftersomefixing"):
		saynn("Time flies. You and Alex fix a few more datapads.")

		saynn("[say=alexrynard]Let's pause for now.[/say]")

		saynn("He carefully puts his tools and unfinished work away into one of the drawers and then locks it.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "time2"):
		playAnimation(StageScene.Duo, "sit", {npc="alexrynard", npcAction="sit"})
		saynn("You and Alex sit nearby. Both of you begin fixing the broken datapads.")

		saynn("Not much happens today. But you fix most of the simple ones that only require the battery change!")

		addButton("Continue", "See what happens next", "skiphours_check")
	if(state == "time3"):
		playAnimation(StageScene.Duo, "sit", {npc="alexrynard", npcAction="sit"})
		saynn("You decide to take a look at the pile of broken datapads. It certainly.. shrinked a bit. Yay")

		saynn("That gives you a motivation boost to continue.")

		saynn("[say=alexrynard]You can try these ones. Replace the display matrices and buttons where needed.[/say]")

		saynn("Oh, that shouldn't be too hard. Alex watches as you grab one of the datapads, unscrew the front panel, carefully disconnect the display from the main board, before replacing it. After seeing you do that a few times, he starts repairing too.")

		saynn("[say=pc]What are you gonna do when we finish going through the backlog?[/say]")

		saynn("[say=alexrynard]I doubt that we will.[/say]")

		saynn("[say=pc]We might.[/say]")

		saynn("[say=alexrynard]The death of the universe will happen first.[/say]")

		saynn("[say=pc]Still.[/say]")

		saynn("[say=alexrynard]I prefer not to have dreams. They will be stolen anyway.[/say]")

		saynn("Wow, what a buzzkill.")

		saynn("Suddenly, his personal datapad beeps and boops.")

		saynn("[say=alexrynard]Ah, dammit. I gotta go do something.[/say]")

		saynn("[say=pc]Can I come?[/say]")

		saynn("[say=alexrynard]Nah, it's personal. In fact, I'd prefer it if you stayed here but didn't touch the datapads while I'm away.[/say]")

		saynn("[say=pc]I won't.[/say]")

		saynn("He shakes his head and produces some.. zip ties.")

		saynn("[say=alexrynard]We both know that you will. Hands behind your back.[/say]")

		saynn("Is he gonna..")

		addButton("Hands behind back", "Do as he says", "time3_tie")
	if(state == "time3_tie"):
		playAnimation(StageScene.Duo, "sit", {npc="alexrynard", npcAction="stand"})
		saynn("Might as well trust him. You bring your hands behind your back and wait while Alex uses the zip ties to bind your wrists to the chair. Kinky.")

		saynn("[say=alexrynard]I know that you can fix things. I don't trust you not to break things.[/say]")

		saynn("[say=pc]What?[/say]")

		saynn("[say=alexrynard]I gotta go.[/say]")

		saynn("He leaves in a hurry.")

		addButton("Continue", "See what happens next", "time3_alexleaves")
	if(state == "time3_alexleaves"):
		removeCharacter("alexrynard")
		playAnimation(StageScene.Solo, "sit")
		saynn("Some time passes..")

		saynn("You're sitting alone behind one of the work tables. Not much you can do.")

		saynn("You're so bored that you begin tugging on the restraints.")

		saynn("And.. huh.. Looks like Alex didn't secure them properly. You feel like you might escape if you keep trying.")

		saynn("He might get angry if you do that. But maybe that will also prove him wrong?")

		addButton("Stay still", "Just let the boredom consume you", "time3_bored")
		addButton("Tug more", "Try to escape the bindings", "time3_escape")
	if(state == "time3_bored"):
		saynn("Better not to anger the foxy and just sit still.")

		saynn("It's not exactly thrilling.. but at least you're not breaking his trust.")

		addButton("Continue", "See what happens next", "time3_bored_return")
	if(state == "time3_bored_return"):
		addCharacter("alexrynard")
		playAnimation(StageScene.Duo, "sit", {npc="alexrynard"})
		saynn("Alex returns soon enough. He sees that your hands are still bound.. but still checks if the tools or datapads were touched.")

		saynn("[say=alexrynard]Good job, you did it.[/say]")

		saynn("Alex sounds a bit sarcastic. In a kind way.")

		saynn("[say=pc]Thanks. Do you mind?[/say]")

		saynn("[say=alexrynard]Right, I almost forgot.[/say]")

		saynn("He takes off the zipties off your hands.")

		saynn("[say=pc]You don't strike me as a forgetful type.[/say]")

		saynn("[say=alexrynard]It's like you're implying something.[/say]")

		saynn("He smiles softly.")

		saynn("After all that, you and him return to fixing datapads.")

		addButton("Continue", "See what happens next", "skiphours_check")
	if(state == "time3_escape"):
		playAnimation(StageScene.Solo, "sit")
		saynn("Yeah, you will prove to him that he can trust you.")

		saynn("You tug on the zip ties more and more, gradually loosening them. Takes some time.. but eventually you manage to pull your wrists out!")

		saynn("And now.. Time to do nothing again.")

		addButton("Continue", "", "time3_escape_return")
	if(state == "time3_escape_return"):
		addCharacter("alexrynard")
		playAnimation(StageScene.Duo, "sit", {npc="alexrynard"})
		saynn("Alex returns soon enough. He quickly notices that your hands aren't bound, you weren't really hiding that. It seems like he wants to get angry.. so might as well strike first.")

		saynn("[say=pc]See? I didn't touch anything, exactly like you said. You only said not to touch.[/say]")

		saynn("The foxy changes in face as he realizes.. that you're not wrong.")

		saynn("[say=alexrynard]I guess I gotta formulate the rules better.[/say]")

		saynn("[say=pc]Please do, I will make sure to find new ways around them.[/say]")

		saynn("[say=alexrynard]Hah.[/say]")

		saynn("He smiles softly.")

		saynn("After all that, you and him return to fixing datapads.")

		addButton("Continue", "See what happens next", "skiphours_check")
	if(state == "time4"):
		playAnimation(StageScene.Duo, "sit", {npc="alexrynard", npcAction="sit"})
		saynn("Time to do some more datapad fixing! You and Alex are fixing them faster than the new ones arrive, allowing you to keep shrinking the pile.")

		saynn("And Alex also allows you to fix pretty much any datapad, maximizing your and his efficiency.")

		addButton("Continue", "See what happens next", "skiphours_special_check")
	if(state == "offer_hypno"):
		playAnimation(StageScene.Duo, "stand", {npc="alexrynard"})
		saynn("It's getting late.. Foxy's shift is probably about to end so you begin to put away all the tools and unfinished work.")

		saynn("[say=alexrynard]Hey. Have a minute?[/say]")

		saynn("This feels.. different.")

		saynn("[say=pc]What's up?[/say]")

		saynn("Alex scratches the back of his head.")

		saynn("[say=alexrynard]I have a lot more free time lately. So, you know, thanks.[/say]")

		saynn("[say=pc]Yeah, it's okay.[/say]")

		saynn("He nods.")

		saynn("[say=alexrynard]And since I don't have to stress about these repairs as much, I actually had some time to work on my own prototypes.[/say]")

		saynn("[say=pc]Like the portal panties? That's nice.[/say]")

		saynn("[say=alexrynard]Yeah, something like that. I actually wanted to show one to the captain, see what he thinks about it.[/say]")

		saynn("He scratches behind his head again.")

		saynn("[say=pc]Is there some problem with that?[/say]")

		saynn("[say=alexrynard]Well, I kinda need to test it first. Make sure the thing works even.[/say]")

		saynn("You get a sneaking suspicion about why he is telling you this.")

		saynn("[say=pc]You need me to be the test subject again?[/say]")

		saynn("[say=alexrynard]Well.. yeah. This particular prototype I can't test alone.[/say]")

		saynn("[say=pc]What is it?[/say]")

		saynn("Alex stays silent for a second.")

		saynn("[say=alexrynard]You would kinda have to trust me.[/say]")

		saynn("[say=pc]Could it.. kill me?[/say]")

		saynn("He looks at the ceiling and rubs his chin.")

		saynn("[say=alexrynard]It shouldn't. I will be nearby.[/say]")

		saynn("Very inspiring. Still. Do you wanna help him?")

		addButton("Agree", "Agree to test his prototype", "start_hypnoscene")
		addButton("Not today", "You don't feel like doing it today", "hypno_nottoday")
	if(state == "hypno_nottoday"):
		saynn("You begin thinking about the best way to say no.")

		saynn("[say=pc]Not today, I'm pretty tired.[/say]")

		saynn("He nods.")

		saynn("[say=alexrynard]Alright, I understand.[/say]")

		saynn("Time to go.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "start_hypnoscene"):
		saynn("[say=pc]Sure. Do you wanna do it now or?[/say]")

		saynn("He smiles and nods.")

		saynn("[say=alexrynard]Yeah, now would be nice. Follow me, inmate.[/say]")

		saynn("Inmate, huh.")

		addButton("Follow", "See where he brings you", "start_thehypno")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "skiphours_check"):
		processTime(RNG.randi_range(6,9) * 60 * 60)
		
		if(GM.main.isVeryLate()):
			setState("toolate")
			GM.pc.addCredits(1)
			addMessage("You received 1 credit!")
		else:
			setState("aftersomefixing")
			if(getFlag("AlexRynardModule.ch1CommentedPay")):
				GM.pc.addCredits(1)
				addMessage("You received 1 credit!")
		return

	if(_action == "time3_tie"):
		processTime(25*60)
		GM.pc.getInventory().forceEquipStoreOtherUnlessRestraint(GlobalRegistry.createItem("ZiptiesWrist"))

	if(_action == "time3_alexleaves"):
		processTime(60*60)

	if(_action == "time3_bored"):
		processTime(10*60)

	if(_action == "time3_escape"):
		processTime(10*60)
		GM.pc.freeArmsDeleteAll()

	if(_action == "time3_bored_return"):
		processTime(10*60)
		GM.pc.freeArmsDeleteAll()

	if(_action == "time3_escape_return"):
		processTime(10*60)

	if(_action == "skiphours_special_check"):
		processTime(RNG.randi_range(6,9) * 60 * 60)
		
		if(GM.main.isVeryLate()):
			setState("offer_hypno")
		else:
			setState("aftersomefixing")
		return

	if(_action == "start_thehypno"):
		setFlag("AlexRynardModule.ch1HypnovisorHappened", true)
		runScene("AlexS5HypnovisorIntroScene")
		endScene()
		return

	setState(_action)

func saveData():
	var data = .saveData()

	data["howManyTimes"] = howManyTimes

	return data

func loadData(data):
	.loadData(data)

	howManyTimes = SAVE.loadVar(data, "howManyTimes", 0)
