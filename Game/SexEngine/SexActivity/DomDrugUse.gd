extends SexActivityBase

var usedItemID = ""
var usedUniqueItemID = ""
var timePassed = 0
var pillVariants:Array = []

func _init():
	id = "DomDrugUse"
	startedByDom = true
	startedBySub = false

func getGoals():
	return {
		SexGoal.UseTFDrug: 1.0,
	}

func getSupportedSexTypes():
	return {
		SexType.DefaultSex: true,
		SexType.StocksSex: true,
		SexType.SlutwallSex: true,
	}

func getActivityBaseScore(_sexEngine: SexEngine, _domInfo: SexDomInfo, _subInfo: SexSubInfo):
	var mult = 1.0
	if(_domInfo.getChar().getCharacterType() == CharacterType.Nurse):
		mult = 2.0
	return 0.0 + _domInfo.fetishScore({Fetish.DrugUse: 0.5}) * mult

func getVisibleName():
	return "Drug use"

func getCategory():
	return ["Drugs/Lube"]

func getDomTags():
	return [SexActivityTag.OrderedToDoSomething]

func getSubTags():
	return [SexActivityTag.OrderedToDoSomething]

func getPossibleDrugsInfo(_sexEngine: SexEngine, _domInfo: SexDomInfo, _subInfo: SexSubInfo):
	var thedrugs:Array = []
	if(_domInfo.getChar().isPlayer()):
		for item in GM.pc.getInventory().getItemsWithTag(ItemTag.SexEngineDrug):
			if(item.has_method("getSexEngineInfo")):
				thedrugs.append({
					id = item.id,
					item = item,
					info = item.getSexEngineInfo(_sexEngine, _domInfo, _subInfo),
				})
		return thedrugs
	
	for itemID in GlobalRegistry.getItemIDsByTag(ItemTag.SexEngineDrug):
		var item = GlobalRegistry.getItemRef(itemID)
		if(item.has_method("getSexEngineInfo")):
			thedrugs.append({
				id = itemID,
				info = item.getSexEngineInfo(_sexEngine, _domInfo, _subInfo),
			})
	
	return thedrugs
	
func getPossibleCanApplyInfo(_sexEngine: SexEngine, _domInfo: SexDomInfo, _subInfo: SexSubInfo):
	var thedrugs:Array = []
	for itemID in GlobalRegistry.getItemIDsByTag(ItemTag.SexEngineCanApply):
		var item = GlobalRegistry.getItemRef(itemID)
		if(item.has_method("getSexEngineInfo")):
			thedrugs.append({
				id = itemID,
				info = item.getSexEngineInfo(_sexEngine, _domInfo, _subInfo),
			})
	
	return thedrugs
	
func getDrugInfo(itemID, uniqueItemID):
	var item
	if(uniqueItemID != ""):
		item = getDom().getInventory().getItemByUniqueID(uniqueItemID)
	else:
		item = GlobalRegistry.getItemRef(itemID)
		if(item == null):
			return null
	
	return item.getSexEngineInfo(getSexEngine(), domInfo, subInfo)

func getStartActions(_sexEngine: SexEngine, _domInfo: SexDomInfo, _subInfo: SexSubInfo):
	var actions = []
	
	var possibleDrugsInfo = getPossibleDrugsInfo(_sexEngine, _domInfo, _subInfo)
	addDrugButtons(actions, possibleDrugsInfo, _sexEngine, _domInfo, _subInfo, false)
	
	var possibleCanApplyInfo = getPossibleCanApplyInfo(_sexEngine, _domInfo, _subInfo)
	addDrugButtons(actions, possibleCanApplyInfo, _sexEngine, _domInfo, _subInfo, true)
	
	return actions

