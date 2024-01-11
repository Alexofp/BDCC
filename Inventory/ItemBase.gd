extends Reference
class_name ItemBase

var id = "baditem"
var uniqueID = null
var amount = 1
var currentInventory = null
var restraintData: RestraintData
var itemState: ItemState
var fluids: Fluids

func _init():
	#if(uniqueID == null):
	#	uniqueID = "item"+str(GlobalRegistry.generateUniqueID())
	generateRestraintData()
	if(restraintData != null):
		restraintData.item = weakref(self)
		
	generateItemState()
	if(itemState != null):
		itemState.item = weakref(self)
	
	generateFluids()

func getVisibleName():
	return "Bad item"

func getCasualName():
	if(itemState == null):
		return getVisibleName()
	
	var theCasualName = itemState.getCasualName()
	if(theCasualName == null):
		return getVisibleName()
	return theCasualName

func getStackName():
	if(amount > 1):
		return ""+str(amount)+"x"+getVisibleName()
	else:
		return getVisibleName()

func getInventoryName():
	var theName = getStackName()
	if(fluids != null):
		if(fluids.isEmpty()):
			theName += " (empty)"
		else:
			if(fluids.isCapacityLimited()):
				theName += " ("+str(Util.roundF(fluids.getFluidAmount()))+"/"+str(Util.roundF(fluids.getCapacity(), 1))+" ml)"
			else:
				theName += " ("+str(Util.roundF(fluids.getFluidAmount()))+" ml)"
	elif(restraintData != null):
		if(currentInventory != null):
			theName += " (Level "+restraintData.getVisibleLevel(GM.pc.isBlindfolded() && !GM.pc.canHandleBlindness())+")"
	return theName

# Hacky but good enough for most things, can always just override just function with a proper one
func getA():
	var visName = getVisibleName()
	
	if(visName.ends_with("s")):
		return ""
	if(visName.length() > 0 && visName[0].to_lower() in ["a", "e", "i", "o", "u"]):
		return "an"
	return "a"

func getAStackName():
	if(amount > 1):
		return ""+str(amount)+"x"+getVisibleName()
	else:
		return (getA() + " " + getVisibleName()).trim_prefix(" ")

func getAStackNameCapitalize():
	if(amount > 1):
		return ""+str(amount)+"x"+getVisibleName()
	else:
		return (getA().capitalize() + " " + getVisibleName()).trim_prefix(" ")

func getDescription():
	return "No description provided, please let the developer know"
	
func getVisisbleDescription():
	var text = getDescription()
	if(itemState != null):
		var extraDesc = itemState.getExtraDescription()
		if(extraDesc != null && extraDesc != ""):
			text += "\n"+extraDesc
	if(hasTag(ItemTag.Illegal)):
		text += "\n[color=red]This item is illegal![/color]"
	if(addsIntoxication() > 0.0):
		text += "\n[color=red]Adds "+str(round(addsIntoxicationToPC()*100.0))+"% intoxication[/color]"
	
	if(fluids != null):
		if(fluids.isCapacityLimited()):
			text += "\n\nMax volume: "+str(Util.roundF(fluids.getFluidAmount()))+"/"+str(Util.roundF(fluids.getCapacity(), 1))+" ml"
		else:
			text += "\n"
		if(!fluids.isEmpty()):
			text += "\nContents:\n"+Util.join(fluids.getContentsHumanReadableArray(),"\n")
		else:
			text += "\nContents: Empty"
			
	var timedBuffs = getTimedBuffs()
	if(timedBuffs.size() > 0):
		var t = getBuffsDurationSeconds()
		var tstring = Util.getTimeStringHumanReadable(t)
		
		text += "\n- For the next "+tstring+":"
		for buff in timedBuffs:
			text += "\n" + "[color=#"+buff.getBuffColor().to_html(false)+"]" + buff.getVisibleDescription() + "[/color]"
	
	var turnBuffs = getTimedBuffsTurns()
	if(turnBuffs.size() > 0):
		var duration = getBuffsDurationTurns()
		
		text += "\n- Next "+str(duration)+" turns (in-fight only):"
		for buff in turnBuffs:
			text += "\n" + "[color=#"+buff.getBuffColor().to_html(false)+"]" + buff.getVisibleDescription() + "[/color]"
	
	var buffs = getBuffs()
	if(buffs.size() > 0):
		for buff in buffs:
			text += "\n" + "[color=#"+buff.getBuffColor().to_html(false)+"]" + buff.getVisibleDescription() + "[/color]"
	return text

