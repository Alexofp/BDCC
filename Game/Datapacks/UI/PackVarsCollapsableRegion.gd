extends PanelContainer

var prefix = "Test"

func setText(theText):
	prefix = theText
	updateText()

func updateText():
	if($VBoxContainer/VBoxContainer.visible):
		$VBoxContainer/Label.text = "v "#+prefix
	else:
		$VBoxContainer/Label.text = "> "+prefix

func toggleRegion():
	$VBoxContainer/VBoxContainer.visible = !$VBoxContainer/VBoxContainer.visible
	updateText()

func addToRegion(newNode):
	$VBoxContainer/VBoxContainer.add_child(newNode)


func _on_TextureButton_pressed():
	toggleRegion()
