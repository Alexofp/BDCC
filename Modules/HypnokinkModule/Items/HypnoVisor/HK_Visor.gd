extends ItemBase
class_name HK_HypnoVisor

var programmedToSuppressPerkId: String = ""

func _init():
	id = HK_Item.Visor

func getVisibleName():
	if(isWornByWearer()):
		if(HK_CharUtil.isInTrance(getWearer())):
			return "Nothing" #alas, using [corrupt][/corrupt] does not work in the inventory buttons.
		if(HK_CharUtil.isHypnotized(getWearer())):
			return "Visor"
	return "Hypnotic Visor"
	
func getDescription():
	if(isWornByWearer()):
		if(HK_CharUtil.isInTrance(getWearer())):
			return "There's nothing over your eyes."
		if(HK_CharUtil.isHypnotized(getWearer())):
			return "A... safety visor? Nothing important... right?"
	return "A see-through visor that seems to display an endlessly spinning spiral, with words and images occasionally flashing too fast to consciously observe."

func getClothingSlot():
	return InventorySlot.Eyes
	
func getPossibleActions():
	if(isWornByWearer()):
		var wearer = getWearer()
		if(wearer.hasPerk(HK_Perk.VisorMastery)):
			return [{
					"name": "Program",
					"scene": "HK_ProgramVisorScene",
					"description": "Program the visor to suppress one of your drawback perks",
					"onlyWhenCalm": true
				}]
	return []
	
func getTakeOffScene():
	if(isWornByWearer()):
		if(HK_CharUtil.isInTrance(getWearer())):
			return "RestraintTakeOffNopeScene"
			
	return "TakeAnyItemOffScene"

func isHatsPerkActive():
	var wearer = getWearer()
	if(wearer == null):
		return false
	if(wearer.hasPerk(HK_Perk.GoodAtVisors) && isWornByWearer()):
		if(HK_CharUtil.isInTrance(wearer)):
			return true
		elif(wearer.hasPerk(HK_Perk.VisorMastery) and HK_CharUtil.isHypnotized(wearer)):
			return true
	return false

func getBuffs():
	if(isHatsPerkActive()):
		return [buff(Buff.AccuracyBuff, [25])]
	else:
		return [buff(Buff.AccuracyBuff, [-25])]

func getPrice():
	return 0

func canSell():
	return true

func getTags():
	return [ItemTag.BDSMRestraint, ItemTag.CanBeForcedByGuards, ItemTag.CanBeForcedInStocks, "HK_HypnoVisor"]

func isRestraint():
	return true

func generateRestraintData():
	var restraintClass = load("res://Modules/HypnokinkModule/Items/HypnoVisor/HK_RestraintVisor.gd")
	restraintData = restraintClass.new()
	restraintData.setLevel(RNG.randi_range(1, 2))
	
func programToSuppressPerk(perkId: String):
	programmedToSuppressPerkId = perkId
	
func programmedToSuppressPerk() -> String:
	return programmedToSuppressPerkId
	
func saveData():
	return {
		"programmedToSuppressPerkId": programmedToSuppressPerkId,
	}
	
func loadData(_data):
	programmedToSuppressPerkId = SAVE.loadVar(_data, "programmedToSuppressPerkId", "")

func onEquippedBy(_otherCharacter, _forced = false):
	if(not _forced):
		return
	var wearer = getWearer()
	var currentAmount = HK_CharUtil.getSuggestibleStacks(wearer)
	if(_otherCharacter.hasPerk(HK_Perk.VisorMastery) and currentAmount < 50):
		HK_CharUtil.changeSuggestibilityBy(wearer, 50 - currentAmount)
	elif(_otherCharacter.hasPerk(HK_Perk.GoodAtVisors) and currentAmount < 30):
		HK_CharUtil.changeSuggestibilityBy(wearer, 30 - currentAmount)
	
	
func getForcedOnMessage(isPlayer = true):
	if(isPlayer):
		return getAStackNameCapitalize()+" was forced over your eyes."
	else:
		return getAStackNameCapitalize()+" was forced over {receiver.nameS} eyes."

func getUnriggedParts(_character):
	return {
		"blindfold": ["res://Modules/HypnokinkModule/Items/HypnoVisor/HypnoVisorNorm_Model.tscn"]
		}
