extends ItemBase

var breakChance = 20
var lastUser = ""

func _init():
	id = "UsedCondom"

func getVisibleName():
	return "Used condom"
	
func getDescription():
	var theText = "A condom that was used. Can be thrown if filled."
	if(lastUser != ""):
		theText += "\nFilled by: "+str(lastUser)
	return theText

func getClothingSlot():
	return InventorySlot.Penis

func getBuffs():
	return [
		]

func getCondomBreakChance():
	if(!OPTIONS.isContentEnabled(ContentType.RiskyCondoms)):
		return 0.0
	
	return breakChance

func saveData():
	var data = .saveData()
	
	data["breakChance"] = breakChance
	data["lastUser"] = lastUser
	
	return data
	
func loadData(data):
	.loadData(data)
	
	breakChance = SAVE.loadVar(data, "breakChance", 20)
	lastUser = SAVE.loadVar(data, "lastUser", "")

func markLastUser(theName):
	lastUser = theName

func onSexEnd():
	destroyMe()

func updateDoll(doll: Doll3D):
	doll.setState("cock", "condom")

func generateFluids():
	fluids = Fluids.new()
	#fluids.addFluid("Cum", 1000.0)
	#fluids.addFluid("Milk", 1000.0)
	#fluids.addFluid("GirlCum", 1000.0)
	#fluids.addFluid("Piss", 1000.0)

func getTags():
	return [
		ItemTag.CanPeeInto,
		ItemTag.CanForceCumInto,
		]

func getPossibleActions():
	return [
		{
			"name": "Transfer fluids",
			"scene": "FluidTransferScene",
			"description": "Transfer the fluids between fluid containers",
		},
		{
			"name": "Drink from",
			"scene": "DrinkFromScene",
			"description": "Swallow the contents of this item",
		},
		{
			"name": "Dispose",
			"scene": "DisposeOfAnItemScene",
			"description": "Throw out this condom",
		},
	]

func getAttacks():
	if(fluids.isEmpty()):
		return []
	return ["ThrowUsedCondomPCAttack"]

func getInventoryImage():
	return "res://Images/Items/toys/usedcondom.png"
