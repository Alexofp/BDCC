extends TFBase

var removedHorns:bool = false

func _init():
	id = "RemoveHornsTF"
	
	pointsOnUnlock = 5

func getName() -> String:
	return "Removes horns"

func getPillName() -> String:
	return "HornsBeGone"

func getUnlockData() -> Dictionary:
	return {
		eliza = "This pill appears to contain a blend of tissue-regulating compounds and growth inhibitors that could disrupt horn development. When ingested, it will probably facilitate the removal of horns.. if you have any that is. I think I’ll call it.. 'HornsBeGone.'",
	}

func getPillDatabaseDesc() -> String:
	return "This drug will morph away your horns if you have any.\n\nThe transformation consists only of one stage that will happen roughly after 20 minutes. This could be accelerated only by using the QuickShift drug."

func getTFCheckTags() -> Dictionary:
	return {
		"horns": true,
	}

func getPillFluidsRequired() -> Dictionary:
	return {
		"GirlCum": 250.0,
	}

func isPossibleFor(_char) -> bool:
	if(!_char.hasHorns()):
		return false
	return true

func start(_args:Dictionary):
	pass

func canTransformFurther() -> bool:
	if(removedHorns):
		return false
	if(getChar().hasHorns()):
		return true
	return false
	
func getTimerForStage(_theStage:int) -> int:
	if(_theStage == 0):
		return 60*20
	return 60*60*2
	
func doProgress(_context:Dictionary) -> Dictionary:
	if(removedHorns):
		return {}
	removedHorns = true
	return {
		effects = [
			partEffect("newpart", BodypartSlot.Horns, "SwitchPart", [""]),
		]
	}


func reactProgress(_context:Dictionary, _result:TFResult):
	addText(_result.getAllTFTexts())
	
	playAnim(StageScene.TFLook, "head")
	
func saveData() -> Dictionary:
	var data:Dictionary = .saveData()
	
	data["rh"] = removedHorns
	
	return data

func loadData(_data:Dictionary):
	.loadData(_data)
	
	removedHorns = SAVE.loadVar(_data, "rh", false)
