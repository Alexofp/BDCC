extends TFEffect

var fluidType:String = ""

func _init():
	id = "FluidTypeChange"

func initArgs(_args:Array):
	if(_args.size() > 0):
		fluidType = _args[0]

func applyEffect(_data:Dictionary) -> Dictionary:
	var oldFluidType = _data["fluidType"] if _data.has("fluidType") else ""
	
	_data["fluidType"] = fluidType
	
	return {
		oldFluidType = oldFluidType,
		newFluidType = _data["fluidType"],
		success = true,
	}
	
func generateTransformText(_result:Dictionary):
	var oldFluidType:String = _result["oldFluidType"]
	var newFluidType:String = _result["newFluidType"]
	var bodypartSlot = getBodypartSlot()
	var slotName:String = BodypartSlot.getVisibleNameNoCap(bodypartSlot)
	
	var newFluidName:String = getFluidName(newFluidType)
	
	var text:String = ""
	
	if(oldFluidType == newFluidType):
		return
	
	if(bodypartSlot == BodypartSlot.Breasts):
		text += RNG.pick([
			"Something changes within {npc.yourHis} mammary glands. {npc.YourHis} breasts are now producing " + newFluidName + " during lactation!",
		])
	elif(bodypartSlot == BodypartSlot.Penis):
		text += RNG.pick([
			"Something happens within {npc.yourHis} testicles. {npc.YourHis} penis will now release "+newFluidName+" during ejaculation!",
		])
	elif(bodypartSlot == BodypartSlot.Vagina):
		text += RNG.pick([
			"Something changes inside the glands of {npc.yourHis} vagina. {npc.YourHis} pussy will now squirt "+newFluidName+" during orgasms!",
		])
	else:
		text += RNG.pick([
			"{npc.YourHis} "+slotName+" is now producing "+newFluidName+"!",
		])

	addText(text)

func getFluidName(theFluidType:String) -> String:
	var fluidObj:FluidBase = GlobalRegistry.getFluid(theFluidType)
	if(fluidObj == null):
		return theFluidType
	return fluidObj.getLewdName()

func saveData() -> Dictionary:
	var data:Dictionary = .saveData()
	
	data["fluidType"] = fluidType
	
	return data

func loadData(_data:Dictionary):
	.loadData(_data)
	
	fluidType = SAVE.loadVar(_data, "fluidType", "")
