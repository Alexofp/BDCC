extends LineEdit

func _ready():
	var _ok := connect("text_changed", self, "doIDTextFilter")

func doIDTextFilter(_newText:String):
#	var newText:String = ""
#	for character in _newText:
#		var c:String = character.to_lower()
#		if(Util.letters_chars.has(c) || Util.numbers_chars.has(c) || ["_"].has(c)):
#			newText += c
#	if(newText != _newText):
#		text = newText
	var newText:String = Util.stripBadCharactersFromID(_newText)
	if(_newText != newText):
		text = newText
