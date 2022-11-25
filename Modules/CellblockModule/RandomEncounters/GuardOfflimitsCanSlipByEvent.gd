extends EventBase

func _init():
	id = "GuardOfflimitsCanSlipByEvent"

func registerTriggers(es):
	es.addTrigger(self, Trigger.CaughtOffLimits)

func react(_triggerID, _args):
	var idToUse = grabNpcIDFromPoolOrGenerate(CharacterPool.Guards, GuardGenerator.new())
	
	if(idToUse == null || idToUse == ""):
		return false
		
	runScene("GuardOfflimitsCanSlipByScene", [idToUse])

	return true

func getPriority():
	return 4
