extends TFBase

func _init():
	id = "BreastSizeIncTF"

func getName() -> String:
	return "Increase size of breasts"

func getPillName() -> String:
	return "TiTS"

func getTFCheckTags() -> Dictionary:
	return {
		"breasts": true,
	}

func isPossibleFor(_char) -> bool:
	if(_char.getBreastsSize() >= BreastsSize.O):
		return false
	return true

func start(_args:Dictionary):
	pass

func canTransformFurther() -> bool:
	if(getChar().getBreastsSize() >= BreastsSize.O):
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
			partEffect("breasts", BodypartSlot.Breasts, "BreastSizeChange", [1]),
		]
	}

func reactProgress(_context:Dictionary, _result:TFResult):
	addText(_result.getAllTFTexts())
	
	playAnim(StageScene.GivingBirth, "birth", {bodyState={exposedCrotch=true, hard=true}})
	
