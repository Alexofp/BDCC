extends "res://Game/Datapacks/UI/PackVarUIs/PackVarUIBase.gd"

var isUploading = false
var signalConnected = false

var theImage:Image

func _ready():
	setIsUploading(false)

func setIsUploading(newEdit):
	#var wasUploading = isUploading
	isUploading = newEdit
	
	if(isUploading):
		if(!signalConnected):
			var _ok = get_tree().connect("files_dropped", self, "_on_files_dropped")
			signalConnected = true
		
		$Control/DragDropWindowDialog.show_modal()
	else:
		if(signalConnected):
			get_tree().disconnect("files_dropped", self, "_on_files_dropped")
			signalConnected = false
		
		$Control/DragDropWindowDialog.hide()

func _on_files_dropped(files, _screen):
	setIsUploading(false)
	if(files.empty()):
		return
	
	var theFilePath:String = files[0]
	
	var image = Image.new()
	var err = image.load(theFilePath)
	if err != OK:
		showAlert("Couldn't load image from "+str(theFilePath)+"!")
		return
	
	var newTexture = ImageTexture.new()
	newTexture.create_from_image(image, 4)
	$TextureRect.texture = newTexture
	theImage = image
	triggerChange(theImage)

func setData(_dataLine:Dictionary):
	if(_dataLine.has("name")):
		$Label.text = _dataLine["name"]
	if(_dataLine.has("uploadinfo")):
		$Control/DragDropWindowDialog/VBoxContainer/Label.text = _dataLine["uploadinfo"]
	if(_dataLine.has("value")):
		theImage = _dataLine["value"]
		if(theImage != null):
			if(_dataLine.has("texture")):
				$TextureRect.texture = _dataLine["texture"]
			else:
				var newTexture = ImageTexture.new()
				newTexture.create_from_image(theImage, 4)
				$TextureRect.texture = newTexture
		else:
			$TextureRect.texture = null

func _on_DragDropWindowDialog_popup_hide():
	setIsUploading(false)

func _on_CancelButton_pressed():
	setIsUploading(false)

func _on_UploadButton_pressed():
	setIsUploading(true)

func _on_ClearButton_pressed():
	theImage = null
	$TextureRect.texture = theImage
	triggerChange(theImage)
