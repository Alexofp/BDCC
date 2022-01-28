extends SubGameWorld


func _on_CBStairs1_onEnter(room):
	room.say("You can go up here")
	room.addButton("Go up", "Go up", "goup")

func _on_CBStairs1_onReact(_room, key):
	if(key == "goup"):
		GM.pc.setLocation("MainStairs1")
		GM.main.reRun()


func _on_CBStairs2_onEnter(room):
	room.say("You can go up here")
	room.addButton("Go up", "Go up", "goup")


func _on_CBStairs2_onReact(_room, key):
	if(key == "goup"):
		GM.pc.setLocation("MainStairs2")
		GM.main.reRun()


func _on_CellblockRoom11_onEnter(room):
	room.addButton("Stash", "You can hide something in your cell", "stash")


func _on_CellblockRoom11_onReact(_room, key):
	if(key == "stash"):
		_room.runScene("PlayerStashScene")
