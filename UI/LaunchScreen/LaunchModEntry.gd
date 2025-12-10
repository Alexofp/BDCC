extends PanelContainer

onready var label:Label = $HBoxContainer/Label

var storedEntry = null
var entryIndex:int = -1

signal onDragOntoAnotherEntry(ar)
signal onSelected(modEntry)

func setModEntry(modEntry):
	storedEntry = modEntry
	updateEntry()

func updateEntry():
	if(!storedEntry):
		return
	var theTextColor:Color = Color.white
	label.text = storedEntry["name"]
	if(storedEntry.has("broken") && storedEntry["broken"]):
		label.text = "(BROKEN) "+label.text
		theTextColor = Color.red
	if(storedEntry.has("disabled") && storedEntry["disabled"]):
		label.text += " (disabled)"
		theTextColor = theTextColor.darkened(0.3)
		
	label["custom_colors/font_color"] = theTextColor

func _on_TextureButton_pressed():
	emit_signal("onSelected", storedEntry)

func makeActive():
	$Panel.visible = true

func makeInactive():
	$Panel.visible = false

func _notification(what):
	if what==NOTIFICATION_DRAG_BEGIN:
		get_drag_data(rect_position)
	elif what==NOTIFICATION_DRAG_END:
		drop_data(rect_position,get_viewport().gui_get_drag_data())

func get_drag_data(_position):
	if !storedEntry or !Rect2(Vector2.ZERO,rect_size).has_point(_position) or get_viewport().gui_get_drag_data():
		return
	var data = {"entry":storedEntry,"origin":self}
	set_drag_preview(getPreview())
	return data

func getPreview():
	var lp = Control.new()
	var panel = PanelContainer.new()
	var l = Label.new()
	l.text = label.text
	lp.rect_min_size = rect_size
	panel.size_flags_horizontal = panel.SIZE_EXPAND_FILL
	panel.size_flags_vertical = panel.SIZE_EXPAND_FILL
	lp.add_child(panel)
	l.add_color_override("font_color",label.get_color("font_color"))
	panel.add_child(l)
	return lp

func drop_data(_position, data):
	if typeof(data)!=TYPE_DICTIONARY:
		return
	var origin = data.get("origin",null)
	if !origin:
		return
	if origin==self or origin.entryIndex==entryIndex:
		return
	var newidx = origin.entryIndex
	var neworiginidx = entryIndex
	emit_signal("onDragOntoAnotherEntry",[newidx,neworiginidx])

func can_drop_data(_position, data):
	return typeof(data)==TYPE_DICTIONARY
