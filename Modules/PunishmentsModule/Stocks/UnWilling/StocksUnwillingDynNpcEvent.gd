extends EventBase

func _init():
	id = "StocksUnwillingDynNpcEvent"

func registerTriggers(es):
	es.addTrigger(self, "StocksUnWillingSex")

func react(_triggerID, _args):
	var encounterLevel = RNG.randi_range(0, GM.pc.getLevel())
	if(_args.size() > 0):
		encounterLevel = _args[0]
	
	var characterPool = RNG.pick([CharacterPool.Guards, CharacterPool.Inmates])
	var generator = null
	if(characterPool == CharacterPool.Guards):
		generator = GuardGenerator.new()
	else:
		generator = InmateGenerator.new()
	
	var idToUse = grabNpcIDFromPoolOrGenerate(characterPool, [], generator, {NpcGen.Level: encounterLevel})
	
	if(idToUse == null || idToUse == ""):
		return false
		
	runScene("StocksUnwillingDynNpcScene", [idToUse])

	return true

func getPriority():
	return 0 # disabled
