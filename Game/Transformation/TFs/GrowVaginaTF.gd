extends TFBase

var addedVag:bool = false

func _init():
	id = "GrowVaginaTF"

func getName() -> String:
	return "Grow a pussy"

func isPossibleFor(_char) -> bool:
	if(_char.hasVagina()):
		return false
	return true

func start(_args:Dictionary):
	pass

func canTransformFurther() -> bool:
	if(getStage() == 0 && !getChar().hasVagina()):
		return true
	if(!addedVag && !getChar().hasVagina()):
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
	if(theChar.hasVagina()):
		return {}
	var possiblePartIDs:Dictionary = Bodypart.findPossibleBodypartIDsDict(BodypartSlot.Vagina, theChar, theChar.getSpecies(), NpcGender.Female)
	if(possiblePartIDs.has("")):
		possiblePartIDs.erase("")
	if(possiblePartIDs.empty()):
		return {}
	var newPartID:String = RNG.pickWeightedDict(possiblePartIDs)
	addedVag = true
	return {
		effects = [
			partEffect("newpart", BodypartSlot.Vagina, "SwitchPart", [newPartID]),
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
	
	data["av"] = addedVag
	
	return data

func loadData(_data:Dictionary):
	.loadData(_data)
	
	addedVag = SAVE.loadVar(_data, "av", false)
