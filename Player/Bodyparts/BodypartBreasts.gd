extends Bodypart
class_name BodypartBreasts


var size = 0

func _init():
	limbSlot = LimbTypes.Breasts
	
func saveData():
	return {
		"size": size
	}

func loadData(_data):
	size = SAVE.loadVar(_data, "size", 0)

func getSlot():
	return BodypartSlot.Breasts

func getTooltipInfo():
	return "size: " + BreastsSize.breastSizeToString(size) + "\n" + "Gonna be more stuff here"

func getLewdSizeAdjective():
	if(size <= BreastsSize.FLAT):
		return "flat"
	if(size <= BreastsSize.A):
		return RNG.pick(["tiny", "miniature", "little", "petite", "a-cup"])
	if(size <= BreastsSize.B):
		return RNG.pick(["small", "modest", "cute", "b-cup"])
	if(size <= BreastsSize.C):
		return RNG.pick(["perky", "generous", "average", "c-cup"])
	if(size <= BreastsSize.D):
		return RNG.pick(["curvy", "rounded", "huge", "big", "d-cup"])
	if(size <= BreastsSize.E):
		return RNG.pick(["large" , "weighty", "curvy", "heavy"])
	if(size <= BreastsSize.F):
		return RNG.pick(["massive", "heavy", "enormous"]) 
	return RNG.pick(["gigantic", "ginormous", "colossal"])
		

func getLewdAdjective():
	return RNG.pick(["soft", "squishy", "nice"])
	
func getLewdName():
	if(size <= BreastsSize.FLAT):
		return "breasts"
	
	if(size <= BreastsSize.D):
		return RNG.pick(["breasts", "boobs", "tits", "funbags"])
	
	return RNG.pick(["breasts", "boobs", "tits", "melons", "jugs", "milkies", "milkers"])

func getLewdDescriptionAndName():
	var text = getLewdAdjective() + " " + getLewdSizeAdjective() + " " + getLewdName()
	return text

func getPickableAttributes():
	return {
		"breastsize": {
			"text": "Change the breast size",
			"textButton": "Breast size",
			"buttonDesc": "Pick the breast size",
			"options": [
				[BreastsSize.FOREVER_FLAT, "Forever Flat", "Your breasts will never produce milk or increase in size"],
				[BreastsSize.FLAT, "Flat", "Flat breasts"],
				[BreastsSize.A, "A", "A-cup breasts"],
				[BreastsSize.B, "B", "B-cup breasts"],
				[BreastsSize.C, "C", "C-cup breasts"],
				[BreastsSize.D, "D", "D-cup breasts"],
			]
		}
	}
	
func applyAttribute(_attrID: String, _attrValue):
	if(_attrID == "breastsize"):
		size = _attrValue

func getAttributesText():
	return [
		["Breast size", BreastsSize.breastSizeToString(size)],
	]

func getSize():
	return size
