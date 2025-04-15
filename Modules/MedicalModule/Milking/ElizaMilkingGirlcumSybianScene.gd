extends SceneBase

var amountCollected = 0.0

func _init():
	sceneID = "ElizaMilkingGirlcumSybianScene"

func _run():
	if(state == ""):
		addCharacter("eliza")
		aimCameraAndSetLocName("med_milkingroom")
		playAnimation(StageScene.Grope, "tease", {pc="pc", npc="eliza", bodyState={naked=true}})
		saynn("You tell Eliza that you would like to donate your girlcum.")

		saynn("[say=eliza]Follow me, the process is simple~.[/say]")

		saynn("Well, why not.")

		saynn("Eliza brings you into the big open space and finds a stall that has the required equipment installed.")

		saynn("The centerpiece of this stall is a big grated platform. Below it, you see some kind of funnel, a fluid collector of sorts. In the middle of the platform, there is a sybian machine installed, a kinky seat..")

		saynn("The sybian is equipped with a small dildo and a ridged platform positioned precisely so that your clit would be resting directly upon it. Seeing it.. makes the air feel warmer already.")

		saynn("[say=eliza]It's better to be naked, trust me~.[/say]")

		saynn("You strip yourself of all clothes and approach the kinky device.")

		addButton("Sit", "Take a seat on that sybian", "do_sit")
	if(state == "do_sit"):
		playAnimation(StageScene.Sybian, "idle", {pc="pc", chained=true, bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("Slowly, you lower yourself onto that device, allowing the little dildo to part your pussy folds and get buried between your sensitive inner walls.")

		saynn("[say=pc]Mmm..[/say]")

		saynn("Eliza approaches you and suddenly clicks a leash to your collar.")

		saynn("[say=eliza]We don't want you to wiggle yourself off, do we~.[/say]")

		saynn("Probably not..")

		saynn("Eliza attaches the other end of that tight leash to the floor.. making it so you can't get off that seat anymore.")

		saynn("The feline grabs the remote of that device.. and turns one of the dials pretty high..")

		addButton("Continue", "See what happens next", "begins_working")
	if(state == "begins_working"):
		playAnimation(StageScene.Sybian, "ride", {pc="pc", chained=true, bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("The sybian underneath you roars to life, its dildo begins to vibrate against the walls of your warm, inviting pussy, immediately sending pleasure waves to flow through your limbs.")

		saynn("[say=pc]Mmmhh.. hh..[/say]")

		saynn("Every muscle in your inner walls contracts reflexively, clenching around that dildo as its rhythmic pulsations make you moan softly. At the same time, the ridged platform positioned near that other toy begins to shift left and right against your clit, its bumps massaging and rubbing one of your most sensitive spots, creating another source of pleasure.")

		saynn("[say=pc]Ah.. ah-h..[/say]")

		saynn("You get wet fast.. your juices coating the dildo and dripping down from the sybian. All the while Eliza just watches, holding and playing with the remote.")

		saynn("[say=eliza]A little more, yes~?[/say]")

		saynn("[say=pc]Ah.. mmhh-hah..[/say]")

		saynn("[say=eliza]Sounds like a yes to me.[/say]")

		saynn("She turns the dial to its second highest setting.. making the dildo inside you vibrate even harder, now reaching and stimulating your g-spot.. Makes you want to throw your head back and moan into the air.. but the chain keeps your chin at a steady level.")

		saynn("[say=pc]Nnhh-.. mhh.. ahh..[/say]")

		saynn("Moans of raw ecstasy spill from your lips as your body writhes in tandem with the sybian's intense vibrations. It's almost unbearable.. your hips buck and quiver uncontrollably, your love tunnel contracting tightly around the dildo.. all the while each attempt to escape this is prevented by the chain.")

		saynn("Heat builds within you fast..")

		saynn("[say=eliza]I think someone is close~.[/say]")

		saynn("She turns the remote's dial to its maximum setting..")

		addButton("Orgasm", "See what happens next!", "processCum")
	if(state == "processCum"):
		playAnimation(StageScene.Sybian, "intense", {pc="pc", pcCum=true, chained=true, bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("Before you can realize it, a powerful orgasm is already rocking through your body, making you squirm and quiver around the dildo that vibrates directly against your g-spot, overwhelming your senses.")

		saynn("[say=pc]Ah-h-hh!..[/say]")

		saynn("Your pussy spasms and clenches hard.. before releasing a stream of warm, transparent fluid that gushingly sprats out all over the platform.. before pooling into the collector beneath. Your muscles just aren't listening anymore, you're squirting from the overstimulation, your slit gushing out more and more of your girlcum!")

		saynn("Eliza watches the fluid level rising.")

		saynn("[say=eliza]Great, great~. I bet you could give me more than that.[/say]")

		saynn("She keeps the dial at its full setting.. meaning that the sybian keeps pushing further and further into this abyss of pleasure.. until another wave of overstimulation catches up with you. Your muscles tense up uncontrollably as your pussy start to pulse and squirt, releasing more of that wet fluid into the air.")

		saynn("[say=pc]Mhhhnhh-h-hhahhh.. ahhh-h.. Ahh-h..[/say]")

		saynn("Even if you wanted, you can't do anything about it, the sybain keeps milking your pussy for all of its fluids, the dildo pounding your g-pose while the ridged platform is thrashing against your clit, causing another orgasm to overwhelm you!")

		saynn("Your pussy spawns a fountain of girlcum again.. and again.. but much less this time. You keep moaning like a slut.. while your pussy forces out the rest of its fluids with hard, powerful pulses.")

		saynn("[say=pc]Nhh.. I cc-can't.. t-too much.. ahh..[/say]")

		saynn("Your eyes keep rolling up, your tongue is out and drooling. You're holding onto that sybian as tight as you can.. while it constantly stimulates your poor, overstimulated cunt.")

		saynn("Time becomes a blur, the ecstatic waves making your mind go blank.. Your pussy spasms repeatedly, over and over, until there is nothing left to give. Only when the next orgasm draws pretty much nothing from you, is when Eliza finally starts to turn the dial down again.")

		saynn("[say=pc]Mhh.. ahh..[/say]")

		saynn("You're panting.. heavily.. Your crotch is a source of heat that spreads throughout..")

		saynn("[say=eliza]That's what I like to see~. Sorry, the best squirt gets collected only during constant forced orgasms.[/say]")

		saynn("She completely turns off the machine, letting you rest.")

		saynn("[say=eliza]You did well. Thank you for your donation~.[/say]")

		saynn("You nod.. your body still trembling from the aftershocks.")

		addButton("Continue", "See what happens next", "about_to_leave")
	if(state == "about_to_leave"):
		playAnimation(StageScene.Duo, "stand", {npc="eliza"})
		GM.pc.setLocation("med_nearmilking")
		saynn("Eliza helps you to get up. Your legs are still shaky.")

		saynn("[say=eliza]Please come again later.[/say]")

		saynn("You nod.. trying to catch your breathing.")

		saynn("[say=eliza]I need to fill in some paperwork now, I hope you will find your way back to the lobby~.[/say]")

		saynn("It's time to go.")

		addButton("Continue", "See what happens next", "endthescene")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "do_sit"):
		processTime(3*60)

	if(_action == "begins_working"):
		processTime(5*60)

	if(_action == "processCum"):
		processTime(5*60)
		amountCollected = GM.main.SCI.processMilkPlayerVagina()
		GM.pc.orgasmFrom("eliza")

	if(_action == "about_to_leave"):
		processTime(3*60)

	setState(_action)

func saveData():
	var data = .saveData()

	data["amountCollected"] = amountCollected

	return data

func loadData(data):
	.loadData(data)

	amountCollected = SAVE.loadVar(data, "amountCollected", 0.0)
