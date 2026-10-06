extends RecruitSceneBase

func _init():
	sceneID = "ElizaRecSceneCuddlingDruguse"

func _reactInit():
	getCharacter("eliza").getInventory().clearSlot(InventorySlot.Body)
	putOn("eliza", "LatexStraitjacket")
	putOn("eliza", "oldcollar")

func _run():
	if(state == ""):
		addCharacter("eliza", ["naked"])
		aimCameraAndSetLocName("hideout_breakroom")
		playAnimation(StageScene.Duo, "stand", {npc="eliza"})
		saynn("Eliza had a certain.. drug.. in her pockets. Curious. You bring it with you into the cell.")

		saynn("You look at Eliza Quinn. She is standing still, her collar leashed to the pipe above her, preventing her from most things. She can't even sit on a chair that's here.")

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

		saynn("She squirms but you hold her tight. After about a minute, she stops struggling and gives up.")

		saynn("[say=eliza]There is filth everywhere, this sucks![/say]")

		saynn("[say=pc]"+str(ch1("...", "You're not above us, pussy cat. I know that you're using something.", "You're just as filthy, cat. I know that you're using."))+"[/say]")

		saynn("As your hand produces a tiny transparent bag that has some stuff inside it, Eliza's ears perk.")

		saynn("[say=eliza]..where did you get that?[/say]")

		saynn("[say=pc]"+str(ch1("...", "You're dumb, your stash wasn't hard to find.", "You're a druggie, Eliza."))+"[/say]")

		saynn("She avoids looking at it but you bring it to her face again and again.")

		saynn("[say=eliza]That's.. that's just catnip.. That's.. for my feline patients![/say]")

		saynn("Catnip huh. Patients.. let's see.")

		saynn("You open the bag. A subtle minty smell fills the air. As you bring it to Eliza's nose, she has no choice but to smell it.")

		saynn("Her emerald eyes go wide for a second.. and then dilate. Her body goes limp, all tension going away.")

		saynn("[say=eliza]..mhh.. rr-r..[/say]")

		addButton("Continue", "See what happens next", "eliza_rubs_against_you")
	if(state == "eliza_rubs_against_you"):
		playAnimation(StageScene.Cuddling, "squirm", {pc="pc", npc="eliza"})
		saynn("A low, rumbling purr starts in her chest. Subtly, she begins to rub herself against you. Her tail is swaying back and forth, gently.")

		saynn("[say=pc]"+str(ch1("...", "Good little slut.", "See? Not so tough now, are you, bitch?"))+"[/say]")

		saynn("She leans back and nuzzles your cheek, her purrs getting louder. Occasionally she shoves her muzzle into the bag of catnip to take another sniff that sends her back into this high state.")

		saynn("[say=eliza]Mrr-r~.. meow..[/say]")

		saynn("She is just a needy, drugged feline in your arms. It's nice to be watching her mewl and purr. She doesn't even seem to mind when your hands land on her exposed breasts, just resting there. You can really feel the vibrations there.")

		addButton("Continue", "See what happens next", "after_effect")
	if(state == "after_effect"):
		playAnimation(StageScene.Cuddling, "idle", {pc="pc", npc="eliza"})
		saynn("You hold her like that for a long time, just letting the catnip do its thing.")

		saynn("Eventually, the effect does start to fade. The fog in Eliza's eyes clears. She blinks.. and then starts trying to pull away again, her cheeks burning red.")

		saynn("[say=eliza]Forget this happened![/say]")

		saynn("[say=pc]"+str(ch1("There is more if you submit.", "That was just a taste. Submit if you want more.", "Imagine feeling that good every day. Be a good pet, and you'll get more."))+"[/say]")

		saynn("Eliza just sighs.")

		saynn("[say=eliza]Really? It'd be the same as before, but now with a collar around my neck. Wow, great, love it.[/say]")

		saynn("She says that with all the sarcasm she can force out of herself.")

		saynn("Oh well.")

		saynn("You get up and allow her to be.")

		saynn("[say=eliza]Leave the bag?..[/say]")

		saynn("You don't say anything.")

		saynn("[say=eliza]Screw you then![/say]")

		addButton("Continue", "See what happens next", "endthescene")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	setState(_action)
