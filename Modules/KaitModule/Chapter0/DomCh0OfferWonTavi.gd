extends SceneBase

func _init():
	sceneID = "DomCh0OfferWonTavi"

func _run():
	if(state == ""):
		addCharacter("kait")
		playAnimation(StageScene.Duo, "stand", {npc="kait"})
		saynn("Not that much time passes before you get approached by another feline. This one.. is much less colorful and weird.")

		saynn("[say=kait]Hey, you![/say]")

		saynn("A swift little snow leopard runs up to you.")
		
		if(getFlag("TaviModule.Tavi_RefusedToSubmit")):
			saynn("[say=pc]Don't tell me you want me to submit too. I got enough of that already.[/say]")
		else:
			saynn("[say=pc]Don't tell me you want me to submit too. I don't wanna break another cat.[/say]")

		saynn("She offers you a little smile.")

		if(getFlag("TaviModule.Tavi_RefusedToSubmit")):
			saynn("[say=kait]Nah, I saw what happened back there. You did good, all things considered. You lost but didn't bend the knee.[/say]")
		else:
			saynn("[say=kait]Nah, quite the opposite in fact. I saw what you did. Great job, really. That bitch deserved it.[/say]")

		saynn("At least she doesn't seem to be hostile.")

		saynn("[say=pc]Thanks. Is that all?[/say]")

		saynn("[say=kait]Do you wanna escape this place?[/say]")

		saynn("She tugs on her bulky collar. Yours isn't exactly sitting pretty either.")

		saynn("[say=pc]Show me a person who doesn't.[/say]")

		saynn("[say=kait]There are many such doormats, trust me. Sadly, escaping this shithole won't be easy.[/say]")

		saynn("You take a quick look around.")

		saynn("[say=pc]I've noticed.[/say]")

		saynn("[say=kait]Maybe even impossible. But we might have a plan brewing.[/say]")

		saynn("We? That's interesting.")

		saynn("She gives you a quick look from toes to the head.")

		saynn("[say=kait]If you're interested, find me in the underground arena.[/say]")

		saynn("[say=pc]Underground arena?[/say]")
		
		if(getFlag("TaviModule.Tavi_RefusedToSubmit")):
			saynn("[say=kait]It will help you improve your fighting skills. The entrance is hidden somewhere near the gym. If you manage to get in, we can talk more~. Name is Kait by the way.[/say]")
		else:
			saynn("[say=kait]Well, that will be your first test then. The entrance is hidden somewhere near the gym. If you manage to get in, we can talk more~. Name is Kait by the way.[/say]")

		saynn("[say=pc]Uh huh.[/say]")

		saynn("Kait waits to see if you'd say something else.. her paw scritches her cheek.")

		saynn("Then, after a few seconds, she finally turns around and walks away.")

		addButton("Continue", "See what happens next", "endthescene")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	setState(_action)
