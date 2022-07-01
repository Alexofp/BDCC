extends "res://Scenes/SceneBase.gd"

var savedActionText = ""

func _init():
	sceneID = "MasturbationScene"

func _run():
	if(state == ""):
		GM.main.playAnimation(StageScene.Solo, "stand")
		
		var lustCombatState:LustCombatState = GM.pc.getLustCombatState()
		if(GM.pc.getLocation() == GM.pc.getCellLocation()):
			#(if in cell)
			if(RNG.chance(50)):
				saynn("You look around, the cell seems to be mostly secluded, you should be safe as long as nobody peeks through the reinforced window. But that thought only sparks up more desire in you. You feel kinda horny, maybe it’s a good time to blow some steam off..")
			else:
				saynn("You’re standing in your cell, alone. There are lots of inmates outside but nobody seems to be paying attention to the cell’s window so you should be safe as long as you’re careful. Maybe you can expose yourself a bit without anyone noticing here..")
		elif(!lustCombatState.isInPublic()):
			#(if in private place)
			if(RNG.chance(50)):
				saynn("You take a look around. It’s mostly quiet. The idea of doing some naughty things suddenly crosses your lusty mind. This isn’t your cell but this spot is mostly out of the way so you should be safe as long as you’re fast and nobody notices you. You walk around a bit to make sure there is no one around, your face already starts to glow slightly red, you are so excited.")
			
				saynn("[say=pc]Anyone here?[/say]")
			else:
				saynn("Horny thoughts invade your mind as you stand in this room. It’s a public place but right now there is no one around so it’s your chance. And even if somebody walks in on you, maybe it’s not such a bad thing..")
				
				saynn("[say=pc]Some privacy. good..[/say]")
		else:
			#(if in public place)
			if(GM.pc.getSkillLevel(Skill.Exhibitionism) < 1):
				saynn("You look around, there are people around, lots of them in fact. Doing something lewd would surely get somebody’s attention.. But you are feeling kinda horny, the idea of teasing yourself in public sounds so hot right now.. Just gotta make sure to not get noticed.. You walk around a bit, trying to find a better spot, making sure not to catch too many eyes. Hands travel along your curves, your face is blushing red already..")
				
				if(GM.pc.getExposedPrivates().size() > 0):
					saynn("Your face only gets more flustered as you try to cover your exposed privates as best you can. [b]You're not brave enough to do anything sexual.[/b]")
				
				saynn(RNG.pick([
					"[say=pc]What am I doing..[/say]",
					"[say=pc]Should I stop.. But..[/say]",
					"[say=pc]I’m gonna get caught.. I can’t..[/say]",
				]))
			elif(GM.pc.getSkillLevel(Skill.Exhibitionism) < 2):
				saynn("It’s a public place, you see people around, doing their things. You wonder how much you can get away with, the idea of exposing yourself crosses your mind and you can’t resist it, you feel aroused already. If you’re careful, people shouldn’t even notice you.. Maybe you do want them to notice.. You don’t really wanna hide and decide to stay mostly in the open, so risky..")
				
				saynn(RNG.pick([
					"[say=pc]I can’t believe myself..[/say]",
					"[say=pc]Why do I want this so much..[/say]",
					"[say=pc]Why does it feel so nice..[/say]",
				]))
			else:
				saynn("The thought of doing something lewd in public excites you immensely. There are people around but you don’t even mind them, you’re so horny!")
				
				saynn("You’re so tempted to start exposing yourself, maybe more than that. After all the practice you feel very confident in showing off your body. Your cheeks blush red, you can’t wait to get started.")
				
				saynn(RNG.pick([
					"[say=pc]I so wanna touch myself..[/say]",
					"[say=pc]Everyone’s watching.. Good.[/say]",
					"[say=pc]Wonder how long will it take before I get noticed~[/say]",
				]))
			
	if(state == "doLustAction"):
		saynn(savedActionText.trim_suffix("\n\n"))
				
	if(state == "" || state == "doLustAction"):
		addButtonAt(13, "Do nothing", "Try not to attract any attention", "doidle")
		addButtonAt(14, "Stop", "Enough horny", "endthescene")
		
		
		var lustCombatState:LustCombatState = GM.pc.getLustCombatState()
	
		addLustActionsButtons(lustCombatState, lustCombatState.getActionsSorted())

		for activity in lustCombatState.getAllText():
			sayn(activity)
		
		if(lustCombatState.isInPublic()):
			var visibility = lustCombatState.getVisibility()
			sayn("\nVisibility: "+Util.textProgressBar(visibility)+" "+str(Util.roundF(visibility*100, 1))+"%")
			var danger = lustCombatState.getDanger()
			if(danger > 0.0):
				sayn("Danger: "+Util.textProgressBar(danger)+" "+str(Util.roundF(danger*100, 1))+"%")
		
	if(state == "lustCombatAboutToCum"):
		saynn(savedActionText)
		
		saynn("You're about to cum..")
		
		var lustCombatState:LustCombatState = GM.pc.getLustCombatState()
		addLustActionsButtons(lustCombatState, lustCombatState.getOrgasmActionsSorted())
		
	if(state == "lustCombatAfterCame"):
		saynn(savedActionText)
		
		addButton("Continue", "You're not done yet", "")
		addButton("Stop", "That's enough for now..", "endthescene")

