extends SceneBase

var isFirst = true
var amountCollected = 0.0

func _init():
	sceneID = "ElizaMilkingProstateHandScene"

func _run():
	if(state == ""):
		addCharacter("eliza")
		if (isFirst):
			saynn("The feline seems to be filling out some reports, barely paying any attention now.")

			saynn("[say=pc]Hey. I want to donate my.. seed. I think.. How do I do that?[/say]")

			saynn("Your shyness makes her raise her gaze and inspect you a little more.")

			saynn("[say=eliza]Hm. I can give you a plastic container to do your thing into..[/say]")

			saynn("She tilts her head slightly, the tip of her tongue sneakily sliding along her top teeth.")

			saynn("[say=eliza]But I think I have some time to do it properly. That's okay with you?[/say]")

			saynn("[say=pc]Uh.. what is?[/say]")

			saynn("She tilts her head the other way, her expression staying quite serious.")

			saynn("[say=eliza]Yeah, just follow me, I will help you.[/say]")

			saynn("Sounds good.. Help is always good.")

		else:
			saynn("You tell Eliza that you need your prostate to be milked.")

			saynn("She nods and invites you to follow her.")

		addButton("Follow", "See where she will bring you", "in_heaven")
	if(state == "in_heaven"):
		aimCameraAndSetLocName("med_milkingroom")
		playAnimation(StageScene.Grope, "tease", {pc="pc", npc="eliza", bodyState={exposedCrotch=true}})
		saynn("Eliza brings you into a big open space.. with big fluid tanks on one side of it and some kind of stalls on the other. But she skips past that and brings you in a secluded room instead.. much smaller one.. but with way more equipment.")

		saynn("In the middle of it.. a hi-tech-looking medical table.. outfitted with all sorts of sensors and tools.. connected to a computer.")

		saynn("As Eliza turns it on, the soft hum of the machinery fills the air.")

		saynn("[say=eliza]Alright, I will need access to your.. you know.[/say]")

		saynn("Makes sense.. you obey, exposing your {pc.penis} and covering it up with your hands..")

		if (GM.pc.isWearingChastityCage()):
			saynn("But Eliza's professional gaze seems to be trained on picking up even the slightest thing. She takes note of what's between your legs and offers you some extra words.")

			saynn("[say=eliza]Chastity cage?[/say]")

			saynn("Makes you wonder what gave it away.")

			saynn("[say=pc]Uhh..[/say]")

			saynn("The corners of her mouth curl up slightly.")

			saynn("[say=eliza]Don't worry, that's why I brought you here.[/say]")

		else:
			saynn("[say=eliza]Try not to worry so much, inmate, really. We will get you milked dry in no time.[/say]")

			saynn("[say=pc]If it involves stroking, I'm not sure if I can do it in front of..[/say]")

			saynn("She cuts you off and scritches you under the chin.")

			saynn("[say=eliza]Don't worry, that's why I brought you here.[/say]")

		saynn("Sounds.. a bit ominous.")

		addButton("Continue", "See what happens next", "lock_to_table")
	if(state == "lock_to_table"):
		playAnimation(StageScene.MilkingProstate, "tease", {pc="pc", npc="eliza", bodyState={exposedCrotch=true}})
		saynn("Without a word extra, Eliza presses some buttons on the computer.. and almost immediately, some kind of mechanical arms emerge from the table and begin reaching towards you!")

		saynn("Before you can react, they get a grasp on your ankles and wrists.. and pull you towards the table, bending you over it.")

		saynn("And now, your body is rendered completely helpless, your {pc.masc} back curving and your {pc.thick} butt fully exposed.. with your {pc.analStretch} tailhole clearly visible.. your {pc.penis} is hovering over some kind of.. fluid receiver.")

		saynn("[say=pc]Uh..[/say]")

		saynn("[say=eliza]Just so you don't wiggle too much. Don't worry, patient, I'm a professional.[/say]")

		saynn("Right..")

		saynn("[say=pc]Okay..[/say]")

		saynn("Eliza puts on a pair of pristine-looking white latex gloves that cling to her graceful fingers. She then also retrieves a lubricant tube and sits behind you.. her curious eyes can see your.. everything..")

		saynn("Leaning forward, she begins to apply a generous amount of that lube along your exposed anal ring. The cool, slick sensations against your skin sends shivers racing down your spine. She starts spreading it too, doing little circular motions along your sensitive star.. making your muscles clench.. and your cock twitch"+str(" in its little cage" if GM.pc.isWearingChastityCage() else "")+"..")

		saynn("[say=pc]Ah..[/say]")

		saynn("[say=eliza]It's cold, I know. Just endure it for a bit. You don't want me to go in raw~.[/say]")

		saynn("Her tone is so playful now.. But you can't really do anything but trust her by this point.")

		saynn("One of the table's manipulators brings a screen closer to Eliza's eyes. A screen that seems to be showing some kind of info about you..")

		addButton("Continue", "See what happens next", "milking_begins")
	if(state == "milking_begins"):
		playAnimation(StageScene.MilkingProstate, "milk", {pc="pc", npc="eliza", bodyState={exposedCrotch=true, hard=true}})
		saynn("Her gloved fingers, precise and expert, begin to prod at your anal ring, gently teasing and rubbing.. until it accepts one of her fingers. She gently wiggles it inside while working in the second one.. making you breathe a little heavier..")

		saynn("[say=eliza]There we go. You think two is enough?[/say]")

		saynn("She leans to the side to look at your blushing face..")

		saynn("[say=pc]Uh.. maybe..[/say]")

		saynn("[say=eliza]I can always add more later~.[/say]")

		saynn("She slips them a little deeper and curls them.. finding a little walnut-like bean.. squeezing it makes you suddenly squirm, a spike of sensations rushing through you.. She doesn't even need that info screen to know that she found the right spot.")

		saynn("[say=pc]Ahh..[/say]")

		saynn("Your cock twitches more"+str(" in its tight cage" if GM.pc.isWearingChastityCage() else "")+".. a little bead of your precum already hanging from the tip.")

		saynn("Satisfied with the reaction, Eliza proceeds to gently knead that bean more, curling and wiggling her digits inside your tailhole. You're not sure if it's the lube that's making your prostate so sensitive.. or maybe it's her skilled fingers.. or this helpless position that you're in.. but you begin moaning, your body trying to convulse from little spasms that rock through you.. but the restraints keep you nice and still for her.")

		saynn("[say=pc]Mm-m.. ah.. ah..[/say]")

		saynn("Her careful, deliberate strokes awaken a deep, pulsating pressure inside you. Heat is spreading along your whole body.. emanating from your stimulated tailhole.")

		saynn("Eliza's fingers keep methodically pressing against your prostate, coaxing it to start producing.. making it so your cock is leaking some kind of transparent fluid. With each subtle squeeze, your balls tighten and your inner muscles clench around the intruding fingers.. your hips jerking slightly.")

		saynn("[say=eliza]It's getting all nice and swollen, I can feel it~.[/say]")

		saynn("Without much trouble, she slips in a third digits down your needy tailhole, stretching it slightly wider and intensifying her onslaught on your pleasure bean. Your cock begins to spurt small, rhythmic bursts of that prostate fluid.. all of it landing into the collector below.")

		saynn("[say=pc]Ah.. ahh.. mhh.. ffhh.. hhh..[/say]")

		saynn("Your breathing is deep and heavy.. passionate moans keep slipping past your lips.. "+str("Your member is desperately trying to get hard in its little prison.. which, in turn, makes you desperate too.. desperate for a release." if GM.pc.isWearingChastityCage() else "Your member is hard as a rock, desperate for any direct stimulation.. but not finding any.. which, in turn, makes you desperate too.. desperate for a release.")+"")

		saynn("Here you are, squirming and panting and dripping.. about to cum.. while Eliza just keeps casualling sliping her digits in and out, stimulating your prostate with simple strokes. A little smile does shine on her face though..")

		addButton("Orgasm", "See what happens to your prostate next..", "process_cum")
	if(state == "process_cum"):
		playAnimation(StageScene.MilkingProstate, "fast", {pc="pc", npc="eliza", pcCum=true, bodyState={exposedCrotch=true, hard=true}})
		saynn("At some point.. it becomes too much. Every nerve, every fiber of your being, seems to suddenly ignite with pure, wild euphoria.. you cum hard.. Your cock starts to throb, your balls twitching, as your {pc.cum} gets forced out in a series of many weak but intensely satisfying spurts.. little weak strings of your seed that dribble from the tip of your member, landing into the machine's reservoir.")

		saynn("[say=pc]Ah!.. ahh.. f-f.. ah..[/say]")

		saynn("[say=eliza]Good.. good.. Let's make sure none of that useless seed stays in those balls.[/say]")

		saynn("Her free hand gets a hold of your twitching balls.. and squeezes them gently in her palm.. while still milking the fuck out of your prostate, causing your poor pulsing cock to keep dribbling more of its seed out, your prostate orgasm is making you squirm against the restraints hard.")

		saynn("[say=pc]F-fuck.. ah..[/say]")

		saynn("Eventually, the spasms begin to get weaker.. your orgasm coming to its end.. leaving your tailhole to clench tightly around Eliza's digits.")

		saynn("[say=eliza]There we go.. milked completely dry.[/say]")

		saynn("She gently taps your ballsack with her digits.. and pulls her other digits out.")

		addButton("Continue", "See what happens next", "after_milking")
	if(state == "after_milking"):
		playAnimation(StageScene.Duo, "stand", {npc="eliza"})
		GM.pc.setLocation("med_nearmilking")
		aimCameraAndSetLocName("med_nearmilking")
		saynn("Eliza takes off her gloves and presses a few buttons on the computer that make it let go of your limbs.")

		saynn("Your legs feel weak so you just flop onto the table for a bit, trying to catch your breathing.")

		saynn("[say=eliza]Thank you for your donation~. Come again when you feel like doing so, it helps a lot.[/say]")

		saynn("You nod.. blushing deeply..")

		saynn("Eliza brings you out into the corridor.")

		saynn("[say=eliza]If you excuse me, I gotta fill in some paperwork now. Hope you can find the way back to the lobby.[/say]")

		saynn("And just like that, she leaves you..")

		saynn("Time to go.")

		addButton("Continue", "See what happens next", "endthescene")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "in_heaven"):
		processTime(3*60)

	if(_action == "lock_to_table"):
		processTime(5*60)

	if(_action == "milking_begins"):
		processTime(10*60)

	if(_action == "process_cum"):
		processTime(5*60)
		amountCollected = GM.main.SCI.processMilkPlayerPenis()
		GM.pc.orgasmFrom("eliza")

	if(_action == "after_milking"):
		processTime(5*60)

	setState(_action)

func saveData():
	var data = .saveData()

	data["isFirst"] = isFirst
	data["amountCollected"] = amountCollected

	return data

func loadData(data):
	.loadData(data)

	isFirst = SAVE.loadVar(data, "isFirst", true)
	amountCollected = SAVE.loadVar(data, "amountCollected", 0.0)