func getCombatDescription():
	return getVisisbleDescription()

func getVisibleDescription(): # A TYPOOO
	return getVisisbleDescription()

func getUniqueID():
	assert(uniqueID != null)
	
	return uniqueID

func canCombine():
	return false
	
func tryCombine(_otherItem):
	amount += _otherItem.amount
	return true

func canUseInCombat():
	return false

func useInCombatWithBuffs(_attacker, _receiver):
	if(_attacker.isPlayer()):
		var intoxic = addsIntoxication()
		if(intoxic > 0.0):
			if(_attacker.isPlayer()):
				_attacker.addIntoxication(addsIntoxicationToPC())
			else:
				_attacker.addIntoxication(addsIntoxication())
			
		var timedBuffs = getTimedBuffs()
		if(timedBuffs.size() > 0):
			_attacker.addTimedBuffs(timedBuffs, getBuffsDurationSeconds())
		var turnBuffs = getTimedBuffsTurns()
		if(turnBuffs.size() > 0):
			_attacker.addTimedBuffsTurns(turnBuffs, getBuffsDurationTurns())
			
		#_attacker.updateNonBattleEffects()
	
	return useInCombat(_attacker, _receiver)

func useInCombat(_attacker, _receiver):
	return ""

func addsIntoxication() -> float:
	return 0.0
	
func addsIntoxicationToPC() -> float:
	return addsIntoxication() * GM.pc.getIntoxicationMod()

func destroyMe():
	if(currentInventory == null):
		return
	var invent = currentInventory
	invent.removeItem(self)
	invent.removeEquippedItem(self)

func removeXOrDestroy(remamount):
	amount -= remamount
	
	if(amount <= 0):
		destroyMe()

func setAmount(newamount):
	if(newamount > 1):
		assert(canCombine())
	amount = newamount

func getAmount():
	return amount

func splitAmount(howMuchTake:int):
	if(!canCombine()):
		return null
	
	if(howMuchTake <= 0):
		return null
	
	if(howMuchTake >= getAmount()):
		destroyMe()
		return self
	
	var itemCopy = GlobalRegistry.createItem(id)
	itemCopy.loadData(saveData())
	
	itemCopy.amount = howMuchTake
	amount -= howMuchTake
	
	return itemCopy

func getPossibleActions():
	return [
	]
	
func saveData():
	var data = {}
	
	data["amount"] = amount
	
	if(restraintData != null):
		data["restraintData"] = restraintData.saveData()

	if(itemState != null):
		data["itemState"] = itemState.saveData()

	if(fluids != null):
		data["fluids"] = fluids.saveData()

	return data
	
func loadData(_data):
	amount = SAVE.loadVar(_data, "amount", 1)
	
	if(restraintData != null):
		restraintData.loadData(SAVE.loadVar(_data, "restraintData", {}))
		
	if(itemState != null && _data.has("itemState")):
		itemState.loadData(SAVE.loadVar(_data, "itemState", {}))

	if(fluids != null):
		fluids.loadData(SAVE.loadVar(_data, "fluids", {}))

func getClothingSlot():
	return null

func getRequiredBodypart():
	return null

func getTakeOffScene():
	return "TakeAnyItemOffScene"

func getPutOnScene():
	return "PutOnAnyItemScene"

func getBuffs():
	return []

func hasBuff(buffID):
	var thebuffs = getBuffs()
	if(thebuffs == null):
		return false
	
	for buff in thebuffs:
		if(buff.id == buffID):
			return true
	return false

func getTimedBuffs():
	return []

func getBuffsDurationSeconds():
	return 0

func getTimedBuffsTurns():
	return []

func getBuffsDurationTurns():
	return 0

func buff(buffid, args = []):
	var buff: BuffBase = GlobalRegistry.createBuff(buffid)
	buff.initBuff(args)
	return buff

func getPrice():
	return 0

func getBuyAmount():
	return 1

func getSellPrice():
	return int(getPrice() / 2.0)

func getStackPrice():
	return int(getPrice() * amount)

func getStackSellPrice():
	return int(getSellPrice() * amount)

func canSell():
	return true

func getTakingOffStringLong(withS):
	if(withS):
		return "takes off your "+getVisibleName().to_lower()
	else:
		return "take off your "+getVisibleName().to_lower()

