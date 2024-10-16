extends SceneBase

func _init():
	sceneID = "MirriTalkScene"

func _run():
	if(state == ""):
		addCharacter("mirri")
		playAnimation(StageScene.Duo, "stand", {npc="mirri"})
		saynn("You approach Mirri. The catgirl is eyeing you out.")

		saynn("[say=mirri]"+str(getModule("SlaveAuctionModule").getMirriGreeting())+"[/say]")

		saynn(""+str(getModule("SlaveAuctionModule").getRepInfoString())+"")

		addButton("Sell Slave", "Sell one of your slaves on a slave auction", "sell_menu")
		addButton("Talk", "Ask her a few things", "chat_menu")
		addButton("Sex", "See if you can get a little kinky with her", "sex_menu_check")
		addDisabledButton("Upgrades", "You don't access to this yet")
		addButton("Leave", "Enough talking", "endthescene")
		GM.ES.triggerRun(Trigger.TalkingToNPC, ["mirri"])
	if(state == "chat_menu"):
		saynn("What do you wanna ask Mirri?")

		addButton("Wolf", "Who is that wolf with glowing black and gold fur", "ask_luxe")
		addButton("BDCC", "Ask her about how she stumbled upon the AlphaCorp prison", "ask_bdcc")
		addButton("Blacktail", "Ask her about her family", "ask_blacktail")
		addButton("Slaves", "Ask her about why she enslaves people", "ask_slaves")
		addButton("Collar", "Ask about them possible removing your collar", "ask_collar")
		addButton("Catgirl", "Ask her about her species", "ask_catgirl")
		addButton("Back", "Enough questions..", "")
	if(state == "ask_luxe"):
		saynn("[say=pc]That wolf.. with the black and gold fur. Who is he?[/say]")

		saynn("Mirri rolls her eyes.")

		saynn("[say=mirri]That's my dad.[/say]")

		saynn("That.. wasn't very obvious.. all things considered.")

		saynn("[say=pc]You don't seem particularly happy about that.[/say]")

		saynn("[say=mirri]Uh huh. If he'd hear me tell you that I'd be dead already. Or worse.[/say]")

		saynn("That's one way to parent.")

		addButton("Continue", "See what happens next", "chat_menu")
	if(state == "ask_bdcc"):
		saynn("[say=pc]How did you stumble upon BDCC?[/say]")

		saynn("[say=mirri]Is that what your stupid giant hamster cage called? Hah, didn't know.[/say]")

		saynn("She didn't even know the prison's name..")

		saynn("[say=mirri]I just scanned the whole dimension.[/say]")

		saynn("[say=pc]That's.. how is that even possible?[/say]")

		saynn("[say=mirri]I guess I'm just that smart~.[/say]")

		saynn("[say=pc]You're not gonna tell me how?[/say]")

		saynn("She shakes her head.")

		addButton("Continue", "See what happens next", "chat_menu")
	if(state == "ask_blacktail"):
		saynn("[say=pc]So you are.. Blacktail.[/say]")

		saynn("Mirri nods.")

		saynn("[say=mirri]Yeah. One of the Syndicate families. One of the most important ones.[/say]")

		saynn("[say=pc]Syndicate families?[/say]")

		saynn("She tilts her head, annoyed tones hiding in her voice.")

		saynn("[say=mirri]Yeah? You've been living under a rock or something?[/say]")

		saynn("[say=pc]More like, attached to a rock.[/say]")

		saynn("Mirri giggles softly.")

		saynn("[say=mirri]Oh, right, AlphaCorp thinks asteroid belts can protect their stupid silly space stations. Their brains are so one-dimensional.[/say]")

		saynn("[say=pc]Seems to work for them for now.[/say]")

		saynn("She shrugs.")

		saynn("[say=mirri]Syndicate is not a single entity. Syndicate is just many families under the same goal. Having many heads is better than one silly dictator. Brains over brute force, that was always our way.[/say]")

		saynn("[say=pc]And why is Blacktail one of the most important Syndicate families?[/say]")

		saynn("[say=mirri]Cause we enslave people, duh.[/say]")

		saynn("She has a point. But you're not sure if you see it.")

		saynn("[say=mirri]It's fun. And it pays well.[/say]")

		saynn("Interesting.")

		addButton("Continue", "See what happens next", "chat_menu")
	if(state == "ask_slaves"):
		saynn("[say=pc]Why are you.. selling slaves?[/say]")

		saynn("Mirri blinks, genuinely confused at your question.")

		saynn("[say=mirri]Are you dumb or something? I'm Blacktail.[/say]")

		saynn("[say=pc]So?[/say]")

		saynn("[say=mirri]SO? Yeah, I was right. You are just very-very..[/say]")

		saynn("You decide to cut her off before she insults you even more.")

		saynn("[say=pc]Listen. I know who you are. I know what your family does. I don't care that Blacktail is known for trading slaves. Why are YOU doing this?[/say]")

		saynn("Mirri shuts up and frowns at you, her claws are visible out.")

		saynn("[say=mirri]Fuck you. I do this for the credits and pleasure. Happy now, fucker?[/say]")

		saynn("[say=pc]Why not do something else?[/say]")

		saynn("Suddenly, she pulls her gun out and presses it against your skull. Ohh, the cat got very angry. An audible click makes your blood freeze.")

		saynn("[say=mirri]You're saying that I suck at this? That I should just give up? Yeah, fucker?[/say]")

		saynn("[say=pc]No, I don't.[/say]")

		saynn("Her mean eyes have that predator glow in them, her tail wagging aggressively.")

		saynn("[say=mirri]But you're implying that.[/say]")

		saynn("She pushes the gun more into your head, the barrel leaving a little circular imprint on above your brow already. Better not to push her further now..")

		saynn("[say=pc]Relax, Mirri, please. You're a good slaver, the best one that I know.[/say]")

		saynn("Mirri smiles, her cheeks receive a faint red glow.")

		saynn("[say=mirri]Well thank you, you're such a nice {pc.boy}.[/say]")

		saynn("She decides to put her gun away.")

		saynn("[say=pc]..you're welcome..[/say]")

		addButton("Continue", "See what happens next", "chat_menu")
	if(state == "ask_collar"):
		saynn("[say=pc]I have this collar on my neck.[/say]")

		saynn("[say=mirri]I've noticed, I like it a lot.[/say]")

		saynn("[say=pc]Yeah, sure. Can you or someone else.. help me remove it?[/say]")

		saynn("Mirri takes a closer look.")

		saynn("[say=mirri]Huh.[/say]")

		saynn("She grabs you by the collar and pulls closer. You can feel her warm breath on your chest as she closely inspects the device.")

		saynn("[say=mirri]Nope. It would be easier to cut your head off. Should I?[/say]")

		saynn("[say=pc]I'm good.[/say]")

		saynn("[say=mirri]It's a different design, I have no idea how to break this one. Looks like your shithole is really worried about the security of its fucktoys. Wrong priorities if you'd ask me.[/say]")

		saynn("[say=pc]I guess.[/say]")

		saynn("[say=mirri]I can see the bluespace transmitter. The thing is relaying its position constantly.[/say]")

		saynn("Does that mean what you think it means?")

		saynn("[say=mirri]You're lucky we have a jammer installed. Otherwise you'd be dead already.[/say]")

		saynn("[say=pc]Wait. But the jammer only covers this..[/say]")

		saynn("You realize that you have no idea if you're on a space station.. or on a planet.. you could be anywhere..")

		saynn("[say=pc]This.. place?[/say]")

		saynn("[say=mirri]Mhm.[/say]")

		saynn("[say=pc]So.. the slaves that you sell..[/say]")

		saynn("[say=mirri]Syndicate isn't stupid. Bluespace might be novel to you but it's a commodity here. Everyone has jammers.[/say]")

		saynn("Necessity pushes the progress forward..")

		saynn("[say=mirri]And if someone doesn't and AlphaCorp frees them.. that's their problem. I'm totally okay with enslaving and selling someone for the second time~.[/say]")

		addButton("Continue", "See what happens next", "chat_menu")
	if(state == "ask_catgirl"):
		saynn("You focus your curious eyes on her black fur..")

		saynn("[say=pc]Interesting.. pattern.. for a human.[/say]")

		saynn("Mirri shrugs, her tail wagging a bit.")

		saynn("[say=mirri]Yes, I know, I know, I'm a hybrid and everything.[/say]")

		saynn("Her feline ears flick. Huh. That ponytail that she has is hiding something interesting.")

		saynn("[say=mirri]Just call me what I am. A catgirl.[/say]")

		saynn("A question lingers in your mind..")

		saynn("[say=pc]I'm curious.. Do you..[/say]")

		saynn("[say=mirri]..purr during sex? Only one way to find out~.[/say]")

		saynn("[say=pc]That's.. alright. but I had a different question.[/say]")

		saynn("Mirri giggles.")

		saynn("[say=pc]Do you have two pairs of ears?[/say]")

		saynn("She stops giggling and starts coughing instead.")

		saynn("[say=mirri]..really? That's what you're curious about?[/say]")

		saynn("You nod.")

		saynn("[say=mirri]Curiosity.. murdered the cat.[/say]")

		saynn("Looks like you're not gonna get the answer for that question..")

		addButton("Continue", "See what happens next", "chat_menu")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "sell_menu"):
		runScene("SlaveAuctionGenericSellScene")
		endScene()
		return

	if(_action == "sex_menu_check"):
		setState("sex_menu")
		return

	if(_action == "ask_luxe"):
		processTime(5*60)

	if(_action == "ask_bdcc"):
		processTime(5*60)

	if(_action == "ask_blacktail"):
		processTime(5*60)

	if(_action == "ask_slaves"):
		processTime(5*60)

	if(_action == "ask_collar"):
		processTime(5*60)

	setState(_action)
