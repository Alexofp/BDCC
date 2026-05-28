extends EventBase

func _init():
	id = "KaitMeetOfferEvent"

func registerTriggers(es):
	es.addTrigger(self, Trigger.EnteringRoom, "hall_mainentrance")

func react(_triggerID, _args):
	if(GM.main.hasCommittedToMainRoute()):
		return false
	
	if(!getFlag("KaitModule.gotMetByKait", false) && !getFlag("KaitModule.talkedKaitArena", false)):
		# Better way to check if we have fought against Tavi?
		# This one will trigger if we lost and denied to obey her too
		if(GM.main.getFlag("TaviModule.Tavi_IsAngryAtPlayer", false)):
			addMessage("New task added!")
			setFlag("KaitModule.gotMetByKait", true)
			runScene("DomCh0OfferWonTavi")
			return true
		
		# Got apple and returning back to give it to Tavi
		if(GM.main.getFlag("TaviModule.Tavi_NeedsApple", false) && GM.pc.getInventory().hasItemID("appleitem")):
			addMessage("New task added!")
			setFlag("KaitModule.gotMetByKait", true)
			runScene("DomCh0OfferGotApple")
			return true
		
	
	
	return false

func getPriority():
	return 11
