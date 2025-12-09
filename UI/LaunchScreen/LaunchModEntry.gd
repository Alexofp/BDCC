extends PanelContainer

onready var label:Label = $HBoxContainer/Label

var storedEntry = null
var myidx = -100

signal weMoved(ar)
signal onSelected(modEntry)

func setModEntry(modEntry,idx=-100):
	if idx>=0:
		myidx = idx
	label.text = (str(myidx+1)+": " if myidx>=0 else "?")+modEntry["name"]
	if(modEntry["disabled"]):
		label.text += " (disabled)"
	if(modEntry.has("broken") && modEntry["broken"]):
		label.text = "(BROKEN) "+label.text
		label["custom_colors/font_color"] = Color.red
		
	storedEntry = modEntry

func updIdx(change:int=-100):
	myidx+=change
	label.text = str(myidx+1)+": "+(storedEntry["name"] if storedEntry else "NO ENTRY!!!!")

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
	if !storedEntry:
		return
	var data = {"entry":storedEntry,"origin":self}
	set_drag_preview(getPreview())
	return data

func getPreview():
	var lp = Control.new()
	var l = Label.new()
	l.text = label.text
	lp.rect_min_size = Vector2(150,20)
	lp.add_child(l)
	return lp

func drop_data(_position, data):
	if typeof(data)!=TYPE_DICTIONARY:
		return
	var origin = data.get("origin",null)
	if !origin:
		return
	if origin==self or origin.myidx==myidx:
		return
	var newidx = origin.myidx
	var neworiginidx = myidx
	origin.setModEntry(storedEntry,neworiginidx)
	setModEntry(data["entry"],newidx)
	emit_signal("weMoved",[newidx,neworiginidx])

func can_drop_data(_position, data):
	if typeof(data)!=TYPE_DICTIONARY:
		return false
	return true
