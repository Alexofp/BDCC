extends "res://Scenes/SceneBase.gd"

var savedActionText = ""

func _init():
	sceneID = "MasturbationScene"

func _run():
	if(state == ""):
		var lustCombatState:LustCombatState = GM.pc.getLustCombatState()
		if(lustCombatState.isInPublic()):
			saynn("You are thinking about touching yourself in a public area, how lewd..")
		else:
			saynn("You found yourself a mostly private spot where you can do your things without anyone spotting you..")
			
	if(state == "doLustAction"):
		saynn(savedActionText)
				
	if(state == "" || state == "doLustAction"):
		addButtonAt(14, "Stop", "Enough horny", "endthescene")
		
		
		var lustCombatState:LustCombatState = GM.pc.getLustCombatState()
	
		addLustActionsButtons(lustCombatState, lustCombatState.getActionsSorted())

		for activity in lustCombatState.getAllText():
			sayn(activity)
	
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
	
	if(_action == "doLustAction"):
		var actionData = _args[0]
		var lustCombatState:LustCombatState = GM.pc.getLustCombatState()
		
		var result = lustCombatState.doAction(actionData)
		savedActionText = result["text"]
		if("lust" in result):
			GM.pc.addLust(result["lust"] * 3)
		if("pain" in result):
			GM.pc.addPain(result["pain"])
		
		processTime(30)
		
		if("came" in result):
			setState("lustCombatAfterCame")
			return
		
		if(GM.pc.getLustLevel() >= 1.0):
			setState("lustCombatAboutToCum")
			return

	setState(_action)

func resolveCustomCharacterName(_charID):
	if(_charID == "attacker"):
		return "pc"
	
	return null
