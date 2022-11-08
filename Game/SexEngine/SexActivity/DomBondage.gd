extends SexActivityBase

var pcUniqueID = ""
var npcItemID = ""

func _init():
	id = "DomBondage"
	startedByDom = true
	startedBySub = false

func getGoals():
	return {
		SexGoal.TieUp: 1.0,
	}

func getActivityBaseScore(_sexEngine: SexEngine, _domInfo: SexDomInfo, _subInfo: SexSubInfo):
	return 0.0 + _domInfo.fetishScore({Fetish.Rigging: 0.1})

func getVisibleName():
	return "Bondage"

func getCategory():
	return ["Bondage"]

func getDomTags():
	return []

func getSubTags():
	return [SexActivityTag.BeingUndressed]

func getStartActions(_sexEngine: SexEngine, _domInfo: SexDomInfo, _subInfo: SexSubInfo):
	var actions = []
	var dom:BaseCharacter = _domInfo.getChar()
	var sub:BaseCharacter = _subInfo.getChar()
	
	if(_domInfo.getChar().isPlayer()):
		var usableItems = dom.getInventory().getAllCombatUsableRestraints()
		
		for item in usableItems:
			var itemSlot = item.getClothingSlot()
			var bodypartSlot = item.getRequiredBodypart()
			if(bodypartSlot != null && sub.getFirstItemThatCoversBodypart(bodypartSlot) != null):
				continue
			elif(!sub.invCanEquipSlot(itemSlot)):
				continue
			elif(sub.getInventory().hasSlotEquipped(itemSlot)):
				continue
			else:
				var restraintData:RestraintData = item.getRestraintData()
				if(restraintData == null):
					continue
					
				actions.append({
					name = item.getVisibleName(),
					args = ["pc", item.uniqueID],
					score = getActivityScore(_sexEngine, _domInfo, _subInfo),
					category = getCategory(),
					desc = "Restraint level: "+str(restraintData.getLevel()) + "\n" + item.getCombatDescription(),
				})
	else:
		var possibleRestraints = GlobalRegistry.getItemIDsByTag(ItemTag.CanBeForcedByGuards)
		
		for possibleRestraintID in possibleRestraints:
			var item:ItemBase = GlobalRegistry.getItemRef(possibleRestraintID)
			
			var itemSlot = item.getClothingSlot()
			var bodypartSlot = item.getRequiredBodypart()
			if(bodypartSlot != null && sub.getFirstItemThatCoversBodypart(bodypartSlot) != null):
				continue
			elif(!sub.invCanEquipSlot(itemSlot)):
				continue
			elif(sub.getInventory().hasSlotEquipped(itemSlot)):
				continue
			else:
				var restraintData:RestraintData = item.getRestraintData()
				if(restraintData == null):
					continue
					
				actions.append({
					name = item.getVisibleName(),
					args = ["npc", possibleRestraintID],
					score = getActivityScore(_sexEngine, _domInfo, _subInfo),
					category = getCategory(),
					desc = "Restraint level: "+str(restraintData.getLevel()) + "\n" + item.getCombatDescription(),
				})
	
	return actions

func startActivity(_args):
	state = ""
	
	subInfo.addResistance(subInfo.fetishScore({Fetish.Bondage: 0.5})+0.3-subInfo.personalityScore({PersonalityStat.Subby: 0.2}))
	subInfo.addLust(subInfo.fetishScore({Fetish.Bondage: 1.0}) * 20)
	
	if(_args[0] == "pc"):
		pcUniqueID = _args[1]
		
		var item = getDom().getInventory().getItemByUniqueID(pcUniqueID)
		return {
			text = "{dom.You} {dom.youVerb('attempt')} to force "+str(item.getAStackName())+" onto {sub.you}!",
		}
	if(_args[0] == "npc"):
		npcItemID = _args[1]
	
		var item = GlobalRegistry.getItemRef(npcItemID)
		return {
			text = "{dom.You} {dom.youVerb('attempt')} to force "+str(item.getAStackName())+" onto {sub.you}!",
		}


func processTurn():
	if(state == ""):
		state = "aboutToTieUp"
	elif(state == "aboutToTieUp"):
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
			return {text="{dom.You} somehow lost the restraint."}
		
		if(dom.isPlayer()):
			dom.getInventory().removeItem(item)
		sub.getInventory().forceEquipStoreOtherUnlessRestraint(item)
		sub.getBuffsHolder().calculateBuffs()
		sub.updateNonBattleEffects()
		
		var text = RNG.pick([
			"{dom.You} {dom.youVerb('were', 'was')} successful. ",
		])
		text += GM.ui.processString(item.getForcedOnMessage(false), {receiver=subID})
		
		getSexEngine().addTrackedGear(domID, subID, item.uniqueID)
		progressGoal(SexGoal.TieUp)
		
		return {text = text}

func getDomActions():
	var actions = []

	return actions

func doDomAction(_id, _actionInfo):
	return null

func getSubActions():
	var actions = []
	if(!getSub().hasBoundArms()):
		actions.append({
				"id": "resist",
				"score": subInfo.getResistScore() * 1.0 - subInfo.fetishScore({Fetish.Bondage: 1.0}) * subInfo.getComplyScore(),
				"name": "Resist the restraint",
				"desc": "You don't wanna be restrained",
				"chance": 70.0 - domInfo.getAngerScore()*60.0,
			})
	return actions

func doSubAction(_id, _actionInfo):
	if(_id == "resist"):
		if(RNG.chance(70.0 - domInfo.getAngerScore()*60.0)):
			domInfo.addAnger(0.3)
			endActivity()
			return {
				text = "{sub.You} {sub.youVerb('manage', 'managed')} to resist {dom.yourHis} attempt to force a restraint!",
			}
		
		domInfo.addAnger(0.1)
		return {text = "{sub.You} {sub.youVerb('try', 'tries')} to resist {dom.yourHis} attempt at restraining {sub.youHim} but {sub.youVerb('fail')}.",}
