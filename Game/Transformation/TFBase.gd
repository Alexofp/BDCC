extends Reference
class_name TFBase

var id:String = "error"
var holderRef:WeakRef
var uniqueID:int = -1

var stage:int = 0
var timer:int = 0

const TFTYPE_CHAR = 0
const TFTYPE_PART = 1

var tfTexts:Array = [] # no save
var reactResultData:Dictionary = {}

func start(_args:Dictionary):
	pass

func startFinal(_args:Dictionary):
	resetTimer()
	start(_args)

func setHolder(_holder):
	holderRef = weakref(_holder)

func getHolder():
	if(holderRef == null):
		return null
	return holderRef.get_ref()

func getChar() -> BaseCharacter:
	var theHolder = getHolder()
	if(theHolder == null):
		return null
	return theHolder.getChar()

func getName() -> String:
	return "FILL ME!"

func canTransformFurther() -> bool:
	return !isMaxStage()

func isReadyToProgress() -> bool:
	return (timer <= 0)

func isReadyToProgressFinal() -> bool:
	return canTransformFurther() && isReadyToProgress()

func setTimer(newTime:int):
	timer = newTime

func getTimer() -> int:
	return timer

func accelerateTimerSeconds(howMuch:int):
	timer -= howMuch

func accelerateTimer(share:float):
	timer = int(float(timer) * (1.0 - clamp(share, 0.0, 1.0)))

func getTimerForStage(_theStage:int) -> int:
	return 240

func getTimerDeviation() -> float:
	return 0.3

func resetTimer():
	var deviation:float = getTimerDeviation()
	setTimer( int(round(float(getTimerForStage(getStage())) * (1.0 + RNG.randf_range(-deviation, deviation)))) )

func doProgressFinal(_context:Dictionary) -> Dictionary:
	resetTimer()
	return doProgress(_context)

func doProgress(_context:Dictionary) -> Dictionary:
	return {
		effects = [],
	}

func reactProgress(_context:Dictionary, _result:TFResult):
	var resultText:String = _result.getAllTFTexts()
	if(resultText != ""):
		addText(resultText)
	else:
		addText("Nothing happened")
	
func reactProgressFinal(_context:Dictionary, _result:TFResult):
	tfTexts.clear()
	reactResultData.clear()
	reactProgress(_context, _result)
	if(!_result.getField("noStageAdvance", false)):
		stage += 1
	return {text=Util.join(tfTexts, "\n\n"), anim=(reactResultData["anim"] if reactResultData.has("anim") else [])}

func reactProgressShort(_context:Dictionary, _result:TFResult):
	addText(_result.getAllTFTexts(" "))

func reactProgressShortFinal(_context:Dictionary, _result:TFResult):
	tfTexts.clear()
	reactResultData.clear()
	reactProgressShort(_context, _result)
	stage += 1
	return {text=Util.join(tfTexts, " ")}

func getStage() -> int:
	return stage

func isFirstTime() -> bool:
	return stage == 0

func getMaxStage() -> int:
	return 1

func isMaxStage() -> bool:
	return getStage() >= getMaxStage()

func doCancel(_context:Dictionary) -> Dictionary:
	return {
		text = "MEOW GOT CANCELLED!",
	}

func processTime(_seconds:int):
	timer -= _seconds

func onSexEvent(_event : SexEvent):
	pass

func playAnim(anim:String, animState:String, args:Dictionary={}):
	reactResultData["anim"] = [anim, animState, args]

func addText(theText:String):
	if(theText == ""):
		return
	#getHolder().addTextToReactQueue(theText)
	tfTexts.append(theText)

func effect(_effectID:String, _args:Array = [], bodypartSlot:String = ""):
	var theEffect:TFEffect = GlobalRegistry.createTransformationEffect(_effectID)
	theEffect.tfID = uniqueID
	if(bodypartSlot != ""):
		theEffect.setBodypartSlot(bodypartSlot)
	theEffect.initArgs(_args)
	return theEffect

func partEffect(theid:String, part:String, effectID:String, args:Array = []) -> Dictionary:
	return {
		id = theid,
		type = TFTYPE_PART,
		part = part,
		effect = effect(effectID, args, part),
	}
	
func charEffect(theid:String, effectID:String, args:Array = []) -> Dictionary:
	return {
		id = theid,
		type = TFTYPE_CHAR,
		effect = effect(effectID, args),
	}
