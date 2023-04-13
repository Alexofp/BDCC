extends EventBase

func _init():
	id = "NovaTalkEvent"

func registerTriggers(es):
	es.addTrigger(self, Trigger.EnteringRoom, "yard_novaspot")

func run(_triggerID, _args):
	if(checkCharacterBusy("NovaBusy", "Seems like Nova is not here", "Nova")):
		return
	
	if(!GM.main.getModuleFlag("NovaModule", "Nova_Introduced")):
		saynn("You see some guard patrolling this zone")
	else:
		saynn("You see Nova patrolling this zone")
	if(GM.main.getModuleFlag("NovaModule", "Nova_NotThereToday", false)):
		addDisabledButton("Nova", "She is not here today")
	else:
		addButtonUnlessLate("Nova", "Talk to the husky", "talk")

func getPriority():
	return 0

func onButton(_method, _args):
	if(_method == "talk"):
		runScene("NovaTalkScene")
