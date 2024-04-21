extends EventBase

func _init():
	id = "ArticaShyTalkEvent"

func registerTriggers(es):
	es.addTrigger(self, Trigger.EnteringRoom, "hall_canteen")
	es.addTrigger(self, Trigger.EnteringRoom, "cellblock_lilac_nearcell")

func run(_triggerID, _args):
	if(_args[0] == "cellblock_lilac_nearcell"):
		if(getFlag("ArticaModule.s0happened") && !getFlag("ArticaModule.s1happened")):
			addButtonUnlessLate("White fluff", "Search for that new inmate", "search")
		
		if(getFlag("ArticaModule.s1happened") && !getFlag("ArticaModule.s2happened")):
			if(GM.main.getDays() > getFlag("ArticaModule.s1day", -1)):
				addButtonUnlessLate("White fluff", "Search for that new inmate", "c2scene")
			else:
				addDisabledButton("White fluff", "The guard is standing near that fluff's cell. Better come back some other day")
	else:
		if(getFlag("ArticaModule.s2happened") && !getFlag("ArticaModule.s3happened")):
			addButtonUnlessLate("White fluff", "She seems to be here", "s3scene")
		if(getFlag("ArticaModule.s3happened") && !getFlag("ArticaModule.s4happened")):
			if(GM.main.getDays() > getFlag("ArticaModule.s3day", -1)):
				addButtonUnlessLate("Artica", "Join the white fluff", "s4scene")
			else:
				addDisabledButton("Artica", "Visit her tomorrow")
		if(getFlag("ArticaModule.s4happened") && !getFlag("ArticaModule.s5happened")):
			addButtonUnlessLate("Artica", "Join the white fluff", "s5scene")
		
		if(getFlag("ArticaModule.s5happened") && !getFlag("ArticaModule.corruptionBegan")):
			if(GM.main.getDays() > getFlag("ArticaModule.s5day", -1)):
				if(getFlag("ArticaModule.s6GrabbedThroat")):
					addButtonUnlessLate("Artica", "Join the white fluff", "s7scene")
				else:
					addButtonUnlessLate("Artica", "Join the white fluff", "s6scene")
			else:
				addDisabledButton("Artica", "Visit her tomorrow")

func getPriority():
	return 0

func onButton(_method, _args):
	if(_method == "search"):
		setFlag("ArticaModule.s1happened", true)
		setFlag("ArticaModule.s1day", GM.main.getDays())
		runScene("articaS1CellblockScene")

	if(_method == "c2scene"):
		setFlag("ArticaModule.s2happened", true)
		runScene("articaS2HungryScene")

	if(_method == "s3scene"):
		setFlag("ArticaModule.s3happened", true)
		setFlag("ArticaModule.s3day", GM.main.getDays())
		runScene("articaS3CanteenScene")

	if(_method == "s4scene"):
		setFlag("ArticaModule.s4happened", true)
		runScene("articaS4CanteenScene")

	if(_method == "s5scene"):
		setFlag("ArticaModule.s5happened", true)
		setFlag("ArticaModule.s5day", GM.main.getDays())
		runScene("articaS5CanteenPawsScene")

	if(_method == "s6scene"):
		runScene("articaS6CanteenTalkScene")

	if(_method == "s7scene"):
		setFlag("ArticaModule.corruptionBegan", true)
		runScene("articaS7FirstShowerScene", [true])
	
	
