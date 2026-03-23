extends "res://Scenes/SceneBase.gd"

var eggsToLay:int = 0
var eggReport:String = ""
var eggQueue:Array = []

func _init():
	sceneID = "PlayerWantsToLayEggsScene"

func _run():
	if(state == ""):
		playAnimation(StageScene.TFLook, "start")
		saynn("You stop because you can't make another step..")
		
		var stuffedHoles := GM.pc.getEggStuffedHoles()
		var stuffedHolesTexts:Array = []
		for theHole in stuffedHoles:
			if(theHole == BodypartSlot.Vagina):
				stuffedHolesTexts.append("womb")
			elif(theHole == BodypartSlot.Anus):
				stuffedHolesTexts.append("butt")
			else:
				stuffedHolesTexts.append(BodypartSlot.getVisibleNameNoCap(theHole))
		if(stuffedHolesTexts.empty()):
			stuffedHolesTexts = ["butt"]
		
		saynn("The eggs that are inside your "+Util.humanReadableList(stuffedHolesTexts)+" really want to come out now..")
		
		saynn("You can try clenching to hold them in.. but that requires a lot of stamina.")
		
		addButton("Lay eggs", "See what happens..", "start_laying_eggs")
		addButton("Clench", "Try to hold them in!", "do_clench")
	
	if(state == "no_stamina_must_lay"):
		playAnimation(StageScene.TFLook, "crotch")

		saynn("You grunt and try to clench.. but you just don't have any strength left..")
		saynn("Try as you might, you will have to lay these eggs now..")
		addButton("Lay eggs", "See what happens..", "start_laying_eggs")
	
	if(state == "start_laying_eggs"):
		playAnimation(StageScene.EggLaying, "eggs", {eggQueue=eggQueue, bodyState={naked=true}})
		
		saynn("Carefully, you position yourself down on the floor, your legs spread..")
		
		saynn("And then.. you start pushing.")
		
		var stuffedHoles := GM.pc.getEggStuffedHoles()
		var stuffedHolesTexts:Array = []
		for theHole in stuffedHoles:
			stuffedHolesTexts.append(BodypartSlot.getVisibleNameNoCap(theHole))
		if(stuffedHolesTexts.empty()):
			stuffedHolesTexts = ["tailhole"]
		
		if(eggsToLay <= 0 ):
			saynn("Sadly, somehow, nothing comes out. Weird.")
		elif(eggsToLay == 1):
			saynn("You grunt and moan as a single egg slides out of your "+Util.humanReadableList(stuffedHolesTexts)+", really stretching you out in the process..")
		elif(eggsToLay == 2):
			saynn("You grunt and moan as two eggs slide out of your "+Util.humanReadableList(stuffedHolesTexts)+", one after another, really stretching you out in the process..")
		else:
			saynn("You grunt and moan as multiple eggs slide out of your "+Util.humanReadableList(stuffedHolesTexts)+", one after another, really stretching you out in the process..")
		
		addButton("Continue", "See what happens next", "doLay")
	
	if(state == "doLay"):
		playAnimation(StageScene.EggLaying, "eggsdone", {bodyState={naked=true}})
		
		saynn("You ended up laying "+str(eggsToLay)+" egg"+("s" if eggsToLay != 1 else "")+"!")
		
		saynn(eggReport)
		
		saynn("You keep "+("it" if eggsToLay == 1 else "them")+" with you..")
		
		addButton("Continue", "Time to go..", "endthescene")
	
	if(state == "after_clenching"):
		playAnimation(StageScene.TFLook, "crotch")
		
		saynn("You clench as hard as you can and manage to keep the eggs inside! For now at least..")
		saynn("You did use a lot of stamina in the process.. Maybe using something to block your holes could be a good idea.")
		addButton("Continue", "Time to go..", "endthescene")
	
func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return
	if(_action == "do_clench"):
		if(GM.pc.getStamina() <= 0):
			setState("no_stamina_must_lay")
		else:
			GM.pc.addStamina(-30)
			setState("after_clenching")
			var menstrualCycle:MenstrualCycle = GM.pc.getMenstrualCycle()
			if(menstrualCycle):
				menstrualCycle.delayEggs()
		return
		
	if(_action == "start_laying_eggs"):
		var menstrualCycle:MenstrualCycle = GM.pc.getMenstrualCycle()
		if(menstrualCycle):
			eggsToLay = menstrualCycle.getAmountOfEggsReadyToBeLaid()
			eggQueue = menstrualCycle.getEggQueue()
	
	if(_action == "doLay"):
		var menstrualCycle:MenstrualCycle = GM.pc.getMenstrualCycle()
		if(menstrualCycle):
			var theEggs:Array = menstrualCycle.layEggs()
			eggReport = menstrualCycle.generateLayEggsReport(theEggs)
			menstrualCycle.giveEggItems(theEggs)
		processTime(10*60)
	
	setState(_action)

func saveData():
	var data = .saveData()
	
	data["eggsToLay"] = eggsToLay
	data["eggReport"] = eggReport

	return data
	
func loadData(data):
	.loadData(data)
	
	eggsToLay = SAVE.loadVar(data, "eggsToLay", 0)
	eggReport = SAVE.loadVar(data, "eggReport", "")
