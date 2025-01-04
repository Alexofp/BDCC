extends TFBase

var addedPenis:bool = false

func _init():
	id = "GrowPenisTF"

func getName() -> String:
	return "Grow a penis"

func isPossibleFor(_char) -> bool:
	if(_char.hasPenis()):
		return false
	return true

func start(_args:Dictionary):
	pass

func canTransformFurther() -> bool:
	if(getStage() == 0 && !getChar().hasPenis()):
		return true
	if(!addedPenis):
		return true
	var theChar:BaseCharacter = getChar()
	if(theChar.hasPenis() && theChar.getPenisSize() < 15):
		return true
	return false
	
func getTimerForStage(_theStage:int) -> int:
	if(_theStage == 0):
		return 120
	return 240
	
func doProgress(_context:Dictionary) -> Dictionary:
	if(getStage() == 0):
		return {}
	var theChar:BaseCharacter = getChar()
	if(theChar.hasPenis()):
		if(theChar.hasPenis() && theChar.getPenisSize() < 15):
			return {
				showPenis = true,
				effects = [
					partEffect("penLen", BodypartSlot.Penis, "PenisLengthChange", [RNG.randi_range(3, 6)])
				],
			}
		
		return {}
	var possiblePartIDs:Dictionary = Bodypart.findPossibleBodypartIDsDict(BodypartSlot.Penis, theChar, theChar.getSpecies(), NpcGender.Male)
	if(possiblePartIDs.has("")):
		possiblePartIDs.erase("")
	if(possiblePartIDs.empty()):
		return {}
	var newPartID:String = RNG.pickWeightedDict(possiblePartIDs)
	addedPenis = true
	return {
		effects = [
			partEffect("newpart", BodypartSlot.Penis, "SwitchPart", [newPartID, {lengthCM=10}]),
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
	
	return data

func loadData(_data:Dictionary):
	.loadData(_data)
	
	addedPenis = SAVE.loadVar(_data, "ap", false)
