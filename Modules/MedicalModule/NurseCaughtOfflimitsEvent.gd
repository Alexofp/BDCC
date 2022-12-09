extends EventBase

var nurseGenerator = preload("res://Characters/Dynamic/Generator/NurseGenerator.gd")

func _init():
	id = "NurseCaughtOfflimitsEvent"

func registerTriggers(es):
	es.addTrigger(self, Trigger.CaughtOffLimitsByNurse)

func react(_triggerID, _args):
	var encounterLevel = RNG.randi_range(0, 5)
	if(_args.size() > 0):
		encounterLevel = _args[0]
	
	var idToUse = grabNpcIDFromPoolOrGenerate(CharacterPool.Nurses, [], nurseGenerator.new(), {NpcGen.Level: encounterLevel})
	
	if(idToUse == null || idToUse == ""):
		return false
		
	runScene("NurseCaughtOfflimitsScene", [idToUse])

	return true

func getPriority():
	return 10
