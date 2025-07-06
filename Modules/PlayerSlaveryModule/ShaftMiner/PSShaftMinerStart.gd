extends SceneBase

func _init():
	sceneID = "PSShaftMinerStart"

func _run():
	if(state == ""):
		playAnimation(StageScene.Duo, "kneel")
		saynn("You get thrown into a metal cage that's inside some spaceship's cargo space. The cage's limited height forces you to keep your head and body low.")

		saynn("Together with you, are some other unlucky.. travelers. None of them drop a word, their dull stares say everything.")

		saynn("This could be a good time to start discussing ways to escape.. but you're not alone here. Surrounding the cage are a few armed goons, all spotting some hi-tech looking rifles. Right.")

		saynn("You find a corner to stuff yourself into.. and just wait for what's gonna happen next.")

		saynn("Finally, after a few more fresh folks get stuffed into the cage, the spaceship finally begins moving somewhere. There is a small window that you can barely see through.. nothing but space out there. The little colorful stars shift ever so slightly.. or maybe that's just your imagination.")

		saynn("Most of the other.. slaves.. lack any clothing. Only you, the odd one, have a bulky collar around your neck.")

		saynn("Might as well try to take a nap..")

		addButton("Continue", "See what happens next", "ricky_intro")
	if(state == "ricky_intro"):
		addCharacter("psricky")
		playAnimation(StageScene.Solo, "stand", {pc="psricky"})
		saynn("You almost manage to disconnect from your enslaved body and enter the dream world..")

		saynn("..but a loud [b]kick[/b] sends everyone in the cage recoiling back.")

		saynn("[say=psricky]Wake up, you lazy cunts! Okay? We're almost there.[/say]")

		saynn("His raspy voice is quite annoying.")

		saynn("You look into the window.. and see a planet. A sharp, rocky planet. If it didn't have a glowing blue-ish ring of atmosphere around it, you could have easily mistaken it for an asteroid.")

		saynn("[say=psricky]Point your sad muzzles towards me, c'mon. Me, yeah? Mouths shut, eyes at me. To anyone who is new, my name is Ricky, welcome to this little cruise.[/say]")

		saynn("Ricky drags his hand over the cage, stroking the cold metal.")

		saynn("[say=psricky]Consider yourself lucky. Why lucky? I don't like public executions, I don't get off from them like the rest of my friends.[/say]")

		saynn("He waits for any reaction.. and just laughs.")

		saynn("[say=psricky]Relax, you dumb fucks. I don't need your cocks and I don't need your holes. Your holes even, mhm? I don't care who you are. What I need is your raw strength. And also your obedience, goes without sayin'. Anyone who wants to get off this ship, let me know now. Anyone wants off?[/say]")

		saynn("He stares at all of you, his strict eyes searching for any signs of rebellion. His gaze lingers on your neck for some time.")

		saynn("[say=psricky]Nice toy you got there. Indeed, eh?[/say]")

		saynn("Ricky slips his hand between the bars of the cage to tug tightly on your collar.")

		saynn("[say=psricky]Good thing I got a jammer. Otherwise you'd be the first one out. First one for sure, see?[/say]")

		saynn("The spaceship begins to shake slightly, fire starts dancing behind the window.")

		saynn("[say=psricky]We're landing. Will share more after, okay? I will share alright.[/say]")

		saynn("And just like that, he leaves the cargo space.")

		addButton("Continue", "See what happens next", "after_landing")
	if(state == "after_landing"):
		aimCameraAndSetLocName("psmine_exit")
		playAnimation(StageScene.Duo, "stand", {npc="psricky"})
		saynn("The landing wasn't the softest.. but you can't complain.")

		saynn("Ricky returns as the wide rear door of the spaceship starts going through its opening sequence, revealing.. quite a landscape.")

		saynn("It's nothing but black, sharp rock.")

		saynn("One of the goons opens the cage while the others are standing near, aiming their guns at you.")

		saynn("[say=psricky]One by one, no funny shit. No funny, mhm?[/say]")

		saynn("Slowly, you step out of the spaceship. Is that your new home? You're standing on a small landing pad, surrounded by tall, prickly mountains of that black rock.")

		saynn("[say=psricky]You know what planet this is? You probably don't, do ya?[/say]")

		saynn("Some goons push the cage out of the spaceship and bring it along.")

		saynn("[say=psricky]It's called Deadrock. The god wasn't kind to it. Even the god, can you believe it?[/say]")

		saynn("Fitting name for such a dead-looking place.")

		saynn("[say=psricky]Has so much lava that the sky has turned red. A bloody fuckin' sky, eh?[/say]")

		saynn("Ricky approaches one of the rocky walls.. and slips a stick of dynamite into one of its cracks. He steps back.. and seconds later, a loud explosion creates a hole.")

		saynn("[say=psricky]Put that voidsteel barricade there, okay? Slaves, heel, you fuckers.[/say]")

		saynn("Time for more exploring..")

		addButton("Follow", "Follow the guy", "near_cages")
	if(state == "near_cages"):
		aimCameraAndSetLocName("psmine_sleep")
		saynn("Ricky pulls out his datapad and follows some kind of digital map.")

		saynn("You don't see any lava here luckily.. but a little bit of it wouldn't hurt, it's so dark you can barely see.")

		saynn("Eventually, you find a deadend.")

		saynn("[say=psricky]Good enough. Put the cage here. Here, you dig?[/say]")

		saynn("The armed goons obey, placing the familiar cage onto the ground.")

		saynn("Ricky lines you all up.")

		saynn("[say=psricky]Listen up. This is where you will all sleep for the duration of this.. vacation. That's right, you won't be here forever. We're gonna do a job. And then we're gonna leave. I wanna be here as much as any one of you do. Let's not waste our time, alright? You waste my time, I will do the same to you.[/say]")

		saynn("At least you won't have to spend the rest of your days here. You already begin to miss the prison..")

		saynn("[say=psricky]What's the job? Simple. You will mine this planet dry for me.[/say]")

		addButton("Continue", "See what happens next", "in_caves")
	if(state == "in_caves"):
		aimCameraAndSetLocName("psmine_entrance")
		saynn("Ricky throws a few more sticks of dynamite, creating artificial caves.. until you stumble into some natural ones.. a whole system of them.")

		saynn("[say=psricky]There we are. See these? These caves are rich with the ore that I need. So rich, it basically grows here. Flowing lava brings more of it every night. Or so I've been told. If you dig too far, you will get a face full of it, got it? Face full of lava, I mean.[/say]")

		saynn("Not like you can escape from this god-forgotten rock of a planet on your own anyway..")

		saynn("He presses some buttons on his datapad and then puts it away.")

		saynn("[say=psricky]This spot right here will be the collection point. Bring the ore here and we will process it, alright? We will supply the tools.[/say]")

		saynn("The armed goons bring an old, rusty minecart out.. and then hand every one of you a pickaxe.")

		saynn("[say=psricky]I'm willing to spend a share of the profits on upgrades. I'm kind, you see? But this part is up to you. Just get the job done. Will be a shame if I will have to execute all of you. A big waste indeed, eh?[/say]")

		saynn("He spits onto the ground and tilts his head slightly, his tired stare eyeing you out.")

		saynn("[say=psricky]So. Questions? You can say a word or two now.[/say]")

		addButton("How much", "How much ore does he need", "say_howmuch")
		addButton("Flirt", "Try to flirt with him", "say_flirt")
		addButton("What's next", "Ask what will happen to you after", "say_after")
		addButton("Time to work", "Begin working", "time_to_work")
	if(state == "say_howmuch"):
		saynn("[say=pc]How much of that ore do you need?[/say]")

		saynn("[say=psricky]As much as you can. I need roughly 1 million credits, that will pay for everything, including what I paid for you.[/say]")

		saynn("One million credits.. shit.. Hopefully that ore will be a good one.")

		addButton("How much", "How much ore does he need", "say_howmuch")
		addButton("Flirt", "Try to flirt with him", "say_flirt")
		addButton("What's next", "Ask what will happen to you after", "say_after")
		addButton("Time to work", "Begin working", "time_to_work")
	if(state == "say_flirt"):
		saynn("asd")


func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "ricky_intro"):
		processTime(30*60)

	if(_action == "after_landing"):
		processTime(10*60)
		GM.pc.setLocation("psmine_sleep")

	if(_action == "near_cages"):
		processTime(3*60)

	if(_action == "in_caves"):
		processTime(3*60)

	setState(_action)
