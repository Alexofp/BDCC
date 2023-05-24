extends EventBase

func _init():
	id = "InmateExposureProstitutionEvent"

func registerTriggers(es):
	es.addTrigger(self, Trigger.HighExposureInmateEvent)

func react(_triggerID, _args):
	var encounterLevel = RNG.randi_range(0, 5)
	if(_args.size() > 0):
		encounterLevel = _args[0]
	
	var idToUse = grabNpcIDFromPoolOrGenerate(CharacterPool.Inmates, [[NpcCon.FlagEquals, CharacterFlag.InmateType, InmateType.SexDeviant]], InmateGenerator.new(), {NpcGen.Level: encounterLevel, NpcGen.Flag: [[CharacterFlag.InmateType, InmateType.SexDeviant]]})
	
	if(idToUse == null || idToUse == ""):
		return false
		
	if(GM.ES.triggerReact(Trigger.TalkingToDynamicNPC, [idToUse])):
		return true
		
	runScene("InmateExposureProstitutionScene", [idToUse])

	return true

func getPriority():
	return 2
