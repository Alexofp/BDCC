extends ItemBase

func _init():
	id = "caninedildogag"

func getVisibleName():
	return "Canine Dildo Gag"
	
func getDescription():
	return "Consists out of a harness and a knotted rubber dildo that seals the mouth"

func getClothingSlot():
	return InventorySlot.Mouth

func getBuffs():
	return [
		buff(Buff.GagBuff),
		buff(Buff.AmbientLustBuff, [20]),
		buff(Buff.MinLoosenessThroatBuff, [2.0]),
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

func getForcedOnMessage(isPlayer = true):
	if(isPlayer):
		return getAStackNameCapitalize()+" was locked around your head. The canine-shaped rubber cock is stretching your throat out!"
	else:
		return getAStackNameCapitalize()+" was locked around {receiver.nameS} head. The canine-shaped rubber cock is stretching {receiver.his} throat out!"

func updateDoll(doll: Doll3D):
	doll.setState("mouth", "ballgag")

func getInventoryImage():
	return "res://Images/Items/bdsm/ballgag.png"
