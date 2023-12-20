extends "res://Inventory/Items/BDSM/HypnovisorMk1.gd"

func _init():
	id = HK_Item.Visor

func getVisibleName():
	if(GM.main.getFlag("HypnokinkModule.TalkedToAlexAboutVisors", false)):
		return "Hypnovisor Mk0"
	else:
		return "AR Visor"
	
func getDescription():
	if(isWornByWearer()):
		if(HK_CharUtil.isInTrance(getWearer())):
			return "A very important visor that helps you focus on the important things."
		if(HK_CharUtil.isHypnotized(getWearer())):
			return "A helpful visor that keeps you safe."		
	return "An old model of a rugged AR safety visor.\nModified to display an endlessly spinning spiral, with words and images occasionally flashing too fast to consciously observe."

func getClothingSlot():
	return InventorySlot.Eyes

func getBuffs():	
	if(isWornByWearer() and getWearer().hasPerk(HK_Perk.HATS) and HK_CharUtil.isInTrance(getWearer())):
		return [buff(Buff.AccuracyBuff, [25])]
	else:
		return [buff(Buff.AccuracyBuff, [-25])]

func getPrice():
	return 35

func getTags():
	return [ItemTag.BDSMRestraint, ItemTag.CanBeForcedByGuards, ItemTag.CanBeForcedInStocks, ItemTag.Hypnovisor]

func getUnriggedParts(_character):
	return {
		"blindfold": ["res://Modules/HypnokinkModule/Items/HypnoVisor/HypnoVisorNorm_Model.tscn"]
		}
		
func getInventoryImage():
	return "res://Modules/HypnokinkModule/Items/HypnoVisor/hypnoVisor_inv.png"
