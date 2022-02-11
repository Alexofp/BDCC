extends SubGameWorld


func _on_MainStairs1_onEnter(room):
	room.addButton("Go down", "Go down", "godown")


func _on_MainStairs1_onReact(_room, key):
	if(key == "godown"):
		GM.pc.setLocation("CBStairs1")
		GM.main.reRun()


func _on_MainStairs2_onEnter(room):
	room.addButton("Go down", "Go down", "godown")


func _on_MainStairs2_onReact(_room, key):
	if(key == "godown"):
		GM.pc.setLocation("CBStairs2")
		GM.main.reRun()


func _on_MainCanteen_onEnter(room):
	if(!GM.main.getFlag(Flag.Canteen_PlayerAteToday, false)):
		room.addButton("Eat", "See what you can catch", "eat")
	else:
		room.addDisabledButton("Eat", "You already ate today")


func _on_MainCanteen_onReact(room, key):
	if(key == "eat"):
		room.runScene("EatInCanteenScene")


func _on_MainDressingRoom_onEnter(room):
	if(GM.pc.isFullyNaked()):
		room.addDisabledButton("Undress", "You're already naked")
	else:
		room.addButton("Undress", "Take off your clothes and go take a shower", "shower")

func _on_MainDressingRoom_onReact(room, key):
	if(key == "shower"):
		room.runScene("TakingAShowerScene")

func _on_MainShowerRoom_onEnter(room):
	if(GM.pc.isFullyNaked()):
		room.addButton("Shower", "Take a shower", "shower")
	else:
		room.addDisabledButton("Shower", "You need to be naked")

func _on_MainShowerRoom_onReact(room, key):
	if(key == "shower"):
		room.runScene("TakingAShowerScene")


func _on_MainElevator_onEnter(room):
	room.addButton("Elevator", "Use it", "elevator")

func _on_MainElevator_onReact(room, key):
	if(key == "elevator"):
		room.runScene("ElevatorScene")


func _on_MainVendomatRoom_onEnter(room):
	room.saynn("You see a working vendomat nearby")
	
	room.addButton("Vendomat", "Approach it", "vendomat")

func _on_MainVendomatRoom_onReact(room, key):
	if(key == "vendomat"):
		room.runScene("VendomatScene")
