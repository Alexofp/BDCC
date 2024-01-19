extends EventBase

func _init():
	id = "AdvancedBreastPumpEvent"

func registerTriggers(es):
	es.addTrigger(self, Trigger.EnteringRoom)
	es.addTrigger(self, Trigger.Waiting)
	es.addTrigger(self, Trigger.WakeUpInCell)
	es.addTrigger(self, Trigger.TakingAShower)
	
func react(_triggerID, _args):
	var currentTime = GM.main.getTimeInGlobalSeconds()
	var lastTimeMilked = getFlag("MedicalModule.AdvBreastPumpLastMilked", 0)
	
	# Means this event runs every 30 minutes basically
	if(currentTime >= (lastTimeMilked + 60*30) || _triggerID == Trigger.WakeUpInCell):
		setFlag("MedicalModule.AdvBreastPumpLastMilked", currentTime)
	else:
		return false
	
	if(!GM.pc.getInventory().hasItemIDEquipped("BreastPumpAdvanced")):
		return false
	
	var maxMilk = 2000.0
	if(_triggerID == Trigger.WakeUpInCell):
		maxMilk = 10000.0
	if(_triggerID == Trigger.Waiting && _args.size() > 0):
		maxMilk = min(2000.0 * _args[0], 6000.0)
	
	var lactation = GM.pc.getBodypart(BodypartSlot.Breasts).getFluidProduction()
	if(lactation == null):
		return false
	
	if(lactation is Lactation && lactation.getFluidLevelForOptimalSize() < 0.9 && GM.pc.canBeMilked()):
		return false
	
	var beganLactating = GM.pc.stimulateLactation()
	
	if(GM.pc.canBeMilked()):
		var breastPump = GM.pc.getInventory().getEquippedItemByID("BreastPumpAdvanced")
		if(breastPump == null):
			return false
		
		GM.pc.addSkillExperience(Skill.Milking, 10)
		var howMuchTransferred = GM.pc.getBodypart(BodypartSlot.Breasts).getFluids().transferAmountTo(breastPump, maxMilk)
		if(howMuchTransferred > 0.0):
			GM.main.addMessage("Your breast pumps engage, milking your breasts for "+str(Util.roundF(howMuchTransferred))+" ml")
			
			if(breastPump.getFluids().isFull()):
				GM.main.addMessage("Your breast pumps are now full!")
		
	else:
		if(beganLactating):
			GM.main.addMessage("Your breast pumps engage, stimulating your breasts for a few minutes until you suddenly [b]begin lactating[/b]!")
		else:
			GM.main.addMessage("Your breast pumps engage, stimulating your breasts for a few minutes but not getting any milk.")
		
	return false
	
func getPriority():
	return 20
