extends TFEffect

var howMuch:float = 1

func _init():
	id = "PenisLengthChange"

func initArgs(_args:Array):
	if(_args.size() > 0):
		howMuch = _args[0]

func applyEffect(_data:Dictionary) -> Dictionary:
	var origLen = _data["lengthCM"] if _data.has("lengthCM") else 5.0
	
	if(_data.has("lengthCM")):
		_data["lengthCM"] += howMuch
		if(_data["lengthCM"] < 4.0):
			_data["lengthCM"] = 4.0
	else:
		_data["lengthCM"] = max(howMuch, 4.0)
	
	return {
		origLen = origLen,
		newLen = _data["lengthCM"],
		success = true,
	}
	
func onReplace(_otherEffect):
	howMuch += _otherEffect.howMuch

func generateTransformText(_result:Dictionary):
	var oldLen:float = _result["origLen"]
	var newLen:float = _result["newLen"]
	
	var text:String = ""
	if(newLen > oldLen):
		text += RNG.pick([
			"{npc.YourHis} {penis} is growing longer!",
		])
		text += RNG.pick([
			" The shaft elongates, gaining both length and girth.",
			" {npc.YouHe} can feel the weight of it shifting as it grows longer.",
			" A tingling sensation runs through it as it continues to extend.",
			" The skin stretches smoothly as it grows, becoming more pronounced.",
			" {npc.YouHe} can see it lengthening before {npc.yourHis} eyes.",
		])
		text += " {npc.YourHis} {npc.penis} is now "+Util.cmToString(newLen)+" long."
		if(newLen >= 25):
			text += RNG.pick([
				" It's so fucking huge!",
				" Holy shit!",
				" That's probably enough, no?!",
				" That's one heck of a bitchbreaker!",
				" How can one even carry that thing around?",
			])
		elif(newLen >= 15):
			text += RNG.pick([
				" Very solid cock.",
				" Not bad.",
				" That's a pretty big cock.",
				" Nice.",
				" Decent size.",
			])
		
		addText(text)
	elif(newLen < oldLen):
		text += RNG.pick([
			"{npc.YourHis} {penis} is shrinking!",
			"{npc.YourHis} {penis} is shrinking! Oh no.",
		])
		text += RNG.pick([
			" The shaft retracts, losing both length and girth.",
			" {npc.YouHe} can feel it becoming lighter as it gets smaller.",
			" A tingling sensation runs through it as it continues to shrink.",
			" The skin tightens around it, becoming less pronounced.",
			" {npc.YouHe} can see it diminishing before {npc.yourHis} very eyes.",
		])
		text += " {npc.YourHis} {npc.penis} is now only " + Util.cmToString(newLen) + " long."
		if(newLen <= 5):
			text += RNG.pick([
				" It's so tiny now!",
				" How did it get this small?",
				" That's almost cute!",
				" It's practically non-existent!",
				" How can one even notice that?",
				" It's like a little button now!",
				" You can barely see it!",
				" It's almost like it vanished!",
				" That's definitely not what it used to be!",
				" It's so small, it feels like a toy!",
			])
		elif(newLen <= 10):
			text += RNG.pick([
				" Quite a small size.",
				" Not much to work with.",
				" That's a little on the small side.",
				" Adorable, really.",
				" A modest size.",
				" It's definitely more compact now.",
				" You can feel the difference; it's much less imposing.",
				" It's shrinking down to a more delicate size.",
				" That's a significant reduction in size.",
				" It feels more manageable now.",
			])
		addText(text)
	else:
		text += RNG.pick([
			"{npc.YouHe} {npc.youVerb('feel')} a tingling in {npc.yourHis} {penis} but nothing about it has seemingly changed.",
		])
		addText(text)
#
#func generateShortTransformText(_result:Dictionary):
#	var origSize:int = _result["origSize"]
#	var size:int = _result["size"]
#	var breastsCovered:bool = (getChar().getFirstItemThatCoversBodypart(BodypartSlot.Breasts) != null)
#
#	addText(describeBreastTransformation(origSize, size, breastsCovered))

func saveData() -> Dictionary:
	var data:Dictionary = .saveData()
	
	data["howMuch"] = howMuch
	
	return data

func loadData(_data:Dictionary):
	.loadData(_data)
	
	howMuch = SAVE.loadVar(_data, "howMuch", 1)
