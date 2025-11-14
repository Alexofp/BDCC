extends SceneBase

var selectedCharID:String = ""

func _init():
	sceneID = "SpecialRelationshipsScene"

func _run():
	if(state == ""):
		addButton("CLOSE", "Close this menu", "endthescene")
		playAnimation(StageScene.Solo, "stand")
		setCharactersEasyList([])
		aimCameraAndSetLocName(GM.pc.getLocation())
		
		for charID in GM.main.RS.special:
			var theSpecial:SpecialRelationshipBase = GM.main.RS.special[charID]
			var theChar:BaseCharacter = getCharacter(charID)
			if(!theChar || !theSpecial):
				continue
			var theColor:Color = theSpecial.getCategoryColor()
			var theCharTypeName:String = CharacterType.getName(theChar.getCharType())
			sayn(theChar.getName()+" - "+theCharTypeName+" - [color=#"+theColor.to_html(false)+"]"+theSpecial.getCategoryName()+"[/color]")
			
			addButton(theChar.getName(), "Look at this relationship", "lookAt", [charID])
	
	if(state == "relationshipInfo"):
		addButton("BACK", "Go back to the previous menu", "")
		if(!GM.main.RS.special.has(selectedCharID)):
			return
		var theSpecial:SpecialRelationshipBase = GM.main.RS.special[selectedCharID]
		var theChar:BaseCharacter = getCharacter(selectedCharID)
		if(!theChar || !theSpecial):
			return
		playAnimation(StageScene.Duo, "stand", {npc=selectedCharID})
		setCharactersEasyList([selectedCharID])
		sayn("Name: "+theChar.getName()+" ("+CharacterType.getName(theChar.getCharType())+")")
		var theColor:Color = theSpecial.getCategoryColor()
		sayn("Relationship: [color=#"+theColor.to_html(false)+"]"+theSpecial.getCategoryName()+"[/color]")
		sayn("Location: "+getLocName(selectedCharID))
		saynn(theSpecial.getBigDescription())
		var thePawn:CharacterPawn = GM.main.IS.getPawn(selectedCharID)
		if(thePawn):
			aimCameraAndSetLocName(thePawn.getLocation())
		
		var canMeet:bool = theSpecial.canMeetThroughRelationshipMenu()
		if(canMeet):
			if(thePawn):
				var thePCLoc:String = GM.pc.getLocation()
				var theLoc:String = thePawn.getLocation()
				if(!isOnSameFloor(thePCLoc, theLoc)):
					addDisabledButton("Meet", "You need to be on the same floor!")
				elif(!thePawn.canBeInterrupted()):
					addDisabledButton("Meet", "They are busy with something!")
				elif(!isLocSafeToMeetAt(theLoc)):
					addDisabledButton("Meet", "Their location isn't safe!")
				elif(!isLocSafeToMeetAt(thePCLoc)):
					addDisabledButton("Meet", "Your current location isn't safe! Escape the danger first!")
				else:
					addButton("Meet", "Go meet them!", "doMeet")
			else:
				var theLoc:String = GM.pc.getLocation()
				if(!isFloorSafeToMeetAt(theLoc)):
					addDisabledButton("Meet", "You can't meet them on this floor!")
				elif(!isLocSafeToMeetAt(theLoc)):
					addDisabledButton("Meet", "Your current location isn't safe!")
				else:
					addButton("Meet", "Go meet them!", "doMeet")

func isLocSafeToMeetAt(_loc:String) -> bool:
	var theRoom:GameRoom = GM.world.getRoomByID(_loc)
	if(!theRoom):
		return false
	
	return GM.world.isLocSafe(_loc)

func isFloorSafeToMeetAt(_loc:String) -> bool:
	var theRoom:GameRoom = GM.world.getRoomByID(_loc)
	if(!theRoom):
		return false
	var floorID:String = theRoom.getFloorID()
	#TODO: Make this a generic function?
	if(floorID in ["Cellblock", "MainHall", "Medical", "MiningFloor"]):
		return true
	return false

func isOnSameFloor(_loc1:String, _loc2:String) -> bool:
	var theRoom1:GameRoom = GM.world.getRoomByID(_loc1)
	var theRoom2:GameRoom = GM.world.getRoomByID(_loc2)
	if(!theRoom1 || !theRoom2):
		return false
	return theRoom1.getFloorID() == theRoom2.getFloorID()

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return
	if(_action == "lookAt"):
		selectedCharID = _args[0]
		setState("relationshipInfo")
		return
	if(_action == "doMeet"):
		if(GM.main.IS.hasPawn(selectedCharID)):
			var thePawn:CharacterPawn = GM.main.IS.spawnPawnIfNeeded(selectedCharID)
			GM.pc.setLocation(thePawn.getLocation())
			GM.main.IS.startInteraction("Talking", {starter="pc", reacter=selectedCharID})
		else:
			var thePawn:CharacterPawn = GM.main.IS.spawnPawnIfNeeded(selectedCharID)
			if(thePawn):
				thePawn.setLocation(GM.pc.getLocation())
				GM.main.IS.startInteraction("Talking", {starter="pc", reacter=selectedCharID})
		
		processTime(5*60)
		endScene()
		return
	
	setState(_action)

func getLocName(theCharID:String) -> String:
	if(GM.main.IS.hasPawn(theCharID)):
		var pawn:CharacterPawn = GM.main.IS.getPawn(theCharID)
		var room = GM.world.getRoomByID(pawn.getLocation())
		if(room == null):
			return "Error.."
		else:
			var floorID:String = room.getFloorID()
			return getFloorName(floorID)+" - "+room.getName()
	return "Resting (Can be met through the Encounters menu)"

static func getFloorName(floorID:String) -> String:
	#var room = GM.world.getRoomByID(loc)
	#var floorID:String = room.getFloorID()
	if(floorID == "Cellblock"):
		return "Cellblock"
	if(floorID == "MainHall"):
		return "Main prison floor"
	if(floorID == "Medical"):
		return "Medical wing"
	if(floorID == "MiningFloor"):
		return "Mining floor"
	
	return "Unknown floor"

func supportsShowingPawns() -> bool:
	return true

func saveData():
	var data = .saveData()
	
	data["selectedCharID"] = selectedCharID
	
	return data
	
func loadData(data):
	.loadData(data)
	
	selectedCharID = SAVE.loadVar(data, "selectedCharID", "")
