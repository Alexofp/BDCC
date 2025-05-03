extends Bodypart
class_name BodypartTail

var tailScale: float = 1.0

func _init():
	limbSlot = LimbTypes.Tail

func getSlot():
	return BodypartSlot.Tail

func getLewdSizeAdjective():
	return RNG.pick(["long"])

func getLewdAdjective():
	return RNG.pick(["fluffy"])
	
func getLewdName():
	return RNG.pick(["tail"])

func applyTFData(_data):
	.applyTFData(_data)
	
	tailScale = loadTFVar(_data, "tailScale", tailScale)

func saveData():
	var data = .saveData()
	data["tailScale"] = tailScale
	
	return data

func loadData(_data):
	tailScale = SAVE.loadVar(_data, "tailScale", 1.0)
	
	.loadData(_data)
	

func getPickableAttributes():
	var result = .getPickableAttributes()
	result["tailscale"] = {
		"text": "Pick your tail's scale",
		"textButton": "Tail scale",
		"buttonDesc": "Pick the tail's scale",
		"options": [
			[0.3, "30%", "Pick this scale"],
			[0.4, "40%", "Pick this scale"],
			[0.5, "50%", "Pick this scale"],
			[0.8, "80%", "Pick this scale"],
			[0.9, "90%", "Pick this scale"],
			[1.0, "100%", "Pick this scale"],
			[1.1, "110%", "Pick this scale"],
			[1.2, "120%", "Pick this scale"],
			[1.3, "130%", "Pick this scale"],
			[1.5, "150%", "Pick this scale"],
			[1.8, "180%", "Pick this scale"],
			[2.0, "200%", "Pick this scale"],
			[2.5, "250%", "Pick this scale"],
			[3.0, "300%", "Pick this scale"],
		],
		"default": 1.0,
		"floatinput": true,
	}
	return result
	
func applyAttribute(_attrID: String, _attrValue):
	.applyAttribute(_attrID, _attrValue)
	if(_attrID == "tailscale"):
		tailScale = _attrValue

func getAttributesText():
	return [
		["Tail scale", str(Util.roundF(tailScale*100.0, 1))+"%"],
	]
	
func getCharCreatorData():
	return [
		["tailScale", tailScale],
	]

func getTailScale():
	return tailScale

func getTransformAwayMessage(_context:Dictionary) -> String:
	return "A tingling sensation spreads through {npc.yourHis} back. It's {npc.yourHis} tail! It begins to rapidly shrink and retract into {npc.yourHis} body, muscles and bones gradually dissolving.. until {npc.youHe} {npc.youVerb('lose')} it completely."

func getTransformGrowMessage(_context:Dictionary) -> String:
	var isFlexible:bool = hasTrait(PartTrait.TailFlexible)
	return "{npc.YouHe} {npc.youVerb('feel')} a strange tugging sensation at the base of {npc.yourHis} spine, and suddenly, a new"+(", flexible" if isFlexible else "")+" tail begins to sprout. It unfurls behind {npc.youHim} and already begins to sway with every movement."

func getTransformMorphMessage(_context:Dictionary) -> String:
	return "{npc.YourHis} tail begins to morph into a different one! Its structure and silhouette changes dramatically, assuming a new form. {npc.YouHe} now {npc.youVerb('have', 'has')} "+getAVulgarName()+"."
