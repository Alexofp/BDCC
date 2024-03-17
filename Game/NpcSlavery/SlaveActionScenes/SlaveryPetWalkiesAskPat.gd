extends "res://Scenes/SceneBase.gd"

var npcID = ""
var npc:DynamicCharacter
var npc2ID = ""
var npc2:DynamicCharacter
var whoStr = "inmate"

func _initScene(_args = []):
	npcID = _args[0]
	npc = GlobalRegistry.getCharacter(npcID)

#func _reactInit():
#	processTime(10*60)
#	npc.afterTakingAShower()
#
#	var npcSlavery:NpcSlave = npc.getNpcSlavery()
#	if(npcSlavery != null && npcSlavery.getActivityID()=="Walkies"):
#		npcSlavery.getActivity().satisfyWant("pee")

func _reactInit():
	if(RNG.chance(50)):
		npc2ID = NpcFinder.grabNpcIDFromPoolOrGenerate(CharacterPool.Guards, [], GuardGenerator.new(), {})
		whoStr = "guard"
	else:
		npc2ID = NpcFinder.grabNpcIDFromPoolOrGenerate(CharacterPool.Inmates, [], InmateGenerator.new(), {})
		whoStr = "inmate"
	if(npc2ID == null || npc2ID == ""):
		addMessage("Couldn't find a good npc :(")
		endScene()
		return
	npc2 = getCharacter(npc2ID)
	addCharacter(npc2ID)

func resolveCustomCharacterName(_charID):
	if(_charID == "npc"):
		return npcID
	if(_charID == "npc2"):
		return npc2ID

func _init():
	sceneID = "SlaveryPetWalkiesAskPat"

func _run():
	if(state == ""):
		addCharacter(npcID)
		playAnimation(StageScene.PuppyDuo, "stand", {pc=npc2ID, npc=npcID, npcBodyState={naked=true}})

		#var npcSlavery:NpcSlave = npc.getNpcSlavery()
		
		saynn("As you walk your puppy around the station, you walk into one of the "+str(whoStr)+"s.")
		
		saynn("[say=npc2]Oh, what a cute little pup you have there.[/say]")
		
		saynn("The "+whoStr+"'s eyes light up with excitement.")
		
		saynn("[say=npc2]Mind if I give {npc.him} a pat?[/say]")
		
		addButton("Sure", "Let them pat your pup", "let_pat")
		addButton("No", "No patting", "no_pat")
		
	if(state == "let_pat"):
		playAnimation(StageScene.PuppySexOral, "tease", {pc=npc2ID, npc=npcID, npcBodyState={naked=true, hard=true}})
		
		saynn("You nod, allowing {npc2.him} to do it.")
		
		saynn("Your puppy wags {npc.his} tail eagerly as the "+whoStr+" pats {npc.him}.")
		
		saynn("[say=npc2]Who's a good puppy?[/say]")
		
		saynn("Your pet just barks back playfully.")
		
		addButton("Continue", "See what happens next", "endthescene")
	
	if(state == "no_pat"):
		playAnimation(StageScene.Duo, "stand", {npc=npc2ID})
		
		saynn("[say=pc]{npc.He} {npc.isAre} not in the mood for strangers today.[/say]")
		
		saynn("The "+whoStr+" frowns slightly.")
		
		saynn("[say=npc2]I see. Oh well.[/say]")
		
		addButton("Continue", "See what happens next", "endthescene")
		
func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return
	
	if(_action == "let_pat"):
		processTime(5*60)
		var npcSlavery:NpcSlave = npc.getNpcSlavery()
		npcSlavery.getActivity().onPat()
		#return

	setState(_action)


func saveData():
	var data = .saveData()
	
	data["npcID"] = npcID
	data["npc2ID"] = npc2ID
	data["whoStr"] = whoStr

	return data
	
func loadData(data):
	.loadData(data)
	
	npcID = SAVE.loadVar(data, "npcID", "")
	npc = GlobalRegistry.getCharacter(npcID)
	
	npc2ID = SAVE.loadVar(data, "npc2ID", "")
	npc2 = GlobalRegistry.getCharacter(npc2ID)
	whoStr = SAVE.loadVar(data, "whoStr", "")
