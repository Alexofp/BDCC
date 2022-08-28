extends ItemBase

func _init():
	id = "basketmuzzle"

func getVisibleName():
	return "Basket muzzle"
	
func getDescription():
	return "Best way to prevent your dog from unwanted chewing, oral sex, and biting. Your pet will thank you."

func getClothingSlot():
	return InventorySlot.Mouth

func getBuffs():
	return [
		buff(Buff.MuzzleBuff),
		]

func getTakeOffScene():
	return "RestraintTakeOffNopeScene"

func getPrice():
	return 0

func canSell():
	return true

func getTags():
	return [ItemTag.BDSMRestraint, ItemTag.CanBeForcedByGuards]

func isRestraint():
	return true

func generateRestraintData():
	restraintData = RestraintBallGag.new()
	restraintData.setLevel(calculateBestRestraintLevel())

func getForcedOnMessage():
	return getAStackNameCapitalize()+" was forced onto you. No more biting for you!"

func updateDoll(doll: Doll3D):
	doll.setState("muzzle", "muzzled")
