extends "res://Inventory/Items/Underwear/Strapon.gd"

var eggInv:LightInventory = LightInventory.new()

func _init():
	id = "StraponOvi"

func getVisibleName():
	return "Ovipositor"

func getInventoryName():
	var theName:String = getStackName()
	if(fluids != null):
		if(fluids.isEmpty()):
			theName += " (empty, "+str(getCurrentOvipositorEggAmount())+" eggs)"
		else:
			if(fluids.isCapacityLimited()):
				theName += " ("+str(Util.roundF(fluids.getFluidAmount()))+"/"+str(Util.roundF(fluids.getCapacity(), 1))+" ml, "+str(getCurrentOvipositorEggAmount())+" eggs)"
			else:
				theName += " ("+str(Util.roundF(fluids.getFluidAmount()))+" ml, "+str(getCurrentOvipositorEggAmount())+" eggs)"
	return theName

func getDescription():
	var text:String = "A strapon that is capable of stuffing someone with eggs. Must be loaded with eggs first. Has a reduced storage for fluids"
	
	var contentsList:Array = []
	for theItem in eggInv.items:
		contentsList.append(theItem.getStackName())
	
	text += "\n\nEgg storage ("+str(getCurrentOvipositorEggAmount())+"/"+str(getMaxOvipositorEggAmount())+"):"
	if(contentsList.empty()):
		text += "\n- Empty\n"
	else:
		text += "\n" + Util.join(contentsList, "\n") + "\n"
	
	return text

func getRiggedParts(_character):
	if(itemState.isRemoved()):
		return null
	return {
		"strapon": "res://Inventory/RiggedModels/Strapons/CaninecockStrapon.tscn",
	}

func getCasualName():
	return "ovipositor strapon"

func getLewdStraponName() -> String:
	return RNG.pick(["ovipositor strapon"])

func getPrice():
	return 30

func generateFluids():
	fluids = Fluids.new()
	fluids.setCapacity(250.0)

func getInventoryImage():
	return "res://Images/Items/strapons/canine.png"

func getStraponTraits() -> Dictionary:
	return {
		PartTrait.Ovipositor: true,
	}

func getPossibleActions():
	var theActions:Array = .getPossibleActions()
	
	theActions.append({
		name = "Load with eggs",
		scene = "LoadOviStraponWithEggs",
		description = "Pick what eggs do you want to load into this strapon",
	})
	
	return theActions

func getMaxOvipositorEggAmount() -> int:
	return 25

func getCurrentOvipositorEggAmount() -> int:
	return eggInv.getTotalAmountOfItemsWithStack()

func saveData():
	var theData:Dictionary = .saveData()
	theData["eggInv"] = eggInv.saveData()
	return theData

func loadData(_data):
	.loadData(_data)
	
	eggInv.loadData(SAVE.loadVar(_data, "eggInv", {}))

func canStuffEggInto(_targetChar, _bodypart:String) -> bool:
	if(eggInv.isEmpty()):
		return false
	return true

func doStuffEggInto(_targetChar, _bodypart:String) -> Dictionary:
	if(eggInv.isEmpty()):
		return {success = false}
	var targetMenstrualCycle:MenstrualCycle = _targetChar.getMenstrualCycle()
	if(!targetMenstrualCycle):
		return {success = false}
	
	var theEggWeightMap:Dictionary = {}
	for theEggItem in eggInv.getItems():
		theEggWeightMap[theEggItem] = float(theEggItem.getAmount())
		
	var theRandomEgg = RNG.pickWeightedDict(theEggWeightMap)
	if(!theRandomEgg || !theRandomEgg.has_method("createEggCellForOviposition")):
		return {success = false}
	
	var theEggCell:EggCell = theRandomEgg.createEggCellForOviposition()
	#TODO: Set the target char as a host?
	targetMenstrualCycle.addImpregnatedEggCell(theEggCell, OrificeType.fromBodypart(_bodypart))
	
	if(theRandomEgg.getAmount() <= 1):
		eggInv.removeItem(theRandomEgg)
	else:
		theRandomEgg.removeXOrDestroy(1)
	
	return {
		success = true,
		text = "!MEOW MEOW!"#"{<USER>.You} An egg got stuffed into {<TARGET>.your} hole.",
	}
