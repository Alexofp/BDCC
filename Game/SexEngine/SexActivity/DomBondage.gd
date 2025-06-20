extends SexActivityBase

var pcUniqueID:String = ""
var npcItemID:String = ""

func _init():
	id = "DomBondage"
	startedByDom = true
	startedBySub = false
	
	activityName = "Bondage"
	activityCategory = ["Bondage"]

func getGoals():
	return {
		SexGoal.TieUp: 1.0,
	}

func getSupportedSexTypes():
	return {
		SexType.DefaultSex: true,
		SexType.StocksSex: true,
	}

func isStocksSex() -> bool:
	return getSexEngine().getSexTypeID() == SexType.StocksSex

func getActivityBaseScore(_sexEngine: SexEngine, _domInfo: SexDomInfo, _subInfo: SexSubInfo):
	if(_subInfo.getChar().isPlayer() && GM.main.getEncounterSettings().isGoalDisabledForSubPC(SexGoal.TieUp)):
		return 0.0
	var mult = 1.0
	# Inmates don't have much bdsm gear
	if(_domInfo.getChar().getCharacterType() == CharacterType.Inmate):
		mult = 0.1
	return 0.0 + _domInfo.fetishScore({Fetish.Rigging: 0.05}) * mult

func getTags(_indx:int) -> Array:
	if(_indx == DOM_0):
		return []
	if(_indx == SUB_0):
		return [SexActivityTag.BeingUndressed]
	return []

func getStartActions(_sexEngine: SexEngine, _domInfo: SexDomInfo, _subInfo: SexSubInfo):
	var actions = []
	var dom:BaseCharacter = _domInfo.getChar()
	var sub:BaseCharacter = _subInfo.getChar()
	
	var usableItems:Array = []
	
	if(_domInfo.getChar().isPlayer()):
		if(_subInfo.getChar().isDynamicCharacter()):
			usableItems = dom.getInventory().getAllCombatUsableRestraints()
		else:
			usableItems = dom.getInventory().getAllCombatUsableRestraintsForStaticNpc()
	else:
		if(_sexEngine.isBondageDisabled()):
			return
		
		var itemTagToUse = ItemTag.CanBeForcedByGuards
		if(_sexEngine.getSexTypeID() == SexType.StocksSex):#(isStocksSex()):
			itemTagToUse = ItemTag.CanBeForcedInStocks
		
		var possibleRestraints = sub.getInventory().getRestraintsThatCanBeForcedDuringSex(itemTagToUse)
		
		for possibleRestraintID in possibleRestraints:
			var item:ItemBase = GlobalRegistry.getItemRef(possibleRestraintID)
			if(_domInfo.goalsScore({SexGoal.FuckOral: 1.0}, _subInfo.charID) > 0.0 || _domInfo.goalsScore({SexGoal.BreastFeedSub: 1.0}, _subInfo.charID) > 0.0 || _sexEngine.hasTag(_subInfo.charID, SexActivityTag.MouthUsed)):
				if(item.getClothingSlot() == InventorySlot.Mouth):
					if(!item.hasBuff(Buff.RingGagBuff)):
						continue
			
			usableItems.append(item)
		
	var countsByItemID = {}
	if(_domInfo.getChar().isPlayer()):
		for item in usableItems:
			if(!countsByItemID.has(item.id)):
				countsByItemID[item.id] = 1
			else:
				countsByItemID[item.id] += 1
		
	#var canActuallyPutOn = 0
	var theActivityScore:float = getActivityScore(_sexEngine, _domInfo, _subInfo)
	for item in usableItems:
		var itemSlot = item.getClothingSlot()
		var bodypartSlot = item.getRequiredBodypart()
		
		if(item.getRequiredBodypart() == BodypartSlot.Vagina && _subInfo.hasTag(SexActivityTag.VaginaPenetrated)):
			continue
		if(item.getRequiredBodypart() == BodypartSlot.Anus && _subInfo.hasTag(SexActivityTag.AnusPenetrated)):
			continue
		if(item.getRequiredBodypart() == BodypartSlot.Penis && _subInfo.hasTag(SexActivityTag.PenisUsed)):
			continue
		
		if(bodypartSlot != null && sub.getFirstItemThatCoversBodypart(bodypartSlot) != null):
			continue
		elif(!sub.invCanEquipSlot(itemSlot)):
			continue
		elif(sub.getInventory().hasSlotEquipped(itemSlot) && sub.getInventory().getEquippedItem(itemSlot)!=null && !sub.getInventory().getEquippedItem(itemSlot).isRemoved() && !sub.getInventory().getEquippedItem(itemSlot).isDamaged()):
			continue
		else:
			var restraintData:RestraintData = item.getRestraintData()
			if(restraintData == null):
				continue
			
			if(_domInfo.getChar().isPlayer()):
#func addStartAction(_aArgs:Array, _aName:String, _aDesc:String, _aScore:float, _aExtra:Dictionary = {}):
				addStartAction(["pc", item.uniqueID], item.getVisibleName(), "Restraint level: "+str(restraintData.getLevel()) + "\n" + item.getCombatDescription(), theActivityScore, {A_CATEGORY: (getCategory() if (!countsByItemID.has(item.id) || countsByItemID[item.id] <= 1) else (getCategory() + [str(countsByItemID[item.id])+"x"+item.getVisibleName()]))})
			else:
				#canActuallyPutOn += 1
				addStartAction(["npc", item.id], "", "", theActivityScore*item.getAIForceItemWeight(dom, sub))
	
	#if(!dom.isPlayer() && canActuallyPutOn == 0):
	#	_sexEngine.satisfyGoal(_domInfo, SexGoal.TieUp, _subInfo)
	if(dom.isPlayer() && !dom.hasBlockedHands() && !dom.hasBoundArms()):
		var allSubRestraints = sub.getInventory().getEquippedRestraints()
		
		for item in allSubRestraints:
			if(!item.canBeEasilyRemovedByDom()):
				continue
			var restraintData:RestraintData = item.getRestraintData()
			if(restraintData == null):
				continue
			
			addStartAction(["rem", item.uniqueID], item.getVisibleName(), "Status: "+restraintData.getVisibleTightness()+"\nRestraint level: "+str(restraintData.getLevel()) + "\n" + item.getCombatDescription(), 0.0, {A_CATEGORY: ["Bondage", "Take off"]})
	
	return actions

