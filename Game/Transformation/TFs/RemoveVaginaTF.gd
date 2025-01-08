extends TFBase

var removedVag:bool = false

func _init():
	id = "RemoveVaginaTF"

func getName() -> String:
	return "Remove pussy"

func getPillName() -> String:
	return "PussyBeGone"

func getTFCheckTags() -> Dictionary:
	return {
		"vagina": true,
	}

func isPossibleFor(_char) -> bool:
	if(!_char.hasVagina()):
		return false
	return true

func start(_args:Dictionary):
	pass

func canTransformFurther() -> bool:
	if(removedVag):
		return false
	if(getChar().hasVagina()):
		return true
	return false
	
func getTimerForStage(_theStage:int) -> int:
	if(_theStage == 0):
		return 120
	return 240
	
func doProgress(_context:Dictionary) -> Dictionary:
	if(removedVag):
		return {}
	removedVag = true
	return {
		effects = [
			partEffect("newpart", BodypartSlot.Vagina, "SwitchPart", [""]),
		]
	}


func reactProgress(_context:Dictionary, _result:TFResult):
	addText(_result.getAllTFTexts())
	
	playAnim(StageScene.GivingBirth, "birth", {bodyState={exposedCrotch=true, hard=true}})
	
func saveData() -> Dictionary:
	var data:Dictionary = .saveData()
	
	data["rv"] = removedVag
	
	return data

func loadData(_data:Dictionary):
	.loadData(_data)
	
	removedVag = SAVE.loadVar(_data, "rv", false)
