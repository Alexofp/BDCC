extends TextureRect
class_name TextureRectLayered

var currentSprites = []
var spriteObjects = []
var textures setget setTextures, getTextures

func setTextures(value):
	setSprites(value)

func getTextures():
	return currentSprites

func setSprites(theSprites):
	if(theSprites == null):
		theSprites = []
		currentSprites = []
		for spriteObject in spriteObjects:
			spriteObject.queue_free()
		spriteObjects.clear()
		texture = null
		return
	
	if(!(theSprites is Array)):
		theSprites = [theSprites]
	
	if(currentSprites == theSprites):
		return
	
	currentSprites = theSprites
	updateSprites()
	
func updateSprites():
	for spriteObject in spriteObjects:
		spriteObject.queue_free()
	spriteObjects.clear()
	texture = null
	
	var handledFirst = false
	
	for spritePath in currentSprites:
		var textureObject = spritePath
		if(textureObject is String):
			textureObject = load(textureObject)
		
		if(!handledFirst):
			handledFirst = true
			texture = textureObject
		else:
			var newTextureRect = TextureRect.new()
			newTextureRect.texture = textureObject
			newTextureRect.stretch_mode = TextureRect.STRETCH_KEEP_ASPECT_CENTERED
			newTextureRect.expand = true
			newTextureRect.anchor_left = 0.0
			newTextureRect.anchor_top = 0.0
			newTextureRect.anchor_right = 1.0
			newTextureRect.anchor_bottom = 1.0
			add_child(newTextureRect)
			spriteObjects.append(newTextureRect)

func hydrateSize(sizeMult:float = 1.0):
	if(texture == null):
		return
	var wantSizeW = rect_size.x * sizeMult
	var aspect = float(texture.get_size().x) / float(texture.get_size().y)
	if(aspect <= 0.0):
		return
	var wantSizeH = wantSizeW / aspect
	
	rect_min_size.y = wantSizeH
