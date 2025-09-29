extends NpcOwnerEventBase

var targetLoc:String = ""

func _init():
	id = "ParadeTo"
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
	playAnimation(StageScene.Duo, "stand", {npc=getOwnerID(), bodyState={leashedBy=getOwnerID()}})
	saynn("{npc.name} clicks a leash to your collar!")
	
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
	playAnimation(StageScene.Duo, "walk", {npc=getOwnerID(), npcAction="walk", flipNPC=true, bodyState={leashedBy=getOwnerID()}})
	
	saynn("You are being paraded by your owner.")
	
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
		
		checkSubEvent(E_PARADE_TO, "You were being paraded by your owner..", [getFreePawnsNear(2)])

func saveData() -> Dictionary:
	var data:Dictionary = .saveData()
	data["targetLoc"] = targetLoc
	return data

func loadData(_data:Dictionary):
	.loadData(_data)
	
	targetLoc = SAVE.loadVar(_data, "targetLoc", "")
