extends EventBase

var inmateGenerator = preload("res://Characters/Dynamic/Generator/InmateGenerator.gd")

func _init():
	id = "InmateExposureForcedSexEvent"

func registerTriggers(es):
	es.addTrigger(self, Trigger.HighExposureInmateEvent)

func react(_triggerID, _args):
	var encounterLevel = RNG.randi_range(0, 5)
	if(_args.size() > 0):
		encounterLevel = _args[0]
	
	var idToUse = grabNpcIDFromPoolOrGenerate(CharacterPool.Inmates, [], inmateGenerator.new(), {NpcGen.Level: encounterLevel})
	
	if(idToUse == null || idToUse == ""):
		return false
		
	runScene("InmateExposureForcedSexScene", [idToUse])

	return true

func getPriority():
	return 10
