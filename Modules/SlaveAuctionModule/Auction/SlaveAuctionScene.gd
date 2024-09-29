extends "res://Scenes/SceneBase.gd"

var slaveAuction:SlaveAuction = SlaveAuction.new()
var charID:String = ""

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
		
	
func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
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