func getTakingOffVerb(withS):
	if(withS):
		return "takes off"
	else:
		return "take off"

func getPuttingOnStringLong(withS):
	if(withS):
		return "puts on your "+getVisibleName().to_lower()
	else:
		return "put on your "+getVisibleName().to_lower()

func getPuttingOnVerb(withS):
	if(withS):
		return "puts on"
	else:
		return "put on"

func getForcedOnMessage(isPlayer = true):
	if(isPlayer):
		return getAStackNameCapitalize()+" was forced on you!"
	else:
		return getAStackNameCapitalize()+" was forced on {receiver.name}!"

func coversBodyparts():
	if(itemState != null):
		return itemState.coversBodyparts()
	return {}

func coversBodypart(bodypartSlot):
	var covers = coversBodyparts()
	if(covers.has(bodypartSlot)):
		return true
	return false

func getTags():
	return []

func hasTag(tag):
	if(getTags().has(tag)):
		return true
	return false

func generateItemState():
	if(getClothingSlot() != null):
		itemState = ItemState.new()

func getItemState():
	return itemState

func generateFluids():
	pass

func getFluids():
	return fluids

func isImportant():
	return false

func isRestraint():
	return restraintData != null

func generateRestraintData():
	pass

func getRestraintData() -> RestraintData:
	return restraintData

func setRestraintLevel(newlevel):
	if(restraintData != null):
		restraintData.setLevel(newlevel)

func calculateBestRestraintLevel():
	#if(GM.pc != null):
	#	return GM.pc.calculateBestRestraintLevel()
	#else:
	return RNG.randi_range(1, 5)

func canForceOntoNpc():
	return isRestraint() && !isImportant()
	
func onEquippedBy(_otherCharacter, _forced = false):
	pass

func getUnriggedParts(_character):
	return null

func getRiggedParts(_character):
	return null

func getHidesParts(_character):
	if(itemState != null):
		return itemState.getHidesParts(_character)
	return null

func getHidesAttachments(_character):
	return null

func getLustActions():
	if(itemState != null):
		return itemState.getActions()
	return []

func resetLustState():
	if(itemState != null):
		return itemState.resetState()

func getAttacks():
	return null

func getWearer():
	if(currentInventory == null):
		return null
	
	return currentInventory.getCharacter()

func isWornByWearer():
	var wearer = getWearer()
	if(wearer == null):
		return false
	if(wearer.getInventory().getEquippedItem(getClothingSlot()) == self):
		return true
	return false

func updateWearerAppearance():
	var wearer = getWearer()
	if(wearer != null && wearer.has_method("updateAppearance")):
		wearer.updateAppearance()

func updateDoll(_doll: Doll3D):
	pass

func canDamage():
	if(itemState != null):
		return itemState.canDamage()
	return false

func receiveDamage():
	if(itemState != null):
		itemState.receiveDamage()

func isDamaged():
	if(itemState != null):
		return itemState.isDamaged()
	return false

func repairDamage():
	if(itemState != null):
		itemState.repairDamage()

func alwaysVisible():
	return false

func shouldBeVisibleOnDoll(_character, _doll):
	return true

func onSexEnd():
	pass

func getAIForceItemWeight():
	return 1.0

func getItemWeightForNpcGeneration():
	return 1.0

func useInSex(_receiver):
	return {
		text = "something something",
	}

func getItemCategory():
	if(restraintData != null):
		return ItemCategory.BDSM
	
	if(getClothingSlot() in [InventorySlot.UnderwearBottom, InventorySlot.UnderwearTop]):
		return ItemCategory.Underwear
	elif(getClothingSlot() != null):
		return ItemCategory.Clothes
	
	if(fluids != null):
		return ItemCategory.FluidStorage
	
	return ItemCategory.Generic

func isRemoved():
	if(itemState == null):
		return false
	return itemState.isRemoved()

func getChains():
	return null

func getInventoryImage():
	
	if(hasTag(ItemTag.SexEngineDrug)):
		return "res://Images/Items/medical/pill.png"
	
	if(hasTag(ItemTag.Condom)):
		return "res://Images/Items/medical/condom.png"
	
	if(getClothingSlot() == InventorySlot.Ring):
		return "res://Images/Items/equipment/ring.png"
	
	if(getClothingSlot() != null):
		return "res://Images/Items/equipment/shirt.png"
	
	return null

func onUnequipped():
	if(itemState != null):
		itemState.resetState()

func isPersistent():
	return false
