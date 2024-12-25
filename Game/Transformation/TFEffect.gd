extends Reference
class_name TFEffect

var holderRef:WeakRef

var id:String = "error"
var tfID:int = -1

var tfTexts:Array = [] # no save
var needsToBeChecked:bool = false # no save

func setHolder(theHolder):
	holderRef = weakref(theHolder)

func getHolder():
	if(holderRef == null):
		return null
	return holderRef.get_ref()

func initArgs(_args:Array):
	pass

func prepareToApply():
	tfTexts.clear()

func applyEffect(_data:Dictionary) -> Dictionary:
	return {
		success = false,
	}

func addText(theText:String):
	tfTexts.append(theText)

func generateTransformText(_result:Dictionary):
	pass

func generateShortTransformText(_result:Dictionary):
	return generateTransformText(_result)

func generateTransformTextFinal(_result:Dictionary) -> String:
	tfTexts.clear()
	generateTransformText(_result)
	return Util.join(tfTexts, " ")

func generateShortTransformTextFinal(_result:Dictionary) -> String:
	tfTexts.clear()
	generateShortTransformText(_result)
	return Util.join(tfTexts, " ")

func canReplace(otherEffect) -> bool:
	if(id == otherEffect.id && tfID == otherEffect.tfID):
		return true
	return false

func onReplace(_otherEffect):
	pass
