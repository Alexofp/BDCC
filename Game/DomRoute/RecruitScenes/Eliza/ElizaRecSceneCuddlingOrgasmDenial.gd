extends RecruitSceneBase

func _init():
	sceneID = "ElizaRecSceneCuddlingOrgasmDenial"

func _reactInit():
	getCharacter("eliza").getInventory().clearSlot(InventorySlot.Body)
	putOn("eliza", "LatexStraitjacket")
	putOn("eliza", "oldcollar")

func _run():
	if(state == ""):
		addCharacter("eliza", ["naked"])
		aimCameraAndSetLocName("hideout_breakroom")
		playAnimation(StageScene.Duo, "stand", {npc="eliza"})
		saynn("You need a little toy for this.. so you prepare one ahead of time.")

		saynn("Then, you step inside the cell and look at Eliza Quinn. She is standing still, her collar leashed to the pipe above her, preventing her from most things. She can't even sit on a chair that's here.")

		saynn("Her tits are still out.. and her eyes are still really angry.")

		saynn("[say=pc]"+str(ch1("...", "Hey there, Quinn.", "You look like one of us. Little slut."))+"[/say]")

		saynn("[say=eliza]Grrr-r..[/say]")

		saynn("Her tail wags annoyed. She struggles against the straitjacket, making the shiny material creak.")

		saynn("[say=pc]"+str(ch1("...", "Relax, slut. I'm not gonna hurt you today.", "What's the matter? Cat got your tongue?"))+"[/say]")

		saynn("You walk over to the pipe and reach up to it, to loose the chain a little. Then you embrace Eliza and pull her down onto the floor!")

		addButton("Cuddle her", "Do the cuddles!", "do_cuddle")
	if(state == "do_cuddle"):
		playAnimation(StageScene.Cuddling, "idle", {pc="pc", npc="eliza"})
		saynn("She tries to pull away but you're stronger.")

		saynn("[say=eliza]What the hell are you doing?[/say]")

		saynn("You wrap your arms around her, making it so there are now two sets of arms hugging her.")

		saynn("[say=pc]"+str(ch1("...", "Shut up and take it, cuddle-slut.", "Shush, cuddle-slut."))+"[/say]")

		saynn("She still squirms but you hold her tight. Her tail lashes angrily.")

		saynn("[say=eliza]You're wasting your time.[/say]")

		saynn("No. You got plenty of time actually. You let your hands wander a little more, sliding down her hips and sneaking between her legs. The chastity belt is there, still. You tug on it a little.")

		saynn("[say=eliza]It's very cute of you to put this thing on me. It won't break me, obviously.[/say]")

		saynn("That's okay, the belt is only there because it was on Kait previously.")

		saynn("You pull out the thing that you prepared. A little pink egg-shaped vibrator. Before the feline has time to react to it, you bring it down to the belt and press it into the slit between her crotch and the cold metal. There was just enough space to slip it in.")

		saynn("The toy is now pressed tightly against her clit, trapped under the chastity belt.")

		saynn("[say=eliza]Wow. Such a royal treatment.[/say]")

		saynn("[say=pc]"+str(ch1("...", "Shhh. Just relax and enjoy it, slut.", "Yeah, you don't deserve it. Now shut up and enjoy it."))+"[/say]")

		saynn("You use a little remote to turn the vibrator on. The low rumbly noise quickly fills the cell.")

		saynn("[say=eliza]Mmh..[/say]")

		saynn("You've set it to a low mode.. just teasing the cat. Your hands return to hugging the feline, your palms cover her exposed breasts and gently knead them.")

		saynn("The vibrations.. coupled with your hands.. make Eliza bite her lip. Her breathing gets a little deeper.")

		saynn("[say=pc]"+str(ch1("...", "Feel that? Good.", "You've been quiet, little pillow."))+"[/say]")

		saynn("[say=eliza]Mhhm.. Toys feel good, what can I say..[/say]")

		saynn("She just earned a pinch of her nips.")

		saynn("[say=eliza]h.. fuck you~.[/say]")

		saynn("She is trying to stay still, trying to avoid giving you any satisfaction. So you turn the dial up, making the toy vibrate louder.")

		saynn("[say=eliza]H..h..ng-..[/say]")

		saynn("She bites her lip again, trying to keep quiet. You notice small, subtle movements of her hips.. like she is trying to press the chastity belt against the floor so she can grind against the toy.")

		saynn("[say=pc]"+str(ch1("...", "Let it out, slut. I want to hear you.", "You're holding back so hard. Cute. And pathetic."))+"[/say]")

		saynn("Eliza is visibly twitching more and more.. her nips have gotten fully stiff under your palms. The scent of a horny feline is reaching your nose now.")

		saynn("If she is gonna play that game.. might as well increase the pressure.")

		addButton("Continue", "See what happens next", "toy_full_speed")
	if(state == "toy_full_speed"):
		playAnimation(StageScene.Cuddling, "squirm", {pc="pc", npc="eliza"})
		saynn("You turn the toy's strength to its max. Loud, high-pitched vibrations begin spreading from Eliza's crotch.")

		saynn("[say=eliza]Mhh-hh.. nhh~..[/say]")

		saynn("She throws her head back and lets out a breathy sigh. You can feel the tension building in her body, Eliza is now squirming in your hands, her breathing turning into short, sharp gasps.")

		saynn("[say=eliza]Mhh.. hh-..[/say]")

		saynn("You can feel it.. she is getting close.")

		saynn("[say=pc]"+str(ch1("...", "You gonna cum, slut? Gonna cum from just a little toy?", "You gonna cum, little worthless slut?"))+"[/say]")

		saynn("Right when you feel like she has reached the edge.. you decide that it's time.")

		saynn("You turn the little toy off, completely.")

		saynn("[say=eliza]Mhh.. w-wow.. Really? Ah..[/say]")

		saynn("She is still squirming against you, the straitjacket keeping her completely helpless. You hold her tight as she lets out noises of frustration.")

		saynn("[say=eliza]You couldn't.. mhh.. hold it for a second longer?..[/say]")

		saynn("[say=pc]"+str(ch1("Submit.", "If you wanna cum, you have to submit. Easy.", "You want to cum? You have to earn it. Start by submitting."))+"[/say]")

		saynn("Her whole body is trembling, you can feel the heat radiating from her.")

		saynn("Eliza is silent for a moment.. then.. she chuckles softly..")

		saynn("[say=eliza]The thing is.. mhh.. I find orgasm denial extremely hot.. Hah..[/say]")

		saynn("She is rubbing her thighs against each other, her lips producing little moans.")

		saynn("[say=eliza]Stealing someone's pleasure.. getting them so close.. mhh.. just to ruin it all.. I love that.. hah..[/say]")

		saynn("You're not touching her at all.. and yet.. her whole body is still tense. She closes her eyes.")

		saynn("[say=eliza]Ah.. ahh.. yes.. yess~..[/say]")

		saynn("She arches her back.. A long, cute moan escapes her as she suddenly cums.. Her whole body squirms against your hands.. and the straitjacket.. a little puddle of her juices collecting underneath the chastity belt.")

		saynn("[say=eliza]That felt good~.[/say]")

		saynn("What a bitch.")

		saynn("You pull the pink toy away from her clit.. and leave her be in the cell.")

		addButton("Continue", "See what happens next", "endthescene")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	setState(_action)
