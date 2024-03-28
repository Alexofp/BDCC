extends SceneBase

var selectedVent = ""

func _init():
	sceneID = "SocketBuyFastTravelScene"

func _reactInit():
	return



func _run():
	if(state == ""):
		saynn("Which one-way vent should Socket make available from your cell?")

		var ventData = getModule("SocketModule").getFastTravelData()
		
		for ventID in ventData:
			var ventInfo = ventData[ventID]
			var hasVent = getFlag("SocketModule."+ventID, false)
			
			if(hasVent):
				addDisabledButton(ventInfo["name"], "You already have this vent available!")
			else:
				addButton(ventInfo["name"], "Look at information about this vent", "look_vent", [ventID])

		addButton("Close", "You changed your mind", "endthescene")

	if(state == "look_vent"):
		var ventData = getModule("SocketModule").getFastTravelData()
		var ventInfo = ventData[selectedVent]
		
		saynn(ventInfo["buydesc"])
		saynn("Cost: "+str(ventInfo["cost"])+" credits")
		saynn("Do you want ask Socket to make this vent available?")
		
		addButtonWithChecks("Unlock it", "Pay the cost and get this vent working", "buy_vent", [ventInfo["cost"]], [[ButtonChecks.HasCredits, ventInfo["cost"]]])
		addButton("Back", "You changed your mind", "")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return
		
	if(_action == "look_vent"):
		selectedVent = _args[0]
	
	if(_action == "buy_vent"):
		setFlag("SocketModule."+selectedVent, true)
		GM.pc.addCredits(-_args[0])
		addMessage("Socket unlocked this vent! Check your personal cell.")
		setState("")
		return
		
	setState(_action)

func saveData():
	var data = .saveData()

	data["selectedVent"] = selectedVent

	return data

func loadData(data):
	.loadData(data)

	selectedVent = SAVE.loadVar(data, "selectedVent", "")
