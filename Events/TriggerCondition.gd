extends Object
class_name TriggerCondition

const Trigger_CaughtOffLimitsCD = "Trigger_CaughtOffLimitsCD"

static func canTrigger(triggerName):
	if(triggerName == Trigger.CaughtOffLimits):
		if(GM.main.getFlag(Trigger_CaughtOffLimitsCD, 0) > 0):
			return false
	
	return true

static func onTrigger(triggerName):
	if(triggerName == Trigger.CaughtOffLimits):
		GM.main.setFlag(Trigger_CaughtOffLimitsCD, 3)
	
	if(triggerName == Trigger.EnteringRoom):
		var cd = GM.main.getFlag(Trigger_CaughtOffLimitsCD, null)
		if(cd != null && cd > 0):
			GM.main.setFlag(Trigger_CaughtOffLimitsCD, cd - 1)

static func onNewDay():
	pass
