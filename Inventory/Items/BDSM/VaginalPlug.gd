extends ItemBase

func _init():
	id = "vaginalplug"

func getVisibleName():
	return "Vaginal plug"
	
func getDescription():
	return "A classic plug made out of black silicon, this one is of a normal size and also features a vibro-motor inside"

func getClothingSlot():
	return InventorySlot.Vagina

func getRequiredBodypart():
	return BodypartSlot.Vagina

func getBuffs():
	return [
		buff(Buff.AmbientLustBuff, [10]),
		buff(Buff.MinLoosenessVaginaBuff, [2.0]),
		buff(Buff.SensitivityGainBuff, [25.0]),
		buff(Buff.BlocksVaginaLeakingBuff),
		]

func getPrice():
	return 4

func getSellPrice():
	return 1

func canSell():
	return true

func getTags():
	return [ItemTag.CanBeForcedByGuards, ItemTag.CanBeForcedInStocks]#[ItemTag.BDSMRestraint]

func isRestraint():
	return true

func generateRestraintData():
	restraintData = RestraintVaginalplug.new()
	restraintData.setLevel(calculateBestRestraintLevel())

func getTakingOffStringLong(withS):
	if(withS):
		return "slides the vaginal plug out from your pussy"
	else:
		return "slide the vaginal plug out from your pussy"

func getPuttingOnStringLong(withS):
	if(withS):
		return "inserts the vaginal plug into your pussy"
	else:
		return "insert the vaginal plug into your pussy"

func getForcedOnMessage(isPlayer = true):
	if(isPlayer):
		return getAStackNameCapitalize()+" was stuffed into your "+RNG.pick(["pussy", "pussy", "cunt", "slit"])+". It can accidentally start vibrating!"
	else:
		return getAStackNameCapitalize()+" was stuffed into {receiver.nameS} "+RNG.pick(["pussy", "pussy", "cunt", "slit"])+". It can accidentally start vibrating!"

func getInventoryImage():
	return "res://Images/Items/bdsm/plug.png"
