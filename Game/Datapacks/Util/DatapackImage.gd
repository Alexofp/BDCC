extends Reference
class_name DatapackImage

var image:Image
var imageRaw:PoolByteArray
var texture:ImageTexture

func isEmpty() -> bool:
	return getImage() == null

func getImage() -> Image:
	if(image != null):
		return image
	
	if(imageRaw.empty()):
		return image
	var newIm = Image.new()
	var _ok = newIm.load_png_from_buffer(imageRaw)
	if(_ok == OK):
		image = newIm
		imageRaw = PoolByteArray()
	return image

func setImage(newIm:Image):
	if(image == newIm):
		return
	image = newIm
	imageRaw = PoolByteArray()
	texture = null

func getTexture() -> ImageTexture:
	if(texture == null):
		if(getImage() != null):
			texture = ImageTexture.new()
			texture.create_from_image(getImage(), 4)
	return texture

func saveData() -> PoolByteArray:
	return (getImage().save_png_to_buffer() if getImage() else PoolByteArray())

func loadData(_data):
	if(!(_data is PoolByteArray)):
		setImage(null)
		return
	imageRaw = _data
	image = null
	texture = null
