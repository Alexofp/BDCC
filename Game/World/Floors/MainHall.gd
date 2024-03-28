extends SubGameWorld


func _on_MainStairs1_onEnter(room):
	room.addButton("Go down", "Go down to the cells", "godown")


func _on_MainStairs1_onReact(_room, key):
	if(key == "godown"):
		GM.pc.setLocation("CBStairs1")
		GM.main.reRun()


func _on_MainStairs2_onEnter(room):
	room.addButton("Go down", "Go down to the cells", "godown")


func _on_MainStairs2_onReact(_room, key):
	if(key == "godown"):
		GM.pc.setLocation("CBStairs2")
		GM.main.reRun()


func _on_MainCanteen_onEnter(room):
	if(!GM.main.getFlag("Canteen_PlayerAteToday", false)):
		room.addButton("Eat", "See what you can catch", "eat")
	else:
		room.addDisabledButton("Eat", "You already ate today")


func _on_MainCanteen_onReact(room, key):
	if(key == "eat"):
		room.runScene("EatInCanteenScene")


func _on_MainDressingRoom_onEnter(room):
	if(GM.main.playerHasCompanions()):
		return
	if(GM.pc.isFullyNaked()):
		room.addDisabledButton("Undress", "You're already naked")
	else:
		room.addButton("Undress", "Take off your clothes and go take a shower", "shower")

func _on_MainDressingRoom_onReact(room, key):
	if(key == "shower"):
		room.runScene("TakingAShowerScene")

func _on_MainShowerRoom_onEnter(room):
	if(GM.main.playerHasCompanions()):
		return
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

func _on_MainLaundry_onEnter(room):
	room.saynn("You also see a vendomat nearby. This one seems to be selling some kind of clothing")
	
	room.addButton("Uniform vendor", "Approach the vendor", "uniform")
	room.addButton("Vendomat", "Approach it", "vendomat")

func _on_MainLaundry_onReact(room, key):
	if(key == "uniform"):
		room.runScene("LaundryUniformMachineScene")
	
	if(key == "vendomat"):
		room.runScene("VendomatUnderwearScene")


func _on_MainGreenhousesJumpable_onEnter(room):
	room.saynn("You look over the railing and see that the drop is not that high.")
	
	room.addButton("Vault over", "Seems like you can jump down to the yard here", "vault")


func _on_MainGreenhousesJumpable_onReact(_room, key):
	if(key == "vault"):
		GM.pc.setLocation("yard_vaulthere")
		GM.main.reRun()
		GM.main.addMessage("You successfully jumped over the railing")

func _on_MainHallRoom9_onEnter(_room):
	#room.addButton("Try stocks", "Stick your head into them out of curiosity", "stocks")
	pass

func _on_MainHallRoom9_onReact(_room, _key):
	#if(key == "stocks"):
	#	room.runScene("TryStocksScene")
	pass


func _on_MainHallRoom21_onEnter(_room):
	#room.addButton("Mirror", "Change your haircut", "mirror")
	#room.addButton("Toilet", "Find an empty stall", "toilet")
	pass


# Got converted to events
func _on_MainHallRoom21_onReact(_room, _key):
#	if(key == "mirror"):
#		room.runScene("ChangeHaircutScene")
#	if(key == "toilet"):
#		room.runScene("ToiletScene")
	pass