func startActivity(_args):
	getSubInfo().addResistance(getSubInfo().fetishScore({Fetish.Bondage: -0.5})+0.3-getSubInfo().personalityScore({PersonalityStat.Subby: 0.2}))
	getSubInfo().addLust(getSubInfo().fetishScore({Fetish.Bondage: 1.0}) * 20)
	
	if(_args[0] == "pc"):
		pcUniqueID = _args[1]
		
		var item = getDom().getInventory().getItemByUniqueID(pcUniqueID)
		addText("{dom.You} {dom.youVerb('attempt')} to force "+str(item.getAStackName())+" onto {sub.you}!")
	if(_args[0] == "npc"):
		npcItemID = _args[1]
	
		var item = GlobalRegistry.getItemRef(npcItemID)
		addText("{dom.You} {dom.youVerb('attempt')} to force "+str(item.getAStackName())+" onto {sub.you}!")
	if(_args[0] == "rem"):
		endActivity()
		var itemUniqueID = _args[1]
		var item:ItemBase = getSub().getInventory().getItemByUniqueID(itemUniqueID)
		if(item == null):
			return
		var restraintData:RestraintData = item.getRestraintData()
		if(restraintData == null):
			return
		
		var text = "{dom.You} {dom.youVerb('help')} to take off {sub.yourHis} "+item.getVisibleName()+"."
		
		var struggleText = restraintData.getRemoveMessage()
		if(struggleText != ""):
			text += " [b]"+struggleText+"[/b]"
		restraintData.onStruggleRemoval()
		getSub().getInventory().removeEquippedItem(item)
		getSexEngine().removeTrackedGear(getDomID(), getSubID(), item.uniqueID)
		
		#var canKeepTheRestraint = false
		if(!restraintData.alwaysBreaksWhenStruggledOutOf() && (getDom().hasPerk(Perk.BDSMCollector) || restraintData.alwaysSavedWhenStruggledOutOf())):
			#canKeepTheRestraint = true
			text += " {dom.You} managed to keep the restraint."
		
			getDom().getInventory().addItem(item)
		else:
			text += " The restraint broke and was unable to be recovered."
		addText(text)

func processTurn():
	if(getState() == ""):
		setState("aboutToTieUp")
	elif(getState() == "aboutToTieUp"):
		#var item = _args[1]
		var sub:BaseCharacter = getSub()
		var dom:BaseCharacter = getDom()
		var item
		
		if(dom.isPlayer()):
			item = dom.getInventory().getItemByUniqueID(pcUniqueID)
		else:
			item = GlobalRegistry.createItem(npcItemID)
		
		endActivity()
		
		if(item == null):
			addText("{dom.You} somehow lost the restraint.")
			return
		
		if(dom.isPlayer()):
			dom.getInventory().removeItem(item)
		sub.getInventory().forceEquipByStoreOtherUnlessRestraint(item, dom)
		#sub.getBuffsHolder().calculateBuffs()
		#sub.updateNonBattleEffects()
		
		var text:String = RNG.pick([
			"{dom.You} {dom.youVerb('were', 'was')} successful. ",
		])
		text += GM.ui.processString(item.getForcedOnMessage(false), {receiver=getSubID()})
		
		sendSexEvent(SexEvent.BondageGearForced, DOM_0, SUB_0, {itemID=item.id})
		getSexEngine().addTrackedGear(getDomID(), getSubID(), item.uniqueID)
		progressGoal(SexGoal.TieUp)
		
		addText(text)
		
		if(item && item.getRestraintData()):
			var bondageSexReaction:int = item.getRestraintData().sexReaction
			if(bondageSexReaction >= 0):
				react(bondageSexReaction)

func getActions(_indx:int):
	if(_indx == SUB_0):
		var resistScore:float = getSubInfo().getResistScore() * 1.0 - getSubInfo().fetishScore({Fetish.Bondage: 1.0}) * getSubInfo().getComplyScore()
		addAction("resist", resistScore, "Resist the restraint", "You don't wanna be restrained", {A_CHANCE: 70.0 - getDomInfo().getAngerScore()*60.0})

func doAction(_indx:int, _actionID:String, _action:Dictionary):
	if(_actionID == "resist"):
		if(RNG.chance(70.0 - getDomInfo().getAngerScore()*60.0)):
			progressGoal(SexGoal.TieUp)
			getDomInfo().addAnger(0.3)
			endActivity()
			addText("{sub.You} {sub.youVerb('manage', 'managed')} to resist {dom.yourHis} attempt to force a restraint!")
			return
		
		getDomInfo().addAnger(0.1)
		addText("{sub.You} {sub.youVerb('try', 'tries')} to resist {dom.yourHis} attempt at restraining {sub.youHim} but {sub.youVerb('fail')}.")
		reactSub(SexReaction.Resisting, [50])

func saveData():
	var data = .saveData()
	
	data["pcUniqueID"] = pcUniqueID
	data["npcItemID"] = npcItemID

	return data
	
func loadData(data):
	.loadData(data)
	
	pcUniqueID = SAVE.loadVar(data, "pcUniqueID", "")
	npcItemID = SAVE.loadVar(data, "npcItemID", "")
