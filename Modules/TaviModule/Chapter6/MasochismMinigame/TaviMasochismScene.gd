extends SceneBase

var minigame = null

func _init():
	sceneID = "TaviMasochismScene"
	
	minigame = preload("res://Modules/TaviModule/Chapter6/MasochismMinigame/MasochismMinigame.gd").new()
	minigame.setChar("tavi")

func _run():
	if(state == ""):
		playAnimation(StageScene.Duo, "stand", {npc="tavi"})
		addCharacter("tavi")
		
		saynn("In this minigame you need to bring Tavi's pain to the exact target value using the actions that you have.")
		
		saynn("The higher the difficulty, the more actions you have and the harder the minigame is gonna be.")
		
		saynn("The minigame is gonna be over after a certain amount of actions or if you hold Tavi's pain above the target pain value for more than one turn.")
		
		saynn("Pick the difficulty")
		#var masochismScore = getModule("TaviModule").getSkillScore("taviSkillMasochism")
		for _i in range(8): #masochismScore+1
			addButton(str(_i), "Pick this difficulty", "start", [_i])
	
	if(state == "playing"):
		# Show the text of the previous action
		
		sayn("Target pain: "+str(Util.roundF(minigame.targetPain, 1)))
		saynn("Tavi's current pain: "+str(Util.roundF(minigame.pain, 1)))
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
		minigame.doAction(_args[0])
		return

	setState(_action)
