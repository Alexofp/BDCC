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
