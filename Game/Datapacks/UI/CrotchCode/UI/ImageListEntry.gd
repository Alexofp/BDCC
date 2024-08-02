extends HBoxContainer
onready var id_label = $IDLabel
onready var artist_label = $ArtistLabel
onready var image_scale = $ImageScale
onready var image_var_ui = $ImageVarUI

var entry:DatapackSceneImage
signal onIDChanged(oldID, newID)
signal onDeletePressed(theID)

func setEntry(theEntry:DatapackSceneImage):
	entry = theEntry
	updateEntry()

func updateEntry():
	if(entry == null):
		return
	
	id_label.setData({
		name = "ID",
		value = entry.id,
	})
	
	artist_label.setData({
		name = "Artist (optional)",
		value = entry.artist,
	})
	
	image_scale.setData({
		name = "Scale (0.0 - 1.0)",
		value = entry.imageScale,
	})
	
	image_var_ui.setData({
		name = "Image",
		value = entry.image.getImage(),
		texture = entry.image.getTexture(),
	})

func _on_IDLabel_onValueChange(_id, newValue):
	var oldID = entry.id
	
	entry.id = newValue
	emit_signal("onIDChanged", oldID, entry.id)

func _on_ArtistLabel_onValueChange(_id, newValue):
	entry.artist = newValue

func _on_ImageScale_onValueChange(_id, newValue):
	entry.imageScale = newValue

func _on_ImageVarUI_onValueChange(_id, newValue):
	entry.image.setImage(newValue)

func _on_DeleteButton_pressed():
	emit_signal("onDeletePressed", entry.id)
