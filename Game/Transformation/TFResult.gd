extends Reference
class_name TFResult

var effects:Dictionary = {}
var tfresult:Dictionary = {}

func setData(newtfresult:Dictionary, newEffects:Dictionary):
	tfresult = newtfresult
	effects = newEffects

func isSuccessful(effectID:String) -> bool:
	if(!effects.has(effectID)):
		return false
	if(!effects[effectID].has("success") || !effects[effectID]["success"]):
		return false
	return true

func getField(keyID:String, default = null):
	if(!tfresult.has(keyID)):
		return default
	return tfresult[keyID]

func getEffectField(effectID:String, keyID:String, default = null):
	if(!effects.has(effectID)):
		return default
	if(!effects[effectID].has(keyID)):
		return default
	return effects[effectID][keyID]

func getTFText(effectID:String) -> String:
	if(!effects.has(effectID)):
		return ""
	if(!effects[effectID].has("effect")):
		return ""
	return effects[effectID]["effect"].generateTransformTextFinal(effects[effectID])

func getAllTFTexts(connectorStr:String = "\n\n") -> String:
	var results:Array = []
	for effectID in effects:
		if(getEffectField(effectID, "noOutput", false)):
			continue
		results.append(getTFText(effectID))
	return Util.join(results, connectorStr)

func getAllTFTextsArray() -> Array:
	var results:Array = []
	for effectID in effects:
		results.append(getTFText(effectID))
	return results
