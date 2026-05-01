extends SceneBase

var choices:Array = [] # indicies
var extra:Dictionary = {} # id = indx
var selectedExtra:int = 0
var didPlanYourself:bool = false
var lastContext:RecruitContext = RecruitContext.new()

func _init():
	sceneID = "RecruitStartScene"

func _reactInit():
	makeSureChoicesFilled()

func resolveCustomCharacterName(_charID):
	if(_charID == "npc"):
		return GM.main.RCS.getRecruit().charID
	if(_charID == "presenter"):
		return GM.main.RCS.getRecruit().getPresenterCharID()

func _run():
	if(!GM.main.RCS.hasCurrent()):
		saynn("SOMETHING WENT WRONG, THERE IS NO CURRENT RECRUIT. SORRY.")
		addButton("Continue", "See what happens next", "endthescene")
		return
	
	var _recruit:RecruitBase = GM.main.RCS.getRecruit()
	var _presenterID:String = _recruit.getPresenterCharID()
	var _hasPresenter:bool = !_presenterID.empty()
	if(state == ""):
		if(_hasPresenter):
			addCharacter(_presenterID)
			playAnimation(StageScene.Duo, "stand", {npc=_presenterID})
		else:
			playAnimation(StageScene.Solo, "stand")
		
		saynn("You are standing near the cell where {npc.name} is held.")
		
		if(_hasPresenter):
			saynn("{presenter.name} is guarding the entrance.")
		
		saynn("What do you wanna do?")
		
		saynn(_recruit.getHistoryString())
		
		addButton("Plan", "Make a plan and execute it", "plan")
		addButton("Talk", "Go have a chat with them!", "talk")
		addButton("Step away", "You changed your mind", "endthescene")
	
	if(state == "plan"):
		saynn("Make a plan!")
		
		var _choices:Array = _recruit.choices
		for _i in _choices.size():
			var theChoice:Dictionary = _choices[_i]
			addExtraButtonAt(_i, theChoice["name"]+":", theChoice["desc"], "pickNextOption", [_i])
			
			var baseButtonIndx:int = _i
			var theOptions:Array = theChoice["options"]
			for _ii in theOptions.size():
				var isSelected:bool = (choices.size() > _i) && (choices[_i] == _ii)
				var theOption:Array = theOptions[_ii]
				var finalButtonIndx:int = baseButtonIndx + _ii*5
				
				if(!isSelected):
					addButtonAt(finalButtonIndx, theOption[1], theOption[2], "setOption", [_i, _ii])
				else:
					addDisabledButtonAt(finalButtonIndx, "["+theOption[1]+"]", "(Selected)\n" + theOption[2])
		
		var theExtras:Array = getExtras()
		var _ei:int = 0
		for theExtraEntry in theExtras:
			var theID:String = theExtraEntry["id"]
			
			if(extra.has(theID)):
				var theOption:Array = theExtraEntry["options"][extra[theID]]
				addButton(theOption[1], theOption[2], "extraMenu", [_ei])
			else:
				addButton(theExtraEntry["name"], theExtraEntry["desc"], "extraMenu", [_ei])
			_ei += 1
		
		if(areChoicesFilled()):
			var theCanStart:Array = _recruit.isCombinationPossibleFinal(getChoicesIDs(), getExtraWithIDs())
			if(theCanStart[0]):
				addButtonAt(9, "START", "Execute the plan!", "readyToDoPlan")
			else:
				saynn("Can't do this plan: "+theCanStart[1])
		addButtonAt(14, "Cancel", "You changed your mind!", "")
		
		saynn(_recruit.getHistoryString())
	
	if(state == "readyToDoPlan"):
		saynn("You have prepared the plan.")
		var thePresenterName:String = getCharacter(_recruit.getPresenterCharID()).getName()
		if(_hasPresenter):
			saynn("[say="+_recruit.getPresenterCharID()+"]"+_recruit.getPresenterDialogue()+"[/say]")
		addButton("You", "Execute the plan yourself", "startThePlan")
		addButton(thePresenterName, "(Skip scene) Let "+thePresenterName+" do the plan, avoiding the need for you to see it", "helperStartsThePlan")
	
	if(state == "extraMenu"):
		saynn("Pick the value!")
		
		addButton("Back", "You changed your mind", "plan")
		var theExtras:Array = getExtras()
		var theExtra:Dictionary = theExtras[selectedExtra]
		var theOptions:Array = theExtra["options"]
		var _i:int = 0
		for theOption in theOptions:
			addButton(theOption[1], theOption[2], "pickExtra", [_i])
			_i += 1
	
	if(state == "afterPlan"):
		saynn("The plan is completed.")
		
		saynn(_recruit.getColorStringForChoices(lastContext.choiceIDs))
		
		if(lastContext.perfect):
			saynn("It went perfect!")
		elif(lastContext.success):
			saynn("Success! Not everything was perfect but it was good enough.")
		else:
			saynn("That wasn't it..")
		
		# Start the next story scene
		# If replay more, just end it?
		if(lastContext.success):
			addButton("Continue", "See what happens next", "endthescene")
		addButton("Try again", "Try a different plan!", "")
	
	if(state == "helperDoesThings"):
		playAnimation(StageScene.Solo, "stand")
		saynn("You tell {presenter.name} to carry out the plan.")
		
		saynn("After some time, {presenter.he} returns..")
		
		addButton("Continue", "See what happens next", "afterPlan")
	
