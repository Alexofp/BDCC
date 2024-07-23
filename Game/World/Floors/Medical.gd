extends SubGameWorld



func _on_MedElevator_onEnter(room):
	room.addButton("Elevator", "Use it", "elevator")


func _on_MedElevator_onReact(room, key):
	if(key == "elevator"):
		room.runScene("ElevatorScene")


func _on_MedRoom2_onEnter(room):
	room.saynn("The Medical Vendomat is tucked into this corner, offering all sorts of drugs and medicine.")
	
	room.addButton("Vendomat", "Approach it", "vendomat")


func _on_MedRoom2_onReact(room, key):
	if(key == "vendomat"):
		room.runScene("VendomatMedScene")


func _on_MedRoom7_onEnter(room):
	room.addButton("Leave", "This airlock can let you out but not in", "leave")


func _on_MedRoom7_onReact(_room, key):
	if(key == "leave"):
		GM.pc.setLocation("med_lobbynw")
		GM.main.reRun()


func _on_MedRoom8_onEnter(room):
	room.addButton("Leave", "This airlock can let you out but not in", "leave")

func _on_MedRoom8_onReact(_room, key):
	if(key == "leave"):
		GM.pc.setLocation("med_lobbyne")
		GM.main.reRun()
