extends SubGameWorld



func _on_MiningElevator_onEnter(room):
	room.addButton("Elevator", "Use it", "elevator")

func _on_MiningElevator_onReact(room, key):
	if(key == "elevator"):
		room.runScene("ElevatorScene")
