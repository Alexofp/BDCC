extends SexActivityBase

var pumpID = ""
var timesMilked = 0

func _init():
	id = "DomPutPenisPumpOnSub"
	startedByDom = true
	startedBySub = false

func getGoals():
	return {
		SexGoal.MilkWithPenisPump: 1.0,
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
	
	var allPumpsIDs = GlobalRegistry.getItemIDsByTag(ItemTag.PenisPumpUsableByNPC)
	
	#var putOnDomScore = getActivityScoreCustomGoals({SexGoal.SubWearStraponOnDom: 1.0}, _sexEngine, _domInfo, _subInfo) / float(allStraponIds.size())
	#var putOnSubScore = getActivityScoreCustomGoals({SexGoal.SubWearStraponOnSub: 1.0}, _sexEngine, _domInfo, _subInfo) / float(allStraponIds.size())
	
	#sub.canWearBreastPump() && 
	if(sub.hasReachablePenis() && sub.getFirstItemThatCoversBodypart(BodypartSlot.Penis) == null):
		if(dom.isPlayer()):
			for straponObject in dom.getInventory().getItemsWithTag(ItemTag.PenisPump):
				actions.append({
					name = straponObject.getVisibleName(),
					desc = straponObject.getVisisbleDescription(),
					args = ["sub", straponObject.uniqueID],
					score = 0.0,
					category = ["Wear", "Penis pump on sub"],
				})
		else:
			for pumpNewID in allPumpsIDs:
				var pumpObject:ItemBase = GlobalRegistry.getItemRef(pumpNewID)

				actions.append({
					name = pumpObject.getVisibleName(),
					desc = pumpObject.getVisisbleDescription(),
					args = ["sub", pumpNewID],
					score = getActivityScore(_sexEngine, _domInfo, _subInfo),
					category = ["Wear", "Penis pump on sub"],
				})
	
	return actions

func getVisibleName():
	return "Wear penis pump on sub"

func getCategory():
	return ["Wear"]

func getDomTags():
	return []

func getSubTags():
	return [SexActivityTag.PenisUsed, SexActivityTag.PenisInside]
	
func startActivity(_args):
	state = ""
	
	if(_args[0] == "sub"):
		var pumpItem:ItemBase
		if(getDom().isPlayer()):
			pumpItem = getDom().getInventory().getItemByUniqueID(_args[1])
			getSexEngine().addTrackedGear(domID, subID, pumpItem.uniqueID)
			getDom().getInventory().removeItem(pumpItem)
			pumpID = pumpItem.uniqueID
		else:
			pumpItem = GlobalRegistry.createItem(_args[1])
			pumpID = pumpItem.uniqueID
		#	fuelStraponRandomly(straponItem)
		getSub().getInventory().forceEquipByStoreOther(pumpItem, getDom())
		
		state = "milkingSub"
		affectSub(subInfo.fetishScore({Fetish.Lactation: 1.0})+0.3, 0.03, -0.1, 0.0)
		
		var text = RNG.pick([
			"{dom.You} {dom.youVerb('force')} a "+pumpItem.getCasualName()+" on {sub.you}.",
			"{dom.You} {dom.youVerb('put')} a "+pumpItem.getCasualName()+" on {sub.you}.",
		])
		
		return {
			text = text,
			#domSay=domReaction(SexReaction.PutBreastPumpOnSub),
			#subSay=subReaction(SexReaction.PutBreastPumpOnSub),
		}

func processTurn():
	if(state == "milkingSub"):
		var pumpItem = getSub().getInventory().getEquippedItemByUniqueID(pumpID)
		if(pumpItem == null):
			endActivity()
			return
		
		affectSub(subInfo.fetishScore({Fetish.SeedMilking: 1.0})+0.3, 0.03, -0.01, 0.0)
		subInfo.addArousal(max(0.1, subInfo.fetishScore({Fetish.SeedMilking: 0.2})))
		
		timesMilked += 1
		var text = ""
		text += RNG.pick([
			"The penis pump stimulates {sub.your} {sub.penis}.",
			"The penis pump stimulates {sub.your} {sub.penis}.",
			"The penis pump strokes {sub.your} {sub.penis}.",
			"The penis pump strokes {sub.your} {sub.penis}.",
			"The penis pump pleasures {sub.your} {sub.penis}.",
			"Pleasure ring of the penis pump strokes {sub.your} {sub.penis}.",
		])
		
		return {
			text = text,
			#domSay=domReaction(SexReaction.MilkingSubWithBreastPump, 10),
			#subSay=subReaction(SexReaction.MilkingSubWithBreastPump, 5),
		}


func getDomActions():
	var actions = []
	if(state in ["milkingSub"]):
		actions.append({
			"id": "stopMilking",
			"score": (0.1 if timesMilked > 15 else 0.0),
			"name": "Stop seed-milking sub",
			"desc": "Take off the penis pump from them",
			"priority" : 0,
		})
	return actions

func doDomAction(_id, _actionInfo):
	if(_id == "stopMilking"):
		var text = ""
		text += "{dom.You} {dom.youVerb('take')} off the pump from {sub.your} cock!"
		
		var pumpItem = getSub().getInventory().getEquippedItemByUniqueID(pumpID)
		if(pumpItem != null):
			getSub().getInventory().removeEquippedItem(pumpItem)
			if(getDom().isPlayer()):
				getDom().getInventory().addItem(pumpItem)
				
		satisfyGoals()
		
		endActivity()
		return {
			text = text,
			#domSay=domReaction(SexReaction.RemoveBreastPumpFromSub),
			#subSay=subReaction(SexReaction.RemoveBreastPumpFromSub, 30),
		}

func getSubActions():
	var actions = []
	actions.append({
		"id": "moo",
		"score": subInfo.fetishScore({Fetish.Lactation: 0.3}),
		"name": "Moo",
		"desc": "Do the cute noise",
		"priority" : 0,
	})
	if(subInfo.isReadyToCum() && isHandlingSubOrgasms()):
		actions.append({
			"id": "cum",
			"score": 1.0,
			"name": "Cum!",
			"desc": "You gonna cum.",
			"priority": 1001,
		})
	return actions

func doSubAction(_id, _actionInfo):
	if(_id == "cum"):
		getSub().cumOnFloor(domID)
		subInfo.cum()
		
		satisfyGoals()
		
		return getGenericSubOrgasmData()
	if(_id == "moo"):
		var text = ""
		var muffled = ""
		if(getSub().isGagged()):
			muffled = " muffled"
		text += RNG.pick([
			"{sub.You} {sub.youVerb('produce')} a cute"+muffled+" moo noise.",
			"{sub.You} {sub.youVerb('imitate')} a cute"+muffled+" cow moo.",
			"{sub.You} {sub.youVerb('moo')} while {sub.yourHis} {sub.penis} is being milked.",
			"{sub.You} {sub.youVerb('moo')} while a penis pump strokes {sub.yourHis} cock.."
		])
		domInfo.addAnger(-0.05)
		domInfo.addLust(5)
		subInfo.addArousalForeplay(0.03)
		subInfo.addLust(10)
		return {
			text = text,
			subSay=subReaction(SexReaction.SubMoos),
			
		}

func onActivityEnd():
	var pumpItem = getSub().getInventory().getEquippedItemByUniqueID(pumpID)
	if(pumpItem != null):
		getSub().getInventory().removeEquippedItem(pumpItem)
		if(getDom().isPlayer()):
			getDom().getInventory().addItem(pumpItem)

func getSubOrgasmHandlePriority():
	return 3



func saveData():
	var data = .saveData()
	
	data["pumpID"] = pumpID
	data["timesMilked"] = timesMilked

	return data
	
func loadData(data):
	.loadData(data)
	
	pumpID = SAVE.loadVar(data, "pumpID", "")
	timesMilked = SAVE.loadVar(data, "timesMilked", 0)
