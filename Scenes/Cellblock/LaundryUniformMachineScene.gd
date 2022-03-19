extends "res://Scenes/SceneBase.gd"

func _init():
	sceneID = "LaundryUniformMachineScene"

func _run():
	if(state == ""):
		saynn("You walk up to the machine's terminal, it has a black-and-green screen and a few buttons. You press one of them and the machine beeps.")
		
		saynn("The screen displays:\n\nDetected inmate number {pc.inmateNumber}.\nInmate category: {pc.inmateType}\nInmate Uniform Replacement cost: 10 credits.\nInmate Uniform Repair cost: 5 credits.")

		saynn("What do you wanna do?")

		addButton("Print uniform", "You want a fresh inmate uniform", "printUniform")
		addDisabledButton("Repair", "Not implemented")
		addButton("Walk away", "You don't wanna spend your hard earned work credits", "endthescene")
	
	if(state == "notEnough"):
		saynn("The machine angrily beeps at you, the screen displays: [b]Not enough credits, go work in the mines, lazy inmate[/b]")
		
		addButton("Walk away", "So rude", "endthescene")

	if(state == "afterPrinting"):
		if(GM.pc.isBlindfolded()):
			saynn("Even though you're blindfolded you somehow find the right button by pressing all of them. Then it withdraws some credits from you and prints you a fresh uniform. You can't tell if its the correct one but what can you do, you grab it and go")
		elif(GM.pc.hasBoundArms()):
			saynn("Interacting with the machine is really hard without being able to use your hands but you about manage, you just press the buttons with your nose and the machine looks up the noseprints database before printing you an uniform that is exactly your size and has your inmate number. You grab it with your chin and go")
		else:
			saynn("You press the button and the machine withdraws some credits from you. After that it hums and prints you a fresh inmate uniform that is exactly your size and has your inmate number. You grab it and go")
			
		addButton("Walk away", "Good", "endthescene")
func _react(_action: String, _args):
	if(_action == "printUniform"):
		processTime(30)
		
		if(GM.pc.getCredits() < 10):
			setState("notEnough")
		else:
			GM.pc.addCredits(-10)
			
			var uniform = GlobalRegistry.createItem("inmateuniform")
			uniform.setPrisonerNumber(GM.pc.getFullInmateNumber())
			uniform.setInmateType(GM.pc.getInmateType())
			GM.pc.getInventory().addItem(uniform)
			
			addMessage("A fresh uniform was added to your inventory")
			
			setState("afterPrinting")
		return

	if(_action == "endthescene"):
		endScene()
		return
	
	setState(_action)
