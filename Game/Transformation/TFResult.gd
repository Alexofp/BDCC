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

func getAllTFTexts(connectorStr:String = "\n\n", addMiddleParts:bool = true) -> String:
	var results:Array = []
	var effectAmount:int = effects.size()
	for effectID in effects:
		var isLast:bool = (effectAmount == 1)
		if(getEffectField(effectID, "noOutput", false)):
			effectAmount -= 1
			continue
		results.append(getTFText(effectID))
		if(!isLast && addMiddleParts):
			results.append(RNG.pick([
				"But that's not all..",
				"Something else is happening..",
				"Just when {npc.youHe} {npc.youVerb('think')} that this is over..",
				"Wait.. More?",
				"It's not stopping..",
				"It doesn't stop there..",
				"This isn't even {npc.yourHis} final form..",
				"Something else is stirring..",
				"More surprises await..",
				"Was that it? No.",
				"At the same time, something else is happening..",
			]))
		effectAmount -= 1
	return Util.join(results, connectorStr)

func getAllTFTextsArray() -> Array:
	var results:Array = []
	for effectID in effects:
		results.append(getTFText(effectID))
	return results
