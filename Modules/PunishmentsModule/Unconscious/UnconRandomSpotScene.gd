extends "res://Scenes/SceneBase.gd"

var pantiesStolen:bool = false

func _init():
	sceneID = "UnconRandomSpotScene"

func _run():
	if(state == ""):
		playAnimation(StageScene.Sleeping, "sleep", {pc="pc"})

		saynn("While you are.. sleeping soundly.. someone has approached you.. and began dragging you off somewhere..")
		
		addButton("Continue", "See what happens next..", "do_drag_pc_off")
	
	if(state == "do_drag_pc_off"):
		aimCameraAndSetLocName(GM.pc.getLocation())
		playAnimation(StageScene.GivingBirth, "idle", {pc="pc"})
		
		saynn("After a less-than-comfy sleeping experience, you finally open your eyes.. and realize that you are somewhere else..")
		
		if(pantiesStolen):
			saynn("For some reason, your bottom area feels a bit more cold too..")
		
		addButton("Get up", "Time to go..", "endthescene")


func _react(_action: String, _args):

	if(_action == "endthescene"):
		endScene()
		return
	
	if(_action == "do_drag_pc_off"):
		var possibleLocs:Array = [
			"eng_near_storage",
			"yard_vaulthere",
			"main_green_corridor11",
			"med_mental5",
		]
		GM.pc.setLocation(RNG.pick(possibleLocs))
		processTime(RNG.randi_range(120, 300)*60)
		
		if(GM.pc.getInventory().hasSlotEquipped(InventorySlot.UnderwearBottom)):
			var panties:ItemBase = GM.pc.getInventory().getEquippedItem(InventorySlot.UnderwearBottom)
			if(!panties.isRestraint()):
				if(RNG.chance(75)):
					addMessage("Your "+panties.getVisibleName()+" were stolen..")
					GM.pc.getInventory().removeItemFromSlot(InventorySlot.UnderwearBottom)
					pantiesStolen = true
		if(RNG.chance(50)):
			if(GM.pc.getCredits() > 5):
				GM.pc.addCredits(RNG.randi_range(2, 5))
				addMessage("A few of your credits were stolen..")
		if(RNG.chance(50)):
			for _i in range(RNG.randi_range(2, 6)):
				GM.pc.addBodywritingRandom()
			addMessage("Your body has something scribbled on it..")
		if(OPTIONS.isContentEnabled(ContentType.Watersports)):
			if(RNG.chance(10)):
				GM.pc.pissedOnBy("pc")
				addMessage("What is that scent.. gross..")
		if(GM.pc.canBeMilked()):
			if(RNG.chance(30)):
				GM.pc.milk()
				GM.pc.addEffect(StatusEffect.SoreNipplesAfterMilking)
				addMessage("You find your breasts.. less heavy..")
		if(GM.pc.canBeSeedMilked()):
			if(RNG.chance(30)):
				GM.pc.orgasmFrom("pc")
				addMessage("You feel.. spent..")
		if(RNG.chance(20)):
			GM.pc.doWound()
			GM.pc.addPain(10)
			addMessage("What are these.. teeth marks..")
	
	setState(_action)


func saveData():
	var data = .saveData()

	data["pantiesStolen"] = pantiesStolen

	return data

func loadData(data):
	.loadData(data)

	pantiesStolen = SAVE.loadVar(data, "pantiesStolen", false)
