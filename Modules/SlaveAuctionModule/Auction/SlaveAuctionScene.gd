extends "res://Scenes/SceneBase.gd"

var slaveAuction:SlaveAuction = SlaveAuction.new()
var charID:String = ""
var currentActionType = AuctionActionType.NoType

func _initScene(_args = []):
	charID = _args[0] if _args.size() > 0 else RNG.pick(GM.main.dynamicCharacters)
	slaveAuction.setCharID(charID)
	addCharacter(charID)
	
	slaveAuction.start(_args[1] if _args.size() > 1 else {})

func _init():
	sceneID = "SlaveAuctionScene"

func _run():
	if(state == ""):
		playAnimation(StageScene.HangingDuo, "idle", {pc=charID, npc=slaveAuction.getPresenterID(), bodyState={naked=true, hard=true}})
		
		saynn(slaveAuction.getText())
		
		if(false):
			addButtonAt(14, "End", "REMOVE ME IN RELEASE", "endthescene")
		
		if(slaveAuction.getState() == "act"):
			if(currentActionType != AuctionActionType.NoType):
				addButton("Back..", "Go back to the previous menu", "setActionType", [AuctionActionType.NoType])
			else:
				addButton("Body", "Show actions that showcase the slave's body", "setActionType", [AuctionActionType.Body])
				addButton("Mind", "Reveal some of the slave's inner info", "setActionType", [AuctionActionType.Mind])
				addButton("Fetishes", "Pick which fetish of your slave you want to showcase", "setActionType", [AuctionActionType.Fetish])
				addButton("Personality", "Pick which personality side of your slave you want to showcase", "setActionType", [AuctionActionType.Personality])
				addButton("Emphasize", "Put extra focus on some of the traits", "setActionType", [AuctionActionType.Emphasize])
			
		var actions:Array = slaveAuction.getActions()
		var disabledActions:Array = []
		for actionA in actions:
			var action:AuctionAction = actionA
			var theActionType = action.getActionType()
			if((theActionType == currentActionType && slaveAuction.getState() == "act") || (slaveAuction.getState() != "act") || theActionType == AuctionActionType.Continue || (theActionType == AuctionActionType.Ungrouped && currentActionType == AuctionActionType.NoType)):
				var canDoData:Array = slaveAuction.canDoAction(action)
				if(canDoData[0]):
					addButton(action.getButtonName(), action.getButtonDesc(), "doAction", [action])
				else:
					disabledActions.append([canDoData[1] if canDoData.size() > 1 else "Can't use this action", action])
		
		for actionA in disabledActions:
			var action:AuctionAction = actionA[1]
			addDisabledButton(action.getButtonName(), actionA[0])
		
	
func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return
	if(_action == "doAction"):
		processTime(60)
		currentActionType = AuctionActionType.NoType
		slaveAuction.doAction(_args[0])
		if(slaveAuction.hasEnded()):
			endScene([slaveAuction.getAuctionResult()])
		return
	if(_action == "setActionType"):
		currentActionType = _args[0]
		return


	setState(_action)

func resolveCustomCharacterName(_charID):
	if(_charID == "slave"):
		return charID
	if(_charID == "presenter"):
		return slaveAuction.getPresenterID()
	return .resolveCustomCharacterName(_charID)

func saveData():
	var data = .saveData()
	
	data["charID"] = charID
	data["currentActionType"] = currentActionType
	data["slaveAuction"] = slaveAuction.saveData()

	return data
	
func loadData(data):
	.loadData(data)
	
	charID = SAVE.loadVar(data, "charID", "")
	currentActionType = SAVE.loadVar(data, "currentActionType", AuctionActionType.NoType)
	
	slaveAuction = SlaveAuction.new()
	slaveAuction.loadData(SAVE.loadVar(data, "slaveAuction", {}))

func supportsSexEngine():
	return true
