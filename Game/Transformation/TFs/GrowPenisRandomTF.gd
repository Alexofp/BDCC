extends TFBase

var addedPenis:bool = false
var targetLen:float = 15
var specificPartID:String = ""

func _init():
	id = "GrowPenisRandomTF"

func getName() -> String:
	return "Grows a random penis"

func getPillName() -> String:
	return "CockRoll"

func getTFCheckTags() -> Dictionary:
	return {
		"growpenis": true,
	}

func isPossibleFor(_char) -> bool:
	#if(_char.hasPenis()):
	#	return false
	return true

func start(_args:Dictionary):
	if(_args.has("targetLen")):
		targetLen = _args["targetLen"]
	else:
		targetLen = round(RNG.randf_range(15.0, 25.0))
	if(_args.has("specificPartID")):
		specificPartID = _args["specificPartID"]

func getPillOptions() -> Dictionary:
	var lengths:Array = [5.0, 8.0, 10.0, 12.0, 15.0, 18.0, 20.0, 22.0, 25.0, 28.0, 30.0]
	var lenArray:Array = []
	for theLen in lengths:
		lenArray.append([theLen, str(theLen)+"cm"])
	
	var dicks:Array = [["", "Random"]]
	for dickID in GlobalRegistry.getBodypartsIdsBySlot(BodypartSlot.Penis):
		dicks.append([dickID, GlobalRegistry.getBodypartRef(dickID).getName()])
	
	return {
		"specificPartID": {
			name = "Cock type",
			desc = "What kind of cock the drug will grow.",
			value = "",
			values = dicks,
		},
		"targetLen": {
			name = "Length",
			desc = "How long should the new cock be.",
			value = 12.0,
			values = lenArray,
		},
	}

func canTransformFurther() -> bool:
	if(getStage() == 0):
		return true
	if(addedPenis):
		return false
	return true
	
func getTimerForStage(_theStage:int) -> int:
	if(_theStage == 0):
		return 120
	return 240
	
func doProgress(_context:Dictionary) -> Dictionary:
	if(getStage() == 0):
		return {}
	var theChar:BaseCharacter = getChar()

	if(addedPenis):
		return {}
	addedPenis = true
	
	var newPartID:String = specificPartID
	if(newPartID == "" || GlobalRegistry.getBodypartRef(newPartID) == null):
		var possiblePartIDs:Array = GlobalRegistry.getBodypartsIdsBySlot(BodypartSlot.Penis)#Bodypart.findPossibleBodypartIDsDict(BodypartSlot.Penis, theChar, theChar.getSpecies(), NpcGender.Male)
		if(possiblePartIDs.has("")):
			possiblePartIDs.erase("")
		if(theChar.hasPenis()):
			var currPenis:String = theChar.getBodypart(BodypartSlot.Penis).id
			if(possiblePartIDs.has(currPenis)):
				possiblePartIDs.erase(currPenis)
		if(possiblePartIDs.empty()):
			return {}
		newPartID = RNG.pick(possiblePartIDs)
	
	if(theChar.hasPenis() && abs(theChar.getPenisSize()-targetLen)>0.1):
		var toAdd:float = targetLen - theChar.getPenisSize()
		return {
			effects = [
				partEffect("newpart", BodypartSlot.Penis, "SwitchPart", [newPartID]),
				partEffect("penLen", BodypartSlot.Penis, "PenisLengthChange", [toAdd]),
			]
		}
	else:
		return {
			effects = [
				partEffect("newpart", BodypartSlot.Penis, "SwitchPart", [newPartID, {lengthCM=targetLen}]),
			]
		}


func reactProgress(_context:Dictionary, _result:TFResult):
	if(getStage() == 0):
		addText("{npc.YouHe} {npc.youVerb('feel')} a strange warmth spreading through {npc.yourHis} lower abdomen, as if something new is starting to take shape beneath the surface.")
		return
	addText(_result.getAllTFTexts())
	
	playAnim(StageScene.GivingBirth, "birth", {bodyState={exposedCrotch=true, hard=true}})
	
func saveData() -> Dictionary:
	var data:Dictionary = .saveData()
	
	data["ap"] = addedPenis
	data["tl"] = targetLen
	data["sp"] = specificPartID
	
	return data

func loadData(_data:Dictionary):
	.loadData(_data)
	
	addedPenis = SAVE.loadVar(_data, "ap", false)
	targetLen = SAVE.loadVar(_data, "tl", 15.0)
	specificPartID = SAVE.loadVar(_data, "sp", "")
