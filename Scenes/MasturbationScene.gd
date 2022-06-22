extends "res://Scenes/SceneBase.gd"

var savedActionText = ""

func _init():
	sceneID = "MasturbationScene"

func _run():
	if(state == ""):
		pass
	
	if(state == "doAction"):
		saynn(savedActionText)
				
	if(state == "" || state == "doAction"):
		var lustCombatState:LustCombatState = GM.pc.getLustCombatState()
	
		for actionData in lustCombatState.getActions():
			var lustAction:LustAction = GlobalRegistry.getLustAction(actionData["id"])
			
			addButton(lustAction.getVisibleName(lustCombatState, actionData), lustAction.getVisibleDescription(lustCombatState, actionData), "doAction", [actionData])
		
		addButton("Close", "Enough horny", "endthescene")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return
	
	if(_action == "doAction"):
		var actionData = _args[0]
		var lustCombatState:LustCombatState = GM.pc.getLustCombatState()
		var lustAction:LustAction = GlobalRegistry.getLustAction(actionData["id"])
		
		var result = lustAction.doAction(lustCombatState, actionData)
		savedActionText = result["text"]

	
	setState(_action)

func resolveCustomCharacterName(_charID):
	if(_charID == "attacker"):
		return "pc"
	
	return null
