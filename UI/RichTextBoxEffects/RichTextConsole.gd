tool
extends RichTextEffect

# Syntax: [console freq=5.0 span=10.0][/ghost]

# Define the tag name.
var bbcode = "console"

const CURSOR = ord("█")

func _process_custom_fx(char_fx):
	# Get parameters, or use the provided default value if missing.
	var speed = char_fx.env.get("speed", 20.0)
	#var span = char_fx.env.get("span", 10.0)

	#var alpha = sin(char_fx.elapsed_time * speed + (char_fx.absolute_index / span)) * 0.5 + 0.5
	var alpha = 0.0

	if(char_fx.elapsed_time*speed > char_fx.relative_index):
		alpha = 1.0
	elif((char_fx.elapsed_time*speed+1) > char_fx.relative_index && int(char_fx.elapsed_time*3)%2==0):
		alpha = 1.0
		char_fx.character = CURSOR
		
	char_fx.color.a = alpha
	return true
