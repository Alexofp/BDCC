extends EventBase

func _init():
	id = "HighExposureEvent"

func registerTriggers(es):
	es.addTrigger(self, Trigger.EnteringRoom)

func react(_triggerID, _args):
	if(GM.main.getFlag("ExposureEventCD", 0) > 0):
		GM.main.increaseFlag("ExposureEventCD", -1)
		return
	
	if(GM.pc.hasEffect(StatusEffect.Exposed)):
		if(WorldPopulation.Inmates in GM.pc.getLocationPopulation()):
			if(RNG.chance(2.0 + min(5.0, 2.0*GM.pc.getExposure()))):
				GM.main.setFlag("ExposureEventCD", RNG.randi_range(5, 10))
				
				var encounterLevel = RNG.randi_range(0, GM.pc.getLevel() + RNG.randi_range(-1, 1))
				encounterLevel = Util.maxi(encounterLevel, 0)
				encounterLevel = Util.mini(encounterLevel, 15+RNG.randi_range(-1, 1))
				
				return GM.ES.triggerReact(Trigger.HighExposureInmateEvent, [encounterLevel])

		return false

func getPriority():
	return -5
