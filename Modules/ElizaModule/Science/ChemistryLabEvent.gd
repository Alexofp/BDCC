extends EventBase

func _init():
	id = "ChemistryLabEvent"

func registerTriggers(es):
	es.addTrigger(self, Trigger.EnteringRoom, "med_researchlab")
	es.addTrigger(self, Trigger.TalkingToNPC, "eliza")

func run(_triggerID, _args):
	if(_triggerID == Trigger.TalkingToNPC):
		if((getFlag("ElizaModule.firstDrugTestHappened") || true) && GM.main.SCI.doesPCHaveUnknownStrangePills()):
			addButton("Strange pill!", "Make Eliza scan the strange pill that you have", "scan_strange_pill")
		if((getFlag("ElizaModule.firstDrugTestHappened") || true) && GM.main.SCI.hasTFsCanScan(GM.pc)):
			addButton("Get scanned!", "Make Eliza scan the effects of your current transformations", "scan_tfs")
		return
	# Scream at me if I will forget to remove || true
	if(getFlag("ElizaModule.firstDrugTestHappened") || true):
		addButton("Lab", "Look at the lab", "lab")
	
func getPriority():
	return 0

func onButton(_method, _args):
	if(_method == "lab"):
		runScene("ChemistryLabScene")
	if(_method == "scan_strange_pill"):
		GM.main.endCurrentScene()
		runScene("ElizaGenericUnlockDrugScene")
	if(_method == "scan_tfs"):
		GM.main.endCurrentScene()
		runScene("ElizaGenericTestDrugScene")
