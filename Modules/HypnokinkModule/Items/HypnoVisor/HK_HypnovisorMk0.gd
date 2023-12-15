extends ItemBase
class_name HK_HypnoVisor

var programmedToSuppressPerkId: String = ""

func _init():
	id = "HypnovisorMk0"

func getVisibleName():
	if(GM.main.getFlag("HypnokinkModule.TalkedToAlexAboutVisors", false)):
		return "Hypnovisor Mk0"
	else:
		return "AR Visor"
	
func getDescription():
	if(isWornByWearer()):
		if(HK_Utils.isInTrance(getWearer())):
			return "A very important visor that helps you focus on the important things."
		if(HK_Utils.isHypnotized(getWearer())):
			return "A helpful visor that keeps you safe."		
	return "An old model of a rugged AR safety visor.\nModified to display an endlessly spinning spiral, with words and images occasionally flashing too fast to consciously observe."

func getClothingSlot():
	return InventorySlot.Eyes
	
func getPossibleActions():
	if(isWornByWearer()):
		var wearer = getWearer()
		if(wearer.hasPerk(Perk.VisorMastery)):
			return [{
					"name": "Program",
					"scene": "HK_ProgramVisorScene",
					"description": "Program the visor to suppress one of your drawback perks",
					"onlyWhenCalm": true
				}]
	return []
	
func getTakeOffScene():
	return "RestraintTakeOffNopeScene"

func isHatsPerkActive():
	var wearer = getWearer()
	if(wearer == null):
		return false
	if(wearer.hasPerk(Perk.HATS) && isWornByWearer()):
		if(HK_Utils.isInTrance(wearer)):
			return true.gd
	return false

func getBuffs():	
	if(isHatsPerkActive()):
		return [buff(Buff.AccuracyBuff, [25])]
	else:
		return [buff(Buff.AccuracyBuff, [-25])]

func getPrice():
	return 35

func canSell():
	return true

func getTags():
	return [ItemTag.BDSMRestraint, ItemTag.CanBeForcedByGuards, ItemTag.CanBeForcedInStocks, ItemTag.Hypnovisor]

func isRestraint():
	return true

func generateRestraintData():
	restraintData = RestraintHypnovisor.new()
	restraintData.setLevel(5)
	
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
	var currentAmount = HK_Utils.getSuggestibleStacks(wearer)
	if(_otherCharacter.hasPerk(Perk.VisorMastery) and currentAmount < 50):
		HK_Utils.changeSuggestibilityBy(wearer, 50 - currentAmount)
	elif(_otherCharacter.hasPerk(Perk.GoodAtVisors) and currentAmount < 30):
		HK_Utils.changeSuggestibilityBy(wearer, 30 - currentAmount)
	
	
func getForcedOnMessage(isPlayer = true):
	if(isPlayer):
		return getAStackNameCapitalize()+" was forced over your eyes."
	else:
		return getAStackNameCapitalize()+" was forced over {receiver.nameS} eyes!"

func getUnriggedParts(_character):
	return {
		"blindfold": ["res://Modules/HypnokinkModule/Items/HypnoVisor/HypnoVisorNorm_Model.tscn"]
		}
		
func getInventoryImage():
	return "res://Modules/HypnokinkModule/Items/HypnoVisor/hypnoVisor_inv.png"