func addLustActionsButtons(lustCombatState:LustCombatState, theActions):
	for actionData in theActions:
		var lustAction:LustAction = GlobalRegistry.getLustAction(actionData["id"])
		
		if(!lustAction.shouldShow(lustCombatState, actionData)):
			continue
		var canDo = lustAction.canDo(lustCombatState, actionData)
		var reasonWhyCant = "You can't do this right now"
		if(canDo is Array):
			if(canDo.size() > 1):
				reasonWhyCant = canDo[1]
			canDo = canDo[0]
		
		if(canDo):
			addButton(lustAction.getVisibleName(lustCombatState, actionData), lustAction.getVisibleDescription(lustCombatState, actionData), "doLustAction", [actionData])
		else:
			addDisabledButton(lustAction.getVisibleName(lustCombatState, actionData), reasonWhyCant)
	

func _react(_action: String, _args):
	if(_action == "endthescene"):
		GM.pc.getLustCombatState().resetState()
		GM.pc.updateNonBattleEffects()
		endScene()
		return
	
	if(_action == "doidle"):
		processTime(30)
		var lustCombatState:LustCombatState = GM.pc.getLustCombatState()
		
		lustCombatState.processLewdTurn()
		
		savedActionText = "You decide to idle for a bit"
		#GM.pc.addLust(-1)
		
		checkDanger()
		
		setState("doLustAction")
		return
	
	if(_action == "doLustAction"):
		processTime(30)
		
		var actionData = _args[0]
		var lustCombatState:LustCombatState = GM.pc.getLustCombatState()
		
		var result = lustCombatState.doAction(actionData)
		savedActionText = result["text"]
		if("lust" in result):
			GM.pc.addLust(result["lust"] * 4)
		if("pain" in result):
			GM.pc.addPain(result["pain"])
		
		if("came" in result):
			lustCombatState.stopActivities()
			setState("lustCombatAfterCame")
			return
		
		if(GM.pc.getLustLevel() >= 1.0):
			setState("lustCombatAboutToCum")
			return
			
		checkDanger()

	setState(_action)

func checkDanger():
	var lustCombatState:LustCombatState = GM.pc.getLustCombatState()
	var newDanger = lustCombatState.getDanger()
	if(lustCombatState.isInPublic() && newDanger >= 1.0):
		print("SPOTTED")
		lustCombatState.resetDanger()
		var population = GM.pc.getLocationPopulation()
		if(population.size() > 0):
			var randomPop = RNG.pick(population)
			var sceneID
			if(randomPop == WorldPopulation.Inmates):
				sceneID = GM.main.getRandomSceneFor(RandomSceneType.MasturbationSpottedInmate)
			if(randomPop == WorldPopulation.Guards):
				sceneID = GM.main.getRandomSceneFor(RandomSceneType.MasturbationSpottedGuard)
			
			if(sceneID != null && sceneID != ""):
				GM.pc.getLustCombatState().resetState()
				GM.pc.updateNonBattleEffects()
				endScene()
				runScene(sceneID)

func resolveCustomCharacterName(_charID):
	if(_charID == "attacker"):
		return "pc"
	
	return null

func saveData():
	var data = .saveData()
	
	data["savedActionText"] = savedActionText
	
	return data
	
func loadData(data):
	.loadData(data)
	
	savedActionText = SAVE.loadVar(data, "savedActionText", "")
