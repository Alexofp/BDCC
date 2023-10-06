extends SexActivityBase

var pumpID = ""
var timesMilked = 0

func _init():
	id = "DomPutBreastPumpOnSub"
	startedByDom = true
	startedBySub = false

func getGoals():
	return {
		SexGoal.MilkWithBreastPump: 1.0,
	}

func getSupportedSexTypes():
	return {
		SexType.DefaultSex: true,
		SexType.StocksSex: true,
	}

func getActivityBaseScore(_sexEngine: SexEngine, _domInfo: SexDomInfo, _subInfo: SexSubInfo):
	return 0.0

func getStartActions(_sexEngine: SexEngine, _domInfo: SexDomInfo, _subInfo: SexSubInfo):
	var dom:BaseCharacter = _domInfo.getChar()
	var sub:BaseCharacter = _subInfo.getChar()
	var actions = []
	
	var allPumpsIDs = GlobalRegistry.getItemIDsByTag(ItemTag.BreastPumpUsableByNPC)
	
	#var putOnDomScore = getActivityScoreCustomGoals({SexGoal.SubWearStraponOnDom: 1.0}, _sexEngine, _domInfo, _subInfo) / float(allStraponIds.size())
	#var putOnSubScore = getActivityScoreCustomGoals({SexGoal.SubWearStraponOnSub: 1.0}, _sexEngine, _domInfo, _subInfo) / float(allStraponIds.size())
	
	#sub.canWearBreastPump() && 
	if(sub.getFirstItemThatCoversBodypart(BodypartSlot.Breasts) == null):
		if(dom.isPlayer()):
			for straponObject in dom.getInventory().getItemsWithTag(ItemTag.BreastPump):
				actions.append({
					name = straponObject.getVisibleName(),
					desc = straponObject.getVisisbleDescription(),
					args = ["sub", straponObject.uniqueID],
					score = 0.0,
					category = ["Breasts", "Breast Pump on sub"],
				})
		else:
			for pumpNewID in allPumpsIDs:
				var pumpObject:ItemBase = GlobalRegistry.getItemRef(pumpNewID)

				actions.append({
					name = pumpObject.getVisibleName(),
					desc = pumpObject.getVisisbleDescription(),
					args = ["sub", pumpNewID],
					score = getActivityScore(_sexEngine, _domInfo, _subInfo),
					category = ["Breasts", "Breast Pump on sub"],
				})
	
	return actions

func getVisibleName():
	return "Wear breast pump on sub"

func getCategory():
	return ["Wear"]

func getDomTags():
	return []

func getSubTags():
	return [SexActivityTag.BreastsUsed]
	
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
		getSub().getInventory().forceEquipStoreOther(pumpItem)
		
		state = "milkingSub"
		affectSub(subInfo.fetishScore({Fetish.Lactation: 1.0})+0.3, 0.03, -0.1, 0.0)
		
		var text = RNG.pick([
			"{dom.You} {dom.youVerb('force')} a "+pumpItem.getCasualName()+" on {sub.you}.",
			"{dom.You} {dom.youVerb('put')} a "+pumpItem.getCasualName()+" on {sub.you}.",
		])
		
		return {
			text = text,
			domSay=domReaction(SexReaction.PutBreastPumpOnSub),
			subSay=subReaction(SexReaction.PutBreastPumpOnSub),
		}

