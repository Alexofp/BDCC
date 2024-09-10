extends ItemBase

func _init():
	id = "ringgag"

func getVisibleName():
	return "Ring Gag"
	
func getDescription():
	return "Can be used to gag those cheeky brats. This one doesn't prevent oral sex. Kinky."

func getClothingSlot():
	return InventorySlot.Mouth

func getBuffs():
	return [
		buff(Buff.RingGagBuff),
		buff(Buff.AmbientLustBuff, [10]),
		]

func getTakeOffScene():
	return "RestraintTakeOffNopeScene"

func getPrice():
	return 10

func getSellPrice():
	return 2

func canSell():
	return true

func getTags():
	return [ItemTag.BDSMRestraint, ItemTag.CanBeForcedByGuards, ItemTag.CanBeForcedInStocks]

func isRestraint():
	return true

func generateRestraintData():
	restraintData = RestraintRingGag.new()
	restraintData.setLevel(calculateBestRestraintLevel())

func getForcedOnMessage(isPlayer = true):
	if(isPlayer):
		return getAStackNameCapitalize()+" was forced into your mouth! You are drooling and can't close your mouth anymore!"
	else:
		return getAStackNameCapitalize()+" was forced into {receiver.nameS} mouth! {receiver.He} {receiver.is} drooling and can't close {receiver.his} mouth anymore!"

func updateDoll(doll: Doll3D):
	doll.setState("mouth", "ringgag")

func getInventoryImage():
	return "res://Images/Items/bdsm/ringgag.png"
