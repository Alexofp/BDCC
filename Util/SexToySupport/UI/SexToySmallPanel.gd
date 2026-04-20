extends HBoxContainer

onready var popup_panel = $"%PopupPanel"
onready var override_list = $"%OverrideList"
onready var pause_check_box = $"%PauseCheckBox"

var theSexToyGroupOverrideUIScene := preload("res://Util/SexToySupport/UI/SexToyGroupOverrideUI.tscn")

func _ready():
	for _group in SexToyGroup.ALL:
		var theScene:Control = theSexToyGroupOverrideUIScene.instance()
		override_list.add_child(theScene)
		theScene.setGroup(_group)
	visible = SexToyManager.enabled
	
func _on_BPButton_pressed():
	popup_panel.popup(Rect2(
		rect_global_position+Vector2(-50, 30), Vector2(206, 175)
	))

func _exit_tree():
	for group in SexToyGroup.ALL:
		var theGroup:SexToyGroupInstance = SexToyManager.getGroup(group)
		if(!theGroup):
			continue
		theGroup.setPaused(false)

func _on_PauseCheckBox_pressed():
	for group in SexToyGroup.ALL:
		var theGroup:SexToyGroupInstance = SexToyManager.getGroup(group)
		if(!theGroup):
			continue
		theGroup.setPaused(pause_check_box.pressed)
