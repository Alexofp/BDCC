extends RecruitSceneBase

func _init():
	sceneID = "FerriRecScenePetplayDeny"

func _reactInit():
	putOn("ferri", "inmatewristcuffs")
	putOn("ferri", "basketmuzzle")

func _run():
	if(state == ""):
		addCharacter("ferri", ["naked"])
		aimCameraAndSetLocName("hideout_breakroom")
		playAnimation(StageScene.Duo, "stand", {npc="ferri", npcBodyState={naked=true}})
		saynn("You ask your team for some special restraints.. And get provided with them!")

		saynn("Then, you step inside the cell and see Ferri. She is still naked, cuffed, muzzled and leashed to the pipe. Good.")

		saynn("Her eyes lock onto you.")

		saynn("[say=ferri]Finally.. Took you long enough. Unlock me.[/say]")

		saynn("You just hold up the puppy restraints that you've got. It looks like a set of black leather caps that would go onto someone's elbows and knees.")

		saynn("[say=ferri]No! Mew.. I'm not wearing that.[/say]")

		saynn("[say=pc]"+str(ch1("You don't have a choice. You will wear this.", "You will, slut.", "You'll wear what I tell you to wear, bitch."))+"[/say]")

		saynn("Ferri bares her fangs more behind the muzzle. They click against the metal basket.")

		saynn("[say=ferri]Make me, meanie![/say]")

		addButton("Continue", "See what happens next", "ferri_flops")
	if(state == "ferri_flops"):
		playAnimation(StageScene.Duo, "stand", {npc="ferri", npcAction="defeat", npcBodyState={naked=true, leashedBy="pc"}})
		saynn("You grab her leash and pull her towards the center of the cell. She tries to jerk away but you just yank harder, causing her to collapse.")

		saynn("[say=ferri]Grr-r.. EEP![/say]")

		saynn("She flops awkwardly, her tail slams against the floor. It looks like the legs are gonna be easier to restrain so you start with them.")

		saynn("Ferri squirms and kicks, her tail whipping your arm. You ignore it, forcing the leather restraints onto her knees, making it so her rear paws are pressed against her butt.")

		saynn("[say=ferri]I will bite you so hard![/say]")

		saynn("Not with that muzzle she won't.")

		saynn("Her arms are next. You take off her cuffs and quickly bind her before she does too much scratching. Perfect.")

		addButton("Continue", "See what happens next", "ferri_all_fours")
	if(state == "ferri_all_fours"):
		playAnimation(StageScene.PuppyDuo, "stand", {pc="pc", npc="ferri", npcAction="walk", npcBodyState={naked=true, hard=true, leashedBy="pc"}})
		saynn("Now that you're done, you pull Ferri to the center of the cell, away from the wall. Her new restraints force her to crawl, on her elbows and knees, with her ass lifted, her tail lagging behind.")

		saynn("[say=ferri]This is humiliating.. mew..[/say]")

		saynn("[say=pc]"+str(ch1("That's the point. It will get better.", "Good. You look cute when you're humiliated.", "Humiliating? You look like a breeding bitch on display."))+"[/say]")

		saynn("You circle behind her. Her tail swishes nervously. You reach down and run a finger along the outside of her cute cyan pussy. She flinches.")

		saynn("[say=ferri]Hey.. Don't touch there..[/say]")

		saynn("[say=pc]"+str(ch1("I'll touch wherever I want. You're my puppy now.", "Too bad. Your wet cunt says otherwise.", "Shut up. This is happening."))+"[/say]")

		addButton("Continue", "See what happens next", "pc_touches_ferri")
	if(state == "pc_touches_ferri"):
		playAnimation(StageScene.PuppySexStart, "start", {pc="pc", npc="ferri", npcBodyState={naked=true, hard=true, leashedBy="pc"}})
		saynn("You rub her outer folds slowly. Ferri already seems to be a little damp from the stress.. or maybe from the puppy restraints. Her hips twitch.")

		saynn("[say=ferri]Mow..[/say]")

		saynn("Your finger finds her clit.. small and hard. You flick it left and right gently.")

		saynn("[say=ferri]Hhhnn..[/say]")

		saynn("[say=pc]"+str(ch1("Feel good? Tell me.", "That's right. Let me hear you.", "You're already dripping. Fucking slut."))+"[/say]")

		saynn("You circle her clit with your thumb while two of your fingertips get between her folds and just spread them. She looks wet and warm, her love tunnel walls already trying to clench around nothing.")

		saynn("[say=ferri]Nn..[/say]")

		saynn("Her tail goes out of the way completely, her resistance seems to be going down a little.")

		saynn("You push one finger inside her and wiggle it inside.")

		saynn("[say=ferri]Eep..[/say]")

		saynn("It doesn't take long before you add a second one. She gasps behind the muzzle. You curl your digits downward, pressing against her front wall, trying to find her pleasure spot.")

		saynn("[say=ferri]Mew.. Mnngh..[/say]")

		saynn("While she is completely helpless like this.. you start a rhythm.. sliding your fingers in and out, your thumb rubbing her clit with every thrust. Her breathing quickly gets heavier.")

		saynn("Her hips start moving on their own, rocking back into your hand, her chin gets lowered, her ears go flat.")

		saynn("[say=pc]"+str(ch1("There she goes. Getting into it.", "Look at you. Grinding on my fingers like a bitch in heat.", "Pathetic. You're already humping the air."))+"[/say]")

		saynn("[say=ferri]Shush.. mew..[/say]")

		saynn("But she doesn't stop. Her pussy gets wetter.. you can even hear the soft, slick sounds with every pump.")

		saynn("You feel her walls begin to flutter. She is getting close.")

		saynn("[say=pc]"+str(ch1("Not yet. You don't get to cum.", "Stop. You're not allowed to cum.", "No. Hold it, whore."))+"[/say]")

		saynn("You pull your fingers out completely.")

		saynn("[say=ferri]What?.. why..[/say]")

		saynn("She tries her best to look behind her, at you, her pussy dripping onto the floor.")

		saynn("[say=pc]"+str(ch1("Because I said so. Beg first.", "Because you don't deserve it yet. Not until you ask nicely.", "Because I decide when you come. Not you."))+"[/say]")

		saynn("[say=ferri]That's stupid! Let me cum![/say]")

		saynn("[say=pc]"+str(ch1("Not with that attitude. Try again.", "No. Try begging like a good puppy.", "Stupid brat. You don't give orders here."))+"[/say]")

		saynn("She growls, her tail lashes.")

		saynn("[say=ferri]Meanie![/say]")

		saynn("[say=pc]"+str(ch1("Hate me all you want. You're still not cumming.", "Good. Hate me. It won't help.", "Cry about it, slut. I will just deny you harder."))+"[/say]")

		saynn("You wait. She glares at you. Then her eyes drop.")

		saynn("[say=ferri]..please?[/say]")

		saynn("[say=pc]"+str(ch1("Please what? Use your words.", "Please what, puppy? Say it clearly.", "Please what? You want to cum like a dumb animal?"))+"[/say]")

		saynn("[say=ferri]Please.. let me cum.. mew..[/say]")

		saynn("Her voice is smaller now, her tail wags once.")

		saynn("You reach down and rub her clit again. Slowly, you slide your fingers back inside her. She is so wet now.. her fur is soaked. You ramp up the pace and finger-fuck her fast and hard.")

		saynn("[say=ferri]Mmhh.. ah.. yes.. ahh..[/say]")

		saynn("Her hips buck, her body squirms, her tail goes out of the way and rests on the floor. Her breathing gets ragged again, her noises filling the room.")

		saynn("[say=ferri]Please.. mew.. please don't stop.. I will do anything..[/say]")

		saynn("[say=pc]"+str(ch1("I'll stop whenever I want.", "Maybe I'll let you. Maybe I won't.", "Beg better and maybe."))+"[/say]")

		saynn("[say=ferri]I will be your good puppy.. I will never fight.. please..[/say]")

		saynn("You feel it.. her orgasm is building. Her whole body tenses, her mouth opens wide, tongue drooling, her eyes roll back. Her pussy is getting very tight again around your digits.")

		saynn("And that's.. when you pull your digits away again. Poor dracat is quick to realize that, her body thrashing against the restraints.")

		saynn("[say=ferri]I hate you! You're so mean! Ahh..[/say]")

		saynn("She collapses onto her side, her tail still thrashing, her pussy clenching around nothing, still dripping juices. Her heat begins to die down.. slow and painfully..")

		saynn("[say=ferri]Hufff.. Mow.. Fuck you..[/say]")

		saynn("[say=pc]"+str(ch1("Watching you break is better than making you cum.", "You don't deserve to cum, slut. Not tonight.", "Because your desperation is funnier than your orgasm."))+"[/say]")

		saynn("Lonely tears appear under her eyes. Her body trembles.")

		saynn("[say=ferri]Mow.. please.. I need..[/say]")

		saynn("[say=pc]"+str(ch1("You need to learn to obey my every word. That's what you need. Understand?", "You need to learn your place. Below me. Always. You're a slut.", "You need to accept that you're a worthless, dripping mess. Learn your place, bitch."))+"[/say]")

		saynn("She just huffs and gives up, her arousal long gone by now.")

		saynn("[say=ferri]Meanie.. such a meanie..[/say]")

		saynn("You take off the puppy gear and put her cuffs back on.")

		saynn("It sure didn't look like she liked any of that.")

		saynn("But it's time to see what Kait thinks. You leash Ferri to the pipe and step out of the cell.")

		addButton("Continue", "See what happens next", "endstuffmeow")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "ferri_all_fours"):
		putOff("ferri", "inmatewristcuffs")

	if(_action == "endstuffmeow"):
		putOn("ferri", "inmatewristcuffs")
		endScene()
		return

	setState(_action)
