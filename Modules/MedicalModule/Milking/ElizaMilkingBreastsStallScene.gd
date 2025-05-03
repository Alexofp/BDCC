extends SceneBase

var amountCollected = 0.0

func _init():
	sceneID = "ElizaMilkingBreastsStallScene"

func _run():
	if(state == ""):
		addCharacter("eliza")
		aimCameraAndSetLocName("med_milkingroom")
		playAnimation(StageScene.Grope, "tease", {pc="pc", npc="eliza", milkTank=true, bodyState={exposedChest=true}})
		saynn("You ask the doctor to milk you. She nods and brings you into the special room. She picks an empty stall and brings a milk tank.")

		saynn("You expose your {pc.breasts} and wait for her orders. You feel excited..")

		saynn("[say=eliza]Great. Let's get you prepared~.[/say]")

		saynn("She gestures for you to get into the right spot.. in front of a long pipe.. that has some cuff-like restraints attached to it.")

		saynn("Doctor's paw lands on your back and starts putting pressure on it, inviting you to bend forward.")

		addButton("Bend forward", "Do what she wants you to do", "get_locked")
	if(state == "get_locked"):
		playAnimation(StageScene.MilkingStallDuo, "start", {pc="pc", npc="eliza", bodyState={exposedChest=true, hard=true, chains=[["short", "neck", "scene", "bottompipe"]]}})
		saynn("You follow the guidance of that paw, slowly bending forward and assuming the final position. You place your wrists in the offered holes for them in the restraints.. and watch as the doctor locks them up. Then, she also pulls out a short chain leash, attaching one end to your collar and the other to the sturdy pipe..")

		saynn("[say=eliza]Just so you don't move as much, we don't want to waste even a drop~.[/say]")

		saynn("Fair enough.. You can't help to notice.. that your position is quite.. vulnerable.. your {pc.breasts} dangling invitingly underneath you.")

		saynn("Eliza moves the empty fluid tank underneath your chest and then kneels in front of you. Her green eyes quickly inspect your exposed forms with a professional gaze.. with some unfiltered hints hidden in it..")

		addButton("Continue", "See what happens next", "do_milk_start")
	if(state == "do_milk_start"):
		playAnimation(StageScene.MilkingStallDuo, "milk", {pc="pc", npc="eliza", bodyState={exposedChest=true, hard=true, chains=[["short", "neck", "scene", "bottompipe"]]}})
		saynn("Carefully, she reaches her paws out and starts by cupping your breasts.. getting a rough feel for their weight. Her touch is quite soft.. but skilled.. Eliza's fingertips trace delicate circles around the areolas.. causing your nips to get all stiff..")

		saynn("Time seems to slow as she begins the procedure. With the first deliberate squeeze, a few droplets of {pc.milk} appear on your nipples.. tiny beads of creamy stuff that hover for some time.. before falling into the fluid reservoir beneath with a satisfying plink. Feels good.. your body shivers slightly as your breasts release their first drops of {pc.milk}..")

		saynn("From that point on, Eliza's touch becomes more insistent, her skilled paws working their magic over your udder-like mounds.. She kneads your flesh in slow, rhythmic motions, milking you.. Her palms compress and release repeatedly, sending waves of delicious warmth through you while drawing out more of your stored nectar. Your breathing becomes deeper, your body squirming ever so slightly against the restraints.. plink, plink..")

		saynn("Some of the squeezes are followed by an occasional pinch of your sensitive nips, further coaxing the milky nectar to flow freely. More and more of it begins to accumulate in the milk tank, your breasts producing a steady flow..")

		saynn("Eliza's eyes checkout your face sometimes.. making your cheeks turn redder each time. She is milking you like you're a cow.. but it's hard to deny that it feels good.. Very subtle quiet moans escape your lips, together with soft panting.. your body keeps wanting to squirm from the pleasurable stimulation of your breasts..")

		saynn("You close your eyes and just focus on the nice sensations.. while Eliza is hard at work, kneading and massaging your breasts..")

		addButton("Continue", "See what happens next", "do_milk_process")
	if(state == "do_milk_process"):
		playAnimation(StageScene.MilkingStallDuo, "start", {pc="pc", npc="eliza", bodyState={exposedChest=true, hard=true, chains=[["short", "neck", "scene", "bottompipe"]]}})
		saynn("Eventually, the flow of your {pc.milk} begins to subside.. Eliza's rhythmic kneading slows down.. switching to gentle caressing.")

		saynn("She carefully releases your breasts, after ensuring that the last traces of your {pc.milk} got captured in the reservoir underneath you.")

		saynn("[say=eliza]Thank you for being so productive~.[/say]")

		saynn("The genuine warmth in her tone washes over you.")

		saynn("[say=eliza]Always nice to see you around.[/say]")

		saynn("She unlocks your wrists and unclips the leash, allowing you to straighten your posture. Feels so weird to be standing straight again. The milking is done.. so she brings you out into the corridor.")

		saynn("[say=eliza]Hope you will find your way back, I gotta go fill in some paperwork.[/say]")

		saynn("Time to go..")

		addButton("Continue", "See what happens next", "endthescene")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "get_locked"):
		processTime(5*60)

	if(_action == "do_milk_start"):
		processTime(5*60)

	if(_action == "do_milk_process"):
		processTime(5*60)
		amountCollected = GM.main.SCI.processMilkPlayerBreasts()

	setState(_action)

func saveData():
	var data = .saveData()

	data["amountCollected"] = amountCollected

	return data

func loadData(data):
	.loadData(data)

	amountCollected = SAVE.loadVar(data, "amountCollected", 0.0)
