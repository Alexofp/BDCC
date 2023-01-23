extends EventBase

func _init():
	id = "NuraFindToolEvent"

func registerTriggers(es):
	es.addTrigger(self, Trigger.EnteringRoom, "eng_assemblylab")

func run(_triggerID, _args):
	if(GM.main.getFlag("CellblockModule.FoundNura")):
		if(!GM.main.getFlag("CellblockModule.NuraFoundTool")):
			saynn("You notice some kind of tool one of the worktables. An industrial-sized syringe with some circuitry attached.")
		
			addButton("Syringe tool", "Grab it", "nura")

func getPriority():
	return 0

func onButton(_method, _args):
	if(_method == "nura"):
		GM.main.addMessage("You grab the syringe tool and store it. Maybe someone here can use it. But not you.")
		
		GM.main.setFlag("CellblockModule.NuraFoundTool", true)
		GM.main.reRun()
