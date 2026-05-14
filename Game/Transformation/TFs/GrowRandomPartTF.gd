extends TFBase

var addedPart:bool = false
var specificPartID:String = ""

func _init():
	id = "GrowRandomPartTF"
	
	pointsOnUnlock = 10

func getName() -> String:
	return "Grows a random bodypart"

func getPillName() -> String:
	return "VariLimb"

func getUnlockData() -> Dictionary:
	return {
		eliza = "Oh, neat! This pill appears to contain an unstable blend of morphogenetic agents and cellular triggers that could stimulate tissue transformation in unpredictable ways. When ingested, it will probably affect some part of your body in some way.. I think I’ll call it.. 'VariLimb.' There is a catch actually.. It requires a very specific fluid to synthesize, not very common.",
	}

func getPillDatabaseDesc() -> String:
	return "This drug will grow you a completely random bodypart. It might change one of the existing ones but it could also grow a new one too.\n\nThe first stage will happen after about 10 minutes. After that, the next one will happen after roughly 40 minutes. This could be accelerated only by using the QuickShift drug.\n\nThis drug has 2 stages.\n\nIt’s possible to pick which bodypart type to grow by using the advanced lab equipment."

func getTFCheckTags() -> Dictionary:
	return {
		#"growpenis": true,
	}

func getPillFluidsRequired() -> Dictionary:
	return {
		"IvyNectar": 2500.0,
		"Cum": 500.0,
	}

func isPossibleFor(_char) -> bool:
	#if(_char.hasPenis()):
	#	return false
	return true

func start(_args:Dictionary):
	if(_args.has("specificPartID")):
		specificPartID = _args["specificPartID"]

func getPillOptions() -> Dictionary:
	var theParts:Array = [["", "Random"]]
	for partID in GlobalRegistry.getBodypartRefs():
		var thePart:Bodypart = GlobalRegistry.getBodypartRef(partID)
		if(thePart.shouldBeExcludedFromTFPick()):
			continue
		if(thePart.getSlot() in [BodypartSlot.Hair]):
			continue
		theParts.append([partID, thePart.getCharacterCreatorName(), "Slot is '"+BodypartSlot.getVisibleName(thePart.getSlot())+"'"])
	
	return {
		"specificPartID": {
			name = "Bodypart",
			desc = "What bodypart should the drug grow.",
			value = "",
			values = theParts,
		},
	}

func canTransformFurther() -> bool:
	if(getStage() == 0):
		return true
	if(addedPart):
		return false
	return true
	
func getTimerForStage(_theStage:int) -> int:
	if(_theStage == 0):
		return 500
	return 60*40
	
func doProgress(_context:Dictionary) -> Dictionary:
	if(getStage() == 0):
		return {}
	var theChar:BaseCharacter = getChar()

	if(addedPart):
		return {}
	addedPart = true
	
	var newPartID:String = ""
	var newPartSlot:String = ""
	
	if(!specificPartID.empty()):
		var thePart = GlobalRegistry.getBodypartRef(specificPartID)
		if(!thePart):
			return {}
		newPartID = specificPartID
		newPartSlot = thePart.getSlot()
	else:
		var allSlots:Array = BodypartSlot.getAll()
		var possibleSlots:Array = []
		for theSlot in allSlots:
			if(theSlot == BodypartSlot.Body && GlobalRegistry.getBodypartsIdsBySlotForTF(theSlot).size() == 1):
				continue
			if(theSlot == BodypartSlot.Hair):
				continue
			possibleSlots.append(theSlot)
		
		var pickedRandomSlot:String = RNG.pick(possibleSlots)
		
		var possiblePartIDs:Array = GlobalRegistry.getBodypartsIdsBySlotForTF(pickedRandomSlot)#Bodypart.findPossibleBodypartIDsDict(BodypartSlot.Penis, theChar, theChar.getSpecies(), NpcGender.Male)
		if(possiblePartIDs.has("")):
			possiblePartIDs.erase("")
		if(theChar.hasBodypart(pickedRandomSlot)):
			var currPenis:String = theChar.getBodypart(pickedRandomSlot).id
			if(possiblePartIDs.has(currPenis)):
				possiblePartIDs.erase(currPenis)
		if(possiblePartIDs.empty()):
			return {}
		newPartSlot = pickedRandomSlot
		newPartID = RNG.pick(possiblePartIDs)
	
	return {
		effects = [
			partEffect("newpart", newPartSlot, "SwitchPart", [newPartID]),
		],
		newPartID = newPartID,
		newPartSlot = newPartSlot,
	}


func reactProgress(_context:Dictionary, _result:TFResult):
	if(getStage() == 0):
		addText("{npc.YouHe} {npc.youHeVerb('feel')} a strange warmth spreading through {npc.yourHis} [b]whole body[/b]. {npc.YouHe} {npc.youHeVerb('feel')} itching in completely random spots.")
		return
	addText(_result.getAllTFTexts())
	
	var bodypartSlot:String = _result.getField("newPartSlot", "")
	if(bodypartSlot in [BodypartSlot.Head, BodypartSlot.Hair, BodypartSlot.Ears, BodypartSlot.Horns]):
		playAnim(StageScene.TFLook, "head")
	elif(bodypartSlot in [BodypartSlot.Vagina, BodypartSlot.Penis, BodypartSlot.Tail]):
		playAnim(StageScene.TFLook, "crotch", {bodyState={exposedCrotch=true,hard=true}})
	elif(bodypartSlot in [BodypartSlot.Anus, BodypartSlot.Legs]):
		playAnim(StageScene.GivingBirth, "birth", {bodyState={exposedCrotch=true, hard=true}})
	elif(bodypartSlot in [BodypartSlot.Breasts]):
		playAnim(StageScene.TFLook, "breasts", {bodyState={exposedChest=true}})
	else:
		playAnim(StageScene.TFLook, "hands")
	#playAnim(StageScene.TFLook, "crotch", {bodyState={exposedCrotch=true,hard=true}})
	
func saveData() -> Dictionary:
	var data:Dictionary = .saveData()
	
	data["ap"] = addedPart
	#data["tl"] = targetLen
	data["sp"] = specificPartID
	
	return data

func loadData(_data:Dictionary):
	.loadData(_data)
	
	addedPart = SAVE.loadVar(_data, "ap", false)
	#targetLen = SAVE.loadVar(_data, "tl", 15.0)
	specificPartID = SAVE.loadVar(_data, "sp", "")
