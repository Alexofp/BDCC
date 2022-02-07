extends SubGameWorld



func _on_MiningElevator_onEnter(room):
	room.addButton("Elevator", "Use it", "elevator")

func _on_MiningElevator_onReact(room, key):
	if(key == "elevator"):
		room.runScene("ElevatorScene")


func _on_MiningShafts_onEnter(room):
	if(GM.main.isVeryLate()):
		room.addDisabledButton("Work", "It's way too late for that")
	elif(GM.pc.getStamina() > 0):
		room.addButton("Work", "Go work in the mines", "work")
	else:
		room.addDisabledButton("Work", "You are way too tired to work")

func _on_MiningShafts_onReact(room, key):
	if(key == "work"):
		room.runScene("WorkInMinesScene")
