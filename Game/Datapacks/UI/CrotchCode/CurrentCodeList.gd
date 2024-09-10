extends VBoxContainer

onready var crotch_code_editor = $"../../.."

func can_drop_data(_position, _data):
	return true

func drop_data(_position, _data):
	#print(_data)
	
	var idToSpawn = _data["id"]
	var theRef = _data["ref"]
	if(theRef.isPickVersion):
		crotch_code_editor.addBlockLast(idToSpawn)
