extends SceneBase

var selectedCharID:String = ""

func _init():
	sceneID = "SpecialRelationshipsScene"

func _run():
	if(state == ""):
		addButton("CLOSE", "Close this menu", "endthescene")
		playAnimation(StageScene.Solo, "stand")
		setCharactersEasyList([])
		
		for charID in GM.main.RS.special:
			var theSpecial:SpecialRelationshipBase = GM.main.RS.special[charID]
			var theChar:BaseCharacter = getCharacter(charID)
			if(!theChar || !theSpecial):
				continue
			var theColor:Color = theSpecial.getCategoryColor()
			var theCharTypeName:String = CharacterType.getName(theChar.getCharType())
			saynn(theChar.getName()+" - "+theCharTypeName+" - [color=#"+theColor.to_html(false)+"]"+theSpecial.getCategoryName()+"[/color]")
			
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
		
func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return
	if(_action == "lookAt"):
		selectedCharID = _args[0]
		setState("relationshipInfo")
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
