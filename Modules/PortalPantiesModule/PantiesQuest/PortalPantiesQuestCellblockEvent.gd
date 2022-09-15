extends EventBase

func _init():
	id = "PortalPantiesQuestCellblockEvent"

func registerTriggers(es):
	es.addTrigger(self, Trigger.EnteringRoom, "cellblock_orange_nearcell")
	es.addTrigger(self, Trigger.EnteringRoom, "cellblock_lilac_nearcell")
	es.addTrigger(self, Trigger.EnteringRoom, "cellblock_red_nearcell")
	
func run(_triggerID, _args):
	if(getFlag("PortalPantiesModule.Panties_FleshlightsAskedAlex") && !getFlag("PortalPantiesModule.Panties_FleshlightsFoundFleshlights")):
		addButtonUnlessLate("Search around", "Look around for your fleshlights", "searchfleshlights")

func getPriority():
	return 0

func onButton(_method, _args):
	if(_method == "searchfleshlights"):
		if(GM.pc.getLocation() in ["cellblock_orange_nearcell", "cellblock_lilac_nearcell"]):
			GM.main.addMessage("You look around but unable to find anyone with your fleshlights. They might be in another block")
			GM.main.reRun()
		else:
			runScene("PortalPantiesQuestCellblockScene")
			setFlag("PortalPantiesModule.Panties_FleshlightsFoundFleshlights", true)
	

