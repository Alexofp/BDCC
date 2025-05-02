extends TFEffect

var howMuch:int = 10

func _init():
	id = "AddFemininity"

func initArgs(_args:Array):
	if(_args.size() > 0):
		howMuch = _args[0]

func applyEffect(_data:Dictionary) -> Dictionary:
	var oldFemininity:int = _data["femininity"] if _data.has("femininity") else 50
	if(_data.has("femininity")):
		_data["femininity"] += howMuch
		
		if(_data["femininity"] > 100):
			_data["femininity"] = 100
		if(_data["femininity"] < 0):
			_data["femininity"] = 0
	return {
		success = true,
		oldFemininity = oldFemininity,
		newFemininity = _data["femininity"] if _data.has("femininity") else 50,
	}
	
func onReplace(_otherEffect):
	howMuch += _otherEffect.howMuch

func generateTransformText(_result:Dictionary):
	var oldFemininity:int = _result["oldFemininity"]
	var newFemininity:int = _result["newFemininity"]
	
	if(newFemininity > oldFemininity):
		var text:String = ""
		if(oldFemininity < 100):
			text += RNG.pick([
				"{npc.YourHis} body is becoming more feminine.",
			])
			text += RNG.pick([
				" {npc.YourHis} skin begins to soften, becoming smoother and more delicate.",
				" {npc.YourHis} hips widen slightly, creating sexier curves.",
				" Even {npc.yourHis} voice sounds softer now.",
				" {npc.YourHis} voice sounds softer, more melodic.",
				" {npc.YourHis} muscles are softening as they take on a more graceful shape.",
				" {npc.YourHis} thighs begin to soften and round out, losing any muscular definition.",
				" {npc.YouHe} {npc.youVerb('feel')} a deep, internal shift in {npc.yourHis} pelvis as it adjusts to a more feminine structure.",
				" {npc.YourHis} jawline softens, and {npc.yourHis} cheekbones rise, creating a more delicate and feminine face.",
				" {npc.YourHis} brow smooths out, and {npc.yourHis} lips plump slightly, becoming fuller and sexier.",
				" A new, subtle scent begins to emanate from {npc.yourHis} skin, sweet and floral.",
			])
			text += " {npc.YouHe} {npc.youAre} now "+str(Util.roundF(newFemininity, 0))+"% feminine."
				
			if(newFemininity >= 100):
				text += " {npc.YourHis} femininity has hit its peak!"
		else:
			text += RNG.pick([
				"{npc.YourHis} body is trying to become more feminine but {npc.yourHis} femininity has already reached its peak!",
			])
			text += RNG.pick([
				" But still, {npc.yourHis} skin softens a bit more.",
				" But still, {npc.yourHis} voice starts to sound a little softer now.",
				" But still, {npc.yourHis} muscles soften as they take on a more graceful shape.",
			])
		addText(text)
	elif(newFemininity < oldFemininity):
		var text:String = ""
		if(oldFemininity > 0):
			text += RNG.pick([
				"{npc.YourHis} body is becoming more masculine.",
			])
			text += RNG.pick([
				" {npc.YourHis} skin begins to thicken, taking on a rougher texture.",
				" {npc.YourHis} shoulders broaden, creating a more powerful silhouette.",
				" Even {npc.yourHis} voice sounds deeper now.",
				" {npc.YourHis} voice sounds deeper, more resonant.",
				" {npc.YourHis} muscles are firming up, gaining definition and strength.",
				" {npc.YourHis} thighs begin to harden, losing any softness.",
				" {npc.YouHe} {npc.youVerb('feel')} a deep, internal shift in {npc.yourHis} pelvis as it adjusts to a more masculine structure.",
				" {npc.YourHis} jawline sharpens, and {npc.yourHis} brow becomes more pronounced, creating a more rugged and masculine face.",
				" {npc.YourHis} brow furrows slightly, and {npc.yourHis} lips become thinner and more defined.",
				" A new, subtle scent begins to emanate from {npc.yourHis} skin, musky and earthy.",
			])
			text += " {npc.YouHe} {npc.youAre} now " + str(Util.roundF(100.0 - newFemininity, 0)) + "% masculine."

			if(newFemininity <= 0):
				text += " {npc.YourHis} masculinity has hit its peak!"
		else:
			text += RNG.pick([
				"{npc.YourHis} body is trying to become more masculine, but {npc.yourHis} masculinity has already reached its peak!",
			])
			text += RNG.pick([
				" But still, {npc.yourHis} skin thickens a bit more.",
				" But still, {npc.yourHis} voice starts to sound a little deeper now.",
				" But still, {npc.yourHis} muscles gain a bit more definition.",
			])
		addText(text)

func saveData() -> Dictionary:
	var data:Dictionary = .saveData()
	
	data["howMuch"] = howMuch
	
	return data

func loadData(_data:Dictionary):
	.loadData(_data)
	
	howMuch = SAVE.loadVar(_data, "howMuch", 10)
