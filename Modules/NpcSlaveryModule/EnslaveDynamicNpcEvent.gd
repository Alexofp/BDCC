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
	addMessage("[color=red]DON'T FORGET TO REMOVE FALSE HERE[/color]")
	if(!getModule("NpcSlaveryModule").canEnslave() && false):
		addDisabledButton("Enslave!", "Your cell is not big enough for this. Find someone who can upgrade it first.")
		return
	
	if(!character.hasEnslaveQuest()):
		addButton("Enslave!", "Try to enslave them", "doenslave", [_args[0]])
	

func getPriority():
	return 0

func onButton(_method, _args):
	if(_method == "doenslave"):
		runScene("EnslaveDynamicNpcScene", [_args[0]])
