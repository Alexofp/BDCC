extends "res://Inventory/Items/BDSM/HypnovisorMk1.gd"

func _init():
	id = "HypnovisorMk0"

func getVisibleName():
	return "Hypnovisor"
	
func getDescription():
	if(isWornByWearer()):
		if(HypnokinkUtil.isInTrance(getWearer())):
			return "A very important visor that helps you focus on the important things."
		if(HypnokinkUtil.isHypnotized(getWearer())):
			return "A helpful visor that keeps you safe."
	return "An old model of a rugged Augmented Reality visor.\nSeems to be modified to display an endlessly spinning spiral, with words and images occasionally flashing too fast to consciously observe."

func getClothingSlot():
	return InventorySlot.Eyes

func generateRestraintData():
	restraintData = RestraintHypnovisor.new()
	restraintData.setLevel(3)

func getBuffs():	
	if(isWornByWearer() and getWearer().hasPerk(Perk.HypnosisHATS) and HypnokinkUtil.isInTrance(getWearer())):
		return [buff(Buff.AccuracyBuff, [25])]
	else:
		return [buff(Buff.AccuracyBuff, [-25])]

func getPrice():
	return 35

func getTags():
	return [ItemTag.BDSMRestraint, ItemTag.CanBeForcedByGuards, ItemTag.CanBeForcedInStocks, ItemTag.Hypnovisor]
	
func getAIForceItemWeight(_whoForcesNpc, _targetNpc):
	var hypnosisValue = _whoForcesNpc.getFetishHolder().getFetishValue(Fetish.HypnosisHypnotist)
	return 0.3 + hypnosisValue * 1.0
	
func maxHypnosisStacks() -> int:
	return 75
	
func getUnriggedParts(_character):
	return {
		"blindfold": ["res://Modules/HypnokinkModule/Items/HypnoVisor/HypnoVisorNorm_Model.tscn"]
		}
		
func getInventoryImage():
	return "res://Modules/HypnokinkModule/Items/HypnoVisor/hypnoVisor_inv.png"
