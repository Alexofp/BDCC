extends SexActivityBase

func _init():
	id = "DomTakeOffStrapon"
	startedByDom = true
	startedBySub = false

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
	var actions = []
	
	var domTakeOffScore = 1.0 - getActivityScoreCustomGoals({SexGoal.SubWearStraponOnDom: 100.0}, _sexEngine, _domInfo, _subInfo)
	var subTakeOffScore = 1.0 - getActivityScoreCustomGoals({SexGoal.SubWearStraponOnSub: 100.0}, _sexEngine, _domInfo, _subInfo)
	
	if(!_sexEngine.hasTag(_domInfo.charID, SexActivityTag.PenisUsed) && dom.isWearingStrapon()):
		actions.append({
			name = "Take off strapon",
			desc = "Take off your strapon",
			args = ["dom"],
			score = domTakeOffScore,
			category = ["Undress"],
		})
	if(!_sexEngine.hasTag(_subInfo.charID, SexActivityTag.PenisUsed) && sub.isWearingStrapon()):
		actions.append({
			name = "Take off sub strapon",
			desc = "Take off sub's strapon",
			args = ["sub"],
			score = subTakeOffScore,
			category = ["Undress"],
		})
	
	return actions

func getVisibleName():
	return "Take off strapon"

func getCategory():
	return ["Undress"]

func getDomTags():
	return [SexActivityTag.HandsUsed]

func getSubTags():
	return []

func startActivity(_args):
	state = ""
	
	endActivity()
	
	if(_args[0] == "dom"):
		var strapon = getDom().getWornStrapon()
		if(getSexEngine().checkGearIsFromPC(domID, strapon.uniqueID)):
			getDom().getInventory().removeEquippedItem(strapon)
			GlobalRegistry.getCharacter("pc").getInventory().addItem(strapon)
		else:
			getDom().getInventory().removeEquippedItem(strapon)
		
		return {
			text = "{dom.You} {dom.youVerb('take')} off {dom.yourHis} strapon.",
			#domSay = domReaction(SexReaction.DomPutsOnACondom),
		}
	
	if(_args[0] == "sub"):
		var strapon = getSub().getWornStrapon()
		if(getSexEngine().checkGearIsFromPC(subID, strapon.uniqueID)):
			getSub().getInventory().removeEquippedItem(strapon)
			GlobalRegistry.getCharacter("pc").getInventory().addItem(strapon)
		else:
			getSub().getInventory().removeEquippedItem(strapon)
		
		return {
			text = "{dom.You} {dom.youVerb('take')} off {sub.your} strapon.",
			#domSay = domReaction(SexReaction.DomPutsOnACondomOnSub),
		}
