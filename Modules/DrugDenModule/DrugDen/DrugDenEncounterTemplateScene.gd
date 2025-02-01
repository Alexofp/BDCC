extends SceneBase

var npcID:String = ""

func _init():
	sceneID = "DrugDenEncounterTemplateScene"

func startFightWithNPC():
	runScene("Fightscene", [npcID], "encounterFight")

func _react_scene_end(_tag, _result):
	if(_tag == "encounterFight"):
		processTime(10 * 60)
		var battlestate = _result[0]
		
		if(battlestate == "win"):
			setState("won_encounter")
			addExperienceToPlayer(10)
		else:
			setState("lost_encounter")

	if(_tag == "defeated_sex"):
		var gotUncon:bool = false
		var sexResult:Dictionary = _result
		if(sexResult.has("subs")):
			var subs:Dictionary = sexResult["subs"]
			if(subs.has("pc")):
				var info:Dictionary = subs["pc"]
				if(info.has("isUnconscious") && info["isUnconscious"]):
					gotUncon = true
		
		if(gotUncon):
			setState("encounter_fully_rekt")
		else:
			setState("encounter_survived_sex")
		return

func encounter_run():
	if(state == "lost_encounter"):
		playAnimation(StageScene.Duo, "defeated", {npc=npcID})
		
		saynn("You lost! Prepare for bad stuff!")
		
		addButton("Continue", "See what happens next", "start_defeated_sex")
	
	if(state == "encounter_survived_sex"):
		removeCharacter(npcID)
		saynn("You managed to endure the onslaught! Time to run!")
		
		addButton("Continue", "See what happens next", "endthescene")
		
	if(state == "encounter_fully_rekt"):
		removeCharacter(npcID)
		playAnimation(StageScene.Sleeping, "sleep")
		
		saynn("You got chocked out completely..")
		
		saynn("All you see is darkness..")
		
		addButton("Continue", "See what happens next", "encounter_endrun")
	
	if(state == "encounter_medical"):
		clearCharacter()
		playAnimation(StageScene.Sleeping, "sleep")
		addCharacter("eliza")
		aimCameraAndSetLocName("medical_hospitalwards")
	
		saynn("[say=eliza]Wakey-wakey![/say]")
		
		saynn("You open your eyes.. and realize that you're somewhere in the medical wing.")
		
		saynn("[say=eliza]Nanobots worked like a charm! I treated some of your injuries while you were taking a nap. Eat this muffin too, you're starving![/say]")
	
		saynn("She gives you a muffin. You eat it immediately. It tastes like the best thing you have ever eaten in your life.")
	
		saynn("[say=pc]Thanks..[/say]")
		
		saynn("She points at a drawer near your hospital bed.")
		
		saynn("[say=eliza]All your things are in there.[/say]")
		
		saynn("You get up, grab all your belongings and prepare to follow Eliza.")
		
		addButton("Follow", "See where she will bring you", "encounter_back_to_lobby")
		
	if(state == "encounter_back_to_lobby"):
		GM.pc.setLocation("med_lobbymain")
		aimCameraAndSetLocName("med_lobbymain")
		playAnimation(StageScene.Duo, "stand", {npc="eliza"})
		
		saynn("Eliza brings you out into the lobby.")
		
		saynn("[say=eliza]Take care now![/say]")
		
		addButton("Continue", "Time to go!", "endthescene")
	
func encounter_react(_action: String, _args):
	if(_action == "start_defeated_sex"):
		getCharacter(npcID).prepareForSexAsDom()
		runScene("GenericSexScene", [npcID, "pc"], "defeated_sex")
		return true
	if(_action == "encounter_endrun"):
		GM.main.processTimeUntil(23*60*60)
		GM.pc.setLocation("medical_hospitalwards")
		GM.main.stopDungeonRun()
		GM.pc.addPain(-GM.pc.getPain())
		GM.pc.addLust(-GM.pc.getLust())
		GM.pc.addStamina(GM.pc.getMaxStamina())
		setState("encounter_medical")
		return true
	if(_action == "encounter_back_to_lobby"):
		setState("encounter_back_to_lobby")
		return true
	
	return false

func saveData():
	var data = .saveData()
	
	data["npcID"] = npcID
	
	return data
	
func loadData(data):
	.loadData(data)
	
	npcID = SAVE.loadVar(data, "npcID", "")
