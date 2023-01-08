extends "res://Scenes/SceneBase.gd"

func _init():
	sceneID = "MedicalHealCryopodFirstTime"

func _run():
	if(state == ""):
		addCharacter("eliza")
		playAnimation(StageScene.Duo, "stand", {npc="eliza", npcAction="sit"})
		
	if(state == ""):
		saynn("You lean over the counter and hold onto it.")

		saynn("[say=pc]I’m not doing well, doc. I think I need help.[/say]")

		saynn("Eliza quickly springs off her chair and walks behind the wall before appearing from one of the doors. She steps up to you and starts looking for any obvious damage.")

		saynn("[say=eliza]Where does it hurt?[/say]")

		saynn("[say=pc]Just.. inside.[/say]")

		saynn("Eliza nods and grabs you by the collar before tugging you somewhere.")

		saynn("[say=eliza]Hold on, we will fix you right up.[/say]")

		addButton("Continue", "See where she brings you", "continue")

	if(state == "continue"):
		aimCameraAndSetLocName("med_researchlab")
		playAnimation(StageScene.Duo, "stand", {npc="eliza", npcAction="stand", bodyState={naked=true}})
		
		saynn("Eliza brings you into the lab, a very sterile room with lots of expensive equipment around. And doctor Quinn brings to one such hi-tech machine.")

		saynn("It’s.. massive, occupying the whole corner of the lab. It consists of a computer and a huge cylindrical pod with glass walls that easily reaches the ceiling. The pod seems to be big enough to fit a person.")

		saynn("[say=eliza]Latest and greatest. Well, for prisons anyway.[/say]")

		saynn("Doctor goes ahead and grabs something that looks like a breathing mask.")

		# (if has clothes)
		if(!GM.pc.isFullyNaked()):
			saynn("[say=eliza]Take off your clothes, patient. And let me put this on you.[/say]")

			saynn("Well, it seems to be necessary so you don’t argue with the doc. You {pc.undressMessage}. You leave all your belongings and a neat pile and let Eliza put the mask on your face.")

		# (else)
		else:
			saynn("[say=eliza]You’re naked, good. Let me put this on you.[/say]")

			saynn("You leave all your belongings and a neat pile and let Eliza put the mask on your face.")

		# (end)

		saynn("Eliza opens the door of a pod and invites you inside.")

		saynn("[say=eliza]It will feel weird at first.[/say]")

		saynn("Huh. Maybe you should have asked if it’s safe first. But at this point you’re ready to do anything to make the pain go away. You don’t even mind your private bits being exposed.")

		addButton("Step inside", "Step inside the glass pod and let Eliza do her magic", "step_inside")

	if(state == "step_inside"):
		playAnimation(StageScene.Cryopod, "idle", {bodyState={naked=true}})
		
		saynn("You exhale audibly through the mask and step inside before turning around and face the feline. Doctor Quinn presses a button on the computer and a long thin tube extends from the pod’s ceiling. Eliza reaches for it and then connects it to your mask. This air.. so fresh.")

		saynn("[say=eliza]Now stand still for me.[/say]")

		saynn("Easy enough. Eliza closes the pod’s glass door and presses a button that secures it. Now you are trapped inside, great. After that she presses another button and the pod begins to fill with something.. some kind of warm blue fluid. It’s not water, it doesn’t act anywhere close to water. The level climbs.. feet, knees, thighs, crotch.. ah, it tickles you there.. belly.. chest.. ow, it tickles again.. You’re not sure if you should panic or not but Eliza seems calm.")

		saynn("[say=eliza]This fluid is much heavier than you.. You will see what I mean, patient.[/say]")

		saynn("As it begins to reach your neck, you can’t help but to raise your chin high and close your eyes. But at the same time.. you begin to feel.. lighter? Your toes are no longer touching the floor of that pod. You’re floating.")

		saynn("Your breathing mask seems to be leak-proof, the liquid slowly fills the whole pod but you can still breathe air. You slowly open your eyes and realize that you can kinda look through the fluid, even if it's kinda muddy. You can’t hear Eliza anymore though. You’re left to float in the tank. And it tickles..")

		addButton("Continue", "See what happens next", "continue1")

	if(state == "continue1"):
		saynn("You realize that your eyes were closed. Oh. Did you fall asleep? You look around and realize that Eliza isn’t there anymore. How much time has passed? Who knows. But it feels nice, the heavy fluid cushions your whole body.. While tickling your private bits and skin around any bruises that you might have.")

		saynn("So sleepy..")

		addButton("Continue", "See what happens next", "continue2")

	if(state == "continue2"):
		playAnimation(StageScene.Duo, "stand", {npc="eliza", npcAction="stand", bodyState={naked=true}})
		
		saynn("You open your eyes again when you feel some kind of vibrations. You see Eliza knocking on the glass. She stares at you and your body before gesturing ‘OK’ and pressing a button on the computer. The fluid level slowly starts to go down, letting you feel the floor again. Your body is slowly getting heavier as the liquid is no longer supporting it.")

		saynn("[say=eliza]Should be good as new.[/say]")

		saynn("Your legs feel weak at first. Wow, that was probably the comfiest you felt ever since ending up here. Eliza waits for the fluid to be gone completely before pressing a button to open the door. This blue stuff is so heavy that it doesn’t stick to your body, you feel dry instantly.")

		saynn("Then Eliza enters the tube and removes your breathing mask, letting you breathe normally. Aw, this air is not that good in comparison. The whole lab smells of pharmacy.")

		saynn("[say=pc]What is this thing?[/say]")

		saynn("Eliza throws you your belongings and waits for you to be ready.")

		saynn("[say=eliza]It’s a Cryopod.[/say]")

		saynn("[say=pc]Cryopod?[/say]")

		saynn("[say=eliza]Mends broken tissue and bones, removes any irritation. Cheap in comparison to a real surgeon. But you know, a machine doesn’t care what to mend and how, it just does it.[/say]")

		saynn("You tilt your head slightly.")

		saynn("[say=pc]So it can mend bones wrong?[/say]")

		saynn("Eliza chuckles.")

		saynn("[say=eliza]You don’t wanna see the monstrosities it creates sometimes.[/say]")

		saynn("You raise your brow and begin to touch your chest in different places. Eliza chuckles again.")

		saynn("[say=eliza]Relax~. Worst case we break your ribs and let them mend again.[/say]")

		saynn("That.. okay.")

		addButton("Continue", "See what happens next", "continue3")

	if(state == "continue3"):
		aimCameraAndSetLocName("med_lobbymain")
		playAnimation(StageScene.Duo, "stand", {npc="eliza", npcAction="stand"})
		
		saynn("After that Eliza just brings you back into the lobby. You realize that at least a few hours have passed since you were here last time.")

		saynn("[say=eliza]Well. That should be it. I realized that I forgot to ask if you feel better.[/say]")

		saynn("[say=pc]Yeah.. I’m good.[/say]")

		saynn("Eliza softly taps you on the shoulder.")

		saynn("[say=eliza]Try to not get in trouble again.[/say]")

		# (scene ends)
		addButton("Leave", "Time to go", "endthescene")
		


func _react(_action: String, _args):
	if(_action in ["continue", "step_inside", "continue2", "continue3"]):
		processTime(60*3)
	
	if(_action == "continue1"):
		GM.pc.afterCryopodTreatment()
		processTime(60*60*4)
	
	if(_action == "endthescene"):
		endScene()
		return
		
	setState(_action)
