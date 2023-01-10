extends "res://Scenes/SceneBase.gd"

func _init():
	sceneID = "ElizaGetIntoMentalWard"

func _run():
	if(state == ""):
		addCharacter("eliza")
		
	if(state == ""):
		saynn("[say=pc]You were talking about doing some kind of research. I’d like to volunteer.[/say]")

		saynn("Eliza raises her brow and gazes at you with her feline eyes. She puts away her mug and then grabs pen and paper. She starts to slowly fill some form.")

		saynn("[say=eliza]Well then. Indeed, we’re always in need of more test subjects. Are you sure?[/say]")

		saynn("[say=pc]I mean, if it’s safe.[/say]")

		saynn("Eliza chuckles, she is still focused on filling the form.")

		saynn("[say=eliza]Computer simulations say it's safe so it must be. We would happily use computers to simulate everything. But you know, a computer can’t simulate a person. A person with feelings, emotions, thoughts and beliefs. That’s still beyond our reach.[/say]")

		saynn("She offers you a filled form and a pen.")

		saynn("[say=eliza]If you really want this, sign up here. Just keep in mind that you will be kept here for some time after the tests. You know, to monitor you and your vitals. You will be paid, of course.[/say]")

		saynn("You quickly skim through the form, everything seems to make sense. Though it does say that the medical wing can not be held accountable for your mental health after the tests.")

		saynn("Do you wanna sign it?")

		addButton("Sign it", "What’s the worst that can happen, right?", "sign_it")
		addButton("No", "On second thought..", "no")

	if(state == "no"):
		saynn("[say=pc]It seems kinda dangerous. I think I will pass[/say]")

		saynn("Eliza shrugs and quickly destroys the form.")

		saynn("[say=eliza]Your loss, inmate. No one ever complained about this research program.[/say]")

		addButton("Continue", "I wonder why", "endthescene")

	if(state == "sign_it"):
		saynn("You sign the paper and hand it back to the doctor. She puts it away and stands up.")

		saynn("[say=eliza]Wait there, inmate.[/say]")

		saynn("Eliza steps away from the counter and walks away. You spend some time just looking around, a few nurses watch you.")

		saynn("Eventually, Eliza appears from one of the airlocks and walks up to you, she is clearly holding something in her hand but she hides it behind her back.")

		saynn("[say=eliza]Ready?[/say]")

		saynn("[say=pc]Ready for what?[/say]")

		saynn("Ow, she suddenly reaches out and grabs you by the collar just to shove a syringe into your neck and quickly empty it.")

		saynn("You stumble back and grab onto your collar. The room starts to tilt to the side, lights flickering..")

		saynn("[say=pc]W-what.. is that..[/say]")

		saynn("Eliza just covers your mouth.")

		saynn("[say=eliza]Shh-h-h..[/say]")

		saynn("You try to concentrate on her smug face. Your limbs slowly give up.. The gravity pulls you down to your knees.. Everything is so dark all of the sudden.. So.. tired..")

		saynn("You drop to the floor and lose your consciousness.")

		addButton("Continue", "Life is tough", "continue")

	if(state == "continue"):
		setLocationName("Padded cell")
		aimCamera("medical_paddedcell_player")
		GM.pc.setLocation("medical_paddedcell_player")
		playAnimation(StageScene.Solo, "kneel")
		
		saynn("You open your eyes.. Everything is so hazy.. You’re on the floor. But the floor is.. so soft..")

		addButton("Look around", "Where am I?", "look_around")

	if(state == "look_around"):
		saynn("You’re in a small room. About two by two meters. Only the ceiling is made out of concrete, walls and floor have a soft layer to them, made out of square cushions, even the door is padded, apart from a little armored window. Are you in a.. asylum?")

		saynn("Oh no. You try to stand up but suddenly realize.. you’re wearing a latex straitjacket! Your arms are bound in such a way that you’re always hugging yourself, by trying to struggle you only make the latex squeak. You look down at yourself. There are two holes in it, your {pc.breasts} are always out! And your crotch is protected by a bulky chastity belt that’s part of the straitjacket. Overall, you’re completely helpless.")

		addButton("Sit down", "Where else can you do", "sit_down")

	if(state == "sit_down"):
		saynn("With some extra effort you manage to sit on your butt. With nothing better to do you decide to try and get some attention. Maybe this was a mistake.")

		saynn("[say=pc]Hello? Anyone? I’m stuck here.[/say]")

		saynn("No one answers you. Although. After about a minute you hear the noise of an intercom.")

		saynn("[say=eliza]Up already? Good. How are we doing, inmate.[/say]")

		saynn("[say=pc]What’s going on?[/say]")

		saynn("[say=eliza]I told you, you’re gonna be monitored. The tests might be damaging to your mental health, we can’t have you out in the open. So you will spend some time in a closed environment.[/say]")

		saynn("[say=pc]Really? The paper didn’t mention this. The straitjacket and all.[/say]")

		saynn("[say=eliza]It’s so you don’t hurt yourself. Or us. The tests will begin soon. Enjoy your new cell~.[/say]")

		saynn("[say=pc]Wait! How long am I stuck here?[/say]")

		saynn("[say=eliza]A few days. Or. A few months. It depends on your behavior, inmate. For now I just want you to get some sleep.[/say]")

		saynn("The noisy intercom shuts off, leaving you, again, in full silence. You sit against a padded wall, wondering what the doctor ment. Though you soon understand it, the vent that is located on the ceiling of your cell opened up and a thick pink mist began slowly filling the space.")

		saynn("[say=pc]Hey![/say]")
		
		saynn("No reaction. As you inevitably breathe some of it, you begin to feel more drowsy.. The padded floor suddenly feels quite.. comfy. Keeping your eyes open is so hard.. Your body gives up on you..")

		addButton("Sleep", "This place seems comfy enough..", "sleep")
		
	if(state == "sleep"):
		saynn("You get some good sleep. You open your eyes and realize that this wasn't a dream. You can't pinch your skin with that straitjacket on but everything is real, you're indeed stuck in a padded cell..")

		saynn("Welcome to day "+str(GM.main.getDays())+" of your sentence")
		
		addButton("Continue", "What next..", "startmental")
		


func _react(_action: String, _args):
	if(_action == "continue"):
		getModule("MedicalModule").preparePCForMentalWard()

	if(_action == "endthescene"):
		endScene()
		return
		
	if(_action == "startmental"):
		runScene("MentalWardScene")
		endScene()
		return
		
	if(_action == "sleep"):
		GM.main.startNewDay()
		GM.pc.afterSleepingInBed()
	
	setState(_action)
