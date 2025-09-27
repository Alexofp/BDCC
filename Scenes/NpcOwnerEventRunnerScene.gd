extends SceneBase

var runner:NpcOwnerEventRunner = NpcOwnerEventRunner.new()

func _initScene(_args = []):
	var theEventID:String = _args[1] if _args.size() > 1 else "Fuck"#"FuckInStocks"#"TestEvent"
	
	runner.setOwnerID(_args[0] if _args.size() > 0 else "nova")
	runner.runEvent(theEventID, _args[2] if _args.size() > 2 else [])
	
func _init():
	sceneID = "NpcOwnerEventRunnerScene"

func _run():
	if(state == ""):
		runner.run()
		setCharactersEasyList(runner.getAllInvolvedCharIDs())
		saynn(runner.getFinalText())
		
		var theActions := runner.getFinalActions()
		for actionEntry in theActions:
			if(actionEntry.size() > 1):
				addButton(actionEntry[0], actionEntry[1], "doAction", [actionEntry])
			else:
				addDisabledButton(actionEntry[0], actionEntry[1])
		print("Meow")
		#addButton("Leave", "Job well done", "endthescene")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return
	if(_action == "doAction"):
		var runnerActionEntry:Array = runner.doAction(_args[0])
		if(runner.shouldEnd()):
			endScene()
			return
			
		var runnerAction:int = runnerActionEntry[0]
		
		if(runnerAction == NpcOwnerActionType.NOTHING):
			if(runnerActionEntry.size() > 1):
				processTime(runnerActionEntry[1])
		elif(runnerAction == NpcOwnerActionType.START_FIGHT):
			runScene("FightScene", runnerActionEntry[1], "fight_scene")
		elif(runnerAction == NpcOwnerActionType.START_SEX):
			runScene("GenericSexScene", runnerActionEntry[1], "sex_scene")
		
		return
	
	setState(_action)

func _react_scene_end(_tag, _result):
	if(_tag == "fight_scene"):
		var battlestate = _result[0]
		
		runner.notifyFightResult(battlestate == "win")
	if(_tag == "sex_scene"):
		var sexResult = _result[0]
		
		runner.notifySexResult(sexResult)
	if(runner.shouldEnd()):
		endScene()
	
func resolveCustomCharacterName(_charID):
	return runner.resolveCustomCharacterName(_charID)

func supportsShowingPawns() -> bool:
	return true

func saveData():
	var data = .saveData()
	
	data["runner"] = runner.saveData()
	
	return data
	
func loadData(data):
	.loadData(data)
	
	runner.loadData(SAVE.loadVar(data, "runner", {}))