func addDrugButtons(actions:Array, possibleDrugsInfo:Array, _sexEngine: SexEngine, _domInfo: SexDomInfo, _subInfo: SexSubInfo, _isCanApply:bool = false):
	var dom:BaseCharacter = _domInfo.getChar()
	var sub:BaseCharacter = _subInfo.getChar()
	
	for itemEntry in possibleDrugsInfo:
		var itemID = itemEntry["id"]
		var drugInfo = itemEntry["info"]
		var item = itemEntry["item"] if itemEntry.has("item") else null # Only if pc
		
		if(!dom.isPlayer()):
			if(drugInfo.has("maxUsesByNPC")):
				var maxUses = drugInfo["maxUsesByNPC"]
				var currentUses = _domInfo.getMemory("USEDDRUG_"+str(itemID), 0)
				if(currentUses >= maxUses):
					continue

		var desc = drugInfo["desc"]
		if(dom.isPlayer() && item != null && item.canCombine()):
			desc = "Amount left: "+ str(dom.getInventory().getAmountOf(itemID))+"\n"+desc
		
		var drugFetishScore:float = 0.0
		
		if(drugInfo.has("sexgoal")):
			drugFetishScore = _domInfo.goalsScore({drugInfo["sexgoal"]: 1.0}, _subInfo.charID)
		else:
			drugFetishScore = clamp(_domInfo.fetishScore({Fetish.DrugUse: 1.0}) + 0.5, 0.0, 1.0) / 10.0

		if((_isCanApply || !dom.isOralBlocked()) && (!drugInfo.has("canUseOnDom") || drugInfo["canUseOnDom"])):
			actions.append({
				name = drugInfo["name"],
				args = ["useonself", itemID, _isCanApply, item],
				score = drugInfo["scoreOnSelf"] * drugFetishScore,
				category = getCategory()+["Self" if !_isCanApply else "Apply self"],
				desc = desc,
			})
		if((_isCanApply || !sub.isOralBlocked()) && (!drugInfo.has("canUseOnSub") || drugInfo["canUseOnSub"])):
			if(_subInfo.canDoActions() && getSexType() != SexType.SlutwallSex && !_isCanApply):
				actions.append({
					name = drugInfo["name"],
					args = ["offertosub", itemID, _isCanApply, item],
					score = drugInfo["scoreOnSub"]*(1.0 - _domInfo.getAngerScore()) * drugFetishScore,
					category = getCategory()+["Offer to sub"],
					desc = desc,
				})
			actions.append({
				name = drugInfo["name"],
				args = ["forcetosub", itemID, _isCanApply, item],
				score = drugInfo["scoreOnSub"]*(_domInfo.getAngerScore() if !_isCanApply else 1.0) * drugFetishScore,
				category = getCategory()+["Force on sub" if !_isCanApply else "Apply on sub"],
				desc = desc,
			})

func pcCanSeeText(ifcan, ifcant = "some pill"):
	if(GM.pc.isBlindfolded()):
		return ifcant
	return ifcan

