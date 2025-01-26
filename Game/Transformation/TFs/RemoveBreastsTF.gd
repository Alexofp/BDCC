extends TFBase

var removedBreasts:bool = false

func _init():
	id = "RemoveBreastsTF"
	
	pointsOnUnlock = 5

func getName() -> String:
	return "Makes breasts flat"

func getPillName() -> String:
	return "BreastsBeGone"

func getUnlockData() -> Dictionary:
	return {
		eliza = "Hmm. This pill seems to be formulated with a combination of hormonal suppressants and fat-reducing agents that could target breast tissue. When taken, it will probably lead to a flattening effect on the breasts. I think I’ll call it.. 'BreastsBeGone.' It perfectly captures the intended result!",
	}

func getTFCheckTags() -> Dictionary:
	return {
		"breasts": true,
	}

func getPillFluidsRequired() -> Dictionary:
	return {
		"GirlCum": 350.0,
	}

func isPossibleFor(_char) -> bool:
	if(!_char.hasNonFlatBreasts()):
		return false
	return true

func start(_args:Dictionary):
	pass

func canTransformFurther() -> bool:
	#if(getStage() == 0 && !getChar().hasPenis()):
	#	return true
	if(removedBreasts):
		return false
	if(getChar().hasNonFlatBreasts()):
		return true
	return false
	
func getTimerForStage(_theStage:int) -> int:
	if(_theStage == 0):
		return 200
	return 60*60*5
	
func doProgress(_context:Dictionary) -> Dictionary:
	if(removedBreasts):
		return {}
	var theChar:BaseCharacter = getChar()
	var breastSize:int = theChar.getBreastsSize()
	if(breastSize == BreastsSize.A):
		removedBreasts = true
	var toRemove:int = 1
	if(breastSize > BreastsSize.O):
		toRemove = RNG.randi_range(2,5)
	elif(breastSize > BreastsSize.DD):
		toRemove = RNG.randi_range(2,3)
	elif(breastSize > BreastsSize.C):
		toRemove = RNG.randi_range(1,2)
	return {
		effects = [
			partEffect("breasts", BodypartSlot.Breasts, "BreastSizeChange", [-toRemove]),
		]
	}


func reactProgress(_context:Dictionary, _result:TFResult):
	addText(_result.getAllTFTexts())
	
	playAnim(StageScene.GivingBirth, "birth", {bodyState={exposedCrotch=true, hard=true}})
	
func saveData() -> Dictionary:
	var data:Dictionary = .saveData()
	
	data["rb"] = removedBreasts
	
	return data

func loadData(_data:Dictionary):
	.loadData(_data)
	
	removedBreasts = SAVE.loadVar(_data, "rb", false)
