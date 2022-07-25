extends SubGameWorld



func _on_FightClubRoom_onEnter(room):
	room.addButton("Leave", "Return to the prison", "leave")


func _on_FightClubRoom_onReact(_room, key):
	if(key == "leave"):
		GM.pc.setLocation("gym_secret")
		GM.main.reRun()
