extends SceneBase

var s4Outcome = ""

func _init():
	sceneID = "articaS5CanteenPawsScene"

func _run():
	if(state == ""):
		addCharacter("artica")
		playAnimation(StageScene.Duo, "sit", {npc="artica", npcAction="sit"})
		saynn("Artica seems to be occupying her usual spot. She looks a bit.. sad.. more than usual.. so you skip the meal and go straight to her table.")

		s4Outcome = getFlag("ArticaModule.s4Outcome", "left")
		if (s4Outcome == "left" || s4Outcome == "won"):
			saynn("[say=pc]Hey Artica. How was it. The mines.[/say]")

			saynn("[say=artica]It was.. f-fine?..[/say]")

			saynn("There is no way that's true.")

			saynn("[say=pc]But how was it actually?[/say]")

			saynn("[say=artica]It was painful.. still is.. oww-w..[/say]")

		else:
			saynn("[say=pc]Hey Artica. You're alright?[/say]")

			saynn("[say=artica]I'm.. okay..[/say]")

			saynn("Judging from how she looks, there is no way that's true.")

			saynn("[say=pc]But how are you actually?[/say]")

			saynn("[say=artica]Not that good.. oww-w..[/say]")

		saynn("For some reason, the girl winces each time tries to move her legs.. and since she does that a lot, the girl is wincing constantly.")

		saynn("[say=artica]I think I stepped on a rock.. wrong.. still hurts a bit..[/say]")

		addButton("Take a look", "See if something is wrong with Artica's hind leg", "take_look")
	if(state == "take_look"):
		playAnimation(StageScene.CheckPaw, "check", {pc="artica", npc="pc"})
		saynn("You look under the table.. but it's too dark there to see anything.")

		saynn("[say=pc]Alright, let me take a look.[/say]")

		saynn("You get up and approach Artica.")

		saynn("[say=pc]I will need you sitting the other way. Which one hurts?[/say]")

		saynn("[say=artica]..mm-m.. right one..[/say]")

		saynn("Your hand lands on her shoulder and helps to turn her around, Artica doesn't resist it.")

		saynn("After that, you crouch and carefully lift her right hind leg a bit, your hands supporting the ankle.. so fluffy.")

		saynn("A quick visual check.. Everything seems fine.")

		saynn("[say=pc]Where does it hurt?[/say]")

		saynn("Artica tries to curl her toes.. and winces again, her hind paw sprawling wide from a spasm.")

		saynn("[say=artica]Eep..[/say]")

		saynn("Huh. You lift the paw a little higher and look below, at her cyan rough beans. Again, there doesn't seem to be any obvious damage done to them.. which is good.")

		saynn("[say=pc]I think you just pulled a muscle, Artica.[/say]")

		saynn("[say=artica]Mm..m.. What should I do..[/say]")

		addButton("Paw massage", "Knead her hind paw a bit to try to take the edge off", "paw_massage")
		addButton("Bring to medical", "Just bring Artica to medical where the doctor can help her", "bring_to_doctor")
	if(state == "bring_to_doctor"):
		playAnimation(StageScene.Duo, "stand", {npc="artica"})
		aimCameraAndSetLocName("med_lobbymain")
		GM.pc.setLocation("med_lobbymain")
		saynn("[say=pc]It can heal on its own. But it's best if we go see a doctor.[/say]")

		saynn("[say=artica]Oh.h-h.. r.r-right..[/say]")

		saynn("Just the thought of meeting new people makes Artica stutter again it seems.")

		saynn("No point in putting it away any longer, you use your hands to support Artica as she is getting up, the girl has to hop around on one leg basically.")

		saynn("[say=artica]Ee..p-p.. eep.. ow..[/say]")

		saynn("[say=pc]No rush.[/say]")

		saynn("One hop at a time, you eventually get to the medical.")

		addButton("Continue", "See what happens next", "in_medical")
	if(state == "in_medical"):
		addCharacter("eliza")
		playAnimation(StageScene.Duo, "struggle_legs", {npc="eliza", pc="artica"})
		saynn("The doctor quickly approaches you two as you hop into the lobby.")

		saynn("[say=eliza]Dr. Quinn here. Easy there, let me see.[/say]")

		saynn("[say=pc]Pulled muscle.[/say]")

		saynn("She quickly examines the hurt hind paw.")

		saynn("[say=eliza]Mhm, seems like. The pawpads look pristine, would totally rub them if no one was watching. Heh.[/say]")

		saynn("Artica blushes hearing that. The feline doctor produces an elastic bandage and puts it around the girl's ankle.")

		saynn("[say=eliza]There we go. How did you pull it?[/say]")

		saynn("[say=artica]Mines..[/say]")

		saynn("[say=pc]Was her first time with a pickaxe.[/say]")

		saynn("The feline hums and rubs her chin.")

		saynn("[say=eliza]Guess your paws just weren't made for this. Get some rest, you need it. If you want, we have some special rooms here, they're very soft~.[/say]")

		saynn("[say=artica]Mm-m.. It's okay.. Thank you, I feel better already.[/say]")

		saynn("At least you feel like Artica has made some progress, she is not as shy as before.")

		addButton("Continue", "See what happens next", "artica_thanks_pc")
	if(state == "artica_thanks_pc"):
		removeCharacter("eliza")
		playAnimation(StageScene.Duo, "stand", {npc="artica"})
		saynn("The feline doctor nods and leaves, seeing that the bandage had a positive effect.")

		saynn("[say=artica]Thank you too.. Don't know how I can..[/say]")

		saynn("[say=pc]Go get some rest. I will see you around.[/say]")

		saynn("Artica smiles and nods, putting most of her weight onto the healthy leg while holding her arms spread wide to help with the balance. Her fluffy tail wraps around your thigh, hugging your leg warmly.")

		saynn("[say=artica]Same place..[/say]")

		saynn("That feels like an invitation. After that, she leaves you be. Time to go.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "paw_massage"):
		playAnimation(StageScene.CheckPaw, "beans", {pc="artica", npc="pc"})
		saynn("[say=pc]Nothing a little massage can't fix.[/say]")

		saynn("[say=artica]I.. I d-don't know if..[/say]")

		saynn("Artica hesitates.. but as soon as your digits begin brushing against her fluffy ankle, warming it up, the girl becomes quiet.")

		saynn("You just smile as your palms work their magic, pulling any tension out of her muscles. You can see Artica fidgeting more as you knead her hind leg, the toes on the healthy one curl up and sprawl out rhythmically.")

		saynn("[say=artica]Nn-n.. h-hah.. mmhmm.. t-there.. y-yes.. mm.m.m..[/say]")

		saynn("Cute shy noises escape her maw. Artica raises her chin a bit, her breathing gets deeper, the pain seems to gradually leave her foot.")

		saynn("Seeing how much she likes it, you might as well offer something extra. One of your hands keeps supporting the ankle while the second one lands on the cyan beans and starts gently rubbing them.")

		saynn("[say=artica]Ah-h.. e-eep.. ah..[/say]")

		saynn("As you do that, Artica starts squirming under your touch, closing and spreading her legs, arching her back a bit.. producing little moans..")

		saynn("You also notice her shorts bulging out in the crotch region.. A small wet spot appears.. two spots actually.. The fluff must be really liking this.")

		saynn("She notices your smirk.. and blushes deeply. Her hands cover her crotch as you keep teasing her toes with gentle circular strokes around each cyan bean.")

		saynn("[say=artica]H-hah.. p-please.. it's t-too much.h..[/say]")

		saynn("So adorable. You decide to stop there, probably best not to overstimulate her hurt hindpaw.")

		saynn("[say=pc]Glad it seems to be better already.[/say]")

		saynn("[say=artica]Mm-mmh.. nnhh-h.. y-yes-s.. ah..ah.. thank you..[/say]")

		saynn("You smile and carefully put the paw onto the cold floor.")

		saynn("[say=pc]Go get some rest now, don't stress your muscles.[/say]")

		saynn("[say=artica]Y-yes.. G-good idea..[/say]")

		saynn("You help the blushing girl to get up, supporting her as she tries to balance on one leg and cover her crotch at the same time.")

		saynn("[say=artica]I will be here.. t-tomorrow..[/say]")

		saynn("Hah. That feels like an invitation.")

		saynn("Artica tests the ground with her hurt paw.. and seems to be able to stand on it mostly. So she proceeds to head towards the exit.")

		saynn("[say=pc]See you around.[/say]")

		saynn("She chrrrrs back.")

		addButton("Continue", "See what happens next", "endthescene")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "take_look"):
		processTime(3*60)

	if(_action == "paw_massage"):
		processTime(15*60)
		getModule("ArticaModule").addPawslut(0.1)
		getModule("ArticaModule").removeShy(0.1)
		setFlag("ArticaModule.s5GaveMassage", true)

	if(_action == "bring_to_doctor"):
		processTime(15*60)
		setFlag("ArticaModule.s5GaveMassage", false)

	if(_action == "in_medical"):
		processTime(6*60)
		getModule("ArticaModule").removeShy(0.1)

	if(_action == "artica_thanks_pc"):
		processTime(3*60)

	setState(_action)

func saveData():
	var data = .saveData()

	data["s4Outcome"] = s4Outcome

	return data

func loadData(data):
	.loadData(data)

	s4Outcome = SAVE.loadVar(data, "s4Outcome", "")
