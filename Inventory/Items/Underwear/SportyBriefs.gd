extends ItemBase

func _init():
	id = "sportyBriefs"

func getVisibleName():
	return "Sporty briefs"
	
func getDescription():
	var text = "Cotton sporty briefs, perfect to wear during exercises."

	return text

func getClothingSlot():
	return InventorySlot.UnderwearBottom

func getBuffs():
	return [
		buff(Buff.PhysicalArmorBuff, [5]),
		buff(Buff.DodgeChanceBuff, [2]),
		]

func getTakingOffStringLong(withS):
	if(withS):
		return "slips down your briefs"
	else:
		return "slip down your briefs"

func getPuttingOnStringLong(withS):
	if(withS):
		return "puts on the briefs"
	else:
		return "put on the briefs"

func coversBodyparts():
	return [BodypartSlot.Vagina, BodypartSlot.Penis, BodypartSlot.Anus]
