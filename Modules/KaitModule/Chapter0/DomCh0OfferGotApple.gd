extends SceneBase

func _init():
	sceneID = "DomCh0OfferGotApple"

func _run():
	if(state == ""):
		addCharacter("kait")
		playAnimation(StageScene.Duo, "stand", {npc="kait"})
		saynn("You were going back to Tavi with the apple.. when you suddenly got approached by a different feline.")

		saynn("[say=kait]Hey, you![/say]")

		saynn("A swift little snow leopard runs up to you.")

		saynn("[say=kait]I saw what you did back there.[/say]")

		saynn("[say=pc]What, you're gonna tell on me?[/say]")

		saynn("You assume a.. half-combat-ready posture. But the feline just chuckles softly.")

		saynn("[say=kait]Hehe, are you scared? Nah. I'm not gonna rat on a fellow trapped soul.[/say]")

		saynn("The tension gets eased a bit.")

		saynn("[say=pc]What do you want then?[/say]")

		saynn("[say=kait]I know what you did. And I know why you're doing it too. There is a big chance that you're making a big mistake.[/say]")

		saynn("You can't be sure how much she knows exactly. So better not tell her anything.")

		saynn("[say=pc]So?[/say]")

		saynn("[say=kait]I just wanna offer you something different. I'm assembling a team. We might already have a plan brewing about how to escape this gray box.[/say]")

		saynn("We? That's interesting.")

		saynn("She gives you a quick look from toes to the head.")

		saynn("[say=kait]You seem like you're capable of doing stuff. If you're interested, find me in the underground arena.[/say]")

		saynn("[say=pc]Underground arena?[/say]")

		saynn("[say=kait]Well, that will be your first test then. The entrance is hidden somewhere near the gym. If you manage to get in, we can talk more.[/say]")

		saynn("[say=pc]So now you wanna play hide and seek with me?[/say]")

		saynn("[say=kait]You can continue doing what you're doing if you want, not gonna stop you. But if you want to take matters into your own hands rather than..[/say]")

		saynn("She decided not to finish that sentence.")

		saynn("[say=kait]Then come find me. My name is Kait by the way.[/say]")

		saynn("After that, she turns around and walks away, her fluffy tail swishing low.")

		saynn("Right. Looks like you have a new choice now..")

		addButton("Continue", "See what happens next", "endthescene")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	setState(_action)
