extends EventBase

func _init():
	id = "HypnoEncounterInmateEvent"

func registerTriggers(es):
	es.addTrigger(self, Trigger.HypnoEncounter)

func react(_triggerID, _args):
	var encounterLevel = RNG.randi_range(0, 5)
	if(_args.size() > 0):
		encounterLevel = _args[0]
	
	var idToUse = grabNpcIDFromPoolOrGenerate(CharacterPool.Inmates, [], InmateGenerator.new(), {NpcGen.Level: encounterLevel})
	
	if(idToUse == null || idToUse == ""):
		return false
		
	if(GM.ES.triggerReact(Trigger.TalkingToDynamicNPC, [idToUse])):
		return true
		
	runScene("HypnoEncounterStart", [idToUse])

	return true

func getPriority():
	return 2
