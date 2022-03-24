extends ItemBase

func _init():
	id = "bondagemittens"

func getVisibleName():
	return "Bondage Mittens"
	
func getDescription():
	return "Black leather mittens that go on your hands. Once they're on your hands basically become useless"

func getClothingSlot():
	return InventorySlot.Hands

func getBuffs():
	return [
		buff(Buff.BlockedHandsBuff),
		]

func getPrice():
	return 0

func canSell():
	return true

func getTags():
	return [ItemTag.BDSMRestraint]

func isRestraint():
	return true

func generateRestraintData():
	restraintData = RestraintMittens.new()
	restraintData.setLevel(calculateBestRestraintLevel())

