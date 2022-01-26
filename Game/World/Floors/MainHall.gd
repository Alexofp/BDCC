extends SubGameWorld


func _on_MainStairs1_onEnter(room):
	room.say("You can go down here")
	room.addButton("Go down", "Go down", "godown")


func _on_MainStairs1_onReact(_room, key):
	if(key == "godown"):
		GM.pc.setLocation("CBStairs1")
		GM.main.reRun()


func _on_MainStairs2_onEnter(room):
	room.say("You can go down here")
	room.addButton("Go down", "Go down", "godown")


func _on_MainStairs2_onReact(_room, key):
	if(key == "godown"):
		GM.pc.setLocation("CBStairs2")
		GM.main.reRun()
