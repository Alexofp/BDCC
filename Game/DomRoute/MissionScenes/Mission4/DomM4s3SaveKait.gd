extends SceneBase

func _init():
	sceneID = "DomM4s3SaveKait"

func _run():
	if(state == ""):
		aimCameraAndSetLocName("medical_near_pccell")
		addCharacter("avy")
		playAnimation(StageScene.Duo, "stand", {npc="avy"})
		saynn("You approach the row of locked padded rooms.")

		saynn("[say=avy]Might be it.[/say]")

		saynn("You take your time and look into the small window slit of each one..")

		addButton("Continue", "See what happens next", "kait_reveal")
	if(state == "kait_reveal"):
		addCharacter("kait")
		aimCameraAndSetLocName("medical_paddedcell_player")
		playAnimation(StageScene.SexStart, "start", {pc="pc", npc="kait"})
		saynn("There she is! There is Kait!")

		saynn("The giant metal door is locked.. but you just press the nurse's badge against the access panel.")

		saynn("The door begins to unlock, enough to step inside. And so you do.")

		saynn("Inside.. a tiny room.. barely enough for a single person. All walls are padded with soft material. Kait is sitting in the center of it. She is wearing a straitjacket.. made out of latex.. Around her waist is a bulky chastity belt.")

		saynn("When she notices you, her eyes lazily look up at you.")

		saynn("[say=kait]..meow.. meow-w~..[/say]")

		saynn("Avy growls.")

		saynn("[say=avy]Fucking hell, what did that bitch do to you.[/say]")

		saynn("[say=kait]Meow-w-w~. You're pretty-y.[/say]")

		saynn("Her eyes are half-closed, pupils wide and unfocused. She blinks slowly, a cute little smile spreading across her muzzle.")

		saynn("[say=pc]She sedated her. We gotta get her out of here.[/say]")

		saynn("[say=avy]Well.. fucking grab the cat then. We can deal with that fucking nerd bitch some other time.[/say]")

		saynn("You reach down and begin lifting Kait up. She nuzzles you and purrs as you do that.")

		saynn("[say=kait]Warm~.[/say]")

		saynn("The moment you lift the snow leopard.. the heavy metal door closes shut! The loud clang echoes through the corridors.")

		saynn("You're trapped inside! Only Avy is left outside. You can see her through the slit.")

		saynn("[say=avy]What the..[/say]")

		saynn("[say=pc]Use the badge.[/say]")

		saynn("Avy tries.. but the panel flashes red.")

		saynn("[say=avy]It's not fucking working.[/say]")

		saynn("[say=kait]Meow meow.. stuck.. hehe..[/say]")

		saynn("This is not good.")

		saynn("[say=eliza]Not opening, huh~?[/say]")

		saynn("It's her voice..")

		addButton("Continue", "See what happens next", "avy_eliza_intro")
	if(state == "avy_eliza_intro"):
		addCharacter("eliza")
		playAnimation(StageScene.Duo, "stand", {pc="avy", npc="eliza")
		aimCameraAndSetLocName("medical_near_pccell")
		saynn("You can only watch through the small slit of the door.. but you see enough.")

		saynn("Eliza Quinn, in the flesh, standing near the entrance of the mental ward wing.")

		saynn("Avy stops trying to press the badge against the panel.. and faces her.")

		saynn("[say=avy]You. Absolute. Bitch.[/say]")

		saynn("[say=eliza]Gonna be honest, I was hoping that the both of you would be there. But that's okay, I can deal with one of you~.[/say]")

		saynn("[say=avy]You think you're so smart, huh? Your stupid plan didn't work. Hope you like pain.[/say]")

		saynn("[say=eliza]Maybe I do~.[/say]")


func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "kait_reveal"):
		getCharacter("kait").getInventory().clearSlot(InventorySlot.Body)
		putOn("kait", "LatexStraitjacket")

	setState(_action)
