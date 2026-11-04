extends SceneBase

func _init():
	sceneID = "KaitPregMenuScene"

func _run():
	if(state == ""):
		addCharacter("kait")
		playAnimation(StageScene.Duo, "stand", {npc="kait"})
		aimCameraAndSetLocName(GM.pc.getLocation())
		saynn("What do you want to do with the pregnant Kait?")

		var amGiveBirth:int = getFlag("KaitModule.kaitGaveBirths", 0)
		if (amGiveBirth == 1):
			saynn("Kait gave birth a single time.")

		else:
			saynn("Kait gave birth a total of "+str(amGiveBirth)+" times.")

		if (!getFlag("KaitModule.kaitDidCuddle", false)):
			addButton("Cuddle", "Cuddle with pregnant Kait and talk about her", "do_cuddle")
		else:
			addDisabledButton("Cuddle", "You already cuddled with Kait during this pregnancy. This option will become available during her next one.")
		if (getCharacter("kait").isHeavilyPregnant()):
			addButton("Help give birth", "Bring Kait to the nursery where she can give birth", "do_help_givebirth")
		else:
			addDisabledButton("Help give birth", "Kait's pregnancy hasn't progressed far enough yet. Wait for the last trimester.")
		if (amGiveBirth >= 1):
			if (getCharacter("kait").canBeMilked() && !getCharacter("kait").hasSoreNipples()):
				addButton("Milk her", "Milk Kait with breast pumps or with your hands!", "do_milk_kait")
			else:
				addDisabledButton("Milk her", "Kait can't be milked currently, give her some time!")
		else:
			addDisabledButton("Milk her", "Kait should give birth at least one time before this becomes available during her next pregnancy.")
		if (amGiveBirth >= 2):
			if (getCharacter("kait").canBeMilked() && !getCharacter("kait").hasSoreNipples()):
				addButton("Breastfeed on", "Feed on Kait's milky breasts!", "do_feed_on_kait")
			else:
				addDisabledButton("Breastfeed on", "Kait can't breastfeed currently, give her some time!")
		else:
			addDisabledButton("Breastfeed on", "Kait should give birth at least 2 times before this becomes available during her next pregnancy.")
		addButton("Back", "Go back to the other menu", "go_back")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "do_cuddle"):
		runScene("KaitPregCuddleScene")
		setFlag("KaitModule.kaitDidCuddle", true)
		return

	if(_action == "do_help_givebirth"):
		endScene()
		runScene("KaitHelpGiveBirthScene")
		return

	if(_action == "do_milk_kait"):
		runScene("KaitPregMilkPumpsScene")
		return

	if(_action == "do_feed_on_kait"):
		runScene("KaitPregBreastfeedOnScene")
		return

	if(_action == "go_back"):
		endScene()
		runScene("KaitTalkScene")
		return

	setState(_action)
