extends SubGameWorld



func _on_MedElevator_onEnter(room):
	room.addButton("Elevator", "Use it", "elevator")


func _on_MedElevator_onReact(room, key):
	if(key == "elevator"):
		room.runScene("ElevatorScene")


func _on_MedRoom2_onEnter(room):
	room.saynn("You see a working vendomat nearby")
	
	room.addButton("Vendomat", "Approach it", "vendomat")


func _on_MedRoom2_onReact(room, key):
	if(key == "vendomat"):
		room.runScene("VendomatMedScene")