func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return
	if(_action == "setOption"):
		choices[_args[0]] = _args[1]
		checkExtras()
		return
	if(_action == "extraMenu"):
		selectedExtra = _args[0]
	if(_action == "pickExtra"):
		extra[getExtras()[selectedExtra]["id"]] = _args[0]
		setState("plan")
		return
	if(_action == "pickNextOption"):
		choices[_args[0]] += 1
		var _recruit:RecruitBase = GM.main.RCS.getRecruit()
		var _choices:Array = _recruit.choices
		if(choices[_args[0]] >= _choices[_args[0]]["options"].size()):
			choices[_args[0]] = 0
		checkExtras()
		return
	
	if(_action == "startThePlan" || _action == "helperStartsThePlan"):
		didPlanYourself = (_action == "startThePlan")
		var _recruit:RecruitBase = GM.main.RCS.getRecruit()
		var theContext:RecruitContext = _recruit.createContext(getChoicesIDs(), getExtraWithIDs())
		var theSceneID:String = _recruit.getSceneToPlay(getChoicesIDs(), getExtraWithIDs())
		GM.main.RCS.submitContext(theContext)
		if(didPlanYourself):
			runScene(theSceneID, [theContext], "planScene")
			setState("afterPlan")
		else:
			setState("helperDoesThings")
			
		lastContext = theContext
		return
	
	setState(_action)

func makeSureChoicesFilled():
	var _recruit:RecruitBase = GM.main.RCS.getRecruit()
	var _choices:Array = _recruit.choices
	
	while(choices.size() < _choices.size()):
		choices.append(-1)
	while(choices.size() > _choices.size()):
		choices.pop_back()

func areChoicesFilled() -> bool:
	var _recruit:RecruitBase = GM.main.RCS.getRecruit()
	var _choices:Array = _recruit.choices
	if(_choices.size() != choices.size()):
		return false
	for theChoice in choices:
		if(theChoice < 0):
			return false
	return true

func getChoicesIDs() -> Array:
	var result:Array = []
	var _recruit:RecruitBase = GM.main.RCS.getRecruit()
	var _choices:Array = _recruit.choices
	var _i:int = 0
	for choiceIndx in choices:
		result.append(_choices[_i]["options"][choiceIndx][0])
		_i += 1
	return result

func getExtraWithIDs() -> Dictionary:
	var result:Dictionary = {}
	var _recruit:RecruitBase = GM.main.RCS.getRecruit()
	var theExtras := getExtras()
	
	for theExtra in theExtras:
		var theID:String = theExtra["id"]
		if(!extra.has(theID)):
			continue
		
		result[theID] = theExtra["options"][extra[theID]][0]
	
	return result

func getExtras() -> Array:
	if(!areChoicesFilled()):
		return []
	var _recruit:RecruitBase = GM.main.RCS.getRecruit()
	return _recruit.getExtraChoices(getChoicesIDs())

func checkExtras():
	var _recruit:RecruitBase = GM.main.RCS.getRecruit()
	var _choices:Array = _recruit.choices
	if(!areChoicesFilled()):
		extra.clear()
		return
#	var extraChoices:Array = getExtras()
#	for theChoiceEntry in extraChoices:
#		var theId:String = theChoiceEntry["id"]
#		if(!extra.has(theId)):
#			extra[theId] = 0#theChoiceEntry["options"][0][0]

func saveData():
	var data = .saveData()
	
	data["selectedExtra"] = selectedExtra
	data["choices"] = choices
	data["extra"] = extra
	data["didPlanYourself"] = didPlanYourself
	data["lastContext"] = lastContext.saveData()

	return data

func loadData(data):
	.loadData(data)

	selectedExtra = SAVE.loadVar(data, "selectedExtra", 0)
	choices = SAVE.loadVar(data, "choices", [])
	extra = SAVE.loadVar(data, "extra", {})
	didPlanYourself = SAVE.loadVar(data, "didPlanYourself", false)
	lastContext.loadData(SAVE.loadVar(data, "lastContext", {}))
	
	makeSureChoicesFilled()
