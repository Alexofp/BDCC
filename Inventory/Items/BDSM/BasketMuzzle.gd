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
	restraintData = RestraintMuzzle.new()
	restraintData.setLevel(calculateBestRestraintLevel())

func getForcedOnMessage(isPlayer = true):
	if(isPlayer):
		return getAStackNameCapitalize()+" was forced onto you. No more biting for you!"
	else:
		return getAStackNameCapitalize()+" was forced onto {receiver.name}! No more biting for {receiver.him}!"

func updateDoll(doll: Doll3D):
	doll.setState("muzzle", "muzzled")

func getInventoryImage():
	return "res://Images/Items/bdsm/muzzle.png"
