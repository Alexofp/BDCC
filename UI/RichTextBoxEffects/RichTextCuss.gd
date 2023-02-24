tool
extends RichTextEffect


# Syntax: [cuss][/cuss]
var bbcode = "cuss"

var VOWELS = [ord("a"), ord("e"), ord("i"), ord("o"), ord("u"),
			  ord("A"), ord("E"), ord("I"), ord("O"), ord("U")]
var CHARS = [ord("&"), ord("$"), ord("!"), ord("@"), ord("*"), ord("#"), ord("%")]
var SPACE = ord(" ")

var _was_space = false


func _process_custom_fx(char_fx):
	var c = char_fx.character
	
	if not _was_space and not char_fx.relative_index == 0 and not c == SPACE:
		var t = char_fx.elapsed_time + char_fx.character * 10.2 + char_fx.absolute_index * 2
		t *= 4.3
		if c in VOWELS or sin(t) > 0.0:
			char_fx.character = CHARS[int(t) % len(CHARS)]
	
	_was_space = c == SPACE
	
	return true
