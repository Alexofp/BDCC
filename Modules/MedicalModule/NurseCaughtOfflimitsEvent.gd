extends EventBase

func _init():
	id = "NurseCaughtOfflimitsEvent"

func registerTriggers(es):
	es.addTrigger(self, Trigger.CaughtOffLimitsByNurse)

func react(_triggerID, _args):
	var encounterLevel = RNG.randi_range(0, 5)
	if(_args.size() > 0):
		encounterLevel = _args[0]
	
	var idToUse = grabNpcIDFromPoolOrGenerate(CharacterPool.Nurses, [], NurseGenerator.new(), {NpcGen.Level: encounterLevel})
	
	if(idToUse == null || idToUse == ""):
		return false
		
	if(GM.ES.triggerReact(Trigger.TalkingToDynamicNPC, [idToUse])):
		return true
		
	runScene("NurseCaughtOfflimitsScene", [idToUse])

	return true

func getPriority():
	return 10
