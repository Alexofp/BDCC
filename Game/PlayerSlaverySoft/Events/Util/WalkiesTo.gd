extends NpcOwnerEventBase

var targetLoc:String = ""

func _init():
	id = "WalkiesTo"
	reactsToTags = []

func onStart(_args:Array):
	setState("start")
	#setSubResult(SUB_CONTINUE)
	
	targetLoc = _args[0]
	if(!canGetTo(targetLoc)):
		setLocation(targetLoc)
		setSubResult(SUB_CONTINUE)
		endEvent()

func start():
	playAnimation(StageScene.PuppyDuo, "stand", {pc=getOwnerID(), flipPC=true, npcBodyState={naked=true, leashedBy=getOwnerID()}})
	saynn("{npc.name} starts walking you around!")
	
	addButtonAt(6, "Walk", "See where your owner will bring you..", "walk")
	addDisabledButtonAt(10, "Leashed", "You are leashed")
	addDisabledButtonAt(11, "Leashed", "You are leashed")
	addDisabledButtonAt(12, "Leashed", "You are leashed")

func doWalk() -> bool:
	if(goTowards(targetLoc)):
		setSubResult(SUB_CONTINUE)
		endEvent()
		return true
	return false

func start_do(_id:String, _args:Array):
	if(_id == "walk"):
		setState("walking")
		
		doWalk()

func walking():
	playAnimation(StageScene.PuppyDuo, "walk", {pc=getOwnerID(), npcAction="walk", flipPC=true, npcBodyState={naked=true, leashedBy=getOwnerID()}})
	
	saynn("You are being walked by your owner.")
	
	var _roomInfo = GM.world.getRoomByID(getLocation())
	if(_roomInfo):
		if(GM.pc.isBlindfolded() && !GM.pc.canHandleBlindness()):
			saynn(_roomInfo.getBlindDescription())
		else:
			saynn(_roomInfo.getDescription())
	
	addButtonAt(6, "Walk", "See where your owner will bring you..", "walk")
	addDisabledButtonAt(10, "Leashed", "You are leashed")
	addDisabledButtonAt(11, "Leashed", "You are leashed")
	addDisabledButtonAt(12, "Leashed", "You are leashed")
	
func walking_do(_id:String, _args:Array):
	if(_id == "walk"):
		doWalk()
		
		#if(checkProtect("You were being pulled by a leash..")):
		#	return
		
		checkSubEvent(E_WALKIES_TO, "You were being walked by your owner..", [getFreePawnsNear(2)])

func isPlayerOnALeash() -> bool:
	return true

func getNearbyCheckDist() -> float:
	return 2.0

func getNearbyCheckAllChance() -> float:
	return 3.0

func saveData() -> Dictionary:
	var data:Dictionary = .saveData()
	data["targetLoc"] = targetLoc
	return data

func loadData(_data:Dictionary):
	.loadData(_data)
	
	targetLoc = SAVE.loadVar(_data, "targetLoc", "")