func startActivity(_args):
	state = ""
	
	if(_args[0] == "forcetosub"):
		timePassed = 0
		#endActivity()
		var itemID = _args[1]
		var item = _args[3]
		usedUniqueItemID = item.uniqueID if item != null else ""
		var drugInfo = getDrugInfo(itemID, usedUniqueItemID)
		usedItemID = itemID
		var _isCanApply = _args[2]
		
		if(!_isCanApply):
			state = "forcing"
		else:
			state = "forcingCanApply"
		
		#if(getDom().isPlayer()):
		#	if(item != null):
		#		item.removeXOrDestroy(1)
			#getDom().getInventory().removeXOfOrDestroy(itemID, 1)
		if(!getDom().isPlayer()):
			domInfo.increaseMemory("USEDDRUG_"+str(itemID))
		
		if(drugInfo == null):
			endActivity()
			return
		
		var text = RNG.pick([
			"{dom.You} {dom.youVerb('produce')} "+pcCanSeeText(drugInfo["usedName"])+" and {dom.youVerb('try', 'tries')} to force it into {sub.your} mouth!",
		])
		if(getSexType() == SexType.SlutwallSex):
			text = RNG.pick([
				"{dom.You} {dom.youVerb('produce')} "+pcCanSeeText(drugInfo["usedName"])+" and {dom.youVerb('slide')} it into {sub.your} asshole! The pill begins to dissolve inside.",
			])
		if(_isCanApply):
			text = RNG.pick([
				"{dom.You} {dom.youVerb('produce')} "+pcCanSeeText(drugInfo["usedName"], "something")+" and {dom.youVerb('begin')} applying it on {sub.you}!",
			])
		
		if(getSub().isPlayer() && itemID == "TFPill"):
			text += " [color=#"+Color.cyan.to_html()+"]This pill might do something to your body[/color]"

		if(_isCanApply):
			return {text = text}
		else:
			return {text = text, domSay=domReaction(SexReaction.ForcingDrug)}
	
	if(_args[0] == "useonself"):
		timePassed = 0
		#endActivity()
		var itemID = _args[1]
		var item = _args[3]
		usedUniqueItemID = item.uniqueID if item != null else ""
		var drugInfo = getDrugInfo(itemID, usedUniqueItemID)
		usedItemID = itemID
		var _isCanApply = _args[2]
		
		if(!_isCanApply):
			state = "domabouttotake"
		else:
			state = "domabouttotakeCanApply"
		
		#if(getDom().isPlayer()):
			#if(item != null):
			#	item.removeXOrDestroy(1)
			#getDom().getInventory().removeXOfOrDestroy(itemID, 1)
		if(!getDom().isPlayer()):
			domInfo.increaseMemory("USEDDRUG_"+str(itemID))
		
		if(drugInfo == null):
			endActivity()
			return
		
		var text = RNG.pick([
			"{dom.You} {dom.youVerb('produce')} "+pcCanSeeText(drugInfo["usedName"])+" and {dom.youAre} about to {dom.youVerb('put')} it into {dom.yourHis} mouth.",
		])
		if(_isCanApply):
			text = RNG.pick([
				"{dom.You} {dom.youVerb('produce')} "+pcCanSeeText(drugInfo["usedName"], "something")+" and {dom.youVerb('begin')} applying it on {dom.yourself}.",
			])
		return {text = text}
	
	if(_args[0] == "offertosub"):
		state = "offering"
		timePassed = 0
		#endActivity()
		var itemID = _args[1]
		var item = _args[3]
		usedUniqueItemID = item.uniqueID if item != null else ""
		var drugInfo = getDrugInfo(itemID, usedUniqueItemID)
		usedItemID = itemID

		
		if(drugInfo == null):
			endActivity()
			return
		
		var customDomSay:String = ""
		
		var text = RNG.pick([
			"{dom.You} {dom.youVerb('produce')} "+pcCanSeeText(drugInfo["usedName"])+" and {dom.youVerb('offer')} it to {sub.you}.",
		])
		if(getSub().isBlindfolded()):
			text += RNG.pick([
				" {sub.YouHe} can only guess what drug that is.",
			])
		elif(getSub().isPlayer() && itemID == "TFPill"):
			text += " [color=#"+Color.cyan.to_html()+"]This pill might do something to your body[/color]"

			generatePillVariants(itemID)
			if(!pillVariants.empty()):
				var tfNames:Array = []
				for tfID in pillVariants:
					var tf:TFBase = GlobalRegistry.getTransformationRef(tfID)
					if(tf != null):
						var pillName:String = tf.getPillName()
						tfNames.append("a "+pillName)
				customDomSay = "It's either "+Util.humanReadableList(tfNames, "or")+". "
				customDomSay += RNG.pick([
					"But I'm not gonna say which.",
					"But I don't remember which.",
					"Try your luck.",
					"Just try it and see what happens.",
					"C'mon, it will be fun.",
				])

		return {text = text, domSay=domReaction(SexReaction.OfferingDrug) if customDomSay == "" else customDomSay}
	

