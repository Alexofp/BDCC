extends EventBase

func _init():
	id = "CaughtOffLimitsInMentalEvent"

func registerTriggers(es):
	es.addTrigger(self, Trigger.EnteringRoom)
	es.addTrigger(self, Trigger.PCLookingForTrouble)

func react(_triggerID, _args):
	if(true): # Disabled because of interactions
		return
	var isLookingForTrouble = (_triggerID == Trigger.PCLookingForTrouble)
	var baseChance = 30 + 10.0*GM.pc.getExposure()
	baseChance *= GM.pc.getEncounterChanceModifierStaff()
	
	if(GM.main.getFlag("Trigger_CaughtOffLimitsCD", 0) > 0 && !isLookingForTrouble):
		return
	
	#if(!RNG.chance(30 + 10.0*GM.pc.getExposure()) || !GM.world.getRoomByID(GM.pc.getLocation()).loctag_MentalWard):
	#	return false
	
	if(GM.world.getRoomByID(GM.pc.getLocation()).loctag_MentalWard):
		if(RNG.chance(baseChance) || isLookingForTrouble):
			GM.main.setFlag("Trigger_CaughtOffLimitsCD", 3)
			
			var encounterLevel = RNG.randi_range(0, Util.maxi(0, GM.pc.getLevel() + RNG.randi_range(-4, 1)))
			encounterLevel = Util.maxi(encounterLevel, 0)
			encounterLevel = Util.mini(encounterLevel, 10+RNG.randi_range(-1, 1))
			
			return GM.ES.triggerReact(Trigger.CaughtOffLimitsByNurse, [encounterLevel])
	
	#GM.main.setFlag("Trigger_CaughtOffLimitsCD", 3)
	#runScene(RNG.pick([
	#	"NurseFelineOffLimits",
	#	]))
	#return true
	return false

func getPriority():
	return 5

