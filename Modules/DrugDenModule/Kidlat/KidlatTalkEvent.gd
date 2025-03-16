extends EventBase

func _init():
	id = "KidlatTalkEvent"

func registerTriggers(es):
	es.addTrigger(self, Trigger.EnteringRoom, "cellblock_lilac_nearcell")

func run(_triggerID, _args):
	if(getFlag("DrugDenModule.Kidlat7Hap")):
		addButtonUnlessLate("Kidlat", "Talk with the kitty", "talk")
	
func getPriority():
	return 0

func onButton(_method, _args):
	if(_method == "talk"):
		if(!getFlag("DrugDenModule.Kidlat8Hap")):
			setFlag("DrugDenModule.Kidlat8Hap", true)
			runScene("DrugDenKidlat8Scene")
			return
		
		if(!GM.ES.triggerReact(Trigger.TalkingToNPC, ["kidlat"])):
			runScene("KidlatTalkScene")