func processTurn():
	timePassed += 1
	
	if(timePassed > 1):
		endActivity()
		if(state == "offering"):
			var text = RNG.pick([
				"{sub.You} ignored {dom.your} offer.",
			])
			
			return {text = text}
		
		if(state in ["forcing", "forcingCanApply"]):
			var drugInfo = getDrugInfo(usedItemID, usedUniqueItemID)
			
			var itemRef = GlobalRegistry.getItemRef(usedItemID) if usedUniqueItemID == "" else getDom().getInventory().getItemByUniqueID(usedUniqueItemID)
			if(itemRef == null || drugInfo == null):
				return
			if(usedItemID == "TFPill" && pillVariants.size() > 0):
				itemRef = GlobalRegistry.createItem(usedItemID)
				var thePick:String = RNG.pick(pillVariants)
				itemRef.setTFID(thePick)
			
			var pillResultText = ""
			var result = itemRef.useInSex(getSub())
			if(result != null && result.has("text") && result["text"]!=""):
				pillResultText = " "+result["text"]
			
			sendSexEvent(SexEvent.DrugSwallowed, domID, subID, {forced=true,itemID=usedItemID})
			if(drugInfo.has("sexgoal")):
				satisfyGoal(drugInfo["sexgoal"])
			
			var text = RNG.pick([
				"{dom.You} {dom.youVerb('force')} {sub.you} to swallow "+pcCanSeeText(drugInfo["usedName"])+"!"+pillResultText,
			])
			if(getSexType() == SexType.SlutwallSex):
				text = RNG.pick([
					"The pill dissolves inside {sub.your} butt, it was "+pcCanSeeText(drugInfo["usedName"], "an unknown one")+"!"+pillResultText,
				])
			if(state == "forcingCanApply"):
				text = RNG.pick([
					"{dom.You} {dom.youVerb('finish', 'finishes')} applying "+pcCanSeeText(drugInfo["usedName"], "something")+" on {sub.youHim}!"+pillResultText,
				])
			if(usedUniqueItemID != ""):
				getDom().getInventory().getItemByUniqueID(usedUniqueItemID).removeXOrDestroy(1)
			return {text = text}
		
		if(state in ["domabouttotake", "domabouttotakeCanApply"]):
			var drugInfo = getDrugInfo(usedItemID, usedUniqueItemID)
			
			var itemRef = GlobalRegistry.getItemRef(usedItemID) if usedUniqueItemID == "" else getDom().getInventory().getItemByUniqueID(usedUniqueItemID)
			if(itemRef == null || drugInfo == null):
				return
			
			var pillResultText = ""
			var result = itemRef.useInSex(getDom())
			if(result != null && result.has("text") && result["text"]!=""):
				pillResultText = " "+result["text"]
			
			var text = RNG.pick([
				"{dom.You} {dom.youVerb('swallow')} "+pcCanSeeText(drugInfo["usedName"])+"!"+pillResultText,
			])
			if(state == "domabouttotakeCanApply"):
				text = RNG.pick([
					"{dom.You} {dom.youVerb('finish', 'finishes')} applying "+pcCanSeeText(drugInfo["usedName"], "something")+" on {dom.yourself}!"+pillResultText,
				])
			if(usedUniqueItemID != ""):
				getDom().getInventory().getItemByUniqueID(usedUniqueItemID).removeXOrDestroy(1)
			return {text = text}
			
func getDomActions():
	var actions = []

	return actions

func doDomAction(_id, _actionInfo):
	return null

func getSubResistChance(baseChance, domAngerRemoval):
	var theChance = baseChance - domInfo.getAngerScore()*domAngerRemoval
	if(getSub().hasBlockedHands()):
		theChance *= 0.5
	if(getSub().hasBoundArms()):
		theChance *= 0.5
	if(getSub().isBlindfolded()):
		theChance *= 0.8
	
	return max(theChance, 5.0)

func getSubSpitOutChance(baseChance, domAngerRemoval):
	var theChance = baseChance - domInfo.getAngerScore()*domAngerRemoval
	if(getSub().isBitingBlocked()):
		theChance *= 0.5
	
	return max(theChance, 5.0)

