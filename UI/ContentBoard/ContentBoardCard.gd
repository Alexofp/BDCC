tool
extends PanelContainer

export(String) var contentID := ""
export(String) var contentName := "" setget setContentName
export(String, MULTILINE) var contentDesc := "" setget setContentDesc

onready var name_label = $"%NameLabel"
onready var desc_label = $"%DescLabel"
onready var status_label = $"%StatusLabel"


signal onPressed(_contentID)

func _on_PressButton_pressed():
	emit_signal("onPressed", contentID)
	get_parent().triggerCardPress(contentID)

func setContentName(_text:String):
	contentName = _text
	if(Engine.editor_hint && name_label):
		$"%NameLabel".text = _text

func setContentDesc(_text:String):
	contentDesc = _text
	if(Engine.editor_hint && desc_label):
		$"%DescLabel".text = _text

func _ready():
	if(!Engine.editor_hint):
		name_label.text = contentName
		desc_label.text = contentDesc
