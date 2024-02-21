extends SceneBase


func _init():
	sceneID = "SocketFastTravelScene"

func _run():
	if(state == ""):
		saynn("Which one-way vent do you want to use?")

		var ventData = getModule("SocketModule").getFastTravelData()
		
		for ventID in ventData:
			var ventInfo = ventData[ventID]
			var hasVent = getFlag("SocketModule."+ventID, false)
			
			if(hasVent):
				addButton(ventInfo["name"], "Climb into this vent!", "tp_to", [ventInfo["location"]])

		addButton("Back", "You changed your mind", "endthescene")

	if(state == "tp_to"):
		saynn("You follow the web of vents and carefully get out when you reach your destination, making sure not to draw any extra attention.. You don't want others to get suspicious..")
		
		addButton("Continue", "See what happens next", "endthescene")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return
		
	if(_action == "tp_to"):
		GM.pc.setLocation(_args[0])
		aimCameraAndSetLocName(_args[0])
		GM.pc.addStamina(-20)
		addMessage("Climbing took some of your stamina")
	
	setState(_action)
