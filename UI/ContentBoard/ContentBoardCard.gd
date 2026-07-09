tool
extends PanelContainer

export(String) var contentID := ""
export(String) var contentName := "" setget setContentName
export(String, MULTILINE) var contentDesc := "" setget setContentDesc

onready var name_label = $"%NameLabel"
onready var desc_label = $"%DescLabel"
onready var status_label = $"%StatusLabel"

export(Color) var bgColor := Color("#0a2868") setget setBGColor
export(Color) var borderColor := Color("#12142b") setget setBorderColor

export(bool) var updateStuff setget doDebugUpdateStuff
onready var selection_container = $"%SelectionContainer"

signal onPressed(_contentID, _panel)

func _on_PressButton_pressed():
	emit_signal("onPressed", contentID, self)
	get_parent().triggerCardPress(contentID, self)

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
		selection_container.visible = false
		name_label.text = contentName
		desc_label.text = contentDesc
		updateColors()

		var theBoardEntry:ContentBoardEntryBase = GlobalRegistry.getContentBoardEntry(contentID)
		if(!theBoardEntry):
			# Fallback
			var theScript = load("res://UI/ContentBoard/Entries/"+contentID+".gd")
			if(theScript):
				theBoardEntry = theScript.new()
		
		if(theBoardEntry):
			var theStatus:int = theBoardEntry.getStatus()
			status_label.text = ContentBoardStatus.getText(theStatus)
			status_label["custom_colors/font_color"] = ContentBoardStatus.getColor(theStatus)
			
			name_label.text = theBoardEntry.getName()
			desc_label.text = theBoardEntry.getDesc(false)
			
func updateColors():
	var theStyle := preload("res://UI/ContentBoard/Util/ContentBoardCardStyle.tres").duplicate()
	theStyle.bg_color = bgColor
	theStyle.border_color = borderColor
	
	set("custom_styles/panel", theStyle)

func setBGColor(_color:Color):
	bgColor = _color
	updateColors()

func setBorderColor(_color:Color):
	borderColor = _color
	updateColors()

func doDebugUpdateStuff(_u:bool):
	if(!_u):
		return
	$"%NameLabel".text = contentName
	$"%DescLabel".text = contentDesc
	updateColors()

func setSelected(_b:bool):
	selection_container.visible = _b

func getContentID() -> String:
	return contentID
