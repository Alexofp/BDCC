extends SceneBase

var socketLine = ""

func _init():
	sceneID = "SocketPunishmentScene"

func _reactInit():
	var possible = ["tieup", "tieup"]
	if(!GM.pc.isWearingHypnovisor()):
		possible.append("hypnovisor")
	
	var pickedRandom = RNG.pick(possible)
	
	if(pickedRandom == "hypnovisor"):
		var visor = GlobalRegistry.createItem("HypnovisorMk0")
		visor.restraintData.setLevel(5)
		GM.pc.getInventory().forceEquipStoreOtherUnlessRestraint(visor)
		GM.pc.getInventory().forceEquipStoreOtherUnlessRestraint(GlobalRegistry.createItem("ZiptiesWrist"))
		GM.pc.getInventory().forceEquipStoreOtherUnlessRestraint(GlobalRegistry.createItem("bondagemittens"))
		HypnokinkUtil.raiseSuggestibilityTo(GM.pc, 75)
	
	
	if(pickedRandom == "tieup"):
		var rope = GlobalRegistry.createItem("ropeharness")
		rope.restraintData.setLevel(5)
		GM.pc.getInventory().forceEquipStoreOtherUnlessRestraint(rope)
		GM.pc.getInventory().forceEquipStoreOtherUnlessRestraint(GlobalRegistry.createItem("blindfold"))
		GM.pc.getInventory().forceEquipStoreOtherUnlessRestraint(GlobalRegistry.createItem("ZiptiesAnkle"))
		GM.pc.getInventory().forceEquipStoreOtherUnlessRestraint(GlobalRegistry.createItem("ZiptiesWrist"))
		GM.pc.getInventory().forceEquipStoreOtherUnlessRestraint(GlobalRegistry.createItem("bondagemittens"))
	
	setState(pickedRandom)
	
	socketLine = "Something is wrong! Tell the developer! Wait, why did I say that.."
	var punishReason = getFlag("SocketModule.punishReason", "")
	if(punishReason == "stuckroughfuck"):
		socketLine = "You were very rough with me yesterday! My pussy still hurts."
	elif(punishReason == "stuckroughassfuck"):
		socketLine = "Anal sex with me is a big no-no! My butt is only for groping. Hopefully you will remember that now."
	elif(punishReason == "spikeddrink"):
		socketLine = "I felt strange yesterday. And so I decided to check something. I found signs of a strong aphrodisiac left in my pussy! You wouldn't know anything about that, would you? And you didn't tell me!"
	elif(punishReason == "hadcumafterbrainwash"):
		socketLine = "I don't remember what happened yesterday.. But my butt was hurting and leaking cum! I think you are responsible.. Anal sex with me is a big no-no!"
	return

