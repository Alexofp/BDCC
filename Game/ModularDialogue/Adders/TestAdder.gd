extends DialogueFillerAdder

func _init():
	prefix = false
	chance = 20.0

func getFormIDs() -> Array:
	return [
		"GuardCaughtOffLimits",
		]

func canBeUsed(_id:String, _args:Dictionary, _form) -> bool:
	var inmate = getChar(_args, _form.dirToRole)
	if(inmate == null):
		return false
	var hasCumIn:bool = inmate.hasEffect(StatusEffect.HasCumInsideAnus) || inmate.hasEffect(StatusEffect.HasCumInsideVagina)
	if(!hasCumIn):
		return false
#
	return true

func getText(_id:String, _args:Dictionary):
	return [
		"You left a trail, wasn't hard to find you.",
		"I heard the noise of cum dripping.",
		"Wasn't hard to find you, you're dripping everywhere.",
	]
