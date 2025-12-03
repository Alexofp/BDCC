extends NpcOwnerEventBase

var pickedSexLimits:Array = []
var didIntro:bool = false

func _init():
	id = "SetOwnerLimits"

func onStart(_args:Array):
	setState("start")
	setSubResult(SUB_CONTINUE)

func start():
	if(!didIntro):
		saynn("You tell {npc.name} that you are ready to submit.. but only if {npc.he} {npc.verb('promise')} to listen to your limits.")
	
		saynn("Your owner is listening.")
		
		saynn("You can pick as many as you want. The owner might not listen to all of them but {npc.he} {npc.isAre} guranteed to listen to at least 1 of them.")
	else:
		saynn("List of limits:")
	var theOwner = getOwner()
	var theList:Array = []
	for theLimitID in pickedSexLimits:
		if(!NpcOwnerSexLimits.LIMITS.has(theLimitID)):
			continue
		var theChance:float = 100.0 if pickedSexLimits.size() == 1 else NpcOwnerSexLimits.getAgreeChance(theLimitID, theOwner)
		var theLimitEntry:Dictionary = NpcOwnerSexLimits.LIMITS[theLimitID]
		theList.append(theLimitEntry["name"]+": "+theLimitEntry["desc"]+" (Agree chance: "+str(Util.roundF(theChance, 1))+"%)")
	saynn(Util.join(theList, "\n"))
	
	addButton("CONFIRM", "Confirm your list of limits", "confirm")
	
	var bannedLimits:Array = []
	for limitEntryID in pickedSexLimits:
		if(!NpcOwnerSexLimits.LIMITS.has(limitEntryID)):
			continue
		var limitEntry:Dictionary = NpcOwnerSexLimits.LIMITS[limitEntryID]
		if(!limitEntry.has("bans")):
			continue
		bannedLimits.append_array(limitEntry["bans"])
	
	for limitEntryID in NpcOwnerSexLimits.LIMITS:
		var limitEntry:Dictionary = NpcOwnerSexLimits.LIMITS[limitEntryID]
		var isIn:bool = pickedSexLimits.has(limitEntryID)
		
		if(bannedLimits.has(limitEntryID)):
			addDisabledButton(("+" if !isIn else "-")+limitEntry["name"], "This limit is now incompatible with your other selected limits")
		else:
			addButton(("+" if !isIn else "-")+limitEntry["name"], limitEntry["desc"], "toggle", [limitEntryID])

func start_do(_id:String, _args:Array):
	if(_id == "toggle"):
		didIntro = true
		var theLimitID:String = _args[0]
		if(pickedSexLimits.has(theLimitID)):
			pickedSexLimits.erase(theLimitID)
		else:
			pickedSexLimits.append(theLimitID)
	if(_id == "confirm"):
		if(pickedSexLimits.empty()):
			endEvent()
			return
		
		sexLimits.clear()
		var theOwner = getOwner()
		for limitID in pickedSexLimits:
			if(RNG.chance(NpcOwnerSexLimits.getAgreeChance(limitID, theOwner))):
				sexLimits.append(limitID)
		if(sexLimits.size() <= 0):
			sexLimits.append(RNG.pick(pickedSexLimits))
		
		setState("ownerAgreeLimits")
	
func ownerAgreeLimits():
	saynn("You tell your owner your limits.. and then {npc.he} {npc.verb('tell')} which ones {npc.he} {npc.verb('agree')} to honor.")
	
	var theList:Array = []
	for theLimitID in pickedSexLimits:
		if(!NpcOwnerSexLimits.LIMITS.has(theLimitID)):
			continue
		var didAgree:bool = sexLimits.has(theLimitID)
		var theLimitEntry:Dictionary = NpcOwnerSexLimits.LIMITS[theLimitID]
		if(didAgree):
			theList.append("[color=#00CC00]"+theLimitEntry["name"]+": "+theLimitEntry["desc"]+"[/color] (Agrees)")
		else:
			theList.append("[color=red]"+theLimitEntry["name"]+": "+theLimitEntry["desc"]+"[/color] (Nope)")
	saynn(Util.join(theList, "\n"))
	
	addContinue("endEvent")
	
func saveData() -> Dictionary:
	var data := .saveData()
	
	data["pickedSexLimits"] = pickedSexLimits
	data["didIntro"] = didIntro
	
	return data

func loadData(_data:Dictionary):
	.loadData(_data)
	
	pickedSexLimits = SAVE.loadVar(_data, "pickedSexLimits", [])
	didIntro = SAVE.loadVar(_data, "didIntro", false)

func howMuchTimeToPass(_actionID:String, _args:Array) -> int:
	return 0
