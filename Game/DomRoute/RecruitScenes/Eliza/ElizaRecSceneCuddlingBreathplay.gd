extends RecruitSceneBase

func _init():
	sceneID = "ElizaRecSceneCuddlingBreathplay"

func _reactInit():
	getCharacter("eliza").getInventory().clearSlot(InventorySlot.Body)
	putOn("eliza", "LatexStraitjacket")
	putOn("eliza", "oldcollar")

func _run():
	if(state == ""):
		addCharacter("eliza", ["naked"])
		aimCameraAndSetLocName("hideout_breakroom")
		playAnimation(StageScene.Duo, "stand", {npc="eliza"})
		saynn("You step inside the cell and look at Eliza Quinn. She is standing still, her collar leashed to the pipe above her, preventing her from most things. She can't even sit on a chair that's here.")

		saynn("Her tits are still out.. and her eyes are still really angry.")

		saynn("[say=pc]"+str(ch1("...", "Hey there, Quinn.", "You look like one of us. Little slut."))+"[/say]")

		saynn("[say=eliza]Grrr-r..[/say]")

		saynn("Her tail wags annoyed. She struggles against the straitjacket, making the shiny material creak.")

		saynn("[say=pc]"+str(ch1("...", "Relax, slut. I'm not gonna hurt you yet.", "What's the matter? Cat got your tongue?"))+"[/say]")

		saynn("You walk over to the pipe and reach up to it, to loose the chain a little. Then you embrace Eliza and pull her down onto the floor!")

		addButton("Cuddle her", "Do the cuddles!", "do_cuddle")
	if(state == "do_cuddle"):
		playAnimation(StageScene.Cuddling, "idle", {pc="pc", npc="eliza"})
		saynn("She tries to pull away but you're stronger.")

		saynn("[say=eliza]The hell are you doing?[/say]")

		saynn("You wrap your arms around her, making it so there are now 2 sets of arms hugging her.")

		saynn("[say=pc]"+str(ch1("...", "Shut up and take it, cuddle-slut.", "Shush, cuddle-slut."))+"[/say]")

		saynn("She squirms but you hold her tight. She seems quite rebellious so you get an idea. One of your hands starts to slide along her body, along the latex, brushing against her exposed breasts.. before reaching her neck. You grab it, your digits landing on her throat, just above the collar.")

		saynn("[say=eliza]Ah..[/say]")

		saynn("You squeeze. Not hard. Just some pressure to make her feel less in control. She flinches, her breath hitching.")

		saynn("[say=eliza]Kinky..[/say]")

		saynn("[say=pc]"+str(ch1("...", "Shut up.", "Quiet, pet."))+"[/say]")

		saynn("Her mouth opens slightly, a small gasp escaping. Her body.. which was quite rigid before.. begins to relax into your grip.")

		saynn("[say=eliza]..mmhh..[/say]")

		addButton("Continue", "See what happens next", "eliza_rubs_against_you")
	if(state == "eliza_rubs_against_you"):
		playAnimation(StageScene.Cuddling, "squirm", {pc="pc", npc="eliza"})
		saynn("Even when you increase the pressure on her throat, she doesn't try to pull away.. she just endures it, her body desperately trying to push air into her lungs through the constrained throat.")

		saynn("You're choking her.. while watching her nipples getting stiff from the act.")

		saynn("You push her further, tightening your grip until she can't breathe anymore at all. Her eyes go half-closed, her mouth letting out a completely silent moan.")

		saynn("[say=pc]"+str(ch1("...", "Fucking slut.", "Didn't expect you to be this slutty."))+"[/say]")

		saynn("Her cheeks begin to burn red. Her eyes begin to gradually lose focus. Any resistance faded away a long time ago.")

		saynn("After about twenty seconds, you begin to feel her getting really weak. Now is probably a good time to stop then.")

		addButton("Continue", "See what happens next", "after_all")
	if(state == "after_all"):
		playAnimation(StageScene.Cuddling, "idle", {pc="pc", npc="eliza"})
		saynn("You release her throat.. and watch Eliza gasp for a full, deep breath.")

		saynn("She blinks rapidly, the fog in her eyes clearing.")

		saynn("[say=pc]"+str(ch1("Submit.", "You liked it. Submit, whore.", "You're a mess, Quinn. A hot, wet mess. Submit to me."))+"[/say]")

		saynn("She is still busy.. breathing. Her blush slowly starts to fade.")

		saynn("[say=eliza]You.. thought that some light choking.. is enough to break me?.. H-hhah..[/say]")

		saynn("She is still rebellious it seems.")

		saynn("Whatever.")

		saynn("You get up and let her be.")

		addButton("Continue", "See what happens next", "endthescene")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	setState(_action)
