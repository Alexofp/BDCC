extends PanelContainer

var prefix = "Test"
export var collapseName:String = ""
export var keepText:bool = false

var codeBlockMode = false
var editor

func _ready():
	if(collapseName != null):
		setText(collapseName)

func makeCodeBlockMode():
	codeBlockMode = true

func setText(theText):
	prefix = theText
	updateText()

func updateText():
	if($VBoxContainer/VBoxContainer.visible):
		$VBoxContainer/Label.text = "v "+(prefix if (codeBlockMode || keepText) else "")
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
		
		if(theRef.isPickVersion || theRef.isFavVersion):
			pass
		else:
			editor.onUserChangeMade()
			theRef.doSelfdelete()