func processTurn():
	if(state == "milkingSub"):
		var pumpItem = getSub().getInventory().getEquippedItemByUniqueID(pumpID)
		if(pumpItem == null):
			endActivity()
			return
		
		affectSub(subInfo.fetishScore({Fetish.Lactation: 1.0})+0.3, 0.1, -0.02, 0.0)
		subInfo.addArousalForeplay(min(0.0, subInfo.fetishScore({Fetish.Lactation: 0.1})))
		
		timesMilked += 1
		var text = ""
		if(getSub().canBeMilked()):
			var howMuchToExtract = 10.0
			if(pumpItem.has_method("getMilkSpeedPerMinuteMin")):
				howMuchToExtract = RNG.randf_range(pumpItem.getMilkSpeedPerMinuteMin(), pumpItem.getMilkSpeedPerMinuteMax())
			
			var howMuchCollected = getSub().getBodypart(BodypartSlot.Breasts).getFluids().transferAmountTo(pumpItem, howMuchToExtract)
			
			var howMuchCollectedStr = str(Util.roundF(howMuchCollected, 1))+" ml"
					
			text += RNG.pick([
				"The breast pump milks {sub.your} {sub.breasts} for "+howMuchCollectedStr+" of {sub.milk}.",
				"The breast pump milks {sub.your} {sub.breasts} for "+howMuchCollectedStr+" of {sub.milk}.",
			])
			
			if(pumpItem.getFluids().isFull()):
				text += " The pump is full!"
			elif(RNG.chance(20)):
				var howMuchInPump = pumpItem.getFluids().getFluidAmount()
				
				text += " The pump now has "+str(Util.roundF(howMuchInPump, 1))+" ml in it."
		else:
			text += RNG.pick([
				"The breast pump stimulates {sub.your} {sub.breasts}.",
				"The breast pump stimulates {sub.your} {sub.breasts} but doesn't draw any milk out.",
				"The breast pump tries to milk {sub.your} {sub.breasts} but {sub.youHe} is not lactating.",
			])
			if(getSub().stimulateLactation()):
				text += RNG.pick([
					" {sub.You} suddenly [b]began lactating[/b]! {sub.Milk} is leaking from {sub.yourHis} nipples.",
				])
		
		if(timesMilked > 5 && !getSub().hasEffect(StatusEffect.SoreNipplesAfterMilking)):
			if(RNG.chance(10) && !getSub().hasPerk(Perk.MilkNoSoreNipples)):
				if(getSub().addEffect(StatusEffect.SoreNipplesAfterMilking)):
					text += " {sub.YourHis} nipples [b]got sore[/b] from so much milking!"
		
		if(getSub().hasEffect(StatusEffect.SoreNipplesAfterMilking)):
			subInfo.addPain(RNG.randi_range(2, 5))
			text += RNG.pick([
				" {sub.YourHis} sore nipples hurt!",
				" {sub.YourHis} sore nipples hurt from being milked so much!",
				" {sub.YourHis} nipples are sore!",
			])
		elif(RNG.chance(30)):
			text += RNG.pick([
				" {sub.YourHis} nipples itch.",
				" {sub.YourHis} nipples get tugged on.",
				" {sub.YourHis} nipples tingle.",
			])
		
		return {
			text = text,
			domSay=domReaction(SexReaction.MilkingSubWithBreastPump, 10),
			subSay=subReaction(SexReaction.MilkingSubWithBreastPump, 5),
		}


func getDomActions():
	var actions = []
	if(state in ["milkingSub"]):
		actions.append({
			"id": "stopMilking",
			"score": (0.1 if timesMilked > 3 else 0.0),
			"name": "Stop milking sub",
			"desc": "Take off the breast pumps from them",
			"priority" : 0,
		})
	return actions

func doDomAction(_id, _actionInfo):
	if(_id == "stopMilking"):
		var text = ""
		text += "{dom.You} {dom.youVerb('take')} off the breast pumps from {sub.your} tits!"
		
		var pumpItem = getSub().getInventory().getEquippedItemByUniqueID(pumpID)
		if(pumpItem != null):
			getSub().getInventory().removeEquippedItem(pumpItem)
			if(getDom().isPlayer()):
				getDom().getInventory().addItem(pumpItem)
				
		satisfyGoals()
		
		endActivity()
		return {
			text = text,
			domSay=domReaction(SexReaction.RemoveBreastPumpFromSub),
			subSay=subReaction(SexReaction.RemoveBreastPumpFromSub, 30),
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
	return actions

func doSubAction(_id, _actionInfo):
	if(_id == "moo"):
		var text = ""
		var muffled = ""
		if(getSub().isGagged()):
			muffled = " muffled"
		text += RNG.pick([
			"{sub.You} {sub.youVerb('produce')} a cute"+muffled+" moo noise.",
			"{sub.You} {sub.youVerb('imitate')} a cute"+muffled+" cow moo.",
			"{sub.You} {sub.youVerb('moo')} while {sub.yourHis} {sub.breasts} are being milked.",
			"{sub.You} {sub.youVerb('moo')} while breast pumps work on {sub.yourHis} breasts.."
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

func getAnimationPriority():
	return 0

func getAnimation():
	if(getSexType() != SexType.DefaultSex):
		return null
	return [StageScene.Cuddling, "squirm", {pc=domID, npc=subID}]

func saveData():
	var data = .saveData()
	
	data["pumpID"] = pumpID
	data["timesMilked"] = timesMilked

	return data
	
func loadData(data):
	.loadData(data)
	
	pumpID = SAVE.loadVar(data, "pumpID", "")
	timesMilked = SAVE.loadVar(data, "timesMilked", 0)
