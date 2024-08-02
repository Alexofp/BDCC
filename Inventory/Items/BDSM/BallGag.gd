extends ItemBase

func _init():
	id = "ballgag"

func getVisibleName():
	return "Ball Gag"
	
func getDescription():
	return "Can be used to gag those cheeky brats"

func getClothingSlot():
	return InventorySlot.Mouth

func getBuffs():
	return [
		buff(Buff.GagBuff),
		buff(Buff.AmbientLustBuff, [10]),
		]

func getTakeOffScene():
	return "RestraintTakeOffNopeScene"

func getPrice():
	return 5

func getSellPrice():
	return 1

func canSell():
	return true

func getTags():
	return [ItemTag.BDSMRestraint, ItemTag.CanBeForcedByGuards]

func isRestraint():
	return true

func generateRestraintData():
	restraintData = RestraintBallGag.new()
	restraintData.setLevel(calculateBestRestraintLevel())

func getForcedOnMessage(isPlayer = true):
	if(isPlayer):
		return getAStackNameCapitalize()+" was forced into your mouth! You are drooling already"
	else:
		return getAStackNameCapitalize()+" was forced into {receiver.nameS} mouth! {receiver.He} {receiver.is} drooling already"

func updateDoll(doll: Doll3D):
	doll.setState("mouth", "ballgag")

func getInventoryImage():
	return "res://Images/Items/bdsm/ballgag.png"
