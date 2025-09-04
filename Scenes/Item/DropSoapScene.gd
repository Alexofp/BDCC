extends SceneBase

func _init():
	sceneID = "DropSoapScene"

func _run():
	if(state == ""):
		playAnimation(StageScene.Showering, "body", {pc="pc", bodyState={naked=true}})
		saynn("You were standing under a shower head, enjoying your time, relaxing.")

		saynn("You were about to rub the patented Bio-Scrub Soap into your skin.. when suddenly.. it slips out of your hand. Slippery bastard.")

		saynn("Oops. Looks like you just dropped your soap.")

		saynn("As you look down at it.. you feel something.. Like there is a shadow looming over you.")

		saynn("The running water is gradually melting the soap already, you gotta act fast!")

		addButton("Bend over", "Bend over to pick up the soap", "do_bend")
		addButton("Crouch", "Crouch and pick up the soap", "do_crouch")
		addButton("Leave it", "That soap is as good as gone", "leave_soap")
	if(state == "do_bend"):
		playAnimation(StageScene.Yoga, "dog", {pc="pc", bodyState={naked=true, hard=true}})
		saynn("You bend down toward the soap in the most exaggerated, dramatic way possible, arching your back, swaying your hips, drawing out every motion, putting all your private bits out on display.. your {pc.analStretch} tailhole.. "+str(" your pussy.." if GM.pc.hasReachableVagina() else "")+""+str(" your {pc.penis}" if GM.pc.hasPenis() else "")+"")

		saynn("You linger there, exposed, waiting.. for something to happen.")

		saynn("But the showers are silent.. except for the running water of course.")

		saynn("No footsteps.")

		saynn("Not even a gasp.")

		saynn("Not a single prison cliche in sight. Boring.")

		saynn("You wiggle. Then you wiggle harder. Still nothing.")

		saynn("Eventually, you get tired of waiting.. and just pick up the damn thing.")

		saynn("As you sigh audibly..")

		saynn("[sayOther]Were you expecting something else?[/sayOther]")

		saynn("You glance darts around the empty showers.")

		saynn("The fuck.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "do_crouch"):
		playAnimation(StageScene.Solo, "kneel", {bodyState={naked=true}})
		saynn("You eye the fallen soap.. your eyes watching it gleam under the shower spray.. Such an obvious trap, laid by fate itself.")

		saynn("A lesser fool would have bent here.. expose their cheeks to the breeze.. get caught and overwhelmed.. but not you.")

		saynn("No, you crouch. Knees bent, back straight, eyes sharp.")

		saynn("Like a tactical genius, you position your back towards the nearest wall, giving you an incredible level of defense. Your hand closes around the slippery bar with a grip of a master thief and leaves it no chance to escape.")

		saynn("You stand tall again, victorious, unviolated, unmocked.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "leave_soap"):
		playAnimation(StageScene.Showering, "body", {pc="pc", bodyState={naked=true}})
		saynn("You eye the soap on the floor.. the one that you have just dropped.")

		saynn("For a moment you consider bending over.")

		saynn("..but then you sigh, shake your head, and mutter to yourself.")

		saynn("[say=pc]Better safe than fucked.[/say]")

		saynn("You turn towards the exit.. and begin heading out, ready to accept the loss.")

		saynn("But then..")

		saynn("[sayOther]You're just gonna leave it?[/sayOther]")

		saynn("The sudden voice makes you do one-eighty in an instant.")

		saynn("The showers are empty. No one in sight.")

		saynn("[say=pc]Huh?[/say]")

		saynn("You blink.")

		saynn("The voice chuckles.")

		saynn("[sayOther]I mean.. this kind of soap is hard to come by. You just gonna let it melt away?[/sayOther]")

		saynn("A slight shiver crawls up your spine. It's as if.. the whole room is talking with you.")

		saynn("[say=pc]Where are you? Who's talking?[/say]")

		saynn("[sayOther]Does it matter? You're wasting your time, inmate.[/sayOther]")

		saynn("Inmate?.. Right.. wait.. You notice a camera in the corner of the room. Some guard must be talking with you through the intercom. That's why the voice is so weird.")

		saynn("[say=pc]If I pick it up, someone will obviously do a prank on me. You know the kind. Wait, are you recording this?[/say]")

		saynn("[sayOther]Uh.. no? But I see. That's a real dilemma you've got yourself caught in.[/sayOther]")

		saynn("No shit.")

		saynn("[sayOther]You can either let the soap rot and fade away under the constant stream of water.. or bend over.. and face the consequences of your own actions. A guaranteed loss.. or a risky gamble.[/sayOther]")

		saynn("That camera is totally here to spy on inmates dropping their soap.")

		saynn("[say=pc]And so? What should I do?[/say]")

		saynn("[sayOther]I'd say.. risk it? The combined return value of that action feels higher.[/sayOther]")

		saynn("[say=pc]And what are you gonna do with the tape? Blackmail me? Sell it on the intranet? Or you're just gonna jerk off to it yourself?[/say]")

		saynn("The echo-y room chuckles at you.")

		saynn("[sayOther]You think that I'm here to take advantage of you? Is that what you're worried about?[/sayOther]")

		saynn("[say=pc]Yeah. Maybe you even have someone ready behind the corner. When I will bend over, you will give them a signal to storm in. Whatever you say, it won't change my decision. I can't trust a single person in this prison.[/say]")

		saynn("You hear.. no answer. Maybe you have just cracked their plan and they have nothing to say.")

		saynn("Either way, it's best to leave now. That soap is as good as gone.")

		addButton("Continue", "See what happens next", "sudden_tentacles")
	if(state == "sudden_tentacles"):
		playAnimation(StageScene.TentaclesTease, "tease", {pc="pc", npc="pc", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("Suddenly.. from the drain itself.. something stirs.")

		saynn("Pipes groan.. Metal shudders.")

		saynn("A slick, coiling shape pushes its way up through the grate.. shiny and dripping.. a tentacle..")

		saynn("You stumble back, your eyes wide.")

		saynn("The creature emerges further, revealing more of its tentacles to your shocked gaze.")

		saynn("Before you know, one of the tentacles grabs the soap off of the floor and offers it to you.")

		saynn("[sayOther]I'm a monster. But I'm not that kind of monster.[/sayOther]")

		saynn("The voice.. it talks by vibrating its smaller tentacles. Holy shit.")

		saynn("With a delicate precision, another latex tentacles carefully lifts and opens your hand.. just so the first tentacle can place the soap into it.")

		saynn("[sayOther]Here you go.[/sayOther]")

		saynn("You stare at the drippy, slimy appendage.")

		saynn("Awkward silence.")

		saynn("[say=pc]T-Thanks..[/say]")

		saynn("The tentacles wiggle cheerfully.. and then withdraw back into the drain.")

		saynn("And just like that.. it's gone.")

		saynn("You're left alone in the shower.. clutching your reclaimed soap.")

		addButton("Continue", "See what happens next", "endthescene")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		playAnimation(StageScene.Showering, "body", {pc="pc"})
		return

	setState(_action)
