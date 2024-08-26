extends EventBase

func _init():
	id = "CaughtOffLimitsEvent"

func registerTriggers(es):
	es.addTrigger(self, Trigger.EnteringRoom)
	es.addTrigger(self, Trigger.PCLookingForTrouble)

func react(_triggerID, _args):
	var isLookingForTrouble = (_triggerID == Trigger.PCLookingForTrouble)
	var baseChance = 30 + 10.0*GM.pc.getExposure()
	baseChance *= GM.pc.getEncounterChanceModifierStaff()
	
	if(GM.main.getFlag("Trigger_CaughtOffLimitsCD", 0) > 0 && !isLookingForTrouble):
		GM.main.increaseFlag("Trigger_CaughtOffLimitsCD", -1)
		return
	
	# Replaced with interactions
#	if(GM.world.getRoomByID(GM.pc.getLocation()).loctag_Greenhouses):
#		if(RNG.chance(baseChance) || isLookingForTrouble):
#			GM.main.setFlag("Trigger_CaughtOffLimitsCD", 3)
#
#			var encounterLevel = RNG.randi_range(0, Util.maxi(0, GM.pc.getLevel() + RNG.randi_range(-1, 1)))
#			encounterLevel = Util.maxi(encounterLevel, 0)
#			encounterLevel = Util.mini(encounterLevel, 15+RNG.randi_range(-1, 1))
#
#			return GM.ES.triggerReact(Trigger.CaughtOffLimits, [encounterLevel])
#
	if(GM.world.getRoomByID(GM.pc.getLocation()).loctag_OldGuardsEncounter):
		if(RNG.chance(baseChance) || isLookingForTrouble):
			GM.main.setFlag("Trigger_CaughtOffLimitsCD", 3)
			
			var encounterLevel = RNG.randi_range(0, Util.maxi(0, GM.pc.getLevel() + RNG.randi_range(-4, 1)))
			encounterLevel = Util.maxi(encounterLevel, 0)
			encounterLevel = Util.mini(encounterLevel, 10+RNG.randi_range(-1, 1))
			
			return GM.ES.triggerReact(Trigger.CaughtOffLimits, [encounterLevel])
#
#	if(GM.world.getRoomByID(GM.pc.getLocation()).loctag_EngineersEncounter):
#		if(RNG.chance(baseChance) || isLookingForTrouble):
#			GM.main.setFlag("Trigger_CaughtOffLimitsCD", 3)
#
#			var encounterLevel = RNG.randi_range(0, Util.maxi(0, GM.pc.getLevel() + RNG.randi_range(-2, 3)))
#			encounterLevel = Util.maxi(encounterLevel, 10)
#			encounterLevel = Util.mini(encounterLevel, 20+RNG.randi_range(-1, 1))
#
#			return GM.ES.triggerReact(Trigger.CaughtOffLimitsByEnginner, [encounterLevel])
#
	return false

func getPriority():
	return 5
