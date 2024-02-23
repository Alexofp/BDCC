extends EventBase

func _init():
	id = "EnslaveDynamicNpcEvent"

func registerTriggers(es):
	es.addTrigger(self, Trigger.DefeatedDynamicNPC)

func run(_triggerID, _args):
	var npcID = _args[0]
	var character:DynamicCharacter = getCharacter(npcID)
	
	if(!character.isDynamicCharacter()):
		return
	
	# Add a check for empty space for npcs
	if(!character.hasEnslaveQuest()):
		addButton("Enslave!", "Try to enslave them", "doenslave", [_args[0]])
	

func getPriority():
	return 0

func onButton(_method, _args):
	if(_method == "doenslave"):
		runScene("EnslaveDynamicNpcScene", [_args[0]])
