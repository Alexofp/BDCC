extends SceneBase

func _init():
	sceneID = "PSMilkCafeGameplayScene"

func _run():
	if(state == ""):
		playAnimation(StageScene.Solo, "stand")
		
		say(GM.main.PS.getFinalText())
		var theActions:Array = GM.main.PS.getFinalActions()
		for actionEntry in theActions:
			var theIndx:int = actionEntry[0]
			var isEnabled:bool = (actionEntry[1] != "")
			var actionName:String = actionEntry[2]
			var actionDesc:String = actionEntry[3]
			
			if(theIndx < 0):
				if(!isEnabled):
					addDisabledButton(actionName, actionDesc)
				else:
					addButton(actionName, actionDesc, "doAction", [actionEntry])
			else:
				if(!isEnabled):
					addDisabledButtonAt(theIndx, actionName, actionDesc)
				else:
					addButtonAt(theIndx, actionName, actionDesc, "doAction", [actionEntry])

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return
		
	if(_action == "doAction"):
		GM.main.PS.doFinalAction(_args[0])
		return

	setState(_action)
