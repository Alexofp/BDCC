extends EventBase

func _init():
	id = "Ch3s2ControlRoomEvent"

func registerTriggers(es):
	es.addTrigger(self, Trigger.EnteringRoom, "eng_controlroom")
	es.addEventCheck(self, "TaviBusy")
	
func run(_triggerID, _args):
	if(GM.QS.isActive("Ch3TaviQuest") && !getFlag("TaviModule.ch3CompletedDoorHack") && getFlag("TaviModule.ch3StartedInfiltration")):
		addButtonWithChecks("Control panels", "You gotta find a way to turn on the maintenance protol", "start", [], [ButtonChecks.NotHandsBlocked, ButtonChecks.NotArmsRestrained, ButtonChecks.NotBlindfolded])
	if(getFlag("TaviModule.ch3CompletedDoorHack") && !getFlag("TaviModule.ch3CompletedSafeHack")):
		saynn("There is a safe here that you can also try to hack")
		addButtonWithChecks("Safe", "Look at the safe and the console", "safe", [], [ButtonChecks.NotHandsBlocked, ButtonChecks.NotArmsRestrained, ButtonChecks.NotBlindfolded])
	
func getPriority():
	return 0

func onButton(_method, _args):
	if(_method == "start"):
		runScene("Ch3s2ControlRoomScene")
		#setFlag("TaviModule.ch2AlexTalkedTo", true)

	if(_method == "safe"):
		runScene("Ch3s2AdvancedHackScene")
		#setFlag("TaviModule.ch2AlexTalkedTo", true)

func eventCheck(_checkID, _args = []):
	if(GM.QS.isActive("Ch3TaviQuest") && !getFlag("TaviModule.ch3CompletedDoorHack") && getFlag("TaviModule.ch3StartedInfiltration")):
		return {busy=true}
