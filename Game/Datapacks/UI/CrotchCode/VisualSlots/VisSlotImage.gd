extends VBoxContainer

var slotImage:CrotchSlotImage
var editor
onready var image_var_ui = $ImageVarUI

func setSlotImage(theSlotVar):
	slotImage = theSlotVar
	updateBlock()

func updateBlock():
	if(slotImage == null):
		image_var_ui.setData({
			value = null,
			texture = null,
		})
		return
	
	image_var_ui.setData({
		value = slotImage.getImage(),
		texture = slotImage.getTexture(),
	})

func makeExpand():
	size_flags_horizontal = SIZE_EXPAND_FILL


func _on_ImageVarUI_onValueChange(_id, newValue):
	slotImage.setImage(newValue)
	#updateBlock()
