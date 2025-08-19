extends EventBase

func _init():
	id = "NemesisAmbushEvent"

func registerTriggers(es):
	es.addTrigger(self, Trigger.AboutToSleepInCell)
	es.addTrigger(self, Trigger.EatingInCanteen)
	es.addTrigger(self, Trigger.TakingAShower)
	es.addTrigger(self, Trigger.EnteringRoom)

func getPriority():
	return 5.0

func react(_triggerID, _args):
	if(_triggerID == Trigger.EnteringRoom):
		if(tryStartAmbush(RNG.pick(["normalshiv", "normaldrugged"]), true)):
			return true
	elif(_triggerID == Trigger.AboutToSleepInCell):
		if(tryStartAmbush("cellbondage")):
			return true
	elif(_triggerID == Trigger.TakingAShower):
		if(tryStartAmbush("showeritems")):
			return true
	elif(_triggerID == Trigger.EatingInCanteen):
		if(tryStartAmbush("canteendrugged")):
			return true
	
	return false

func getNearbyAmbushInteraction(onlySameLoc:bool = false) -> PawnInteractionBase:
	for charID in GM.main.RS.special:
		var theSpecial:SpecialRelationshipBase = GM.main.RS.special[charID]
		if(theSpecial.id != "Nemesis"):
			continue
		var thePawn := GM.main.IS.getPawn(charID)
		if(!thePawn):
			continue
		var theInteraction:PawnInteractionBase = thePawn.getInteraction()
		if(!theInteraction || theInteraction.id != "NemesisAmbush"):
			continue
		if(!theInteraction.canAmbush()):
			continue
		if(onlySameLoc && theInteraction.getLocation() != GM.pc.getLocation()):
			continue
		return theInteraction
	return null

func startAmbushScene(_interaction:PawnInteractionBase, _type:String):
	runScene("NemesisAmbushScene", [_type, _interaction.getRoleID("main"), _interaction.getRoleID("extra1"), _interaction.getRoleID("extra2")])

func tryStartAmbush(_type:String, onlySameLoc:bool = false) -> bool:
	var theInteraction := getNearbyAmbushInteraction(onlySameLoc)
	if(!theInteraction):
		return false
	startAmbushScene(theInteraction, _type)
	return true
