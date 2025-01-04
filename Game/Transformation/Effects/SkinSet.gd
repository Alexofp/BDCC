extends TFEffect

var pickedSkin:String = ""
var pickedColors:Array = []
var interpolate:float = 1.0

func _init():
	id = "SkinSet"

func initArgs(_args:Array):
	pickedSkin = _args[0]
	if(_args.size() > 1):
		pickedColors = _args[1]
	if(_args.size() > 2):
		interpolate = _args[2]

func applyEffect(_data:Dictionary) -> Dictionary:
	
	if(pickedSkin != ""):
		_data["pickedSkin"] = pickedSkin
	if(!pickedColors.empty()):
		_data["pickedSkinRColor"] = TFUtil.colorInterpolateStr(_data["pickedSkinRColor"], pickedColors[0], interpolate)
		_data["pickedSkinGColor"] = TFUtil.colorInterpolateStr(_data["pickedSkinGColor"], pickedColors[1], interpolate)
		_data["pickedSkinBColor"] = TFUtil.colorInterpolateStr(_data["pickedSkinBColor"], pickedColors[2], interpolate)
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
	
	data["inter"] = interpolate
	data["pickedSkin"] = pickedSkin
	var pickedColorsStrs:Array = []
	for color in pickedColors:
		pickedColorsStrs.append(color.to_html())
	data["pickedColors"] = pickedColorsStrs
	
	return data

func loadData(_data:Dictionary):
	.loadData(_data)
	
	interpolate = SAVE.loadVar(_data, "inter", 0.0)
	pickedSkin = SAVE.loadVar(_data, "pickedSkin", "")
	var pickedColorsStrs = SAVE.loadVar(_data, "pickedColors", [])
	pickedColors = []
	for colorStr in pickedColorsStrs:
		pickedColors.append(Color(colorStr))
