extends LootList

func _init():
	handlesIds = ["guard", "inmate", "engineer", "medical", "junkie"]

func getLoot(_id, _characterID, _battleName):
	if(GM.pc == null || !is_instance_valid(GM.pc)):
		return []
	
	var mod:float = 1.0
	if(_id == "medical"):
		mod = 5.0
	if(GM.main && !GM.main.getFlag("ElizaModule.s1hap")):
		mod *= 0.2
	
	var hasTFs:bool = GM.pc.hasActiveTransformations()
	if(!hasTFs):
		return [
			[5.0*mod*(0.1 if _id != "inmate" else 1.0), [["TFPill", 1, 1]]],
		]

	
	var undoAmount:int = GM.pc.getInventory().getAmountOf("TFUndoPill")
	var applyAmount:int = GM.pc.getInventory().getAmountOf("TFApplyPill")
	
	return [
		[5.0*mod*(0.0 if undoAmount > 0 else 1.0), [["TFUndoPill", 1, 1]]],
		[5.0*mod, [["TFAcceleratePill", 1, 1]]],
		[5.0*mod*(0.0 if applyAmount > 0 else 1.0), [["TFApplyPill", 1, 1]]],
		[5.0*mod*(0.1 if _id != "inmate" else 1.0), [["TFPill", 1, 1]]],
	]
