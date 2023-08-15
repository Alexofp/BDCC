extends SceneBase

var minigame = null

func _init():
	sceneID = "TaviMasochismScene"
	
	minigame = preload("res://Modules/TaviModule/Chapter6/MasochismMinigame/MasochismMinigame.gd").new()

func _run():
	if(state == ""):
		playAnimation(StageScene.Duo, "stand", {npc="tavi"})
		addCharacter("tavi")
		
		saynn("In this minigame you need to bring Tavi's pain to the exact target value using the actions that you have.")
		
		saynn("Depending on the difficulty, you're gonna have access to different actions.")
		
		saynn("The minigame is gonna be over after a certain amount of actions or if you hold Tavi's pain above the target pain value for more than one turn.")
		
		saynn("Pick the difficulty")
		var masochismScore = getModule("TaviModule").getSkillScore("taviSkillMasochism")
		var difficulties = minigame.getAllDifficulties()
		for _i in range(difficulties.size()): #masochismScore+1
			if(masochismScore >= _i || _i == 0):
				var difficulty = difficulties[_i]
				addButton(str(_i+1)+". "+difficulty["name"], "Pick this difficulty", "start", [_i])
			else:
				var difficulty = difficulties[_i]
				addDisabledButton(str(_i+1)+". "+difficulty["name"], "Raise Tavi's masochism skill")
		
	if(state == "failturns"):
		saynn("You couldn't make Tavi reach the target pain level in the required amount of turns.")
	if(state == "failsafeword"):
		saynn("Tavi hisses and signals you that she is in too much pain. You stop before you actually hurt her.")
		
	if(state in ["failsafeword", "failturns"]):
		addButton("Try again", "Reset the minigame", "tryagain")
		addButton("Give up", "Not worth it", "endthescene")
	
	if(state == "playing"):
		# Show the text of the previous action
		addButtonAt(13, "Give up", "Not worth it", "endthescene")
		addButtonAt(14, "Try again", "Reset the minigame", "tryagain")
	
	if(state == "youwon"):
		saynn("Success!")
		
		# Replace with continue
		#addButton("Try again", "Reset the minigame", "tryagain")
		#addButton("Give up", "Not worth it", "endthescene")
		addButton("Continue", "See what happens next", "start_outcome")
	
	if(state in ["playing", "failturns", "failsafeword", "youwon"]):
		saynn(minigame.getLastText())
		
		var animData = minigame.getAnimation()
		if(animData.size() >= 3):
			playAnimation(animData[0], animData[1], animData[2])
		
		sayn("Target pain: "+str(Util.roundF(minigame.targetPain, 1)))
		sayn("Tavi's current pain: "+str(Util.roundF(minigame.pain, 1)))
		if(minigame.air > 0):
			sayn("Tavi's air: "+str((5 - minigame.air)*20)+"%")
		sayn("")
		saynn("Actions left: "+str(minigame.actionsLeft))
		var currentEffects = minigame.getEffectsReadable()
		if(currentEffects.size() > 0):
			sayn("Current effects:")
			for effect in currentEffects:
				sayn(effect)
			sayn("")
		
		sayn("Available actions:")
		var currentActions = minigame.getActionsReadable()
		for actionID in currentActions:
			var action = currentActions[actionID]
			
			sayn(action["name"]+": "+action["shortdesc"])
			if(state == "playing"):
				addButton(action["name"], action["desc"], "doAction", [actionID])
		sayn("")
	

		
func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "start"):
		minigame.startDifficulty(_args[0])
		setState("playing")
		return

	if(_action == "doAction"):
		processTime(60)
		minigame.doAction(_args[0])
		if(minigame.shouldEndSuccess):
			#print("shouldEndSuccess")
			# Run scene
			setState("youwon")
			getModule("TaviModule").advanceSkill("taviSkillMasochism")
			return
		if(minigame.shouldEndFail):
			#print("shouldEndFail")
			setState("failturns")
			return
		if(minigame.shouldSafeWord):
			#print("shouldSafeWord")
			setState("failsafeword")
		if(minigame.shouldEndUnconscious):
			#print("shouldEndUnconscious")
			# run scene
			endScene()
			runScene("TaviMasochismUnconsciousScene")
			return
		return

	if(_action == "start_outcome"):
		runScene("TaviMasochismOutcomesScene", [minigame.shouldPlayStateOnWin])
		endScene()
		return

	if(_action == "tryagain"):
		minigame.tryAgain()
		setState("playing")
		return

	setState(_action)



func saveData():
	var data = .saveData()

	data["minigame"] = minigame.saveData()

	return data

func loadData(data):
	.loadData(data)

	minigame.loadData(SAVE.loadVar(data, "minigame", {}))
