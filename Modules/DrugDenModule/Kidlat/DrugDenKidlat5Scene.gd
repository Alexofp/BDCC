extends SceneBase

func _init():
	sceneID = "DrugDenKidlat5Scene"

func _run():
	if(state == ""):
		addCharacter("kidlat", ["naked"])
		playAnimation(StageScene.Duo, "stand", {npc="kidlat", further=true, kidlatBox=true, npcBodyState={naked=true}})
		saynn("Keys are hard to come by.. but you might as well free Kidlat, who knows how long she has been cuffed by now.")

		saynn("As you step towards her.. she hears it.. and begins stepping back.")

		saynn("[say=kidlat]Hey.. uh.. you want somethin'? Let's strike a deal, yeah. Meow.[/say]")

		saynn("Her ankle cuffs restrict her movement heavily.. so you easily catch up and grab her by the collar, your other hand holding a key.")

		saynn("[say=kidlat]Eek..[/say]")

		saynn("Her breasts bounce a little as she pants in your hands..")

		addButton("Unlock", "Unlock her restraints", "do_unlock")
	if(state == "do_unlock"):
		playAnimation(StageScene.Duo, "stand", {npc="kidlat", further=true, kidlatBox=true, npcBodyState={naked=true}})
		saynn("The sharp click of the restraint key echoes softly in the tunnel.")

		saynn("[say=kidlat]What in the world..[/say]")

		saynn("One by one, the cuffs fall away from Kidlat's wrists and ankles. The cold, metallic weight slips off of her fur, leaving faint bruises in their place. As you unlock the last cuff, the key snaps in half.. So fragile, these things..")

		saynn("[say=kidlat]Sorry if that was your stash![/say]")

		saynn("She stands still as your hands reach up to the blindfold and lift it away.")

		saynn("Even though it's dark here, her eyes still have to adjust, blinking a lot.. but then she finally sees you. At first, her expression is that of a big surprise.. but then her lips twitch into a shaky smile.")

		saynn("[say=kidlat]Oh bloody hell, it's you![/say]")

		saynn("Her ears flick back slightly, a blush creeping up her cheeks.")

		saynn("[say=kidlat]Didn't think you'd be the one to find me like this, luv.[/say]")

		saynn("She chuckles nervously, rubbing the marks on her wrists. Her breasts rise and fall with each deep breath, the tension slowly draining out of her body.")

		saynn("[say=kidlat]So, what's the deal, then? You want something?..[/say]")

		saynn("[say=pc]Huh?[/say]")

		saynn("She shrugs.")

		saynn("[say=kidlat]No one just helps without wantin' something in return, hun. Don't be silly. What do I owe you for this.. I have credits.. or something else..[/say]")

		saynn("You shrug back.")

		saynn("[say=pc]Relax, Kidlat. I just felt like saving you.[/say]")

		saynn("Her eyes widened a little.")

		saynn("[say=kidlat]Really? You want nothing? After all that? You're strange. Not as strange as me but still.[/say]")

		saynn("For a moment, Kidlat just stands there, naked, biting on her bottom lip.")

		addButton("Continue", "See what happens next", "a_hug")
	if(state == "a_hug"):
		playAnimation(StageScene.Hug, "hug", {npc="kidlat", npcBodyState={naked=true}})
		saynn("Without warning, she steps forward and wraps her paws around you. Her fur is soft against you..")

		saynn("[say=kidlat]I still owe you, luv![/say]")

		saynn("She lets the moment linger for a while longer.. her purring tickles your ear, her big fluffy tail brushing against your leg.")

		saynn("[say=kidlat]Promise I will find more stuff for ya next time. I will dig through every nook and cranny down here![/say]")

		saynn("[say=pc]Just be careful with the trapped stashes.[/say]")

		saynn("She chuckles.")

		saynn("[say=kidlat]I am everything but careful! You only live once, you know.[/say]")

		saynn("You nod.")

		saynn("A warm hug.. in the middle of a cold maintenance tunnel.. Nothing lasts forever.")

		saynn("[say=kidlat]Good thing my uniform is still here in my box.[/say]")

		saynn("[say=pc]Uh, were you exploring naked?[/say]")

		saynn("[say=kidlat]Uh.. that's a secret.[/say]")

		saynn("Such a cat.")

		addButton("Continue", "See what happens next", "start_browsing_shop")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "do_unlock"):
		setFlag("DrugDenModule.Kidlat5Hap", true)
		getCharacter("kidlat").resetEquipment()

	if(_action == "a_hug"):
		addMessage("Kidlat will now sell 4 items instead of 3. Task updated!")
		setFlag("DrugDenModule.KidlatCustomShopGreet", "I don't have more to sell right now.. 'cause I was cuffed.. duh..")

	if(_action == "start_browsing_shop"):
		#getModule("DrugDenModule").regenerateKidlatItems()
		runScene("DrugDenKidlatShopScene")
		endScene()

	setState(_action)
