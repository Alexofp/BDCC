extends TFBase

func _init():
	id = "ThicknessAddTF"

func getName() -> String:
	return "Make thicker"

func getPillName() -> String:
	return "ThiCC"

func getTFCheckTags() -> Dictionary:
	return {
		"thickness": true,
	}

func isPossibleFor(_char) -> bool:
	if(_char.getThickness() >= 150):
		return false
	return true

func start(_args:Dictionary):
	pass

func canTransformFurther() -> bool:
	if(getChar().getThickness() >= 150):
		return false
	return .canTransformFurther()
	
func getMaxStage() -> int:
	return 3
	
func getTimerForStage(_theStage:int) -> int:
	if(_theStage == 0):
		return 120
	return 240
	
func doProgress(_context:Dictionary) -> Dictionary:
	return {
		effects = [
			charEffect("thi", "AddThickness", [RNG.randi_range(7, 13)]),
		]
	}

func reactProgress(_context:Dictionary, _result:TFResult):
	addText(_result.getAllTFTexts())
	
	playAnim(StageScene.GivingBirth, "birth", {bodyState={exposedCrotch=true, hard=true}})
	
