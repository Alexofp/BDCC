extends TFEffect

var howMuch:int = 10

func _init():
	id = "AddThickness"

func initArgs(_args:Array):
	if(_args.size() > 0):
		howMuch = _args[0]

func applyEffect(_data:Dictionary) -> Dictionary:
	var oldThickness:int = _data["thickness"] if _data.has("thickness") else 50
	if(_data.has("thickness")):
		if(_data["thickness"] < 150):
			_data["thickness"] += howMuch
			
			if(_data["thickness"] > 150):
				_data["thickness"] = 150
			if(_data["thickness"] < 0):
				_data["thickness"] = 0
	return {
		success = true,
		oldThickness = oldThickness,
		newThickness = _data["thickness"] if _data.has("thickness") else 50,
	}
	
func onReplace(_otherEffect):
	howMuch += _otherEffect.howMuch

func generateTransformText(_result:Dictionary):
	var oldThickness:int = _result["oldThickness"]
	var newThickness:int = _result["newThickness"]
	
	if(newThickness > oldThickness):
		var text:String = ""
		text += RNG.pick([
			"{npc.YourHis} hips begin to widen.",
			"{npc.YourHis} hips begin to noticeably widen.",
		])
		if(newThickness < 40):
			text += RNG.pick([
				" But only just a bit.",
				" But the overall form is still quite slim.",
				" That slim butt might not be so slim soon.",
				" {npc.YourHis} butt gets more jiggly with each pound.",
				" Muscles are not so visible anymore.",
				" Change is barely noticeable.. but it's there, for sure.",
				" {npc.YourHis} body is still maintaining its sleekness.",
			])
		else:
			text += RNG.pick([
				" {npc.yourHis} butt is becoming more full and round.",
				" It looks like {npc.youHe} gained some weight.",
				" {npc.YourHis} curves become more pronounced.",
				" {npc.YouHe} {npc.youAre} getting thicker and thicker.",
				" {npc.YourHis} thighs are starting to fill out nicely.",
				" {npc.YourHis} body is receiving a more voluptuous shape.",
				" {npc.YourHis} butt is developing a delightful roundness.",
			])
			
		if(newThickness >= 150):
			text += " {npc.YourHis} thickness has hit its peak! {npc.YourHis} hips have expanded to their fullest, creating an undeniably striking silhouette."
		addText(text)
	elif(newThickness < oldThickness):
		var text:String = ""
		text += RNG.pick([
			"{npc.YourHis} hips begin to lose some of their thickness.",
		])
		text += RNG.pick([
			" {npc.YouHe} can feel a slight reduction in fullness.",
			" {npc.YourHis} curves are becoming less pronounced.",
			" {npc.YouHe} {npc.youVerb('notice')} that {npc.yourHis} hips are not as wide as before.",
			" The change is subtle, but {npc.youHe} feel a bit slimmer.",
			" {npc.YourHis} body is returning to a more streamlined shape.",
			" {npc.YouHe} {npc.youVerb('feel')} lighter, as if some of the weight has lifted.",
			" {npc.YourHis} silhouette is less curvy than it was moments ago.",
			" {npc.YouHe} can sense a shift, as {npc.yourHis} form becomes more delicate."
		])
		if(newThickness <= 0):
			text += " {npc.YourHis} thickness has hit the lowest possible point! {npc.YourHis} body is now extremely slim and sleek."
		addText(text)

func saveData() -> Dictionary:
	var data:Dictionary = .saveData()
	
	data["howMuch"] = howMuch
	
	return data

func loadData(_data:Dictionary):
	.loadData(_data)
	
	howMuch = SAVE.loadVar(_data, "howMuch", 10)
