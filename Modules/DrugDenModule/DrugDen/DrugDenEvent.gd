extends EventBase

func _init():
	id = "DrugDenEvent"

func registerTriggers(es):
	es.addTrigger(self, Trigger.EnteringRoom)

func run(_triggerID, _args):
	if(GM.main.DrugDenRun == null):
		return
	
	if(GM.pc.getLocation() == GM.main.DrugDenRun.getNextLevelRoom()):
		addButton("Next level", "Go to the next level!", "go")
	
	var drugDenEvent = GM.main.DrugDenRun.getEventInRoom(GM.pc.getLocation())
	if(drugDenEvent != null):
		var interactInfo:Dictionary = drugDenEvent.getInteractInfo()
		
		if(interactInfo.has("text")):
			saynn(interactInfo["text"])
		
		if(interactInfo.has("actions")):
			var theActions:Array = interactInfo["actions"]
			
			for actionEntry in theActions:
				var isDisabled:bool = actionEntry["disabled"] if actionEntry.has("disabled") else false

				if(isDisabled):
					addDisabledButton(actionEntry["name"], actionEntry["desc"])
				else:
					var actionArgs:Array = actionEntry["args"] if actionEntry.has("args") else []
					var actionID:String = actionEntry["id"] if actionEntry.has("id") else ""
					
					addButton(actionEntry["name"], actionEntry["desc"], "doEventInteraction", [drugDenEvent, actionID, actionArgs])
				
	
func react(_triggerID, _args):
	if(GM.main.DrugDenRun == null):
		return false
	
	if(GM.main.DrugDenRun.hasEncounterInRoom(GM.pc.getLocation())):
		runScene("DrugDenEncounterInstantFightScene")
		return true
	
	if(GM.main.DrugDenRun.shouldShowLevelUpScreen()):
		runScene("DungeonLevelUpScene")
	
	return false
	
func getPriority():
	return 0

func onButton(_method, _args):
	if(_method == "go"):
		GM.main.DrugDenRun.nextLevel()
	if(_method == "doEventInteraction"):
		var drugDenEvent = _args[0]
		var theResult:Dictionary = drugDenEvent.doInteract(_args[1], _args[2])
		
		if(theResult.has("text")):
			runScene("DungeonEventSimpleScene", [theResult])
		elif(theResult.has("sceneID")):
			runScene(theResult["sceneID"], theResult["args"] if theResult.has("args") else [])
		
		if(theResult.has("ended") && theResult["ended"]):
			drugDenEvent.endEvent()
