extends EventBase

func _init():
	id = "SocketPunishmentEvent"

func registerTriggers(es):
	es.addTrigger(self, Trigger.SleepInCell)

func react(_triggerID, _args):
	if(getFlag("SocketModule.socketWillPunish")):
		runScene("SocketPunishmentScene")
		setFlag("SocketModule.punishLineShouldSay", true)
		setFlag("SocketModule.socketWillPunish", false)
		return true
	
func getPriority():
	return 35
