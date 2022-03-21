extends Reference
class_name RestraintData

var level = 0
var durability = 1
var tightness = 1
var inspected = false
var material = RestraintMaterial.Leather
var item
var canAlwaysInspect = false

func resetOnNewTry():
	tightness = 1

func setLevel(newlevel):
	level = newlevel
	
func getLevel():
	return level
	
func setMaterial(newmaterial):
	material = newmaterial

func getMaterialName():
	return RestraintMaterial.getVisibleName(material)

func getVisibleLevel():
	if(!inspected):
		return "???"
	return str(level)

func canInspectWhileBlindfolded():
	return canAlwaysInspect

func inspect():
	inspected = true

func getPossibleActions():
	var allActions = item.getRestraintActions()
	
	var result = []
	for action in allActions:
		if(RestraintAction.canUseAction(GM.pc, action, item.getClothingSlot())):
			result.append(action)
			
	return result

func getVisibleDurability():
	if(durability > 0.9):
		return "zero scratches"
	if(durability > 0.8):
		return "some scratches"
	if(durability > 0.7):
		return "slightly damaged"
	if(durability > 0.6):
		return "visible cracks"
	if(durability > 0.1):
		return "very damaged"
	return "almost destroyed"

func getVisibleTightness():
	if(tightness > 0.9):
		return "sits very tight"
	if(tightness > 0.8):
		return "sits tight"
	if(tightness > 0.7):
		return "sits kinda tight"
	if(tightness > 0.6):
		return "gives in a little bit"
	if(tightness > 0.5):
		return "gives some leeway"
	if(tightness > 0.4):
		return "quite a bit of leeway"
	if(tightness > 0.3):
		return "feels slightly loose"
	if(tightness > 0.2):
		return "kinda loose"
	if(tightness > 0.1):
		return "pretty loose"
	return "extremely loose"
