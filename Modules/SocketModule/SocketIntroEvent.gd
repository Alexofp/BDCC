extends EventBase

func _init():
	id = "SocketIntroEvent"

func registerTriggers(es):
	es.addTrigger(self, Trigger.EnteringRoom, "eng_workshop")
	es.addEventCheck(self, "SocketBusy")

func react(_triggerID, _args):
	if(getFlag("SocketModule.socketIntroduced")):
		return false
	if(GM.pc.getLevel() < 10 && !getFlag("PortalPantiesModule.Panties_FleshlightsReturnedToAlex") && !getFlag("PortalPantiesModule.Panties_PcDenied")):
		return false
		
	setFlag("SocketModule.socketIntroduced", true)
	runScene("SocketIntroScene")
	return true

func run(_triggerID, _args):
	if(!getFlag("SocketModule.socketIntroduced")):
		return
	
	if(checkCharacterBusy("SocketBusy", "Seems like Socket is not here", "Socket")):
		return
	
	addButtonUnlessLate("Socket", "Talk with the fennec", "talk")

func getPriority():
	return 11

func onButton(_method, _args):
	if(_method == "talk"):
		runScene("SocketTalkScene")

func eventCheck(_checkID, _args = []):
	if(getFlag("SocketModule.socketWillPunish")):
		return {busy=true}
