extends SexActivityBase

func _init():
	id = "DomPutOnStrapon"
	startedByDom = true
	startedBySub = false
	
	activityName = "Wear strapon"
	activityDesc = "Strapon manipulation"
	activityCategory = ["Wear"]

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
	
	var allStraponIds = GlobalRegistry.getItemIDsByTag(ItemTag.Strapon)
	var putOnDomScore = getActivityScoreCustomGoals({SexGoal.SubWearStraponOnDom: 1.0}, _sexEngine, _domInfo, _subInfo) / float(allStraponIds.size())
	var putOnSubScore = getActivityScoreCustomGoals({SexGoal.SubWearStraponOnSub: 1.0}, _sexEngine, _domInfo, _subInfo) / float(allStraponIds.size())
	
	if(dom.canWearStrapon() && dom.getFirstItemThatCoversBodypart(BodypartSlot.Penis) == null):
		if(dom.isPlayer()):
			for straponObject in dom.getInventory().getItemsWithTag(ItemTag.Strapon):
				addStartAction(["dom", straponObject.uniqueID], straponObject.getVisibleName(), straponObject.getVisisbleDescription(), putOnDomScore, {A_CATEGORY: ["Wear", "Strapon"]})
		else:
			for straponID in allStraponIds:
				var straponObject:ItemBase = GlobalRegistry.getItemRef(straponID)
				addStartAction(["dom", straponID], straponObject.getVisibleName(), straponObject.getVisisbleDescription(), putOnDomScore, {A_CATEGORY: ["Wear", "Strapon"]})
	if(sub.canWearStrapon() && sub.getFirstItemThatCoversBodypart(BodypartSlot.Penis) == null):
		if(dom.isPlayer()):
			for straponObject in dom.getInventory().getItemsWithTag(ItemTag.Strapon):
				addStartAction(["sub", straponObject.uniqueID], straponObject.getVisibleName(), straponObject.getVisisbleDescription(), putOnSubScore, {A_CATEGORY: ["Wear", "Strapon on sub"]})
		else:
			for straponID in allStraponIds:
				var straponObject:ItemBase = GlobalRegistry.getItemRef(straponID)
				addStartAction(["sub", straponID], straponObject.getVisibleName(), straponObject.getVisisbleDescription(), putOnSubScore, {A_CATEGORY: ["Wear", "Strapon on sub"]})

func getTags(_indx:int) -> Array:
	if(_indx == DOM_0):
		return [SexActivityTag.HandsUsed, SexActivityTag.VaginaPenetrated, SexActivityTag.AnusPenetrated]
	return []

func fuelStraponRandomly(strapon):
	if(strapon.getFluids() == null):
		return
	
	var fluids = strapon.getFluids()
	if(RNG.chance(33)):
		fluids.addFluid("CumLube", RNG.randi_range(3, 5)*100.0)
	# 5% chance of there being someone's real cum
	elif(RNG.chance(5) && OPTIONS.isContentEnabled(ContentType.CumStealing)):
		var npcPools = CharacterPool.getPrisonPopulationPools()
		while(npcPools.size() > 0):
			var randomPool = RNG.grab(npcPools)
			
			var characterID = NpcFinder.grabNpcIDFromPool(randomPool, [[NpcCon.HasPenis]])
			if(characterID != null):
				var character = GlobalRegistry.getCharacter(characterID)
				if(character != null):
					fluids.addFluid(character.getFluidType(FluidSource.Penis), RNG.randi_range(1, 20)*10.0, character.getFluidDNA(FluidSource.Penis))
					return
					
func startActivity(_args):
	endActivity()
	
	if(_args[0] == "dom"):
		var straponItem:ItemBase
		if(getDom().isPlayer()):
			straponItem = getDom().getInventory().getItemByUniqueID(_args[1])
			getSexEngine().addTrackedGear(getDomID(), getDomID(), straponItem.uniqueID)
		else:
			straponItem = GlobalRegistry.createItem(_args[1])
			fuelStraponRandomly(straponItem)
		getDom().getInventory().equipItem(straponItem)
		
		addText("{dom.You} {dom.youVerb('put')} on a "+straponItem.getCasualName()+".")
		react(SexReaction.DomPutOnStrapon)
		return
	
	if(_args[0] == "sub"):
		var straponItem:ItemBase
		if(getDom().isPlayer()):
			straponItem = getDom().getInventory().getItemByUniqueID(_args[1])
			getSexEngine().addTrackedGear(getDomID(), getSubID(), straponItem.uniqueID)
			getDom().getInventory().removeItem(straponItem)
		else:
			straponItem = GlobalRegistry.createItem(_args[1])
			fuelStraponRandomly(straponItem)
		getSub().getInventory().equipItem(straponItem)
		
		addText("{dom.You} {dom.youVerb('force')} a "+straponItem.getCasualName()+" on {sub.you}.")
		react(SexReaction.DomPutOnStraponOnSub)
		return
