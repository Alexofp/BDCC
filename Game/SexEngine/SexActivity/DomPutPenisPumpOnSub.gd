extends SexActivityBase

var pumpID:String = ""
var timesMilked:int = 0

func _init():
	id = "DomPutPenisPumpOnSub"
	startedByDom = true
	startedBySub = false
	
	activityName = "Wear penis pump on sub"
	activityDesc = "Put a penis pump on them"
	activityCategory = ["Wear"]

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
	
	var allPumpsIDs = GlobalRegistry.getItemIDsByTag(ItemTag.PenisPumpUsableByNPC)
	
	#var putOnDomScore = getActivityScoreCustomGoals({SexGoal.SubWearStraponOnDom: 1.0}, _sexEngine, _domInfo, _subInfo) / float(allStraponIds.size())
	#var putOnSubScore = getActivityScoreCustomGoals({SexGoal.SubWearStraponOnSub: 1.0}, _sexEngine, _domInfo, _subInfo) / float(allStraponIds.size())
	
	#sub.canWearBreastPump() && 
	if(sub.hasReachablePenis() && sub.getFirstItemThatCoversBodypart(BodypartSlot.Penis) == null):
		if(dom.isPlayer()):
			for straponObject in dom.getInventory().getItemsWithTag(ItemTag.PenisPump):
				addStartAction(["sub", straponObject.uniqueID], straponObject.getVisibleName(), straponObject.getVisisbleDescription(), 0.0, {A_CATEGORY: ["Wear", "Penis pump on sub"]})
		else:
			var theScore:float = getActivityScore(_sexEngine, _domInfo, _subInfo)
			for pumpNewID in allPumpsIDs:
				var pumpObject:ItemBase = GlobalRegistry.getItemRef(pumpNewID)
				
				addStartAction(["sub", pumpNewID], pumpObject.getVisibleName(), pumpObject.getVisisbleDescription(), theScore, {A_CATEGORY: ["Wear", "Penis pump on sub"]})

func getTags(_indx:int) -> Array:
	if(_indx == SUB_0):
		return [SexActivityTag.PenisUsed, SexActivityTag.PenisInside]
	return []
	
func isActivityImpossibleShouldStop() -> bool:
	if(!getSub().hasPenis()):
		return true
	return false
	
func startActivity(_args):
	if(_args[0] == "sub"):
		var pumpItem:ItemBase
		if(getDom().isPlayer()):
			pumpItem = getDom().getInventory().getItemByUniqueID(_args[1])
			getSexEngine().addTrackedGear(getDomID(), getSubID(), pumpItem.uniqueID)
			getDom().getInventory().removeItem(pumpItem)
			pumpID = pumpItem.uniqueID
		else:
			pumpItem = GlobalRegistry.createItem(_args[1])
			pumpID = pumpItem.uniqueID
		#	fuelStraponRandomly(straponItem)
		getSub().getInventory().forceEquipByStoreOther(pumpItem, getDom())
		
		state = "milkingSub"
		affectSub(getSubInfo().fetishScore({Fetish.Lactation: 1.0})+0.3, 0.03, -0.1, 0.0)
		
		addTextPick([
			"{dom.You} {dom.youVerb('force')} a "+pumpItem.getCasualName()+" on {sub.you}.",
			"{dom.You} {dom.youVerb('put')} a "+pumpItem.getCasualName()+" on {sub.you}.",
		])
		react(SexReaction.DomPutOnPenisPumpOnSub)
		return

func milkingSub_processTurn():
	var pumpItem = getSub().getInventory().getEquippedItemByUniqueID(pumpID)
	if(pumpItem == null):
		endActivity()
		return
	
	affectSub(getSubInfo().fetishScore({Fetish.SeedMilking: 1.0})+0.3, 0.03, -0.01, 0.0)
	getSubInfo().addArousal(max(0.1, getSubInfo().fetishScore({Fetish.SeedMilking: 0.2})))
	
	timesMilked += 1
	addTextPick([
		"The penis pump stimulates {sub.your} {sub.penis}.",
		"The penis pump stimulates {sub.your} {sub.penis}.",
		"The penis pump strokes {sub.your} {sub.penis}.",
		"The penis pump strokes {sub.your} {sub.penis}.",
		"The penis pump pleasures {sub.your} {sub.penis}.",
		"Pleasure ring of the penis pump strokes {sub.your} {sub.penis}.",
	])
	return


func getActions(_indx:int):
	if(_indx == DOM_0):
		if(state in ["milkingSub"]):
			addAction("stopMilking", (0.1 if timesMilked > 15 else 0.0), "Stop seed-milking sub", "Take off the penis pump from them")
	
	if(_indx == SUB_0):
		addAction("moo", fetish(SUB_0, Fetish.Lactation)*0.3, "Moo", "Do the cute noise")
		if(isReadyToCumHandled(SUB_0)):
			addAction("cum", 1.0, "Cum!", "You gonna cum.", {A_PRIORITY: 1001})

func doAction(_indx:int, _id:String, _action:Dictionary):
	if(_id == "stopMilking"):
		addText("{dom.You} {dom.youVerb('take')} off the pump from {sub.your} cock!")
		
		var pumpItem = getSub().getInventory().getEquippedItemByUniqueID(pumpID)
		if(pumpItem != null):
			getSub().getInventory().removeEquippedItem(pumpItem)
			if(getDom().isPlayer()):
				getDom().getInventory().addItem(pumpItem)
				
		satisfyGoals()
		
		endActivity()
		return
		
	if(_id == "cum"):
		cumGeneric(SUB_0, DOM_0, UniqueOrgasm.PenisPump)
		satisfyGoals()
		react(SexReaction.DomPenisPumpOnSubMilk)
		return
	if(_id == "moo"):
		var muffled:String = ""
		if(getSub().isGagged()):
			muffled = " muffled"
		addTextPick([
			"{sub.You} {sub.youVerb('produce')} a cute"+muffled+" moo noise.",
			"{sub.You} {sub.youVerb('imitate')} a cute"+muffled+" cow moo.",
			"{sub.You} {sub.youVerb('moo')} while {sub.yourHis} {sub.penis} is being milked.",
			"{sub.You} {sub.youVerb('moo')} while a penis pump strokes {sub.yourHis} cock.."
		])
		moan(SUB_0, SexReaction.SubMoos)
		return

func onActivityEnd():
	var pumpItem = getSub().getInventory().getEquippedItemByUniqueID(pumpID)
	if(pumpItem == null):
		return
	getSub().getInventory().removeEquippedItem(pumpItem)
	if(getDom().isPlayer()):
		getDom().getInventory().addItem(pumpItem)

func getOrgasmHandlePriority(_indx:int) -> int:
	if(_indx == SUB_0):
		return 3
	return -1

func saveData():
	var data = .saveData()
	
	data["pumpID"] = pumpID
	data["timesMilked"] = timesMilked

	return data
	
func loadData(data):
	.loadData(data)
	
	pumpID = SAVE.loadVar(data, "pumpID", "")
	timesMilked = SAVE.loadVar(data, "timesMilked", 0)