func getSubActions():
	var actions = []
	if(state == "offering"):
		var drugInfo = getDrugInfo(usedItemID, usedUniqueItemID)
		var theScore = subInfo.personalityScore({PersonalityStat.Naive: 0.2, PersonalityStat.Subby: 0.2}) + subInfo.fetishScore({Fetish.DrugUse: 1.0})
		if(!getSub().isBlindfolded()):
			theScore = (max(0.0, theScore) + drugInfo["scoreSubScore"]) * subInfo.getComplyScore()
		actions.append({
				"id": "eatit",
				"score": theScore,
				"name": "Take pill",
				"desc": "Eat the offered pill",
			})
		actions.append({
				"id": "noteatit",
				"score": 1.0 - clamp(theScore, 0.0, 1.0),
				"name": "Decline pill",
				"desc": "You don't wanna eat that pill",
			})
	if(state == "forcing" && getSexType() != SexType.SlutwallSex):
		var theresistScore = 0.1 + subInfo.getResistScore()*(0.2 - subInfo.fetishScore({Fetish.DrugUse: 1.0}))
		actions.append({
				"id": "swallowforced",
				"score": (1.0 - theresistScore),
				"name": "Swallow pill",
				"desc": "Swallow the pill in your mouth",
			})
		actions.append({
				"id": "spitpillout",
				"score": theresistScore,
				"name": "Spit pill out",
				"desc": "You really don't wanna swallow that",
				"chance": getSubSpitOutChance(100.0, 60.0),
			})
	
	if(state == "forcingCanApply"):
		var drugInfo = getDrugInfo(usedItemID, usedUniqueItemID)
		actions.append({
				"id": "resistForceCanApply",
				"score": (1.0-max(0.0, drugInfo["scoreSubScore"])),
				"name": "Stop them",
				"desc": "Try to prevent them from doing this to you",
				"chance": getSubResistChance(70.0, 30.0),
			})
	
	if(state == "domabouttotake"):
		actions.append({
				"id": "resistdometake",
				"score": subInfo.getResistScore(),
				"name": "Stop them",
				"desc": "Try to prevent them from taking the drug",
				"chance": getSubResistChance(70.0, 30.0),
			})
	
	if(state == "domabouttotakeCanApply"):
		actions.append({
				"id": "resistForceCanApply",
				"score": subInfo.getResistScore(),
				"name": "Stop them",
				"desc": "Try to prevent them from applying that thing",
				"chance": getSubResistChance(70.0, 30.0),
			})
	return actions

