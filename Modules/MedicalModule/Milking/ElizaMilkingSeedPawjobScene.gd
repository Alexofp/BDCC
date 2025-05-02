extends SceneBase

var amountCollected = 0.0

func _init():
	sceneID = "ElizaMilkingSeedPawjobScene"

func _run():
	if(state == ""):
		addCharacter("eliza")
		aimCameraAndSetLocName("med_milkingroom")
		playAnimation(StageScene.Grope, "tease", {pc="pc", npc="eliza", bodyState={exposedCrotch=true}})
		saynn("You ask the doctor to seed-milk you.")

		saynn("[say=eliza]You know, I think I know a good way to do this~.[/say]")

		saynn("She brings you into one of the milking stalls.. one that doesn't have any special equipment.")

		saynn("You expose your {pc.penis} and wait for her orders.")

		saynn("Eliza smiles.. and begins to undress too.")

		addButton("Continue", "See what happens next", "on_floor")
	if(state == "on_floor"):
		playAnimation(StageScene.SexPawjob, "tease", {pc="pc", npc="eliza", bodyState={exposedCrotch=true, hard=true}, npcBodyState={underwear=true}})
		saynn("Eliza strips her clothes.. until only her seductive lingerie is left. Her bra and panties are accentuating her curves quite well though.. the sight makes more blood flow down to your crotch..")

		saynn("After she is done stripping, she lowers herself down to the floor, lying on her back. She raises her hind paws and lets them hover in the air.. not that far from your face. She playfully curls her toes, showing off her beans to you..")

		saynn("[say=eliza]Like 'em~?[/say]")

		saynn("She lowers her hind paws a bit and gently brushes them against your hardening member, teasing you.. The rough texture of her paw pads feels quite good..")

		saynn("[say=eliza]Hard? Good. Put this on.[/say]")

		saynn("Eliza tosses you a wrapped up condom. You catch it, rip it open and start to apply it onto your shaft, pulling the ring along your length..")

		saynn("After you get your cock rubbered up, you give Eliza an awaiting look..")

		saynn("[say=eliza]Hands away~.[/say]")

		addButton("Continue", "See what happens next", "eliza_begins_to_pawjob")
	if(state == "eliza_begins_to_pawjob"):
		playAnimation(StageScene.SexPawjob, "sex", {pc="pc", npc="eliza", bodyState={exposedCrotch=true, hard=true, condom=true}, npcBodyState={underwear=true}})
		saynn("With a playful glint in her eyes, she gently squeezes your cock between her beans, her hind paws gently sliding along the length of your hard cock. Each stroke sends strange shivers of anticipation through your body.. it feels good..")

		saynn("[say=eliza]Yeah, you totally like my paws~.[/say]")

		saynn("She keeps a steady pace.. giving you a skillful paw job that reaches every sensitive inch of your member. The pleasurable friction makes your shaft pulse a bit in time with her motions, the tip of the condom is filled full with your precum by now..")

		saynn("[say=pc]Mm.. hh..[/say]")

		saynn("After stroking you for a bit, Eliza takes a little pause. One of her hind paws stays to tease the tip of your cock, brushing its pads against it.. while the other one reaches down to your ballsack to gently knead and massage it.. Your body responds immediately, little moans escape your lips while your cock twitches more, pressure rising within it.")

		saynn("The feline bites her lip, seeing your reaction. She spreads her legs a bit more, to let you see her damp lace panties..")

		saynn("[say=eliza]I want every drop of your seed.. I'm gonna empty these orbs with my paws~.[/say]")

		saynn("Her hind paws return to your shaft, trapping it between the pads again and sliding along it. Your hips keep wanting to buck in response to her motions.. You're getting close.")

		addButton("Orgasm", "You're about to cum", "process_cum")
	if(state == "process_cum"):
		playAnimation(StageScene.SexPawjob, "fast", {pc="pc", npc="eliza", bodyState={exposedCrotch=true, hard=true, condom=true}, npcBodyState={underwear=true}})
		saynn("The pleasure level keeps spiking.. until your cock begins to throb uncontrollably! You throw your head back and let out a passionate moan as thick spurts of your {pc.cum} get pumped into the condom's interior, stretching and filling it steadily until it starts to sag under its own weight.")

		saynn("[say=pc]Ah.. f-fuck..[/say]")

		saynn("Eliza's hungry eyes shine brightly as she keeps stroking you out with her hind paws, making your body squirm under her touch, your balls tensing up hard, more and more of your spunk filling the rubber.")

		saynn("[say=eliza]There we go.. yes.. give me everything you have..[/say]")

		saynn("She keeps kneading your balls and rubbing your cock..")

		addButton("Continue", "See what happens next", "after_milking")
	if(state == "after_milking"):
		playAnimation(StageScene.SexPawjob, "tease", {pc="pc", npc="eliza", bodyState={exposedCrotch=true, hard=true, condom=true}, npcBodyState={underwear=true}})
		GM.pc.setLocation("med_nearmilking")
		saynn("Only when your orgasm begins to subside, Eliza stops using her paws, leaving your cock completely milked dry. Both, you and her, are left panting.")

		saynn("[say=eliza]That was a nice workout.[/say]")

		saynn("She sits down and reaches to carefully remove the condom before tying it up, neatly trapping all your seed inside.")

		saynn("[say=eliza]Thank you for the nice donation~.[/say]")

		saynn("[say=pc]You're.. welcome..[/say]")

		saynn("Eliza gets up and puts her clothes back on.")

		saynn("[say=eliza]I need to fill in some paperwork now, I hope you will find your way back to the lobby~.[/say]")

		saynn("You nod.. your breathing seems to be almost back.")

		saynn("It's time to go.")

		addButton("Continue", "See what happens next", "endthescene")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "on_floor"):
		processTime(5*60)

	if(_action == "eliza_begins_to_pawjob"):
		processTime(5*60)

	if(_action == "process_cum"):
		processTime(5*60)
		amountCollected = GM.main.SCI.processMilkPlayerPenis()
		GM.pc.orgasmFrom("eliza")

	if(_action == "after_milking"):
		processTime(3*60)

	setState(_action)

func saveData():
	var data = .saveData()

	data["amountCollected"] = amountCollected

	return data

func loadData(data):
	.loadData(data)

	amountCollected = SAVE.loadVar(data, "amountCollected", 0.0)
