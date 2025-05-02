extends SceneBase

func _init():
	sceneID = "ElizaGenericTestDrugScene"

func _run():
	if(state == ""):
		addCharacter("eliza")
		playAnimation(StageScene.Duo, "stand", {npc="eliza"})
		saynn("[say=pc]Hey, I think the drug effect has settled. I stopped changing.[/say]")

		aimCameraAndSetLocName("med_researchlab")
		saynn("[say=eliza]Oh? Let's go scan you then![/say]")

		saynn("Eliza brings you to the research lab and fetches some kind of device. A little hand-held scanner.")

		saynn("[say=eliza]Hold still![/say]")

		addButton("Continue", "See what happens next", "after_scan")
	if(state == "after_scan"):
		saynn("Eliza slowly moves the scanner over your body.. while a warm sensation spreads throughout your body. Eventually, she stops.")

		saynn("[say=eliza]There we go! The database has been updated! We also got some science points for that, great job![/say]")

		saynn("She puts the scanner away.. and then produces two pills.")

		saynn("[say=eliza]Now.. I have an offer for you.[/say]")

		saynn("Two pills, one on each of her opened palms. A blue one in her left hand.. and a red one in her right..")

		saynn("[say=eliza]You can swallow the blue one.. and everything is gonna return to how it was before. All the transformations are gonna be undone. Boring, if you ask me![/say]")

		saynn("Boring, huh..")

		saynn("[say=eliza]Or! You can swallow the red one.. and accept your new self! It will erase the backup DNA of your body.. making all the current changes permanent.[/say]")

		saynn("The choice is clear..")

		addButton("Blue", "Eat the pill that will undo all the transformations", "eat_blue")
		addButton("Red", "Eat the pill that will make all your transformations permanent", "eat_red")
	if(state == "eat_blue"):
		saynn("You grab the blue one off of her paw.. and eat it.")

		saynn("[say=eliza]Aww~.[/say]")

		saynn("And soon, your body reverts to its normal state.")

		saynn("Ah.. much better.")

		saynn("[say=eliza]Well, come back when you get something else I can scan![/say]")

		saynn("You nod. Eliza guides you back to the lobby.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "eat_red"):
		saynn("You grab the red one off of her paw.. and eat it.")

		saynn("[say=eliza]Wise choice~.[/say]")

		saynn("You brace.. but nothing changes.. and that's the point! Your new you is now you! Forever and ever! Until the next transformation that is..")

		saynn("[say=eliza]Enjoy! Come back when you get something else I can scan![/say]")

		saynn("You nod. Eliza guides you back to the lobby.")

		addButton("Continue", "See what happens next", "endthescene")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "after_scan"):
		processTime(15*60)
		GM.main.SCI.doTestTFsOf(GM.pc)

	if(_action == "eat_blue"):
		GM.pc.getTFHolder().undoAllTransformations()

	if(_action == "eat_red"):
		GM.pc.getTFHolder().makeAllTransformationsPermanent()

	setState(_action)
