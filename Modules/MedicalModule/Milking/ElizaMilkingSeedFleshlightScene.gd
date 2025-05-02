extends SceneBase

var amountCollected = 0.0

func _init():
	sceneID = "ElizaMilkingSeedFleshlightScene"

func _run():
	if(state == ""):
		addCharacter("eliza")
		aimCameraAndSetLocName("med_milkingroom")
		playAnimation(StageScene.Grope, "tease", {pc="pc", npc="eliza"})
		saynn("You approach Eliza, asking if she can seed-milk you.")

		saynn("[say=eliza]Ohh, I think I know what we can do~. Follow me.[/say]")

		saynn("She brings you into one of the empty milking stalls.")

		saynn("[say=eliza]You stay here, I gotta go grab someone![/say]")

		saynn("Huh. Makes you wonder how a third person would help with any of this..")

		addButton("Continue", "See what happens next", "socket_walks_in")
	if(state == "socket_walks_in"):
		removeCharacter("eliza")
		addCharacter("socket")
		addCharacter("eliza")
		playAnimation(StageScene.Duo, "stand", {npc="socket", npcAction=["hold_object", "res://Inventory/UnriggedModels/Fleshlight/FleshlightSocketStraw.tscn"]})
		saynn("Some minutes later, Socket walks into the room, sipping something out of her.. pussy.. through a straw.")

		saynn("[say=socket]Heya![/say]")

		saynn("You raise a brow. Eliza comes back too.")

		saynn("[say=eliza]I think you two know each other, right?[/say]")

		saynn("You nod.")

		saynn("[say=socket]Yeah, {pc.he} helped me a lot! The least I can do is help back.[/say]")

		saynn("Socket reaches her paw forward, offering you the fleshlight-like device.. that has a portal tuned to her crotch device.")

		saynn("Eliza grabs it first though.. she spreads the folds open with her digits and looks inside..")

		saynn("[say=eliza]Wait, you have it filled with something already.[/say]")

		saynn("[say=socket]Yep, it's cider. Use the straw, it's tasty![/say]")

		saynn("Eliza sighs.")

		saynn("[say=eliza]Hold on, I'm gonna go wash it I guess.[/say]")

		saynn("Eliza leaves you two alone for a bit.")

		saynn("The awkward silence ensues.. but then Socket suddenly starts to squirm.")

		saynn("[say=socket]Ohh.. so cold.[/say]")

		saynn("Eliza is washing all the cider out of Socket's pussy..")

		saynn("[say=pc]What's the plan exactly?[/say]")

		saynn("[say=socket]Why jerk off into a plastic bottle if you have me![/say]")

		saynn("That's.. fair. You have nothing against that.")

		saynn("Soon, Eliza returns and hands the device back to Socket.")

		saynn("[say=eliza]Here, it's clean now. We only want seed.[/say]")

		saynn("[say=socket]Oki![/say]")

		saynn("Socket's eyes lock onto yours.")

		saynn("[say=socket]I can do everything, just relax![/say]")

		saynn("Sure..")

		addButton("Continue", "See what happens next", "socket_tease")
	if(state == "socket_tease"):
		playAnimation(StageScene.SexFleshlight, "tease", {npc="socket", socketPussy=true, bodyState={exposedCrotch=true,hard=true}})
		saynn("Without any hesitation, Socket takes a spot behind you and moves the fleshlight down to your pulsing length, aligning it with the tip.")

		saynn("She is being slow, just letting your member brush against her folds and prod away at the entrance itself.")

		saynn("You can feel the warmness of that slit.. how it twitches when her clit gets touched.. how it gets slick and ready for more.. nothing fake about it..")

		saynn("Socket sees a drop of precum leaking from the tip of your member. She catches it with the fleshlight and spreads it along her sensitive flesh.")

		saynn("[say=socket]Looks like you're ready.[/say]")

		saynn("Eliza just leans against one of the walls, watching the process with great fascination.")

		addButton("Continue", "See what happens next", "socket_sex")
	if(state == "socket_sex"):
		playAnimation(StageScene.SexFleshlight, "sex", {npc="socket", socketPussy=true, bodyState={exposedCrotch=true,hard=true}})
		saynn("Socket puts more pressure, allowing your {pc.penis} to part the petals of her flower and slide inside her! Her inner walls clench around your shaft nicely, providing some pleasurable friction as she begins to move the fleshlight back and forth.. making you fuck her raw..")

		saynn("She rests her chin on your shoulder and looks down at the action.")

		saynn("[say=socket]You have a nice cock. Feels pretty nice inside me.[/say]")

		saynn("[say=pc]Yeah.. thanks.[/say]")

		saynn("You meet her motions ever so slightly, your member reaching deep within her, kissing her womb.")

		saynn("Soon, you begin to pant. Little grunts escape your lips as Socket just keeps impaling her slit onto your shaft..")

		saynn("[say=socket]I can do it faster. My pussy walls are augmented against most types of damage, including physical.[/say]")

		saynn("[say=pc]So you're like a.. perfect fuckdoll.[/say]")

		saynn("She giggles softly.")

		saynn("[say=socket]You could say that.[/say]")

		addButton("Continue", "See what happens next", "socket_faster")
	if(state == "socket_faster"):
		playAnimation(StageScene.SexFleshlight, "fast", {npc="socket", socketPussy=true, bodyState={exposedCrotch=true,hard=true}})
		saynn("Socket increases the pace, dragging that fleshlight back and forth even faster, letting her inner walls to knead your cock as the pleasure makes her clench, her pussy coating your member with a layer of her juices.. while your dick is leaking pre inside her.")

		saynn("[say=socket]This should be enough of a pace![/say]")

		saynn("She is panting a bit.. but so do you. Socket is basically making you pound her pussy, slamming the fleshlight deep and hard.. so hard that there is an ever so slightly visible bump appearing on her belly each time.. as your cock pushes on her womb.")

		saynn("With such a perfect pussy, the peak is quickly approaching you.")

		saynn("[say=pc]I'm gonna cum.. inside you.[/say]")

		saynn("[say=socket]Make sure you don't waste even a drop! Or Eliza will be angry with us.[/say]")

		saynn("Eliza bites her lip.")

		saynn("[say=eliza]Oh yeah, I sure will be~.[/say]")

		saynn("The slick hotness.. the way her portable fuckhole treats you.. it makes you grunt.")

		addButton("Orgasm", "Stuff that fleshlight full", "process_cum")
	if(state == "process_cum"):
		playAnimation(StageScene.SexFleshlight, "inside", {npc="socket", socketPussy=true, bodyState={exposedCrotch=true,hard=true}})
		saynn("As soon as her pussy pushes you over the edge, Socket brings the fleshlight down hard, making sure your whole pulsing length is inside her.")

		saynn("[say=pc]Ghh..[/say]")

		saynn("You grunt and growl, your body shivering in waves while your cock starts to throb inside her, pumping Socket's inviting slit with thick, creamy {pc.cum}, more and more of it. Her tight inner walls are kneading your shaft, milking your balls for all of their seed.")

		saynn("[say=pc]Fuck..[/say]")

		saynn("[say=socket]That's a big load.. hah.[/say]")

		saynn("You throw your head back and let the never-ending ecstatic waves flow through you.. your {pc.penis} still filling the fleshlight.")

		saynn("[say=pc]Gh..[/say]")

		saynn("That felt good..")

		addButton("Continue", "See what happens next", "socket_gives_fleshlight_back")
	if(state == "socket_gives_fleshlight_back"):
		playAnimation(StageScene.Duo, "stand", {pc="socket", npc="eliza"})
		GM.pc.setLocation("med_nearmilking")
		saynn("Only when Socket is certain for sure that your orgasm has ended, she carefully pulls the fleshlight off of your shaft, making sure to hold it in a way that won't spill anything.")

		saynn("[say=socket]Oh, there is some left on you still![/say]")

		saynn("She holds the fleshlight under the tip of your cock as her digits grasp it near the base and slide along it, catching any mess and then letting it drip into her stuffed pussy..")

		saynn("After that, she hands the full fleshlight to Eliza.")

		saynn("[say=socket]There you go! Wait, where is the straw..[/say]")

		saynn("[say=eliza]It's okay, I don't need it.[/say]")

		saynn("[say=socket]But I do! Will have to go grab another one.[/say]")

		saynn("Eliza smiles and puts the lid onto the fleshlight, covering up the creamed pussy.. while you're trying to catch your breath.")

		saynn("[say=eliza]Thank you for your donation, I will go get this deposited right away~.[/say]")

		saynn("You nod..")

		saynn("It's time to go.")

		addButton("Continue", "See what happens next", "endthescene")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "socket_walks_in"):
		processTime(5*60)

	if(_action == "socket_tease"):
		processTime(3*60)

	if(_action == "socket_sex"):
		processTime(5*60)

	if(_action == "socket_faster"):
		processTime(5*60)

	if(_action == "process_cum"):
		processTime(3*60)
		amountCollected = GM.main.SCI.processMilkPlayerPenis()
		GM.pc.orgasmFrom("socket")
		GM.pc.fillBalls()
		getCharacter("socket").cummedInVaginaBy("pc")

	if(_action == "socket_gives_fleshlight_back"):
		processTime(3*60)
		getCharacter("socket").clearOrificeFluids()

	setState(_action)

func saveData():
	var data = .saveData()

	data["amountCollected"] = amountCollected

	return data

func loadData(data):
	.loadData(data)

	amountCollected = SAVE.loadVar(data, "amountCollected", 0.0)
