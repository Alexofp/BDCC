extends "res://Scenes/SceneBase.gd"

var dyingItemUniqueID = ""
var colorPickerScene = preload("res://UI/ColorPickerWidget.tscn")
var savedDyedColor = ""

func _init():
	sceneID = "LaundryUniformMachineScene"

func _run():
	if(state == ""):
		saynn("You walk up to the machine's terminal, it has a black-and-green screen and a few buttons. You press one of them and the machine beeps.")
		
		saynn("The screen displays:\n\nDetected inmate number {pc.inmateNumber}.\nInmate category: {pc.inmateType}\nInmate Uniform Replacement cost: 10 credits.\nUniform Repair cost: 5 credits.\nDying a clothing item cost: 5 credits.")

		saynn("What do you wanna do?")

		addButton("Print uniform", "You want a fresh inmate uniform", "printUniform")
		if(GM.pc.canRepairClothes()):
			addButton("Repair clothes", "Repair everything that you are wearing.", "repairUniform")
		else:
			addDisabledButton("Repair clothes", "You are not wearing anything that needs to be repaired")
		addButton("Dye clothes", "Pick what item you want to dye", "dye_clothes_menu")
		
		addButton("Walk away", "You don't wanna spend your hard earned work credits", "endthescene")
	
	if(state == "dye_clothes_menu"):
		playAnimation(StageScene.Solo, "stand")
		saynn("The machine waits for the clothing that it can dye. The screen reminds you that dying your inmate uniform is against the law and would lead to substantial increase of your sentence.")
		
		saynn("Cost: 5 credits")
		
		for item in GM.pc.getInventory().getAllItemsCanDye():
			addButtonWithChecks(item.getVisibleName(), item.getVisibleDescription(), "start_dye", [item], [[ButtonChecks.HasCredits, 5]])
		
		addButton("Back", "You changed your mind", "")
	
	if(state == "coloring_item"):
		var theItem:ItemBase = GM.pc.getInventory().getItemByUniqueID(dyingItemUniqueID)
		
		if(theItem.hasTag(ItemTag.Strapon)):
			playAnimation(StageScene.Solo, "stand", {bodyState={exposedCrotch=true}})
		elif(theItem.getClothingSlot() != null && (theItem.getClothingSlot() in [InventorySlot.UnderwearBottom, InventorySlot.UnderwearTop])):
			playAnimation(StageScene.Solo, "stand", {bodyState={underwear=true}})
		else:
			playAnimation(StageScene.Solo, "stand")
		
		var colorPicker = colorPickerScene.instance()
		GM.ui.addCustomControl("colorpicker", colorPicker)
		colorPicker.setCurrentColor(theItem.clothesColor)
		colorPicker.connect("color_changed", self, "changebasecolormenu_colorchanged")
		
		addButtonWithChecks("Confirm", "Pay 5 credits and finalize the color", "do_pay_coloritem", [theItem], [[ButtonChecks.HasCredits, 5]])
		addButton("Cancel", "You changed your mind", "cancel_dying")
	
	if(state == "notEnough"):
		if(GM.pc.isBlindfolded()):
			saynn("The machine angrily beeps at you, the screen displays.. something. You can't really see it but it's probably something about you not having enough credits.")
		else:
			saynn("The machine angrily beeps at you, the screen displays: [b]Not enough credits, go work in the mines, lazy inmate[/b]")
		
		addButton("Walk away", "So rude", "endthescene")
	
	if(state == "repairUniform"):
		saynn("You press the button and the machine withdraws some credits from you. Then take off your damaged clothes and place them into the offered space. The machine grabs it all and starts working, making a lot of noise as it tries to patch any holes up.")
		
		saynn("The machine beeps and then gives you your clothes back, fully repaired and cleaned!")
		
		addButton("Walk away", "Sweet", "endthescene")
	
	if(state == "afterPrinting"):
		if(GM.pc.isBlindfolded()):
			saynn("Even though you're blindfolded you somehow find the right button by pressing all of them. Then it withdraws some credits from you and prints you a fresh uniform. You can't tell if its the correct one but what can you do, you grab it and go")
		elif(GM.pc.hasBoundArms()):
			saynn("Interacting with the machine is really hard without being able to use your hands but you about manage, you just press the buttons with your nose and the machine looks up the noseprints database before printing you an uniform that is exactly your size and has your inmate number. You grab it with your chin and go")
		else:
			saynn("You press the button and the machine withdraws some credits from you. After that it hums and prints you a fresh inmate uniform that is exactly your size and has your inmate number. You grab it and go")
			
		addButton("Walk away", "Good", "endthescene")
		
		
