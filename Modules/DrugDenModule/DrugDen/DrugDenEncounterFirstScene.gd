extends "res://Modules/DrugDenModule/DrugDen/DrugDenEncounterTemplateScene.gd"

func _init():
	sceneID = "DrugDenEncounterFirstScene"

func _reactInit():
	npcID = generateJunkieNPCID()
	addCharacter(npcID)
	#startFightWithNPC()


func _run():
	encounter_run()
	
	if(state == ""):
		playAnimation(StageScene.Duo, "stand", {npc=npcID})
		
		saynn("As you step deeper into the tunnels, you run into someone. Or, more like, something.")
		
		saynn("{npc.His} skin is sallow, {npc.his} pupils blown wide like black holes. A junkie.")
		
		saynn("{npc.His} gaze snaps to you, and for a moment, there’s just twitchy silence.")
		
		saynn("[say=npc]"+RNG.pick([
			"The fuck are you lookin’ at, fresh meat? You ain’t one of us. Ain’t got the shakes. The fuck are you doing here?",
			"You ain't twitchin', ain't sweatin'.. yeah, you ain't one of us. That’s a problem.",
			"Wrong fuckin’ turn, asshole. Now you’re mine.",
			"You smell too clean. Let’s fix that with a little blood.",
			"You think you can just walk in here and not pay the toll? Cute.",
			"You ain’t here to get high, so that means you’re here to steal. And I hate thieves.",
			"New fish in the tank, huh? Let's break you in.",
			"Walkin’ down here like you own the place. Let’s see how cocky you are when you’re beggin’.",
			"Ain’t nothin’ good waitin’ for you down here, buddy. Just pain.",
			"Gimme a reason, motherfucker. Just one.",
			"Oh-ho, fresh meat in the pit? You must be lost, dumbass.",
			"The fuck you doin’ down here, tourist? Lookin’ for a good time or a bad one?",
		])+"[/say]")
		
		saynn("It's hard to blend in when you're not a junkie yourself.. Looks like you will have to fight {npc.him}..")
		
		addButton("Fight", "Start the fight", "startFight")
	
func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return
		
	if(_action == "startFight"):
		startFightWithNPC()
		return
	if(encounter_react(_action, _args)):
		return
	
	setState(_action)
