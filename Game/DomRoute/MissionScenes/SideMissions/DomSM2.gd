extends SceneBase

func _init():
	sceneID = "DomSM2"

func _run():
	if(state == ""):
		saynn("You're standing near the mission board, thinking about what should be the next move for the team..")

		saynn("Suddenly, a cry of pain echoes from another room.")

		saynn("[say=kait]Ouch! God fucking dammit.[/say]")

		saynn("The voice seems very familiar.")

		addButton("Check it", "Go check it out and see what's up", "kait_tv")
	if(state == "kait_tv"):
		addCharacter("kait")
		playAnimation(StageScene.Duo, "sit", {npc="kait", npcAction="hurt"})
		aimCameraAndSetLocName("hideout_chill")
		saynn("You step inside the other room and uncover quite a scene.")

		saynn("Kait is kneeling in front of an old TV.. the kind that was already old when it came out to market.. bulky and with a rounded screen. It's showing pure static.. accompanied by the beautiful sounds of white noise.")

		saynn("The snow leopard has the back panel open, all wiring is exposed. Her paws are reaching inside.")

		saynn("Zap.")

		saynn("[say=kait]Ouch![/say]")

		saynn("Her whole body jerks, including her tail. Her fur stands on ends, making her look puffy.")

		saynn("She pulls her back and shakes it.")

		saynn("You take a seat on one of the crates and admire the show.")

		saynn("[say=pc]What are you doing?[/say]")

		saynn("Kait looks over her shoulder, her face looks a bit dirty.")

		saynn("[say=kait]What does it look like? Fixing this piece of junk.[/say]")

		saynn("She gestures vaguely at the mess of components inside.")

		saynn("[say=pc]Do you know what you're doing?[/say]")

		saynn("Her ears flatten.")

		saynn("[say=kait]I know enough![/say]")

		saynn("She reaches back inside.")

		saynn("Zap.")

		saynn("[say=kait]Ouch![/say]")

		saynn("Her fur puffs out again.. a few sparks fly out the thing. She yanks her arm back and sucks on her hurt finger.")

		saynn("[say=pc]Tried turning it off first?[/say]")

		saynn("You can feel her rolling her eyes.")

		saynn("[say=kait]This stupid thing heats up for like ten minutes, I wouldn't be able to test it otherwise.[/say]")

		saynn("[say=pc]I guess you're screwed then. Hope you like pain.[/say]")

		saynn("She takes a small pause.. and then giggles.")

		saynn("[say=kait]In a different life, I'd probably be an engineer, you know. But I just had to end up a slut![/say]")

		saynn("A short awkward pause.")

		saynn("[say=kait]A lilac I mean. I'm not a slut.[/say]")

		saynn("Of course.")

		saynn("You let her work.. but you soon become curious.")

		saynn("[say=pc]Step aside.[/say]")

		saynn("Kait shuffles on her knees, letting you look inside. It's about what you'd expect. Exposed wiring.. some are crossed.. some are bare. It's a mess.")

		saynn("[say=pc]You need insulated gloves for this.[/say]")

		saynn("Kait crosses her arms.")

		saynn("[say=kait]We don't have any![/say]")

		saynn("[say=pc]Then we're gonna get you some. Get up.[/say]")

		saynn("She groans.")

		saynn("[say=kait]I can do it![/say]")

		saynn("The snow leopard reaches inside again. Her paw hovers over a loose wire.")

		saynn("[say=pc]Kait. Stop it.[/say]")

		saynn("[say=kait]I'm almost there, I can feel it-..[/say]")

		saynn("Zap.")

		saynn("Kait yelps and falls backward onto her butt. Static electricity crackles between her ears, making them flick.")

		saynn("[say=kait]..ow..[/say]")

		saynn("[say=pc]That's it. We're getting you insulated gloves. Up.[/say]")

		saynn("Kait sits up, rubbing her wrist.")

		saynn("You offer her a hand. She takes it and gets pulled to her feet.")

		saynn("[say=pc]Where can we get them?[/say]")

		saynn("[say=kait]Engineers usually carry some..[/say]")

		saynn("Engineering it is.")

		addButton("Continue", "See what happens next", "in_engineering")
	if(state == "in_engineering"):
		aimCameraAndSetLocName("eng_workshop")
		playAnimation(StageScene.Duo, "stand", {npc="kait"})
		saynn("After some time, you arrive at the engineering bay.. and enter the workshop area. A place where inmates and engineers can waste their time creating something of questionable use.")

		saynn("You and Kait lean against one of the walls. There are a few engineers around.")

		saynn("[say=kait]So? What now?[/say]")

		saynn("[say=pc]We're gonna come up with a plan and then execute it. One step at a time.[/say]")

		saynn("Kait's shoulders slump.")

		saynn("[say=kait]But that will take forever.[/say]")

		saynn("[say=pc]We have all the time in the world. Lets pick the best target and wait for a good moment. We might have to involve some of our team.[/say]")

		saynn("Kait loses focus in the middle of you speaking. She tilts her head and looks at her surroundings.. until she sees something.")

		saynn("[say=kait]That sounds so boring. Give me a second.[/say]")

		saynn("She starts heading somewhere!")

		saynn("[say=pc]Where are you going?[/say]")

		saynn("[say=kait]Just watch me.[/say]")

		saynn("[say=pc]Kait..[/say]")

		saynn("Well.. Time to see what mess she will get herself into.")

		addButton("Continue", "See what happens next", "kait_socket")
	if(state == "kait_socket"):
		addCharacter("socket")
		playAnimation(StageScene.Duo, "stand", {pc="kait", npc="socket"})
		saynn("[say=kait]Hey.. uh.. cool uniform.[/say]")

		saynn("You find Kait standing near a half-naked fennec who seems to be completely unfazed by it. She does have a backpack though.")

		saynn("[say=socket]Thanks! Name is Socket.[/say]")

		saynn("[say=kait]Yes, hey, Socket. I wonder.. Do you have any spare gloves? The yellow ones.[/say]")

		saynn("[say=socket]Let's see![/say]")

		saynn("She drops her backpack onto the nearest workbench and begins rummaging through it. Spare wires, a crowbar, cutters, a screwdriver, some lube and duct tape. Somehow there is also a giant wrench in between all of that.")

		saynn("[say=socket]No, I only have one pair it seems. Sorry![/say]")

		saynn("[say=kait]Can I maybe have that pair perhaps?[/say]")

		saynn("Socket blinks a few times, her expression changes to a more hostile one.")

		saynn("[say=socket]..Do you need to be bonked or something?[/say]")

		saynn("[say=kait]Uh.. no? What if I promise to return it?[/say]")

		saynn("[say=socket]Hm.. I still prefer the bonking route.[/say]")

		saynn("[say=kait]Pretty please?[/say]")

		saynn("The fennec hums and scratches her chin. Then she gets all excited.")

		saynn("[say=socket]I have an idea! If you wear this headset that's on my head for a bit, I will let you have the gloves![/say]")

		saynn("[say=kait]What is it gonna do?[/say]")

		saynn("[say=socket]It will make sure that you will actually return them![/say]")

		saynn("[say=kait]It will hypnotize me?[/say]")

		saynn("[say=socket]No, it's not a hypnovisor obviously. Why would I wear one? It will just show you what happens if you don't return the gloves, what punishment you will receive![/say]")

		saynn("[say=kait]Uh huh. Sure. Whatever it is, I can take it.[/say]")

		saynn("[say=socket]I will prepare it![/say]")

		saynn("Socket takes off her headset and begins pressing buttons on it..")

		saynn("You nudge Kait's side.")

		saynn("[say=pc]Kait, this is a bad idea and you know it.[/say]")

		saynn("She leans closer to your ear and whispers.")

		saynn("[say=kait]Shush, I know it's a hypnovisor, I'm not stupid. My mind is strong enough to not be affected by it.[/say]")

		saynn("[say=pc]I'm not so sure about that.[/say]")

		saynn("[say=kait]Are you saying I'm dumb?[/say]")

		saynn("[say=pc]No.[/say]")

		saynn("[say=kait]I can take it, I'm telling you.[/say]")

		saynn("[say=pc]Alright, you have my full trust in you.[/say]")

		saynn("If she says it, might as well let her.")


func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "kait_tv"):
		processTime(3*60)

	if(_action == "in_engineering"):
		processTime(10*60)

	if(_action == "kait_socket"):
		processTime(2*60)

	setState(_action)
