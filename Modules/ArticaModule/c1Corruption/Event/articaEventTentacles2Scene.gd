extends SceneBase

var isNaked = false
var isCaged = false
var corruption = 0.0
var isSlut = false
var isVerySlut = false
var isLusty = false
var nakedAndShy = false

func _init():
	sceneID = "articaEventTentacles2Scene"

func _run():
	if(state == ""):
		addCharacter("artica")
		isNaked = getFlag("ArticaModule.NoClothes", false)
		isCaged = getCharacter("artica").isWearingChastityCage()
		corruption = getModule("ArticaModule").getCorruption()
		isSlut = getModule("ArticaModule").isSlut()
		isVerySlut = getModule("ArticaModule").isVerySlut()
		isLusty = getModule("ArticaModule").isLusty()
		nakedAndShy = (isNaked && !isSlut)
		playAnimation(StageScene.Solo, "walk", {pc="artica"})
		aimCameraAndSetLocName("hall_mainentrance")
		saynn("While holding that strange little flower in paw, Artica is seemingly heading towards the medical block again."+str(" She has to awkwardly cover her private bits up at the same time to avoid drawing too much attention.." if nakedAndShy else "")+"")

		saynn("Interesting..")

		saynn("You have to take the first elevator alone again.. while you just stay outside and wait for the second one..")

		addButton("Medical", "See what happens there", "in_medical")
	if(state == "in_medical"):
		addCharacter("eliza")
		playAnimation(StageScene.Duo, "stand", {pc="artica", npc="eliza"})
		saynn("You ride the elevator to the lower floor.. and sneakily enter the medical lobby, trying not to draw too much attention to yourself.")

		saynn("Artica seems to be showing that plant to the feline doctor..")

		saynn("[say=artica].. ..[/say]")

		saynn("[say=eliza]Ohh. Great, that's exactly it. Gimme gimme~. Now wait here for a bit![/say]")

		saynn("The feline rushes off somewhere, leaving"+str(" naked" if isNaked else "")+" Artica to stand near the counter. Soon, the doctor returns, holding some kind of vial..")

		saynn("[say=eliza]And they were afraid I'd blow up this station too, silly people. Everything went just fine~.[/say]")

		saynn("For some reason you can sense a faint smell of burnt plastic..")

		saynn("[say=artica].. ..?[/say]")

		saynn("[say=eliza]Yep. I want you to test it and tell me the results. Pour it over the same flowers, small ones, we'd rather not ruin all the actual food.[/say]")

		saynn("Artica grabs the vial with some kind of glowing green fluid.. and stores it.")

		saynn("[say=artica].. ..? ..[/say]")

		saynn("[say=eliza]Oh yeah, Nova? I can schedule her a random medical checkup.. Let's say.. for right now~. Sounds good?[/say]")

		saynn("Artica nods-nods.")

		saynn("[say=eliza]Have fun then~.[/say]")

		saynn("The fluff blushes.. and heads back into the elevator.")

		addButton("Follow", "See where the fluff is heading..", "artica_in_greenhouses")
	if(state == "artica_in_greenhouses"):
		playAnimation(StageScene.Solo, "walk", {pc="artica"})
		aimCameraAndSetLocName("main_greenhouses")
		GM.pc.setLocation("main_greenhouses")
		saynn("Artica approaches those hidden stairs again.. and starts sneaking. She follows the same route as before, avoiding the random patrols, most of which seem to be sleeping on their job.")

		saynn("You do the same, following Artica's steps.. almost like a hunter.")

		saynn("Eventually the fluff reaches the green houses. And since there is no threat of Nova, she steps inside.")

		addButton("Greenhouses", "See what Artica will do there", "artica_pours_drug_on_plant")
	if(state == "artica_pours_drug_on_plant"):
		saynn("You sneak inside.. but decide to stay near the exit, in case something goes wrong again.")

		saynn("Artica approaches one of the big long trays that holds many growing little flowers.. Her hand pulls out that strange vial.. and just holds it.")

		saynn("The fluff seems to be trying to gather enough strength to commit, her eyes closed as she whispers something to herself.")

		saynn("Then she finally opens the vial.. and pours its green glowing contents onto the flowers.")

		saynn("Nothing happens.. at first.. the plants shiver a bit and that's about it. But as soon as the glowing fluid began visibly traveling along the stems of those flowers, things quickly began to change..")

		addButton("Continue", "See what happens next", "plant_grabs_artica")
	if(state == "plant_grabs_artica"):
		playAnimation(StageScene.TentaclesTease, "tease", {pc="artica", plant=true, bodyState={hard=true}})
		saynn("The flowers began growing at an astonishing rate, the stems getting thicker and longer, curling and twisting towards the light. The petals quickly fall off of the tips, revealing green pointy.. tendrils.")

		saynn("Artica steps back, her eyes wide with amazement.")

		saynn("[say=artica]It really works.. wow..[/say]")

		saynn("Her wonder quickly turns to alarm.. as one of the tendrils suddenly wraps around her ankle.")

		saynn("[say=artica]Um.. h-hey.. l-let go..[/say]")

		saynn("Artica is trying to pull her leg out.. but the plants are still growing and their grip only gets tighter.. The poor fluff is shaking from fear.."+str(" Her exposed canine cock is hard as a rock.." if (isNaked && !isCaged) else "")+"")

		saynn("Fueled by adrenaline, Artica manages to grab onto one of the steel beams that support the roof of this greenhouse.. and starts pulling herself free.")

		addButton("Lock the doors", "(Noncon variant) Prevent Artica from escaping the monster that she created..", "lock_doors")
		addButton("Just watch", "(Consensual variant) Just watch what happens next", "con_variant")
	if(state == "lock_doors"):
		addCharacter("artica", ["naked"])
		playAnimation(StageScene.TentaclesTease, "tease", {pc="artica", plant=true, bodyState={hard=true, naked=true}})
		saynn("Artica is about to escape the green tentacles.. but you're way too curious to see what they will do to her.. so you just quickly slip out of the greenhouse and lock the doors, trapping the fluff inside..")

		saynn("Another few fast-growing tendrils slither over her body.. trying to pull her closer..")

		saynn("[say=artica]S-ss..stop i-it..[/say]")

		saynn("Miraculously, the fluff manages to free her leg! Swiftly, she makes a run towards the exit.. but hits the closed doors.")

		saynn("[say=artica]Wha.. h-how.. w-why are t-these.. w-wait!.. h-help!..[/say]")

		saynn("Panic overwhelms her, she desperately pushes on the doors, trying to open them.. until a lonely tendril grows long enough to lasso itself around Artica's ankle and firmly yank her back, making the poor terrified girl lose balance and collapse.")

		saynn("[say=artica]EEK![/say]")

		saynn("She tries to cling onto the floor with her claws.. but more tendrils are fast to wrap around her thighs and wrists, pulling her back to where she was standing before..")

		if (!isNaked):
			saynn("One of tendrils slips under her shirt.. and tugs it off.. while another few.. find her"+str(" caged drippy cock" if isCaged else " hard canine cock")+" and sensitive pussy, tucked away in her shorts.. that they quickly expose..")

			saynn("[say=artica]M-my u-uniform.. n-no.. w-wait.. p-pp..please..[/say]")

		else:
			saynn("One tendril finds Artica's breasts and wraps around them.. while another few.. reach her"+str(" caged drippy cock" if isCaged else " hard canine cock")+" and sensitive pussy..")

			saynn("[say=artica]N-no.. w-wait.. p-pp..please..[/say]")

		addButton("Continue", "See what happens next", "artica_noncon_cum")
	if(state == "artica_noncon_cum"):
		playAnimation(StageScene.TentaclesTease, "inside", {pc="artica", plant=true, bodyState={hard=true, naked=true}})
		saynn("Artica's heart is pounding in her as she is desperately trying to struggle free.. and yet.. the plant's hold was unyielding. It's like it had a mind of its own..")

		saynn("A thick, slick tendril presses itself against her pussy, teasing the wet entrance.. before pushing inside, spreading the cyan folds wide in one rough thrust!")

		saynn("[say=artica]AH!.. W-wait!..[/say]")

		if (isCaged):
			saynn("At the same time, another small, cute tendril manages to slip under Artica's chastity cage and slide inside her sheath, teasing and stroking the locked pulsing member, forcing moans out of the poor fluff as pleasure and fear were flooding her mind both..")

		else:
			saynn("At the same time, another tendril wraps around her canine cock and starts stroking it with a rhythmic, relentless pressure, forcing moans out of the poor fluff as pleasure and fear were flooding her mind both..")

		saynn("[say=artica]Nhh.. ahh.. m-my p-pussy.. ah.. s-sto.. p.. ah-h..[/say]")

		saynn("The tendrils were fucking her mercilessly, one thrusting deep into her pussy, hitting spots that make her gasp and moan, her inner walls clenching hard around it.. while the other is stroking her cock"+str(", making it throb inside its little cage.." if isCaged else ", making the knot at its base start getting bigger and fatter..")+" The relentless stimulation is overwhelming her senses..")

		saynn("[say=artica]Nh-h.. t-too m-much.. ah.. ahh-.. ah..[/say]")

		saynn("The pleasure was too much, too intense..")

		saynn("With a loud cry, Artica cums hard, her {artica.penis} erupting with thick, hot spurts of cum that splatter against her belly and all the tendrils around, her pussy desperately trying to milk the thick one that's inside her.")

		saynn("Organic waves are being forced through her body.. one after another.. while all her paws are being held in place, keeping the fluff helpless against the torrent of ecstatic sensations..")

		saynn("[say=artica]Ah..ahh.ahh.ah..[/say]")

		saynn("As her orgasm begins to fade, the tendrils slowly release their grip, putting Artica to lay on the floor.. while they themselves retreat to their original position, slowly getting smaller..")

		saynn("Artica stares up at the ceiling, her body trembling from the intense experience.")

		saynn("[say=artica]W-w.. hh.. ah.. w-what have I d-done..[/say]")

		saynn("Artica struggles to get up to her feet, her legs shaky.."+str(" She grabs her clothes and looks at the plants with a mix of awe and fear.." if !isNaked else "She looks at the plants with a mix of awe and fear..")+" Echoes of pleasure still linger in her thoroughly used body..")

		saynn("After catching her breath, she walks past you, her mind so spaced out that she doesn't even realize that the doors are opened again..")

		saynn("Time for you to leave too.")

		addButton("Continue", "See what happens next", "endthescene")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "in_medical"):
		processTime(3*60)

	if(_action == "artica_in_greenhouses"):
		processTime(10*60)

	if(_action == "artica_pours_drug_on_plant"):
		processTime(5*60)

	if(_action == "plant_grabs_artica"):
		processTime(3*60)

	if(_action == "lock_doors"):
		processTime(5*60)

	if(_action == "con_variant"):
		processTime(5*60)

	if(_action == "artica_noncon_cum"):
		processTime(5*60)
		getCharacter("artica").cummedOnBy("artica")
		getModule("ArticaModule").triggerCorruption(0.07)

	setState(_action)

func saveData():
	var data = .saveData()

	data["isNaked"] = isNaked
	data["isCaged"] = isCaged
	data["corruption"] = corruption
	data["isSlut"] = isSlut
	data["isVerySlut"] = isVerySlut
	data["isLusty"] = isLusty
	data["nakedAndShy"] = nakedAndShy

	return data

func loadData(data):
	.loadData(data)

	isNaked = SAVE.loadVar(data, "isNaked", false)
	isCaged = SAVE.loadVar(data, "isCaged", false)
	corruption = SAVE.loadVar(data, "corruption", 0.0)
	isSlut = SAVE.loadVar(data, "isSlut", false)
	isVerySlut = SAVE.loadVar(data, "isVerySlut", false)
	isLusty = SAVE.loadVar(data, "isLusty", false)
	nakedAndShy = SAVE.loadVar(data, "nakedAndShy", false)
