extends ItemBase

func _init():
	id = "HypnovisorMk1"

func getVisibleName():
	return "Hypnovisor Mk1"
	
func getDescription():
	return "Special prototype goggles that are supposed to make you happy. What the heck is a 'YOT'?"

func getClothingSlot():
	return InventorySlot.Eyes
	
func getTakeOffScene():
	return "RestraintTakeOffNopeScene"
	
func isHatsPerkActive():
	var wearer = getWearer()
	if(wearer == null):
		return false
	if(wearer.hasPerk(Perk.HATS) && isWornByWearer()):
		if(HK_Utils.isInTrance(wearer)):
			return true
	return false	
	
func getBuffs():
	if(isHatsPerkActive()):
		return [buff(Buff.AmbientLustBuff, [300]), buff(Buff.AccuracyBuff, [25])]
	else:
		return [buff(Buff.AmbientLustBuff, [300]), buff(Buff.AccuracyBuff, [-25])]
	
func getPrice():
	return 60

func canSell():
	return true

func getTags():
	if(GM.main != null && GM.main.getFlag("AlexRynardModule.ch1HypnovisorHappened")):
		return [ItemTag.BDSMRestraint, ItemTag.Hypnovisor, ItemTag.SoldByAlexRynard]
	return [ItemTag.BDSMRestraint, ItemTag.Hypnovisor]

func isRestraint():
	return true

func generateRestraintData():
	restraintData = RestraintHypnovisor.new()
	restraintData.setLevel(5)
	
func getForcedOnMessage(isPlayer = true):
	if(isPlayer):
		return getAStackNameCapitalize()+" was forced over your eyes."
	else:
		return getAStackNameCapitalize()+" was forced over {receiver.nameS} eyes!"

func onEquippedBy(_otherCharacter, _forced = false):
	if(not _forced):
		return
	var wearer = getWearer()
	var currentAmount = HK_Utils.getSuggestibleStacks(wearer)
	if(_otherCharacter.hasPerk(Perk.VisorMastery) and currentAmount < 50):
		HK_Utils.changeSuggestibilityBy(wearer, 50 - currentAmount)
	elif(_otherCharacter.hasPerk(Perk.GoodAtVisors) and currentAmount < 30):
		HK_Utils.changeSuggestibilityBy(wearer, 30 - currentAmount)
	

func getUnriggedParts(_character):
	return {
		"blindfold": ["res://Inventory/UnriggedModels/HypnoVisor/HypnoVisor.tscn"],
	}

func getInventoryImage():
	return "res://Images/Items/bdsm/hypnovisor.png"
