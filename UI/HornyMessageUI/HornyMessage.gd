extends Control

onready var richTextLabel = $CanvasLayer/RichTextLabel
onready var tween = $CanvasLayer/RichTextLabel/Tween

func _ready():
	self.visible = false


func showMessageOnScreen(msg: String) -> void: #do not spam with messages only intended to work with occasional ones for now
	if(richTextLabel.bbcode_text == ""):
		richTextLabel.append_bbcode(msg)	
		tween.interpolate_property(
			richTextLabel, "percent_visible", 0.0, 1.0, 4.0, Tween.TRANS_LINEAR, Tween.EASE_IN)
		tween.interpolate_property(
			richTextLabel, "rect_scale", Vector2( 1.0, 1.0 ), Vector2( 1.8, 1.6 ), 6.0, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
		tween.interpolate_property(
			richTextLabel, "modulate:a", 0, 1, 5, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
		tween.interpolate_property(
			richTextLabel, "modulate:a", 1, 0, 5, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT, 5)
		tween.start()


func _on_Tween_tween_all_completed():
	richTextLabel.clear()
	self.visible = false
