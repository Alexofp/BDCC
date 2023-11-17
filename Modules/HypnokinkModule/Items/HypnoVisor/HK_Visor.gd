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
	restraintData = HK_RestraintVisor.new()
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

func on_forceEquip(_attacker):
	var wearer = getWearer()
	var minAmount = 0
	if(_attacker.hasPerk(HK_Perk.VisorMastery)):
		minAmount = 50
	elif(_attacker.hasPerk(HK_Perk.GoodAtVisors)):
		minAmount = 30
	if(minAmount > 0):
		if(!wearer.hasEffect(HK_StatusEffect.Suggestible)):
			wearer.addEffect(HK_StatusEffect.Suggestible, [minAmount])
		else:
			var effect:HK_Suggestible = wearer.getEffect(HK_StatusEffect.Suggestible)
			effect.stacks = max(effect.stacks, minAmount)
	#todo: consider abusing getForcedOnMessage instead
	
	
func getForcedOnMessage(isPlayer = true):
	if(isPlayer):
		return getAStackNameCapitalize()+" was forced over your eyes."
	else:
		return getAStackNameCapitalize()+" was forced over {receiver.nameS} eyes."

func getUnriggedParts(_character):
	return {
		"blindfold": ["res://Modules/HypnokinkModule/Items/HypnoVisor/HypnoVisorNorm_Model.tscn"]
		}
