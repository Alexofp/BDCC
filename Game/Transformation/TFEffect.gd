extends Reference
class_name TFEffect

var holderRef:WeakRef

var id:String = "error"
var tfID:int = -1
var slot:String = ""

var tfTexts:Array = [] # no save
var needsToBeChecked:bool = false # no save

func saveData() -> Dictionary:
	return {
		tfID = tfID,
		slot = slot,
	}

func loadData(_data:Dictionary):
	tfID = SAVE.loadVar(_data, "tfID", -1)
	slot = SAVE.loadVar(_data, "slot", "")

func setHolder(theHolder):
	holderRef = weakref(theHolder)

func getHolder():
	if(holderRef == null):
		return null
	return holderRef.get_ref()

func getChar():
	var holder = getHolder()
	if(holder == null):
		return null
	return holder.getChar()

func initArgs(_args:Array):
	pass

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
	return Util.join(tfTexts, "\n\n")

func generateShortTransformTextFinal(_result:Dictionary) -> String:
	tfTexts.clear()
	generateShortTransformText(_result)
	return Util.join(tfTexts, " ")

func canReplace(otherEffect) -> bool:
	if(id == otherEffect.id && tfID == otherEffect.tfID && slot == otherEffect.slot):
		return true
	return false

func onReplace(_otherEffect):
	pass

func getBodypartSlot() -> String:
	return slot

func setBodypartSlot(newSlot:String):
	slot = newSlot

func isPartEffect() -> bool:
	return slot != ""
