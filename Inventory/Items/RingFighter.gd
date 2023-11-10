extends ItemBase

func _init():
	id = "RingFighter"

func getVisibleName():
	return "Ring of Triumph"
	
func getDescription():
	return "A golden ring adorned with intricate engravings depicting a victorious warrior with two fallen foes kneeling by their sides. It emanates an aura of power and accomplishment."

func getClothingSlot():
	return InventorySlot.Ring

func getBuffs():
	return [
		buff(Buff.ReceivedPhysicalDamageBuff, [-10]),
		buff(Buff.StatBuff, [Stat.Agility, 10]),
		]

func getPrice():
	return 50

func canSell():
	return true
