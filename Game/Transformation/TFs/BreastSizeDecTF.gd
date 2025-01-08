extends TFBase

func _init():
	id = "BreastSizeDecTF"

func getName() -> String:
	return "Decreases size of breasts"

func getPillName() -> String:
	return "Just-Ice"

func getTFCheckTags() -> Dictionary:
	return {
		"breasts": true,
	}

func isPossibleFor(_char) -> bool:
	if(_char.getBreastsSize() <= BreastsSize.FLAT):
		return false
	return true

func start(_args:Dictionary):
	pass

func canTransformFurther() -> bool:
	if(getChar().getBreastsSize() <= BreastsSize.FLAT):
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
			partEffect("breasts", BodypartSlot.Breasts, "BreastSizeChange", [-1]),
		]
	}

func reactProgress(_context:Dictionary, _result:TFResult):
	addText(_result.getAllTFTexts())
	
	playAnim(StageScene.GivingBirth, "birth", {bodyState={exposedCrotch=true, hard=true}})
	
