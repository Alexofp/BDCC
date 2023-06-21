extends SkinBase

var customName = ""
var customTexture
var texturePath

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

func getName():
	return customName

func getPatternTexture():
	return customTexture
