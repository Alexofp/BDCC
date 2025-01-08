extends TFBase

var removedHorns:bool = false

func _init():
	id = "RemoveHornsTF"

func getName() -> String:
	return "Remove horns"

func getPillName() -> String:
	return "HornsBeGone"

func getTFCheckTags() -> Dictionary:
	return {
		"horns": true,
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
		return 120
	return 240
	
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
	
	playAnim(StageScene.GivingBirth, "birth", {bodyState={exposedCrotch=true, hard=true}})
	
func saveData() -> Dictionary:
	var data:Dictionary = .saveData()
	
	data["rh"] = removedHorns
	
	return data

func loadData(_data:Dictionary):
	.loadData(_data)
	
	removedHorns = SAVE.loadVar(_data, "rh", false)
