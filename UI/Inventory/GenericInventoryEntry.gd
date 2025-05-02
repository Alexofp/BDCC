extends MarginContainer

onready var label = $HBoxContainer/Control/Info/Label
onready var interact_buttons_list = $HBoxContainer/HBoxContainer/InteractButtonsList
onready var texture_rect = $HBoxContainer/Control/Info/TextureRect
onready var v_separator = $HBoxContainer/Control/Info/VSeparator
onready var v_separator_2 = $HBoxContainer/HBoxContainer/VSeparator2


var isSelected:bool = false

#var savedEntry:Dictionary = {}
var id:String = ""

signal onEntrySelected(_id)
signal onActionPressed(_id, _actionID, _args)

func _ready():
	var minSizeInv = OPTIONS.getInventoryIconSize()
	$HBoxContainer/Control/Info/TextureRect.rect_min_size.x = minSizeInv
	$HBoxContainer/Control/Info/TextureRect.rect_min_size.y = minSizeInv
	setSelected(false)

func setSelected(isNewSelected):
	if(isNewSelected != isSelected):
		if(isNewSelected):
			$ColorRect.color.a = 0.0
		else:
			$ColorRect.color.a = 1.0
	isSelected = isNewSelected

func setEntry(_entry:Dictionary):
	#savedEntry = _entry
	label.text = _entry["name"] if _entry.has("name") else "Unknown entry"
	if(_entry.has("icon")):
		texture_rect.visible = true
		v_separator.visible = true
		texture_rect.texture = load(_entry["icon"])
	else:
		texture_rect.visible = false
		v_separator.visible = false
	
	Util.delete_children(interact_buttons_list)
	var actions:Array = _entry["actions"] if _entry.has("actions") else []
	v_separator_2.visible = !actions.empty()
	for actionEntry in actions:
		var newButton:Button = Button.new()
		interact_buttons_list.add_child(newButton)
		newButton.text = actionEntry[1] if actionEntry.size() > 1 else actionEntry[0]
		var _ok = newButton.connect("pressed", self, "onActionButtonPressed", [actionEntry[0], actionEntry[2] if actionEntry.size() > 2 else {}])
	
func onActionButtonPressed(_actionId:String, _args):
	emit_signal("onActionPressed", id, _actionId, _args)

func _on_SelectButton_pressed():
	emit_signal("onEntrySelected", id)
