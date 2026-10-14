extends SceneBase

func _init():
	sceneID = "DomSM3"

func _run():
	if(state == ""):
		addCharacter("announcer")
		playAnimation(StageScene.Duo, "stand", {npc="announcer"})
		saynn("[say=pc]So what happened to the Earth? Did AlphaCorp capture it, just like all the other planets?[/say]")

		saynn("[say=announcer]AlphaCorp? Even AlphaCorp didn't want to touch that mess of a planet.[/say]")

		saynn("[say=pc]And yet you're still here somehow.[/say]")

		saynn("[say=announcer]Yeah, well. We had to escape the Earth. Me and my girls.[/say]")

		saynn("[say=pc]What happened?[/say]")

		saynn("[say=announcer]Wars happened, of course. We were growing.. but the civilized world had only so much space in it. The upper cats didn't like the underdogs entering the arena.[/say]")

		saynn("[say=pc]The arena having no rules didn't help I assume.[/say]")

		saynn("[say=announcer]There must always be rich countries and poor countries. I think that's called harmony. Anyone who tried to mess with that balance was met with.. resistance.[/say]")

		saynn("[say=pc]So what did the poor countries do?[/say]")

		saynn("[say=announcer]They tried to become rich. When that didn't work out, they just made others poor instead. Destroying is much easier than creating.[/say]")

		saynn("[say=pc]That's one way to level the playing field. And how did they do that? Nukes?[/say]")

		saynn("[say=announcer]A few nukes wouldn't change the status quo. But the world is full of smart people. Smart and evil people.[/say]")

		saynn("[say=announcer]Why nuke a town and kill a few million.. when you can nuke a little weak point and kill billions instead.[/say]")

		saynn("[say=pc]A weak point?[/say]")

		saynn("[say=announcer]The whole world depends on trade. Exchange of goods and services is how we managed to grow so much. Make a few choke-points into a radioactive no-mans-land for twenty years.. and your money is suddenly worthless, you can't buy anything with it.[/say]")

		saynn("[say=pc]Surely the countries can support themselves still, even without global trade?[/say]")

		saynn("[say=announcer]They can, kinda. Their quality of life would have to drop of course. Heavily. People really didn't like it when they realized that they would suddenly have to live like poor people. Your average folk started fighting for what little scraps of normal life that were left. The rich people took what they could.. and peaced out on their private rockets.[/say]")

		saynn("[say=pc]Were you rich?[/say]")

		saynn("[say=announcer]A rich person wouldn't be a pimp, hah. I am the underdog that managed to make it out. For better or for worse.[/say]")

		saynn("[say=pc]Welcome to space.[/say]")

		saynn("[say=announcer]Thanks, it's very cozy up here. I've been looking around. I don't know if you noticed it yet. But you're living in a post-money society.[/say]")

		saynn("[say=pc]Mm? What does that mean?[/say]")

		saynn("[say=announcer]Nobody has any. Not a single bill. Except for, maybe, the president.[/say]")

		saynn("[say=pc]How am I able to buy something from a vendomat then?[/say]")

		saynn("[say=announcer]It's another huge story. I don't know if you want me to bore you so much.[/say]")

		saynn("[say=pc]Bore me all you want.[/say]")

		saynn("[say=announcer]From what I gathered.. You all share one giant debt between each other. You just exchange little pieces of it. Credits.[/say]")

		saynn("[say=pc]Sounds like normal money to me.[/say]")

		saynn("[say=announcer]You had normal money before. But then you lost it all to the corporation. And so they had to do something about that. They created credits. A stable currency, completely made up of course. The problem is, you all still have your debts.[/say]")

		saynn("[say=pc]And so no matter how many credits we have, we're still corporate slaves then?[/say]")

		saynn("[say=announcer]You will never be richer than your boss. Now multiply that a billion times. The upper class will always be shrinking. You took that to its extreme until there was only one rich person left. The person with all of the wealth of others. CEO of AlphaCorp.[/say]")

		saynn("[say=pc]That doesn't make sense. Why? What reason?[/say]")

		saynn("[say=announcer]Greed? I guess that's just who we are. We always want more.[/say]")

		saynn("[say=pc]Why would they sit on all that wealth alone? Why not share it.. or something.[/say]")

		saynn("[say=announcer]Oh, they share it, of course. With friends. With family. Friends of family. They can also exchange it for some power over you. Once you have all of the money, you begin to crave power too.[/say]")

		saynn("[say=pc]It looks like they got full control over us already.[/say]")

		saynn("[say=announcer]Not quite. Some of us are clearly still fighting. But when these people will lose.. and submit.. That's when it's gonna be over. All of it. Our whole world will just become a playground for a single person. We will probably start calling them a god. We will be clapping and cheering.. as they destroy the whole galaxy.. out of pure boredom.[/say]")

		saynn("[say=pc]Pretty grim.[/say]")

		saynn("[say=announcer]All things eventually come to an end. We should enjoy what little moments we have. Sorry if I brought your mood down, wasn't my intention.[/say]")

		saynn("[say=pc]You're good.[/say]")

		saynn("[say=announcer]Sometimes I get thoughts like that. Being part of your team helps. Can't help but to think that I'm being.. less than useful.. sometimes. It's eating me up inside.[/say]")

		saynn("[say=pc]You offered us a place to scheme. And your wisdom. We couldn't have done what we did without you. So, relax.[/say]")

		saynn("[say=announcer]Yeah? Right.[/say]")


func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	setState(_action)
