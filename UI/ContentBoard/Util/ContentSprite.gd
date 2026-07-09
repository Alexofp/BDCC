extends Sprite
class_name ContentAutoSprite

export(String) var contentID:String = ""

func _ready():
	if(true): #TODO: Remove before ship
		return
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
	
	if(theBoardEntry):
		visible = theBoardEntry.isCompleted()
