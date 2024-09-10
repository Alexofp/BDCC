extends Reference
class_name CrotchSlotImage

var image:DatapackImage = DatapackImage.new()

signal onImageChanced(datapackImage)

func setImage(theImage:Image):
	image.setImage(theImage)
	emit_signal("onImageChanced", image)

func getImage() -> Image:
	return image.getImage()

func getTexture() -> ImageTexture:
	return image.getTexture()

func isEmpty() -> bool:
	return image.isEmpty()

func getValue(_contex:CodeContex):
	return false

func calcLineNums(_contex:CodeContex):
	pass

func saveData():
	var data = {}
	
	data["image"] = image.saveData()
	
	return data

func loadData(_data):
	image.loadData(loadVar(_data, "image", PoolByteArray()))
	
func loadVar(_data, thekey, defaultValue = null):
	if(_data.has(thekey)):
		return _data[thekey]
	return defaultValue
