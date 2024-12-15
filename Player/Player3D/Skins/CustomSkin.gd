extends SkinBase

var customName = ""
var customTexture
var texturePath
var calculatedFitting = {}

func setTexturePath(newPath):
	customTexture = ImageTexture.new()
	texturePath = newPath
	var image = Image.new()
	var err = image.load(texturePath)
	if err != OK:
		Log.error("Couldn't load skin from "+str(newPath)+"!")
		customTexture.create(32, 32)
		return
	
	customTexture.create_from_image(image, 4)
	
	calculatedFitting = {}
	if("_f" in customName):
		calculatedFitting[SkinType.Fur] = 1.0
	if("_s" in customName):
		calculatedFitting[SkinType.Scales] = 1.0
	if("_h" in customName):
		calculatedFitting[SkinType.SkinHuman] = 1.0
	if("_m" in customName):
		calculatedFitting[SkinType.SkinAndFur] = 1.0

func getName():
	return customName

func getPatternTexture():
	return customTexture

func getFittingSkinTypes():
	return calculatedFitting
