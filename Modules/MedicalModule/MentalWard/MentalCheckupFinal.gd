extends "res://Scenes/SceneBase.gd"

func _init():
	sceneID = "MentalCheckupFinal"

func _run():
	if(state == ""):
		addCharacter("eliza")
		playAnimation(StageScene.Duo, "stand", {npc="eliza"})
		
	if(state == ""):
		saynn("Someone knocks on the little window. You look up and see Eliza standing behind the door. Intercom makes a static noise.")

		saynn("[say=eliza]Hey there, inmate. I’m here to check on you. Sit still.[/say]")

		saynn("Door slowly goes through its opening sequence. Doctor Quinn walks in and crouches before you, her hand reaches out and rubs your latex straitjacket. Then her digits trace circles around your exposed {pc.breasts}.")

		saynn("[say=eliza]Look at me. How are you doing?[/say]")

		addButton("Behave", "Show how good of an inmate you are", "behave")
		addButton("Growl at", "How dares she", "growl_at")


	if(state == "behave"):
		saynn("You watch her touch your chest and offer her a little smile.")

		saynn("[say=pc]I’m feeling well, thank you.[/say]")

		saynn("She traces a digit across your cheek and then slides it between your lips. Unsure, you begin to gently suck on it. Eliza eyes you out with her cunning gaze and chuckles.")

		saynn("[say=eliza]Wish I could keep you here forever. But. You know. Can’t do that, your mental health seems to be stable enough so I have to let you go.[/say]")

		saynn("[say=pc]Tha..[/say]")

		saynn("[say=eliza]Shh-h[/say]")

		saynn("She pulls her digit and drags it across your other cheek. Eliza softly giggles.")

		# (if bad behaviour)
		if(getModuleFlag("MedicalModule", "Mental_PCBehavior", 0.0) < 0.3):
			saynn("[say=eliza]Your behavior was quite awful, you clearly need more punishments. I will note that in the database. Now let’s go.[/say]")

		# (if medium behavior)
		elif(getModuleFlag("MedicalModule", "Mental_PCBehavior", 0.0) < 0.7):
			saynn("[say=eliza]You were pretty helpful and mostly collaborated. Could have been better but oh well. Let’s go.[/say]")

		# (if high behavior)
		else:
			saynn("[say=eliza]You’ve been of great help, we need more test subjects like you. Now let’s go.[/say]")

		saynn("She clips a leash to your collar and helps you to get up.")

		addButton("Follow", "See where she brings you", "follow")

	if(state == "follow"):
		aimCamera("med_lobbyne")
		playAnimation(StageScene.Solo, "walk")
		setLocationName("Medical lobby")
		GM.pc.setLocation("med_lobbyne")
		
		saynn("Eliza walks you through some corridors and brings you to the exit. She then unlocks your straitjacket and takes it off.")

		saynn("[say=eliza]Can’t have you walking around with it~[/say]")

		saynn("She presses the button and invites you to walk into the lobby.")

		addButton("Freedom", "Free, at last", "endthesceneGoodEscape")
		
		# (scene ends)



	if(state == "growl_at"):
		saynn("You expose your fangs and growl at her. She grabs you by the chin and forces you to look at her, face expression changes to a mean one.")

		saynn("[say=eliza]Right now I’m your only way out of here, silly inmate. So you better behave unless you want your mind shattered. See if I care.[/say]")

		saynn("She produces a syringe filled with something unknown and holds it close to your neck.")

		saynn("[say=eliza]Show me you are sorry.[/say]")

		addButton("Obey", "You experienced enough drugs", "obey")
		addButton("Kick her away", "Resist until the end. This probably won’t end well", "kick_her_away")
		

	if(state == "obey"):
		saynn("Your rebellious spirit quickly fades, you stop growling and direct your gaze down, away from the doctor's eyes. Eliza sees it and puts the syringe away. She returns to teasing your chest.")

		saynn("[say=eliza]That’s a good inmate. I will repeat my question. How are you feeling?[/say]")

		# (continue)
		addButton("Behave", "Show how good of an inmate you are", "behave")


	if(state == "kick_her_away"):
		saynn("You prop yourself against a wall and kick Eliza back. She hisses and staggers back, dropping the syringe in the process. You get into one of the corners and growl at her more. You can’t do much more with that straitjacket on.")

		saynn("Eliza stands up and swipes her lab coat.")

		saynn("[say=eliza]Well then.[/say]")

		saynn("She glares at you. You roll the syringe away from her and protect it.")

		saynn("[say=eliza]Think you are safe? Look around, you’re stuck here on this rock. Together with me. You’re screwed. Wanna know why?[/say]")

		saynn("She grabs a remote off her belt and presses some buttons. Your collar beeps and sends a powerful shock through you. Ow! And it doesn’t stop, more and more shocks go through you, sending your body to shake uncontrollably. You can’t help but cry out from pain. Doctor’s eyes burn from excitement.")

		saynn("[say=eliza]Because I love seeing you suffer.[/say]")

		saynn("She gives you a small breather, stopping the shocks. Your muscles feel very sore. Eliza steps closer and presses her leg into your {pc.masc} belly, pinning you to the ground. She grins and holds the button on the remote again sending more shocks through your body. You try to arch your back but Eliza pushes you down into the floor.")

		saynn("[say=eliza]Good thing latex doesn’t conduct electricity.[/say]")

		addButton("Give up", "It’s too much", "give_up")
		addButtonWithChecks("Touch her leg", "Use the shock against her", "touch_her_leg", [], [[ButtonChecks.StatCheck, Stat.Vitality, 10]])
		

	if(state == "give_up"):
		saynn("You quit resisting and try to show that you are surrendering but she just keeps holding the button down, sending more and more painful sensations through your body. She is laughing seeing you shiver so much. Everything is getting dark, you start to lose consciousness..")

		saynn("[say=eliza]Not so fast.[/say]")

		saynn("Eliza lets go of the button and grabs the syringe off the floor. She then swiftly injects your neck with it. Ow.")

		saynn("[say=eliza]Now you can pass out.[/say]")

		saynn("Mind is slowly slipping away.. Thoughts disappear.. Is this what hell feels like.. Or is it heaven..")

		saynn("[say=eliza]See you around~[/say]")

		addButton("Sleep time", "That was painful", "endthesceneSleep")

		# (scene ends)


	if(state == "touch_her_leg"):
		saynn("Despite all the pain and shock you manage to bend your leg enough to touch Eliza, sending a powerful impulse of electricity through her body too. She lets out a painful cry and drops to the floor, breathing heavily. The remote falls out of her hand and smashes against the floor.")

		saynn("It’s your chance. You gather all your willpower and get out of the cell. You drag your face across the control panel and start the door closing mechanism, trapping Eliza inside your cell. As soon as she gains her strength back she starts pounding on the door. You hear her voice through the intercom.")

		saynn("[say=eliza]Hey! What do you think you’re doing. I will break you. Let me out! I will deconstruct your personality into nothing! I will erase your memory and make you into my servant![/say]")

		saynn("You give her last glance and make your escape.")

		addButton("Run", "She got what she deserved", "run")

	if(state == "run"):
		aimCamera("med_lobbyne")
		playAnimation(StageScene.Solo, "walk")
		setLocationName("Medical lobby")
		GM.pc.setLocation("med_lobbyne")
		
		saynn("Seems like no one knows that you escaped so there aren’t many guards around. You manage to sneak past all of them and make your way back to the medical lobby!")

		addButton("Escaped", "Freedom!", "endthesceneEscape")

func _react(_action: String, _args):

	if(_action == "follow"):
		runScene("ParadedOnALeashScene", ["eliza", GM.pc.getLocation(), "med_lobbyne", [
			"Come back soon~",
			"Aw, shame that I have to let you out",
			"You've been such a good test subject, patient~",
		]])

	if(_action == "endthesceneEscape"):
		endScene(["escape"])
		setModuleFlag("MedicalModule", "Mental_PlayerEscaped", true)
		return

	if(_action == "endthesceneGoodEscape"):
		endScene(["good"])
		return

	if(_action == "give_up"):
		MedicalModule.addPCBehavior(-0.9)
		MedicalModule.addPCSanity(-0.7)

	if(_action == "endthesceneSleep"):		
		endScene(["sleep"])
		return

	if(_action == "endthescene"):
		endScene()
		return

	
	setState(_action)


