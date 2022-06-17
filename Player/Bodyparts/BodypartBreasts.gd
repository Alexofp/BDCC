extends Bodypart
class_name BodypartBreasts


var size = 0
var cached_size = 0

func _init():
	limbSlot = LimbTypes.Breasts
	fluidProduction = Lactation.new()
	fluidProduction.bodypart = weakref(self)
	
func saveData():
	var data = .saveData()
	data["size"] = size
	
	return data

func loadData(_data):
	size = SAVE.loadVar(_data, "size", 0)
	
	.loadData(_data)
	cached_size = getSize()

func getSlot():
	return BodypartSlot.Breasts

func getTooltipInfo():
	var text = "size: " + BreastsSize.breastSizeToString(getSize())
	if(size != BreastsSize.FOREVER_FLAT):
		text += "\n"+BodilyFluids.FluidType.getName(getFluidProduction().getFluidType())+": " + str(round(getFluidProduction().getFluidAmount() * 10.0)/10.0)+"/"+ str(round(getFluidProduction().getCapacity() * 10.0)/10.0)+" ml"
	
	return text

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
				[BreastsSize.DD, "DD", "DD-cup breasts"],
				[BreastsSize.E, "E", "E-cup breasts"],
				[BreastsSize.F, "F", "F-cup breasts"],
				[BreastsSize.FF, "FF", "FF-cup breasts"],
				[BreastsSize.G, "G", "G-cup breasts"],
				[BreastsSize.GG, "GG", "GG-cup breasts"],
			]
		}
	}
	
func applyAttribute(_attrID: String, _attrValue):
	if(_attrID == "breastsize"):
		size = _attrValue

func getAttributesText():
	return [
		["Breast size", BreastsSize.breastSizeToString(getSize())],
	]

func getBaseSize():
	return size

func getSize():
	var resultSize = getBaseSize()
	
	# Change to isPregnant check when that's done
	if(size != BreastsSize.FOREVER_FLAT && fluidProduction != null && fluidProduction.shouldProduce()):
		resultSize += 1
	return resultSize

func safeWhenExposed():
	return false

func induceLactation():
	if(fluidProduction != null && fluidProduction.has_method("induceLactation")):
		fluidProduction.induceLactation()

func processTime(_seconds: int):
	.processTime(_seconds)
	
	var newSize = getSize()
	if(cached_size != newSize):
		cached_size = newSize
		updateAppearance()

func getBreastsScale():
	return 1.0
