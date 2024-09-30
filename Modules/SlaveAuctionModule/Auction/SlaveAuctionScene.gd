extends "res://Scenes/SceneBase.gd"

var slaveAuction:SlaveAuction = SlaveAuction.new()
var charID:String = ""
var currentActionType = AuctionActionType.NoType

func _initScene(_args = []):
	charID = RNG.pick(GM.main.dynamicCharacters)#_args[0]
	slaveAuction.setCharID(charID)
	addCharacter(charID)
	
	slaveAuction.start()

func _init():
	sceneID = "SlaveAuctionScene"

func _run():
	if(state == ""):
		playAnimation(StageScene.HangingDuo, "idle", {pc=charID})
		
		saynn(slaveAuction.getText())
		
		addButtonAt(14, "End", "Enough spying", "endthescene")
		
		if(slaveAuction.getState() == "act"):
			if(currentActionType != AuctionActionType.NoType):
				addButton("Back", "Go back to the previous menu", "setActionType", [AuctionActionType.NoType])
			else:
				addButton("Fetish", "Pick which fetish of your slave you want to showcase", "setActionType", [AuctionActionType.Fetish])
			
		var actions:Array = slaveAuction.getActions()
		var disabledActions:Array = []
		for actionA in actions:
			var action:AuctionAction = actionA
			var theActionType = action.getActionType()
			if(theActionType == currentActionType || theActionType == AuctionActionType.Continue):
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
		currentActionType = AuctionActionType.NoType
		slaveAuction.doAction(_args[0])
		return
	if(_action == "setActionType"):
		currentActionType = _args[0]
		return


	setState(_action)

func resolveCustomCharacterName(_charID):
	if(_charID == "slave"):
		return charID
	return .resolveCustomCharacterName(_charID)

func saveData():
	var data = .saveData()
	
	data["charID"] = charID

	return data
	
func loadData(data):
	.loadData(data)
	
	charID = SAVE.loadVar(data, "charID", "")

func supportsSexEngine():
	return true
