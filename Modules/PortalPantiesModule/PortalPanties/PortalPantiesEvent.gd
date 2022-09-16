extends EventBase

func _init():
	id = "PortalPantiesEvent"

func registerTriggers(es):
	es.addTrigger(self, Trigger.EnteringRoom)
	es.addTrigger(self, Trigger.Waiting)
	es.addTrigger(self, Trigger.WakeUpInCell)
	es.addTrigger(self, Trigger.TakingAShower)
	
func react(_triggerID, _args):
	if(!GM.pc.isWearingPortalPanties()):
		return false
	
	var currentMode = getFlag("PortalPantiesModule.Panties_Mode", 0)
	var nonQuestMult = 0.3
	if(currentMode == -1):
		nonQuestMult = 1.0
	elif(currentMode == 0):
		nonQuestMult = 0.3
	elif(currentMode == 1):
		nonQuestMult = 0.1
	elif(currentMode == 2):
		nonQuestMult = 0.05
	
	if(GM.QS.isActive("PortalPantiesQuest")):
		nonQuestMult = 1.0
		
	if(getFlag("PortalPantiesModule.Panties_FleshlightsFoundFleshlights") && !getFlag("PortalPantiesModule.Panties_FleshlightsReturnedToAlex")):
		return false
	
	if(_triggerID == Trigger.EnteringRoom):
		var currentCooldown = getFlag("PortalPantiesModule.Panties_SceneCooldown", 0)
		if(currentCooldown <= 0):
			if(RNG.chance(20 * nonQuestMult)):
				setFlag("PortalPantiesModule.Panties_SceneCooldown", int(min(20, round(4 / nonQuestMult))))
				return GM.ES.triggerReact("PortalPantiesEvent")
		else:
			increaseFlag("PortalPantiesModule.Panties_SceneCooldown", -1)
	
	if(_triggerID == Trigger.Waiting):
		var hoursPassed = 1
		if(_args.size() > 0):
			hoursPassed = _args[0] / 3600.0
			
		# Waited 3 hours = 90% chance
		if(RNG.chance(hoursPassed * 30.0 * nonQuestMult)):
			return GM.ES.triggerReact("PortalPantiesEvent")
	
	if(_triggerID == Trigger.WakeUpInCell):
		
		if(RNG.chance(75 * nonQuestMult)):
			return GM.ES.triggerReact("PortalPantiesSleepingEvent")
	
	if(_triggerID == Trigger.TakingAShower):
		
		if(RNG.chance(50 * nonQuestMult)):
			return GM.ES.triggerReact("PortalPantiesShowerEvent")
	
	return false
	
	
func getPriority():
	return 5
