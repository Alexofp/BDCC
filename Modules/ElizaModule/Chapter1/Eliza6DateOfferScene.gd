extends SceneBase

func _init():
	sceneID = "Eliza6DateOfferScene"

func _reactInit():
	addMessage("Task updated!")

func _run():
	if(state == ""):
		addCharacter("eliza")
		aimCameraAndSetLocName("med_lobbymain")
		playAnimation(StageScene.Duo, "stand", {npc="eliza"})
		saynn("[say=eliza]Come here, my assistant![/say]")

		saynn("You're greeted with Eliza's kind eyes when you approach the counter. A playful smirk is curling her lips.")

		saynn("[say=pc]What's up?[/say]")

		saynn("[say=eliza]I can be boring and tell you for a millionth time how helpful of an assistant you are.. But you know that already.[/say]")

		saynn("You raise a brow while she closes her laptop.")

		saynn("[say=eliza]Why not do something together.. I want us to know each other a little better.[/say]")

		saynn("With how much you did together.. What's more is there to learn.")

		saynn("[say=pc]If you have questions, you can always ask them, Doctor Quinn.[/say]")

		saynn("A soft chuckle.")

		saynn("[say=eliza]Call me Eliza, I'm not an old lady~.[/say]")

		saynn("[say=pc]Sure. What's your proposition, Eliza?[/say]")

		saynn("She pulls her curious gaze away for a second, swaying her head left and right.")

		saynn("[say=eliza]We have both been busy.. for different reasons.. We're both probably tired. Let's chill together, I know just the spot. I might have to leash you though, it's not an area that's available for inmates.[/say]")

		saynn("Knowing her.. she could be offering you a padded room.. or something actually nice.")

		saynn("[say=pc]I wouldn't mind knowing what that spot is. I'd rather not wake up chained up to some medical table tomorrow.[/say]")

		saynn("She giggles, her laugh sounds rather concerning.")

		saynn("[say=eliza]Hahaha, why would I do that, don't be silly-y~.[/say]")

		saynn("Eliza leans over the counter, her stare connecting with yours.")

		saynn("[say=eliza]I wouldn't be making an offer then~.[/say]")

		saynn("She tilts her head to the side a bit, licking her lips, dragging the pause.")

		saynn("[say=eliza]Nah, I'm taking you to the staff bar.. And don't worry, you're my assistant, you can be there.[/say]")

		saynn("Her paw pulls a chain leash.")

		saynn("[say=eliza]As long as you have this clipped to your collar~.[/say]")

		saynn("[say=pc]Like a dog?[/say]")

		saynn("She shrugs.")

		saynn("[say=eliza]See it more like a.. way to protect the station from you. Something needs to hold back all that power that is contained inside.[/say]")

		saynn("That's.. a weird kind of compliment. But she might be right, you have access to some very powerful equipment.")

		saynn("[say=eliza]So.. meet me here after my shift ends if you wanna join me.[/say]")

		saynn("[say=pc]When is that?[/say]")

		saynn("[say=eliza]Any day, after 11pm.[/say]")

		saynn("[say=pc]You work the whole day?[/say]")

		saynn("She sighs softly, her eyes staring to the side.")

		saynn("[say=eliza]Yeah.[/say]")

		saynn("You can see it in her eyes.")

		saynn("[say=pc]But who is gonna push science forward then?[/say]")

		saynn("[say=eliza]Nobody but us.. you're right.[/say]")

		saynn("You nod. For some reason, seeing the sad feline makes your hand reach out and stroke her hair gently.")

		saynn("Eliza catches it and nuzzles it, sticking her muzzle into your palm. Her nose is so cold, it tickles.")

		saynn("[say=eliza]Here, after 11pm, don't forget~.[/say]")

		saynn("Time to go.")

		addButton("Continue", "See what happens next", "endthescene")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	setState(_action)
