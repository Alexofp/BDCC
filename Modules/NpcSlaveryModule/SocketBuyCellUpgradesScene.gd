extends SceneBase

var selectedVent = ""

func _init():
	sceneID = "SocketBuyCellUpgradesScene"

func _reactInit():
	return

func _run():
	if(state == ""):
		addCharacter("socket")
		playAnimation(StageScene.Duo, "stand", {npc="socket"})
		
		saynn("Socket shows you a list of upgrades that she can do to your cell.")
		addButtonAt(14, "Back", "Enough shopping", "endthescene")
		
		var howManySlavesSpaces = getModule("NpcSlaveryModule").getSlavesSpace()
		if(howManySlavesSpaces == 0):
			sayn("[b]Cell expansion[/b]")
			sayn("Allows you to keep a single person in your cell. Complete with a metal hook that you can leash them to.")
			saynn("Cost: "+str(getModule("NpcSlaveryModule").getSlavesSpaceUpgradeCost())+" credits")
			addButtonWithChecks("Cell expansion", "Pay for this upgrade", "first_expansion", [], [[ButtonChecks.HasCredits, getModule("NpcSlaveryModule").getSlavesSpaceUpgradeCost()]])
		else:
			sayn("[b]Cell expansion[/b]")
			sayn("Allows you to keep "+str(howManySlavesSpaces+1)+" slaves in your cell.")
			saynn("Cost: "+str(getModule("NpcSlaveryModule").getSlavesSpaceUpgradeCost())+" credits")
			addButtonWithChecks("Cell expansion", "Pay for this upgrade", "do_cell_expansion", [], [[ButtonChecks.HasCredits, getModule("NpcSlaveryModule").getSlavesSpaceUpgradeCost()]])
		var canHaveSlaves = (howManySlavesSpaces > 0)
		
		var hasSybian = getFlag("NpcSlaveryModule.hasSybian", false)
		var sybianPrice = 25
		sayn("[b]Sybian[/b]")
		if(canHaveSlaves):
			sayn("Install a sybian in your cell that you can use yourself or as a reward for your slaves.")
		else:
			sayn("Install a sybian in your cell.")
		saynn("Cost: "+((str(sybianPrice)+" credits") if !hasSybian else "Bought!")+"")
		if(!hasSybian):
			addButtonWithChecks("Sybian", "Pay to get a sybian installed in your cell", "pay_upgrade", ["NpcSlaveryModule.hasSybian", sybianPrice, "Sybian machine has been installed in your cell"], [[ButtonChecks.HasCredits, sybianPrice]])
	
		var hasHorse = getFlag("NpcSlaveryModule.hasWoodenHorse", false)
		var horsePrice = 30
		sayn("[b]Wooden horse[/b]")
		if(canHaveSlaves):
			sayn("Install a wooden horse torture device in your cell that you can use to punish your slaves.")
		else:
			sayn("Install a wooden horse torture device in your cell. For no particular reason.")
		saynn("Cost: "+((str(horsePrice)+" credits") if !hasHorse else "Bought!")+"")
		if(!hasHorse):
			addButtonWithChecks("Wooden horse", "Pay to get a wooden horse installed in your cell", "pay_upgrade", ["NpcSlaveryModule.hasWoodenHorse", horsePrice, "Wooden horse has been installed in your cell"], [[ButtonChecks.HasCredits, horsePrice]])
	
	
	if(state == "do_cell_expansion"):
		saynn("You pay Socket the required amount of credits for the cell expansion upgrade.")
		
		saynn("She goes ahead and expands the wall of your cell, allowing you to store one more person in it if you so desire!")
		
		saynn("The task takes her about an hour.")
		
		addButton("Continue", "See what happens next", "")
	
	if(state == "first_expansion"):
		saynn("The first upgrade looks kinda interesting to you.")
		
		saynn("[say=pc]Cell expansion?[/say]")
		
		saynn("Socket nods many times.")
		
		saynn("[say=socket]Looking at the prison blueprint, all cells seem to have a big buffer behind them. It's all rock.. But you know, I can clear it out![/say]")
		
		saynn("Interesting. Your cell is incredibly cramped currently.")
		
		saynn("[say=pc]Does that upgrade come with an extra bed?[/say]")
		
		saynn("Socket looks at her datapad.. and then shakes her head.")
		
		saynn("[say=socket]Nope! It only involves drilling through the asteroid and pushing the wall back a little.[/say]")

		saynn("Here is hope that she won't drill into open space..")
		
		saynn("[say=socket]So? What do you say?[/say]")
		
		saynn("Cost is "+str(getModule("NpcSlaveryModule").getSlavesSpaceUpgradeCost())+" credits.")
		
		addButtonWithChecks("Agree", "Pay her the credits", "first_expansion_do_pay", [], [[ButtonChecks.HasCredits, getModule("NpcSlaveryModule").getSlavesSpaceUpgradeCost()]])
		addButton("Never mind", "You changed your mind", "")

	if(state == "first_expansion_do_pay"):
		aimCameraAndSetLocName(GM.pc.getCellLocation())
		GM.pc.setLocation(GM.pc.getCellLocation())
		
		saynn("You nod and pay Socket the credits. As you do that, she whips out a giant industrial drill head that consists out of 3 rotating modules with plenty of 'teeth' on each.. Her eyes are burning brightly while she is holding it.")
		
		saynn("[say=socket]Yay. Let's go![/say]")
		
		saynn("You bring Socket to your cell. Huh, other engineers are already there, disassembling the back wall of your cell, revealing the rock behind. Then they help Socket assemble the giant drill.")

		saynn("[say=pc]Why do we have to use pickaxes if this exists?[/say]")
		
		saynn("Socket finishes preparing the drill and then turns it on, making it dig into the rock with a loud growl.")
		
		saynn("[say=socket]Who says we don't? But sometimes you need a softer touch! This baby can ruin your uranium deposits faster than a giant knotted cock can ruin a virgin pussy! Both will cause a huge explosion too![/say]")

		saynn("Yeah, you can see how it basically just grinds any rock into dust. Any kind of resources would be lost with it.")

		saynn("After the drill has done its work, Socket and other engineers quickly assemble the reinforced wall of your cell again, turning it into a cozy metal box again.")

		saynn("[say=socket]There you go. Have fun![/say]")
		
		saynn("The engineers pack up the drill and transport it away. Now it's just you and Socket.")
		
		saynn("[say=socket]Look what you can do now![/say]")
		
		addButton("Look", "See what happens next", "first_expansion_showchains")
		
	if(state == "first_expansion_showchains"):
		playAnimation(StageScene.Duo, "stand", {npc="socket", npcBodyState={chains=[["normal", "neck", "scene", "floor"]]} })
		
		saynn("Socket presents you a chain leash. She clicks one end to her clothing and another to the metal hook on the floor that was previously used as a fulcrum point for the drill.")

		saynn("[say=socket]Tada! Isn't this fun? It's like I'm your personal fucktoy now![/say]")
		
		saynn("She is kinda right.. You walk up to Socket and play with the chain.")
		
		saynn("[say=pc]So I can keep you now?[/say]")
		
		saynn("[say=socket]I have a lot to do, maybe some other time! But you can keep the leash if you want.[/say]")
		
		saynn("She hands you the leash and heads towards the exit.")
		
		saynn("[say=socket]Take care![/say]")
		
		saynn("Looks like now you can keep someone in your cell.")
		
		addButton("Continue", "See what happens next", "endthescenenosocket")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		runScene("SocketTalkScene")
		return
	
	if(_action == "endthescenenosocket"):
		endScene()
		return
	
	if(_action == "pay_upgrade"):
		setFlag(_args[0], true)
		GM.pc.addCredits(-_args[1])
		addMessage(_args[2])
		return
	
	if(_action == "first_expansion_do_pay"):
		processTime(60*60)
		GM.pc.addCredits(-getModule("NpcSlaveryModule").getSlavesSpaceUpgradeCost())
		increaseFlag("NpcSlaveryModule.slavesSpace")
		
	if(_action == "do_cell_expansion"):
		processTime(60*60)
		GM.pc.addCredits(-getModule("NpcSlaveryModule").getSlavesSpaceUpgradeCost())
		increaseFlag("NpcSlaveryModule.slavesSpace")
		
	setState(_action)

func saveData():
	var data = .saveData()

	data["selectedVent"] = selectedVent

	return data

func loadData(data):
	.loadData(data)

	selectedVent = SAVE.loadVar(data, "selectedVent", "")
