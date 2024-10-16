extends EventBase

func _init():
	id = "BlacktailMarketEvent"

func registerTriggers(es):
	es.addTrigger(self, Trigger.EnteringRoom, "market_intro")
	#es.addTrigger(self, Trigger.EnteringPlayerCell) # Handled in a different scene
	
func run(_triggerID, _args):
	if(GM.pc.getLocation() == "market_intro"):
		addButton("Prison cell", "Teleport back to your prison cell", "exitsecure")
	
	if(getFlag("SlaveAuctionModule.beganAuctionOnce") && !getFlag("SlaveAuctionModule.luxeIntroHap")):
		addDisabledButton("Mirri", "She is not here..")
		
		saynn("You hear loud chatter coming from the room at the end of the corridor..")
	else:
		if(!checkCharacterBusy("MirriBusy", "Seems like the catgirl is not here", "Mirri")):
			addButton("Mirri", "Talk with the catgirl", "mirri")
		
	if(true):
		if(GM.pc.getLocation() == GM.pc.getCellLocation()):
			addButton("Blacktail Market", "Teleport to the Blacktail Market", "entersecure")

func getPriority():
	return 0

func onButton(_method, _args):
	if(_method == "entersecure"):
		GM.pc.setLocation("market_intro")
		addMessage("You use your bluespace relay-tag to teleport to the Blacktail Market.")
		GM.main.reRun()
	if(_method == "mirri"):
		if(!GM.ES.triggerReact(Trigger.TalkingToNPC, ["mirri"])):
			runScene("MirriTalkScene")
	if(_method == "exitsecure"):
		GM.pc.setLocation(GM.pc.getCellLocation())
		addMessage("You use the teleporter to teleport back to your cell.")
		GM.main.reRun()

