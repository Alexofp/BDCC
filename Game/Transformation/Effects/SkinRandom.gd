extends TFEffect

var species:Array = []
var pickedSkin:String = ""
var pickedColors:Array = []

func _init():
	id = "SkinRandom"

func initArgs(_args:Array):
	if(_args.size() > 0):
		species = _args[0] if _args[0] is Array else [_args[0]]

func applyEffect(_data:Dictionary) -> Dictionary:
	if(pickedSkin == ""):
		var finalSpecies:Array = species
		if(finalSpecies.empty()):
			finalSpecies = _data["species"] if _data.has("species") else [Species.Canine]
		
		pickedSkin = TFUtil.getRandomSkinForSpecies(finalSpecies)
		pickedColors = TFUtil.getRandomColorsForSpecies(finalSpecies)
	
	#Color.white.linear_interpolate(Color.red, 0.5)
	
	_data["pickedSkin"] = pickedSkin
	_data["pickedSkinRColor"] = pickedColors[0]
	_data["pickedSkinGColor"] = pickedColors[1]
	_data["pickedSkinBColor"] = pickedColors[2]
	var partsSkins:Dictionary = _data["partsSkins"] if _data.has("partsSkins") else {}
	
	var newPartsSkins:Dictionary = {}
	for bodypartSlot in [BodypartSlot.Hair, BodypartSlot.Penis]:
		var partSkinData:Dictionary = partsSkins[bodypartSlot] if partsSkins.has(bodypartSlot) else {}
		if(bodypartSlot == BodypartSlot.Penis):
			partSkinData["r"] = null
		newPartsSkins[bodypartSlot] = partSkinData
	
	_data["partsSkins"] = newPartsSkins
	
	return {
		success = true,
	}
	
func saveData() -> Dictionary:
	var data:Dictionary = .saveData()
	
	data["species"] = species
	data["pickedSkin"] = pickedSkin
	var pickedColorsStrs:Array = []
	for color in pickedColors:
		pickedColorsStrs.append(color.to_html())
	data["pickedColors"] = pickedColorsStrs
	
	return data

func loadData(_data:Dictionary):
	.loadData(_data)
	
	species = SAVE.loadVar(_data, "species", [])
	pickedSkin = SAVE.loadVar(_data, "pickedSkin", "")
	var pickedColorsStrs = SAVE.loadVar(_data, "pickedColors", [])
	pickedColors = []
	for colorStr in pickedColorsStrs:
		pickedColors.append(Color(colorStr))