func _run():
	if(state == ""):
		saynn("Shouldn't see this.")
		
		addButton("Continue", "See what happens next", "endthescene")

	if(state == "tieup"):
		addCharacter("socket")
		playAnimation(StageScene.Hogtied, "idle", {pc="pc"})
		saynn("After a long night, your eyes open..")

		saynn("It's very dark.. Did someone forget to turn on the lights?")

		saynn("You try to rub your eyes.. but quickly realize that you can't, something is preventing you from doing so. Rope! You're tied up to your own bed.")

		saynn("[say=socket]Oh, you're up! Good morning! Wondering why you're blindfolded and tied up?[/say]")

		saynn("Huh. Looks like Socket is punishing you for something.")

		saynn("[say=socket]"+str(socketLine)+"[/say]")

		saynn("Right.. She kinda has the upper hand here.")

		saynn("[say=pc]I'm sorry?[/say]")

		saynn("[say=socket]You are forgiven![/say]")

		saynn("That was quick.")

		saynn("[say=pc]Can you untie me now?[/say]")

		saynn("No answer..")

		saynn("[say=pc]Socket?[/say]")

		saynn("Looks like she left..")

		addButton("Continue", "See what happens next", "escape_loop")
	if(state == "escape_loop"):
		removeCharacter("socket")
		playAnimation(StageScene.Hogtied, "idle", {pc="pc"})
		saynn("You're tied up to your bed in your own cell.")

		addButton("Rest", "Take a breather", "escape_rest")
		addButtonWithChecks("Struggle", "Start struggling against your restraints", "escape_do_struggle", [], [[ButtonChecks.HasStamina]])
		addButtonWithChecks("Get up", "Enough lying around", "escape_do_getup", [], [[ButtonChecks.NotArmsRestrained], [ButtonChecks.NotLegsRestrained], [ButtonChecks.NotWearingItem, "ropeharness"]])
	if(state == "escape_do_getup"):
		playAnimation(StageScene.Solo, "stand")
		saynn("Yay, you managed to get through Socket's little punishment. Huh, you realize that there is a credit chip with a single credit on your pillow. Did Socket leave it?")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "escape_rest"):
		saynn("You give up and try to rest for a bit..")

		addButton("Resting", "You are resting", "escape_rest1")
	if(state == "escape_rest1"):
		saynn("You're resting..")

		addButton("Resting", "You are resting", "escape_rest2")
	if(state == "escape_rest2"):
		saynn("Still resting..")

		addButton("Resting", "You are resting", "escape_rest3")
	if(state == "escape_rest3"):
		saynn("You have rested for some hours..")

		if (GM.main.isVeryLate()):
			saynn("Somehow, you managed to spend the whole day struggling! Time to sleep..")

			addButton("Sleep", "Do sleep", "escape_sleep")
		else:
			addButton("Continue", "See what happens next", "escape_loop")
	if(state == "escape_sleep"):
		saynn("Welcome to a new day! Sleeping while tied up to your bed wasn't the best experience in your life..")

		addButton("Continue", "See what happens next", "socket_decides_to_save")
	if(state == "socket_decides_to_save"):
		addCharacter("socket")
		playAnimation(StageScene.Duo, "stand", {npc="socket"})
		saynn("Suddenly you feel someone untying you from the bed!")

		saynn("[say=socket]Hey, I felt bad leaving you like this for the whole day. Sorry![/say]")

		saynn("Wow, what a kind fennec.")

		saynn("[say=pc]It's okay. Gonna untie me now?[/say]")

		if (GM.pc.isBlindfolded()):
			saynn("No response.. again..")

			saynn("[say=pc]Right..[/say]")

		else:
			saynn("Socket smiles and just walks away. Right..")

		saynn("At least you're free. Kinda.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "hypnovisor"):
		addCharacter("socket")
		playAnimation(StageScene.Duo, "stand", {npc="socket"})
		saynn("After a long night, you open your eyes.. and realize that the world looks so much more alive. The only problem is that your arms seem to be tied up..")

		saynn("[rainbow freq=0.05 sat=0.9 val=1.0]Everything is so colorful.[/rainbow]")

		saynn("[say=socket]Good morning! Slept well?[/say]")

		saynn("You get up off your bed and see Socket standing near. You feel like.. she did it to you.. you feel like you should thank her..")

		saynn("[say=pc]Yes, thank you![/say]")

		saynn("Socket giggles.")

		saynn("[say=socket]Wonder why I did it?[/say]")

		saynn("You shake your head. Why care about such things..")

		saynn("Socket giggles again.")

		saynn("[say=socket]"+str(socketLine)+"[/say]")

		saynn("Right..")

		saynn("[say=pc]I'm very sorry, won't happen again ever never forever![/say]")

		saynn("[say=socket]You are forgiven![/say]")

		saynn("That was quick. You nod. Socket nods.")

		saynn("Socket leaves..")

		saynn("Looks like you get to keep the visor. She is so nice, isn't she?")

		addButton("Continue", "See what happens next", "endthescene")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "escape_do_struggle"):
		runScene("StrugglingScene", [true, false], "escape_struggle")
		return

	if(_action == "escape_do_getup"):
		GM.pc.addCredits(1)

	if(_action == "escape_rest1"):
		processTime(60*60)
		GM.pc.addStamina(15)

	if(_action == "escape_rest2"):
		processTime(60*60)
		GM.pc.addStamina(15)

	if(_action == "escape_rest3"):
		processTime(70*60)
		GM.pc.addStamina(15)

	if(_action == "escape_sleep"):
		GM.main.startNewDay()
		GM.pc.afterSleepingInBed()

	setState(_action)

func _react_scene_end(_tag, _result):
	if(_tag == "escape_struggle"):
		processTime(5*60)
		setState("escape_loop")

func saveData():
	var data = .saveData()

	data["socketLine"] = socketLine

	return data

func loadData(data):
	.loadData(data)

	socketLine = SAVE.loadVar(data, "socketLine", "")
