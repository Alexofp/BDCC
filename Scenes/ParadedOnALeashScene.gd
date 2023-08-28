extends "res://Scenes/SceneBase.gd"

var startLocation = ""
var endLocation = ""
var path = []
var whoLeashingID = ""
var randomChat = []
var teleportwhenskipped = true

func _initScene(_args = []):
	whoLeashingID = _args[0]
	startLocation = _args[1]
	endLocation = _args[2]
	if(_args.size() > 3):
		randomChat = _args[3]
	if (_args.size() > 4):
		teleportwhenskipped = _args[4]
	
	path = GM.world.calculatePath(startLocation, endLocation)
	if(path.size() <= 0):
		endScene()

func _init():
	sceneID = "ParadedOnALeashScene"

func _run():
	if(state == ""):
		addCharacter(whoLeashingID)
		
	if(state == "" || state == "leashed"):
		if(state == "leashed"):
			playAnimation(StageScene.Duo, "walk", {npc=whoLeashingID, npcAction="walk", flipNPC=true, bodyState={leashedBy=whoLeashingID}})
		if(path.size() > 0):
			aimCameraAndSetLocName(path[0])
		
		var _roomInfo = GM.world.getRoomByID(path[0])
		
		if(_roomInfo == null):
			saynn("You're being walked on a leash by {leasher.name}")
		else:
			saynn("You're being walked on a leash by {leasher.name}")
			
			if(GM.pc.isBlindfolded() && !GM.pc.canHandleBlindness()):
				saynn(_roomInfo.getBlindDescription())
			else:
				saynn(_roomInfo.getDescription())
				
		if(randomChat.size() > 0 && RNG.chance(min(30, randomChat.size() * 10))):
			saynn("[say=leasher]"+RNG.pick(randomChat)+"[/say]")
		
		if (teleportwhenskipped):
			addButton("Skip", "Skip the walk", "skipwalk")
		else:
			addButton("Skip", "Skip the walk", "endthescene")
		addButtonAt(6, "Follow", "Follow the leash", "follow")
		addDisabledButtonAt(10, "Leashed", "Can't escape from the leash")
		addDisabledButtonAt(11, "Leashed", "Can't escape from the leash")
		addDisabledButtonAt(12, "Leashed", "Can't escape from the leash")
	if (state == "skipwalk"):
		aimCamera(endLocation)
		GM.pc.setLocation(endLocation)
		
		endScene()

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return
	
	if(_action == "follow"):
		if(path.size() == 0):
			endScene()
			return
		
		var nextLoc = path[0]
		path.remove(0)
		
		if(!GM.world.hasRoomID(nextLoc)):
			endScene()
			return
		
		GM.pc.setLocation(nextLoc)
		if(path.size() == 0):
			endScene()
			return
		setState("leashed")
		return
	
	setState(_action)

func saveData():
	var data = .saveData()
	
	data["startLocation"] = startLocation
	data["endLocation"] = endLocation
	data["path"] = path
	data["whoLeashingID"] = whoLeashingID
	data["randomChat"] = randomChat
	data["teleportwhenskipped"] = teleportwhenskipped

	return data
	
func loadData(data):
	.loadData(data)
	
	startLocation = SAVE.loadVar(data, "startLocation", "")
	endLocation = SAVE.loadVar(data, "endLocation", "")
	path = SAVE.loadVar(data, "path", [])
	whoLeashingID = SAVE.loadVar(data, "whoLeashingID", "")
	randomChat = SAVE.loadVar(data, "randomChat", [])
	teleportwhenskipped = SAVE.loadVar(data, "teleportwhenskipped", true)

func resolveCustomCharacterName(_charID):
	if(_charID == "leasher" && whoLeashingID != ""):
		return whoLeashingID
	
	return null
