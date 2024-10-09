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
		playAnimation(StageScene.HangingDuo, "idle", {pc=charID, npc=slaveAuction.getPresenterID(), bodyState={naked=true, hard=true}})
		
		saynn(slaveAuction.getText())
		
		addButtonAt(14, "End", "Enough spying", "endthescene")
		
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
		currentActionType = AuctionActionType.NoType
		slaveAuction.doAction(_args[0])
		if(slaveAuction.hasEnded()):
			endScene() # Result here
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

	return data
	
func loadData(data):
	.loadData(data)
	
	charID = SAVE.loadVar(data, "charID", "")

func supportsSexEngine():
	return true
