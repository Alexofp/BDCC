extends SceneBase

func _init():
	sceneID = "DrugDenKidlat3Scene"

func _run():
	if(state == ""):
		addCharacter("kidlat", ["naked"])
		playAnimation(StageScene.Duo, "stand", {npc="kidlat", npcAction="sit", npcBodyState={naked=true}})
		saynn("You follow the tunnels, scanning the dimly-lit walls.. until you spot a familiar shape up ahead. Somehow you always manage to bump into her.")

		saynn("Kidlat is sitting on one of the broken crates, her cardboard box somewhere out of view. She is still naked, her black and cyan fur glinting faintly in the low light. She looks tired.")

		saynn("At the sound of your footsteps, her ears twitch.. and her eyes instinctively snap up to meet yours.")

		saynn("[say=kidlat]Oh. If it ain't my favorite perv~. Came for another show?[/say]")

		saynn("You don't say anything. Instead, you pull out a familiar bundle of black fabric with lilac trims.")

		saynn("Kidlat sees it.. and freezes. Her cyan-and-purple eyes widen as you hold the uniform out toward her. She doesn't take it right away.")

		saynn("[say=kidlat]How.. Why would you..[/say]")

		saynn("[say=pc]Pretty sure it's yours. Take it.[/say]")

		saynn("Her voice catches a little. When she finally takes the uniform, her fingers brush yours, her touch warm.. and much softer than you'd expect.")

		saynn("[say=kidlat]Bloody hell..[/say]")

		saynn("Her ears flick low while she stares at the bundle in her paws.")

		saynn("[say=pc]Something is wrong? It might be damaged a little but I tried not to add to that.[/say]")

		saynn("[say=kidlat]No.. I mean.. I just figured I wasn't worth the trouble.[/say]")

		saynn("[say=pc]It wasn't too hard to track it down, these junkies will spew anything out when they're high.[/say]")

		saynn("She blinks a few times, looking all small and shy.")

		saynn("[say=kidlat]Hey.. you probably expect somethin' in return? I can.. uh.. anything you want. I can.. on my knees.. or.. you know.. against a wall.. uh.. how do you want to..[/say]")

		saynn("Her cheeks are burning with cyan.. She mutters to herself..")

		saynn("[say=kidlat]..fuck, I sound like such a weird slut..[/say]")

		saynn("You decide to stop her before she humiliates herself too much.")

		saynn("[say=pc]You don't owe me anything, Kidlat.[/say]")

		saynn("Her tail flicks nervously behind her. The silence insures. She tugs the uniform to her chest, pressing the fabric close.")

		saynn("A moment of peace.. in the middle of hell.")

		saynn("You hear quiet purring..")

		saynn("[say=kidlat]You really are something, luv.[/say]")

		addButton("Continue", "See what happens next", "kidlat_dresses")
	if(state == "kidlat_dresses"):
		addCharacter("kidlat")
		playAnimation(StageScene.Duo, "stand", {npc="kidlat"})
		saynn("Kidlat puts her uniform on, covering herself up. There are some holes in it.. but nothing too major. The uniform fits her like a glove.")

		saynn("[say=kidlat]Thank you.[/say]")

		saynn("She takes a step forward, just a small one.. until there is barely any space between you. She looks up at you through her lashes, lips parted slightly.")

		saynn("[say=kidlat]Don't think this means I'm gonna stop teasin' you, though~.[/say]")

		saynn("You chuckle.. and give the cat a few pats on the head.")

		saynn("[say=pc]Do your worst.[/say]")

		saynn("She leans in even closer, your lips are about to touch.. but then she pulls away.")

		saynn("[say=kidlat]You're gonna buy something, luv~?[/say]")

		saynn("Of course.")

		addButton("Continue", "See what happens next", "start_browsing_shop")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "kidlat_dresses"):
		addMessage("Kidlat will now sell better items. Task updated!")

	if(_action == "start_browsing_shop"):
		getModule("DrugDenModule").regenerateKidlatItems()
		runScene("DrugDenKidlatShopScene")
		endScene()

	setState(_action)
