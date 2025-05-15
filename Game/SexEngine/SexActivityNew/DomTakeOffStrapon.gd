extends SexActivityBase

func _init():
	id = "DomTakeOffStrapon"
	startedByDom = true
	startedBySub = false
	
	activityName = "Take off strapon"
	activityDesc = "Taking off the strapon"
	activityCategory = ["Undress"]

func getGoals():
	return {
	}

func getSupportedSexTypes():
	return {
		SexType.DefaultSex: true,
		SexType.StocksSex: true,
		SexType.SlutwallSex: true,
	}

func getActivityBaseScore(_sexEngine: SexEngine, _domInfo: SexDomInfo, _subInfo: SexSubInfo):
	return 0.0

func getStartActions(_sexEngine: SexEngine, _domInfo: SexDomInfo, _subInfo: SexSubInfo):
	var dom:BaseCharacter = _domInfo.getChar()
	var sub:BaseCharacter = _subInfo.getChar()
	
	var domTakeOffScore = 1.0 - getActivityScoreCustomGoals({SexGoal.SubWearStraponOnDom: 100.0}, _sexEngine, _domInfo, _subInfo)
	var subTakeOffScore = 1.0 - getActivityScoreCustomGoals({SexGoal.SubWearStraponOnSub: 100.0}, _sexEngine, _domInfo, _subInfo)
	
	if(!_sexEngine.hasTag(_domInfo.charID, SexActivityTag.PenisUsed) && dom.isWearingStrapon()):
		addStartAction(["dom"], "Take off strapon", "Take off your strapon", domTakeOffScore, {A_CATEGORY: ["Undress"]})
	if(!_sexEngine.hasTag(_subInfo.charID, SexActivityTag.PenisUsed) && sub.isWearingStrapon()):
		addStartAction(["sub"], "Take off sub strapon", "Take off sub's strapon", subTakeOffScore, {A_CATEGORY: ["Undress"]})

func getTags(_indx:int) -> Array:
	if(_indx == DOM_0):
		return [SexActivityTag.HandsUsed]
	return []

func startActivity(_args):
	endActivity()
	if(_args[0] == "dom"):
		var strapon = getDom().getWornStrapon()
		if(getSexEngine().checkGearIsFromPC(getDomID(), strapon.uniqueID)):
			getDom().getInventory().removeEquippedItem(strapon)
			GlobalRegistry.getCharacter("pc").getInventory().addItem(strapon)
		else:
			getDom().getInventory().removeEquippedItem(strapon)
		addText("{dom.You} {dom.youVerb('take')} off {dom.yourHis} strapon.")
		return
	
	if(_args[0] == "sub"):
		var strapon = getSub().getWornStrapon()
		if(getSexEngine().checkGearIsFromPC(getSubID(), strapon.uniqueID)):
			getSub().getInventory().removeEquippedItem(strapon)
			GlobalRegistry.getCharacter("pc").getInventory().addItem(strapon)
		else:
			getSub().getInventory().removeEquippedItem(strapon)
		addText("{dom.You} {dom.youVerb('take')} off {sub.your} strapon.")
		return
