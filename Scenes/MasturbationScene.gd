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
			
	if(state == "doAction"):
		saynn(savedActionText)
				
	if(state == "" || state == "doAction"):
		addButtonAt(14, "Stop", "Enough horny", "endthescene")
		
		
		var lustCombatState:LustCombatState = GM.pc.getLustCombatState()
	
		for actionData in lustCombatState.getActions():
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
				addButton(lustAction.getVisibleName(lustCombatState, actionData), lustAction.getVisibleDescription(lustCombatState, actionData), "doAction", [actionData])
			else:
				addDisabledButton(lustAction.getVisibleName(lustCombatState, actionData), reasonWhyCant)
		
		for activity in lustCombatState.getAllText():
			sayn(activity)
	
	if(state == "aboutToCum"):
		saynn("You're about to cum..")
		
		addButton("Cum", "Embrace the orgasm.. If you are in a fight, you will lose and succumb to your enemy", "docum")
		
		if(GM.pc.getStamina() > 0):
			addButton("Deny self", "Go against your will and use 20 stamina to deny yourself the orgasm.", "denyorgasm")
		else:
			addDisabledButton("Deny self", "You don't have enough will to stop now..")
		
	if(state == "docum"):
		saynn("You came hard")
		
		addButton("Continue", "You're not done yet", "")
		addButton("Stop", "That's enough for now..", "endthescene")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		GM.pc.getLustCombatState().resetState()
		GM.pc.updateNonBattleEffects()
		endScene()
		return
	
	if(_action == "doAction"):
		var actionData = _args[0]
		var lustCombatState:LustCombatState = GM.pc.getLustCombatState()
		var lustAction:LustAction = GlobalRegistry.getLustAction(actionData["id"])
		
		var result = lustAction.doAction(lustCombatState, actionData)
		savedActionText = result["text"]
		if("lust" in result):
			GM.pc.addLust(result["lust"])
		
		processTime(30)
		
		if(GM.pc.getLustLevel() >= 1.0):
			setState("aboutToCum")
			return

	if(_action == "denyorgasm"):
		savedActionText = "You denied yourself the orgasm.."
		GM.pc.addStamina(-20)
		
		GM.pc.addLust( -int(float(GM.pc.getLust()) / 2) )
		
		processTime(30)
		
		setState("doAction")
		return
	if(_action == "docum"):
		savedActionText = ""
		
		GM.pc.orgasmFrom("pc")
		
		processTime(60)
		setState("docum")
		return
	
	setState(_action)

func resolveCustomCharacterName(_charID):
	if(_charID == "attacker"):
		return "pc"
	
	return null
