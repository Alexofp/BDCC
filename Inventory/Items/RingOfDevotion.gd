extends ItemBase

func _init():
	id = "RingOfDevotion"

func getVisibleName():
	return "Ring of Devotion"
	
func getDescription():
	return "A simple metal ring. Has a little inscription on it that says “A key to my heart. Forever pure.”\n\n\"[i]Accept this gift as a little token of my appreciation. I hope it will be a good reminder of your choice <3. [/i]\"\n"

func getClothingSlot():
	return InventorySlot.Ring

func getBuffs():
	return [
		buff(Buff.SkillExperienceBuff, [Skill.BDSM, 50])
		]

func getPrice():
	return 20

func canSell():
	return true
