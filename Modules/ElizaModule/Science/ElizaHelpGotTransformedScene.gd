extends SceneBase

func _init():
	sceneID = "ElizaHelpGotTransformedScene"

func _run():
	if(state == ""):
		addCharacter("eliza")
		playAnimation(StageScene.Duo, "stand", {npc="eliza"})
		if (!getFlag("ElizaModule.firstHelpTFHap")):
			saynn("[say=pc]I need help! My body, something is happening to me![/say]")

			saynn("The feline behind the counter leans in closer to see you from toes to ears.")

			saynn("[say=eliza]Something hurts? I need more information, patient.[/say]")

			saynn("You don't really feel any pain.. you just feel different.")

			saynn("[say=pc]I don't know. I think I'm.. changing. Transforming?[/say]")

			saynn("Doctor nods softly.")

			saynn("[say=eliza]Ri-i-ight. Have you eaten any weird pills lately?[/say]")

			saynn("[say=pc]Maybe? What if I did?[/say]")

			saynn("She shrugs.")

			saynn("[say=eliza]Well, you're screwed then! I have no way to undo that![/say]")

			saynn("[say=pc]What? Are you serious?[/say]")

			saynn("The feline doctor just looks at you, her face completely still and serious.. except for the twitching corners of her mouth.")

			saynn("[say=eliza]No. I'm just fucking with you~.[/say]")

			saynn("She chuckles and sips some coffee out of her mug.")

			saynn("[say=eliza]Ever since these weird pills began popping up all over the prison, I made some special pills to fight their effects.[/say]")

			saynn("At least it doesn't seem to be permanent.")

			saynn("[say=pc]Great, give me one.[/say]")

			saynn("The feline hums for an uncomfortable amount of time.")

			saynn("[say=eliza]Humm-m-m-m.. You knoo-ow.. These pills are quite expensive to produce, I can't just hand them out to everyone.[/say]")

			saynn("You sigh and roll your eyes.")

			saynn("[say=pc]How much?[/say]")

			saynn("[say=eliza]15 credits would cover my expenses for one that undoes all the effects.[/say]")

			saynn("She pulls out a little blue pill and holds it on her paw.. a solution to all your current problems. Somehow you get a feeling that she has another offer.")

			saynn("[say=pc]Fifteen credits? That is fifteen days of work, you're serious?[/say]")

			saynn("She shrugs.")

			saynn("[say=eliza]I can let you overdraft if you really need it, go into the negatives. Alternatively.. I can give you a different pill..[/say]")

			saynn("Her second hand produces a red pill.")

			saynn("[say=eliza]This one is free~. And it will solve your problem too![/say]")

			saynn("[say=pc]Free? What's the catch?[/say]")

			saynn("The feline pulls her gaze high away, looking all innocent.")

			saynn("[say=eliza]Well, you know.. It will make all your current changes permanent..[/say]")

			saynn("[say=pc]Huh?[/say]")

			saynn("[say=eliza]But it will stop the transformation! Isn't that what you want~.[/say]")

			saynn("Stay like this permanently.. for free..")

			saynn("Or undo everything.. but pay the price..")

		else:
			saynn("[say=pc]Hey, I need help with the transformations again.[/say]")

			saynn("The feline nods and produces two pills in her paws. A blue one.. and a red one.")

			saynn("[say=eliza]Blue pill costs 15 credits and will undo any effects. Red one is free and will make them permanent~. Which one do you want?[/say]")

		addButton("Blue pill", "Pay 15 credits for a pill that will undo all your transformations and make you look like you did before", "get_blue")
		addButton("Red pill", "Eat a pill that will make all your current transformations [b]permanent[/b]", "get_red")
		addButton("Never mind", "You changed your mind", "endthescene")
	if(state == "get_blue"):
		saynn("You need your old body back. So there is no other choice.")

		saynn("[say=pc]Give me the blue one.[/say]")

		saynn("The feline sighs and slowly hands it to you.")

		saynn("[say=eliza]Oh well, there you go.[/say]")

		saynn("You eat the pill.. and soon.. you become your old self.")

		saynn("Much better.")

		saynn("[say=eliza]Come back if you ever need another one~.[/say]")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "get_red"):
		saynn("How you look right now.. it's not too bad.. so maybe just stopping there is good enough.")

		saynn("[say=pc]Give me the red one.[/say]")

		saynn("The feline's grin is brighter than the sterile lights of the lobby.")

		saynn("[say=eliza]Great choice~.[/say]")

		saynn("She hands you the red pill.")

		saynn("You gather enough strength.. and throw it into your mouth. Tastes exactly like you thought it would.. chalk.")

		saynn("No going back anymore. Your new self is now your normal self!")

		saynn("[say=eliza]Come back if you ever need another one~.[/say]")

		addButton("Continue", "See what happens next", "endthescene")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "get_blue"):
		GM.pc.addCredits(-15)
		GM.pc.getTFHolder().undoAllTransformations()
		setFlag("ElizaModule.firstHelpTFHap", true)
		addMessage("You paid 15 credits")

	if(_action == "get_red"):
		GM.pc.getTFHolder().makeAllTransformationsPermanent()
		setFlag("ElizaModule.firstHelpTFHap", true)

	setState(_action)
