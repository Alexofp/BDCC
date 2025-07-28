extends SceneBase

func _init():
	sceneID = "PSMilkCafeGameplayScene"

func _run():
	if(state == ""):
		#playAnimation(StageScene.Solo, "stand")
		setCharactersEasyList(GM.main.PS.getCharacterList())
		
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
	if(state == "end_credits"):
		saynn("YOU WON!")
		addButton("Continue", "See what happens next", "doEnd")
	if(state == "end_annoying"):
		saynn("YOU ANNOYED THE OWNERS UNTIL THEY DECIDED TO LET YOU GO! YOU WON.")
		addButton("Continue", "See what happens next", "doEnd")
	if(state == "end_breaklock"):
		saynn("YOU BROKE THE LOCK AND ESCAPED!")
		addButton("Continue", "See what happens next", "doEnd")
	
func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return
		
	if(_action == "doAction"):
		var result:Dictionary = GM.main.PS.doFinalAction(_args[0])
		if(result.has("fight")):
			runScene("FightScene", [result["fight"]], "fight_scene")
		elif(result.has("sex")):
			runScene("GenericSexScene", result["sex"], "sex_scene")
		elif(result.has("end")):
			setState(result["end"])
		else:
			if(!GM.main.checkTFs()):
				GM.main.showLog()
		return

	if(_action == "doEnd"):
		GM.main.stopPlayerSlavery()
		GM.pc.setLocation(GM.pc.getCellLocation())
		endScene()
		return

	setState(_action)

func _react_scene_end(_tag, _result):
	if(_tag == "sex_scene"):
		GM.main.PS.processSexEnd(_result[0])
	if(_tag == "fight_scene"):
		var battlestate = _result[0]
		GM.main.PS.processFightEnd(battlestate == "win")
