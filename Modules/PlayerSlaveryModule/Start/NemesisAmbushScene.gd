extends SceneBase

var ambushType:String = "" # showeritems, normalshiv, normaldrugged, canteendrugged, cellbondage
var npcMain:String = ""
var npcExtra1:String = ""
var npcExtra2:String = ""

func _initScene(_args = []):
	ambushType = _args[0]
	npcMain = _args[1]
	npcExtra1 = _args[2]
	npcExtra2 = _args[3]

func _reactInit():
	#addCharacter(npcMain)
	#addCharacter(npcExtra1)
	#addCharacter(npcExtra2)
	
	GM.main.IS.deletePawn(npcMain)
	GM.main.IS.deletePawn(npcExtra1)
	GM.main.IS.deletePawn(npcExtra2)
	pass

func resolveCustomCharacterName(_charID):
	if(_charID == "npc"):
		return npcMain
	if(_charID == "npc1"):
		return npcExtra1
	if(_charID == "npc2"):
		return npcExtra2

func _init():
	sceneID = "NemesisAmbushScene"

func _run():
	if(state == ""):
		playAnimation(StageScene.Duo, "stand", {npc=npcMain})
		saynn("AMBUSH.")

		addButton("Continue", "See what happens next", "show_others")

	if(state == "show_others"):
		playAnimation(StageScene.Duo, "stand", {pc=npcExtra1, npc=npcExtra2})
		
		saynn("There are others with {npc.him}! You will have to win 3 fights in a row.")
		
		saynn("Or just let {npc.name} do whatever {npc.he} wants with you.")
		
		addButton("Fight", "You'd rather fight", "first_fight")
		addButton("Submit", "See what happens..", "do_submit")
	
	if(state == "first_fight"):
		playAnimation(StageScene.Duo, "stand", {npc=npcExtra1})
		
		saynn("FIRST FIGHT. EXTRA 1.")
		
		addButton("Fight", "Start the fight", "start_first_fight")
	
	if(state == "second_fight"):
		playAnimation(StageScene.Duo, "stand", {npc=npcExtra2})
		
		saynn("YOU WON.")
		
		saynn("SECOND FIGHT. EXTRA 2.")
		
		addButton("Fight", "Start the fight", "start_second_fight")
	
	if(state == "third_fight"):
		playAnimation(StageScene.Duo, "stand", {npc=npcMain})
		
		saynn("YOU WON.")
		
		saynn("LAST FIGHT. YOUR NEMESIS.")
		
		addButton("Fight", "Start the fight", "start_third_fight")
	
	if(state == "won_all_fights"):
		playAnimation(StageScene.Duo, "stand", {npc=npcMain, npcAction="defeat"})
		
		saynn("YOU WON! THE NEMESIS IS NO MORE.")
		
		addButton("Leave", "Just leave them be", "endthescene")
		addButton("Punish", "Do something fun with them", "startPunish")
		
	if(state == "lost_fight"):
		playAnimation(StageScene.Solo, "defeat")
		
		saynn("YOU LOST.")
		
		addButton("Continue", "See what happens next..", "get_knocked_out")
	
	if(state == "do_submit"):
		playAnimation(StageScene.Duo, "knee", {npc=npcMain})
		
		saynn("YOU SUBMIT.")
		
		addButton("Continue", "See what happens next", "get_knocked_out")
	
	if(state == "get_knocked_out"):
		removeCharacter(npcMain)
		removeCharacter(npcExtra1)
		removeCharacter(npcExtra2)
		playAnimation(StageScene.Sleeping, "sleep")
		
		saynn("YOU GOT KNOCKED OUT.")
		
		addButton("Continue", "See what happens next", "start_slavery")
	
func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return
	if(_action == "start_first_fight"):
		runScene("FightScene", [npcExtra1], "first_fight")
		return
	if(_action == "start_second_fight"):
		runScene("FightScene", [npcExtra2], "second_fight")
		return
	if(_action == "start_third_fight"):
		runScene("FightScene", [npcMain], "third_fight")
		return
	if(_action == "start_slavery"):
		endScene()
		runScene(getModule("PlayerSlaveryModule").getSlaveryStartScene())
		return
	if(_action == "startPunish"):
		endScene()
		var thePawn = GM.main.IS.spawnPawn(npcMain)
		if(thePawn):
			thePawn.setLocation(GM.pc.getLocation())
			GM.main.IS.startInteraction("PunishInteraction", {punisher="pc", target=npcMain})
		return

	setState(_action)

func _react_scene_end(_tag, _result):
	if(_tag == "first_fight"):
		processTime(10 * 60)
		var battlestate = _result[0]
		if(battlestate == "win"):
			setState("second_fight")
		else:
			setState("lost_fight")
	if(_tag == "second_fight"):
		processTime(10 * 60)
		var battlestate = _result[0]
		if(battlestate == "win"):
			setState("third_fight")
		else:
			setState("lost_fight")
	if(_tag == "third_fight"):
		processTime(10 * 60)
		var battlestate = _result[0]
		if(battlestate == "win"):
			GM.main.RS.stopSpecialRelationship(npcMain)
			setState("won_all_fights")
		else:
			setState("lost_fight")

func saveData():
	var data = .saveData()
	
	data["ambushType"] = ambushType
	data["npcMain"] = npcMain
	data["npcExtra1"] = npcExtra1
	data["npcExtra2"] = npcExtra2
	
	return data
	
func loadData(data):
	.loadData(data)
	
	ambushType = SAVE.loadVar(data, "ambushType", "")
	npcMain = SAVE.loadVar(data, "npcMain", "")
	npcExtra1 = SAVE.loadVar(data, "npcExtra1", "")
	npcExtra2 = SAVE.loadVar(data, "npcExtra2", "")
