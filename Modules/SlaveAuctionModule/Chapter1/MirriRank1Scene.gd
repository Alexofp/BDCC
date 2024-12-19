extends SceneBase

func _init():
	sceneID = "MirriRank1Scene"

func _run():
	if(state == ""):
		addCharacter("mirri")
		playAnimation(StageScene.Duo, "stand", {npc="mirri"})
		saynn("Excited, Mirri grabs you by the collar and yanks you towards the laptop.")

		saynn("[say=mirri]Look! Did you see?[/say]")

		saynn("[say=pc]See what?[/say]")

		saynn("There is some kind of web interface on the screen.. that shows a leaderboard of sorts. Mirri's name is in there.. pretty low. You notice that the top people are all from Blacktail.")

		saynn("[say=mirri]See that? Mirri Blacktail. Rank 1! I am not zero anymore![/say]")

		saynn("[say=pc]Is that good?[/say]")

		saynn("She instantly frowns and pokes you with her claws.")

		saynn("[say=mirri]Is that good? Of course that's good, you dummy! Well, it's kinda shit rank still.. but you know! It just shows that I'm not a complete failure![/say]")

		saynn("She couldn't have done it without you.")

		saynn("[say=pc]Well, you're welcome.[/say]")

		saynn("Mirri puts the laptop away and puts on a cute smile, her eyes have that naive tint to them.")

		saynn("[say=mirri]You did great too, especially for a lowlife AlphaCorp slave. You know, {pc.name}.. I think I have developed feelings for you..[/say]")

		saynn("She advances towards you, her paws reaching out.. which makes you instinctively back away.")

		saynn("But Mirri just pounces towards you and grabs your collar.")

		saynn("[say=pc]The fuck are you talking about.[/say]")

		saynn("[say=mirri]I think I love you..[/say]")

		saynn("Great, a crazy Syndicate agent is exactly the kind of lover that you need in life.")

		saynn("[say=pc]Uh.. cool.[/say]")

		saynn("Her softness instantly goes away, her tail puffs up, her free paw pressing its claws against your throat..")

		saynn("[say=mirri]Cool? COOL? You know what is actually cool?! Your heart![/say]")

		saynn("[say=pc]Baby, you're rushing things a little too fast.[/say]")

		saynn("Mirri tilts her head and leans in close, her lips almost touching yours, her voice a seductive purr now..")

		saynn("[say=mirri]Life is so short, you know.. I worry about you all the time, you could die anyday when I'm not around.. What bitches are you fucking with, tell me every name, I can smell their scents on you.. Give me the fucking list..[/say]")

		saynn("Wow, this girl is going zero to sixty and back around..")

		saynn("[say=pc]Mirri, I just want credits.[/say]")

		saynn("She pouts and pushes you away.")

		saynn("[say=mirri]You have much to learn about what true love is, {pc.name}..[/say]")

		saynn("Her eyes see the laptop.")

		saynn("[say=mirri]But you're right![/say]")

		saynn("She opens the laptop again and shows you some files. Looks like.. camera recordings of your recent auctions? It's hard to see much because of how dim the lighting is near the bidders.. probably by design.")

		saynn("[say=mirri]We gotta start expanding! The current setup we have is dogshit. We need a nicer stage, better seats for the bidders, better cameras, hidden microphones everywhere..[/say]")

		saynn("You can understand why you'd want to make the environment look and feel better for the bidders.. but the rest..")

		saynn("[say=pc]Cameras? Microphones? Why?[/say]")

		saynn("[say=mirri]To gather more intel. The more we know about the bidders, the more.. targeted..  we can make our auctions. The more credits you and I can earn![/say]")

		saynn("Makes sense. Reminds you of all the targeted ads that the global cyberspace has.")

		saynn("[say=mirri]We're gonna squeeze this world for its every last penny.[/say]")

		saynn("[say=pc]Alright, that's a plan.[/say]")

		saynn("[say=mirri]That's the best plan.[/say]")

		saynn("Anything beats being chained up on that stage yourself.")

		saynn("[say=mirri]Keep me impressed, {pc.name}~. Tell me if you think that we should start upgrading the Market.[/say]")

		addButton("Continue", "See what happens next", "endthescene")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	setState(_action)
