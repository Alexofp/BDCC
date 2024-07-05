extends PanelContainer

var prefix = "Test"

var codeBlockMode = false

func makeCodeBlockMode():
	codeBlockMode = true

func setText(theText):
	prefix = theText
	updateText()

func updateText():
	if($VBoxContainer/VBoxContainer.visible):
		$VBoxContainer/Label.text = "v "+(prefix if codeBlockMode else "")
	else:
		$VBoxContainer/Label.text = "> "+prefix

func toggleRegion():
	$VBoxContainer/VBoxContainer.visible = !$VBoxContainer/VBoxContainer.visible
	updateText()

func addToRegion(newNode):
	$VBoxContainer/VBoxContainer.add_child(newNode)


func _on_TextureButton_pressed():
	toggleRegion()


func can_drop_data(_position, _data):
	return codeBlockMode

func drop_data(_position, _data):
	if(_data.has("ref")):
		var theRef = _data["ref"]
		
		if(!theRef.isPickVersion):
			theRef.doSelfdelete()