func doSubAction(_id, _actionInfo):
	if(_id == "spitpillout"):
		if(RNG.chance(getSubSpitOutChance(100.0, 60.0))):
			domInfo.addAnger(0.3)
			endActivity()
			var drugInfo = getDrugInfo(usedItemID, usedUniqueItemID)
			if(drugInfo.has("sexgoal")):
				failGoal(drugInfo["sexgoal"])
			return {
				text = "{sub.You} {sub.youVerb('manage', 'managed')} to spit the pill out!",
				subSay=subReaction(SexReaction.Resisting, 50),
			}
		
		domInfo.addAnger(0.1)
		return {text = "{sub.You} {sub.youVerb('try', 'tries')} to spit the pill out but {sub.youVerb('fail')}.",}

	
	if(_id == "noteatit"):
		endActivity()
		
		var drugInfo = getDrugInfo(usedItemID, usedUniqueItemID)
		if(drugInfo.has("sexgoal")):
			failGoal(drugInfo["sexgoal"])
		
		var text = RNG.pick([
			"{sub.You} {sub.youVerb('refuse')} to take the offered pill.",
		])
		if(!getDom().isPlayer() && RNG.chance(100.0 * domInfo.personalityScore({PersonalityStat.Impatient: 0.5, PersonalityStat.Mean: 0.2}))):
			domInfo.addAnger(0.2)
			text += RNG.pick([
				" That made {dom.you} angry.",
			])
		return {text = text, subSay=subReaction(SexReaction.RefusingToSwallowDrug)}
		
	if(_id in ["eatit", "swallowforced"]):
		endActivity()
		var drugInfo = getDrugInfo(usedItemID, usedUniqueItemID)
		if(drugInfo.has("sexgoal")):
			satisfyGoal(drugInfo["sexgoal"])
		
		if(getDom().isPlayer() && _id == "eatit"):
			getDom().getInventory().removeXOfOrDestroy(usedItemID, 1)
		elif(_id == "eatit"):
			domInfo.increaseMemory("USEDDRUG_"+str(usedItemID))
		
		var itemRef = GlobalRegistry.getItemRef(usedItemID) if usedUniqueItemID == "" else getDom().getInventory().getItemByUniqueID(usedUniqueItemID)
		if(itemRef == null || drugInfo == null):
			return
		if(usedItemID == "TFPill" && pillVariants.size() > 0):
			itemRef = GlobalRegistry.createItem(usedItemID)
			var thePick:String = RNG.pick(pillVariants)
			itemRef.setTFID(thePick)
		
		var pillResultText = ""
		var result = itemRef.useInSex(getSub())
		if(result != null && result.has("text") && result["text"]!=""):
			pillResultText = " "+result["text"]
		
		sendSexEvent(SexEvent.DrugSwallowed, domID, subID, {forced=false,itemID=usedItemID})
		
		var text = RNG.pick([
			"{sub.You} {sub.youVerb('obey')} and {sub.youVerb('swallow')} "+pcCanSeeText(drugInfo["usedName"])+"!"+pillResultText,
		])
		if(usedUniqueItemID != ""):
			getDom().getInventory().getItemByUniqueID(usedUniqueItemID).removeXOrDestroy(1)
		return {text = text}
	
	if(_id == "resistdometake"):
		if(RNG.chance(getSubResistChance(70.0, 30.0))):
			domInfo.addAnger(0.3)
			endActivity()
			return {
				text = "{sub.You} {sub.youVerb('manage', 'managed')} to make {dom.youHim} drop the pill, losing it!",
			}
		
		domInfo.addAnger(0.1)
		if(usedUniqueItemID != ""):
			getDom().getInventory().getItemByUniqueID(usedUniqueItemID).removeXOrDestroy(1)
		return {text = "{sub.You} {sub.youVerb('try', 'tries')} to stop {dom.youHim} from taking the pill but {sub.youVerb('fail')}.",
		subSay=subReaction(SexReaction.Resisting, 50)}

	
	if(_id == "resistForceCanApply"):
		if(RNG.chance(getSubResistChance(70.0, 30.0))):
			domInfo.addAnger(0.3)
			endActivity()
			return {
				text = "{sub.You} {sub.youVerb('manage', 'managed')} to make {dom.youHim} screw up the applying process!",
			}
		
		domInfo.addAnger(0.1)
		if(usedUniqueItemID != ""):
			getDom().getInventory().getItemByUniqueID(usedUniqueItemID).removeXOrDestroy(1)
		return {text = "{sub.You} {sub.youVerb('try', 'tries')} to stop {dom.youHim} but {sub.youVerb('fail')}.",
		subSay=subReaction(SexReaction.Resisting, 50)}

func generatePillVariants(theItemID:String):
	pillVariants = []
	
	if(theItemID == "TFPill"):
		for _i in range(3):
			var newTFID:String = TFUtil.generateTFIDForAPill(pillVariants)
			if(newTFID != ""):
				pillVariants.append(newTFID)

func saveData():
	var data = .saveData()
	
	data["usedItemID"] = usedItemID
	data["usedUniqueItemID"] = usedUniqueItemID
	data["timePassed"] = timePassed
	data["pillVariants"] = pillVariants

	return data
	
func loadData(data):
	.loadData(data)
	
	usedItemID = SAVE.loadVar(data, "usedItemID", "")
	usedUniqueItemID = SAVE.loadVar(data, "usedUniqueItemID", "")
	timePassed = SAVE.loadVar(data, "timePassed", 0)
	pillVariants = SAVE.loadVar(data, "pillVariants", [])
