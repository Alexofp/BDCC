extends Sprite
class_name ContentAutoSprite

export(String) var contentID:String = ""

var darkSpriteMat := preload("res://UI/ContentBoard/Util/DarkSpriteMat.tres")

func _ready():
	#if(true):
	#	return
	if(contentID.empty()):
		var theParent = get_parent()
		if(theParent && theParent.has_method("getContentID")):
			contentID = theParent.getContentID()
			if(contentID.empty()):
				return
		else:
			return
	var theBoardEntry:ContentBoardEntryBase = GlobalRegistry.getContentBoardEntry(contentID)
	if(!theBoardEntry):
		# Fallback
		var theScript = load("res://UI/ContentBoard/Entries/"+contentID+".gd")
		if(theScript):
			theBoardEntry = theScript.new()
	
	var shouldSh:bool = true
	if(theBoardEntry):
		shouldSh = theBoardEntry.isCompleted()
	
	if(!shouldSh):
		material = darkSpriteMat
		modulate = Color.black
		modulate.a = 0.15
	else:
		material = null
		modulate = Color.white

func _unhandled_key_input(event: InputEventKey):
	if(event.pressed && event.physical_scancode == KEY_P): # Tshhhhhhhhh-
		material = null
		modulate = Color.white