func _react(_action: String, _args):
	if(_action == "repairUniform"):
		processTime(30)
		
		if(GM.pc.getCredits() < 5):
			setState("notEnough")
		else:
			GM.pc.addCredits(-5)
			
			GM.pc.repairAllClothes()
			#var item:ItemBase = GM.pc.getInventory().getEquippedItem(InventorySlot.Body)
			#if(item!=null && item.id in ["inmateuniform", "inmateuniformHighsec", "inmateuniformSexDeviant"]):
			#	item.repairDamage()
	
	if(_action == "do_pay_coloritem"):
		var theItem:ItemBase = GM.pc.getInventory().getItemByUniqueID(dyingItemUniqueID)
		var theColor = GM.ui.getUIdata("colorpicker")
		theItem.onDyed(theColor)
		GM.pc.addCredits(-5)
		setState("dye_clothes_menu")
		GM.pc.unequipStrapon()
		return
	
	if(_action == "start_dye"):
		var theItem = _args[0]
		dyingItemUniqueID = _args[0].uniqueID
		savedDyedColor = theItem.clothesColor.to_html()
		if(!GM.pc.getInventory().hasEquippedItemWithUniqueID(dyingItemUniqueID)):
			var theSlot = theItem.getClothingSlot()
			if(theSlot != null):
				if(GM.pc.getInventory().canEquipSlot(theSlot)):
					if(GM.pc.getInventory().hasSlotEquipped(theSlot)):
						if(!GM.pc.getInventory().getEquippedItem(theSlot).isRestraint()):
							# We have something equipped but it's not a restraint, can replace
							GM.pc.getInventory().forceEquipStoreOther(theItem)
					else:
						# Nothing equipped there, can put on
						GM.pc.getInventory().forceEquipStoreOther(theItem)
		setState("coloring_item")
		return
	
	if(_action == "cancel_dying"):
		var theItem:ItemBase = GM.pc.getInventory().getItemByUniqueID(dyingItemUniqueID)
		theItem.onDyed(Color(savedDyedColor))
		setState("dye_clothes_menu")
		GM.pc.unequipStrapon()
		return
	
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

var isChanging = false
func changebasecolormenu_colorchanged(_theColor):
	if(isChanging):
		return
	isChanging = true
	yield(get_tree().create_timer(0.3), "timeout")
	if(GM.ui.getCustomControl("colorpicker") == null):
		isChanging = false
		return
	var theColor = GM.ui.getCustomControl("colorpicker").getCurrentColor()
	
	var theItem:ItemBase = GM.pc.getInventory().getItemByUniqueID(dyingItemUniqueID)
	theItem.onDyed(theColor)

	#thePC.updateAppearance()
	isChanging = false

func saveData():
	var data = .saveData()
	
	data["dyingItemUniqueID"] = dyingItemUniqueID
	data["savedDyedColor"] = savedDyedColor
	
	return data
	
func loadData(data):
	.loadData(data)
	
	dyingItemUniqueID = SAVE.loadVar(data, "dyingItemUniqueID", "")
	savedDyedColor = SAVE.loadVar(data, "savedDyedColor", "")
