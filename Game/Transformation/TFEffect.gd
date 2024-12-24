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

func applyEffect(_data:Dictionary):
	pass

func afterAllEffects(_data:Dictionary):
	pass

func shouldAddText() -> bool:
	var theHolder = getHolder()
	if(theHolder != null && theHolder.canAddText()):
		return true
	return false

func addText(theText:String):
	var theHolder = getHolder()
	if(theHolder != null && theHolder.canAddText()):
		tfTexts.append(theText)

func grabText() -> String:
	var result:String = Util.join(tfTexts, " ")
	tfTexts.clear()
	return result

func canReplace(otherEffect) -> bool:
	if(id == otherEffect.id && tfID == otherEffect.tfID):
		return true
	return false

func onReplace(_otherEffect):
	pass
