extends SceneBase

func _init():
	sceneID = "Eliza3GoodJobScene"

func _run():
	if(state == ""):
		addCharacter("eliza")
		playAnimation(StageScene.Duo, "stand", {npc="eliza"})
		aimCameraAndSetLocName("med_lobbymain")
		saynn("As you traverse medbay's lobby, you hear someone choking on coffee.. followed by a familiar voice.")

		saynn("[say=eliza]Khm.. fuck.. Oh hey! Come here, assistant.[/say]")

		saynn("You approach the counter, behind which you see Doctor Quinn, with her usual mag in her paw. Her lab coat has some dark wet splotches.")

		saynn("[say=pc]Looks like you have a coffee addiction.[/say]")

		saynn("[say=eliza]What I have is a serious case of 'clumsy cat'. Inoperable. Coffee I can quit at any point.[/say]")

		saynn("She puts the mag down and sighs.. before licking the wet cloth.")

		saynn("[say=eliza]But I just don't want to.[/say]")

		saynn("You notice some damage on her personal mag. Little cracks that mess with the 'Best mom' print a bit. Probably not the first time she has almost dropped it.")

		saynn("[say=pc]Clumsy chemist sounds like a dangerous combination.[/say]")

		saynn("She uses some piece of cloth to clean her labcoat and giggles at your words.")

		saynn("[say=eliza]Oh yeah. Did I ever tell you that I managed to blow the whole lab up once before~? That was fun.[/say]")

		saynn("This takes her 'clumsy' description up a few levels.. Right up to 'dangerous'.")

		saynn("[say=pc]You sure you're qualified?[/say]")

		saynn("[say=eliza]I got a paper that says that I am! Listen, you can't do science without an occasional boom, just not how it works. Laboratories can be rebuilt but the knowledge.. that stuff is eternal.[/say]")

		saynn("Rebuilding that laboratory is what you've been doing for some time now.")

		saynn("[say=pc]Is that why the lab equipment is so outdated? You keep blowing it up?[/say]")

		saynn("[say=eliza]Pff. I blow once and now everyone thinks that I'm a serial blower![/say]")

		saynn("She realizes that her voice was loud enough for all the nurses to hear her way too late..")

		saynn("[say=eliza]..Fuck. No. That was a different lab, a long time ago. That lab.. pure perfection. Every possible element and piece of equipment that you'd want.. Computers that don't take hours to boot.. Access to the full AlphaTech database. Pure.. perfection..[/say]")

		saynn("She puts extra purring into the pure word. She sips some more coffee out of her mag.")

		saynn("[say=eliza]Well.. it was like that until I made it go boom. Mom is still mad. But at least dad understands.[/say]")

		saynn("She guides her gaze away and stares at a wall for some time, her eyes reminiscing the past.")

		addButton("Continue", "See what happens next", "unlock_milk_slave")
		saynn("[say=eliza]Anyway.. Speaking of labs.[/say]")

		saynn("She looks at her laptop.")

		saynn("[say=eliza]Good job so far! I'm looking at our database, you've been busy. Love to see it~.[/say]")

		saynn("[say=pc]Thanks.[/say]")

		saynn("She nods.")

		saynn("[say=eliza]I've been busy too, for different reasons.. Can't help you with the lab much, outside of scanning those pills. But! I think I can help you with something.[/say]")

		saynn("Any help would be nice.")

		saynn("[say=eliza]I have some free time in the mornings. I'm usually sleepy as fuck.. but I think I have enough brain power to milk someone![/say]")

		saynn("[say=eliza]So.. it could be you, obviously~. But if you have someone else in mind, I can work my magic on them too. Hope you won't mind me taking some for myself, I love my coffee with milk~.[/say]")

		saynn("Right. That could make for a nice passive.. income.. of sorts.")

		addButton("Leave", "Time to go", "just_leave")
		addButton("Kiss?", "You did a lot. Might as well ask for a bigger reward", "get_kiss")
	if(state == "just_leave"):
		saynn("[say=pc]Yeah, that could be useful. I will keep that in mind.[/say]")

		saynn("Eliza slowly eyes you from toes to tip of your ears.")

		saynn("[say=eliza]Mhm~. Keep it up. Call me when you find more of those strange drugs.[/say]")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "get_kiss"):
		playAnimation(StageScene.Duo, "hurt", {npc="eliza"})
		saynn("You deserve more than a simple 'good job', you've been looking after her lab!")

		saynn("[say=pc]I think I deserve a reward for my work, don't you think? A little kiss would be a good start.[/say]")

		saynn("Eliza raises a brow, her eyes linger on your lips while a little smile is formed by hers.")

		saynn("[say=eliza]Kiss.. hmm~.[/say]")

		saynn("Her paw closes the laptop as she leans a bit closer, over the counter.")

		saynn("[say=eliza]Come here then.[/say]")

		saynn("As you get closer and lean yourself to meet her.. A sharp pain suddenly swipes through your body, starting at the neck. A painful grunt escapes your lips as your muscles seize up for a long, agonizing, two seconds.")

		saynn("[say=pc]Gh-h..[/say]")

		saynn("Eliza shows you her little remote with a face full of innocence.")

		saynn("[say=eliza]You will have to earn it, Fucker-r-r~~.[/say]")

		saynn("She really drags the last syllable, singing it.")

		saynn("You grab onto your neck and try to get your breathing back.")

		saynn("[say=pc]Is that how you play, kitty cat?[/say]")

		saynn("Her soft purring echoes in your ringing ears, her clawed digit scratching the red button on her remote.")

		saynn("[say=eliza]That would be Dr. Quinn for you, little patient~. And yes, sometimes I play rough. Explosive chemistry is what I'm known for~.[/say]")

		saynn("[say=pc]Noted.[/say]")

		saynn("Her second paw reaches out to gently scritch you under the chin. She bites her lip.")

		saynn("[say=eliza]You're always welcome to worship me though. Haha.[/say]")

		saynn("Such a brat. Eliza leans away to return to her post.")

		saynn("[say=eliza]Keep it up. Call me when you find more of those strange drugs.[/say]")

		addButton("Continue", "See what happens next", "endthescene")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "unlock_milk_slave"):
		processTime(5*60)
		addMessage("You can now bring your slaves to Eliza so that she will automatically milk them every morning")

	setState(_action)
