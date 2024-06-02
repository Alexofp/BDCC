extends SceneBase

var isNaked = false
var isCaged = false
var corruption = 0.0
var isSlut = false
var isVerySlut = false
var isLusty = false
var nakedAndShy = false

func _init():
	sceneID = "articaEventPortalPanties2Scene"

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
		saynn("Artica seems to be heading towards the elevator.")

		saynn("Your guess is, she is heading towards the workshop again..")

		addButton("Follow", "See where she goes", "in_workshop")
	if(state == "in_workshop"):
		GM.pc.setLocation("eng_workshop")
		aimCameraAndSetLocName("eng_workshop")
		addCharacter("alexrynard")
		playAnimation(StageScene.Duo, "stand", {pc="artica", npc="alexrynard"})
		saynn("And you weren't wrong, Artica is standing near that engineer foxy.")

		saynn("[say=alexrynard]Look, I'm busy. I don't want to sound mean but.. I'm not eager for sex like most people seem to be here.[/say]")

		saynn("The foxy struggles to find the right words, speaking strictly but slowly. The fluff lowers her gaze.")

		saynn("[say=artica].. ..[/say]")

		saynn("[say=alexrynard]I'm glad that you like being a test subject. I'm sure someone in the medical wing would appreciate that. Mhm?[/say]")

		saynn("Engineer sighs and tries to return to his current task, his hand holding a screwdriver. He tries to unscrew something.. but his hands begin to shake when Artica starts leaving..")

		saynn("[say=alexrynard]Wait![/say]")

		saynn("The fluff instantly returns to the foxy, her eyes full of hope. All the while the engineer sighs again.")

		saynn("[say=alexrynard]I got something else you can test. But this is the last time.[/say]")

		saynn("Foxy reaches under the workbench.. and pulls another case out. He opens it.. revealing.. panties? Purple panties. Artica tilts her head watching a normal-looking piece of clothing.")

		saynn("[say=artica]..?[/say]")

		saynn("[say=alexrynard]Nu huh, look.[/say]")

		saynn("He turns the panties inside-out.. revealing some kind of devices that are attached to the cloth. Together with that, he also shows Artica some kind of.. tube.")

		saynn("[say=alexrynard]You will figure it out, I'm sure. Now leave me alone, I gotta focus.[/say]")

		saynn("Artica grabs the two prototypes.. The panties she begins to put on already..")

		saynn("[say=alexrynard]No, not here. Go a.. somewhere else.[/say]")

		saynn("She nods.. and just heads off, swaying her hips with extra excitement.")

		saynn("[say=artica]..[/say]")

		saynn("[say=alexrynard]You're welcome.[/say]")

		addButton("Follow", "See where Artica is going now..", "in_cell")
	if(state == "in_cell"):
		aimCameraAndSetLocName("cellblock_lilac_nearcell")
		GM.pc.setLocation("cellblock_lilac_nearcell")
		addCharacter("artica", ["naked"])
		playAnimation(StageScene.SexPortalOral, "tease", {pc="artica", bodyState={naked=true, hard=true}})
		removeCharacter("alexrynard")
		saynn("Artica rushes into her cell"+str(", quickly throws her clothes on the bed" if !isNaked else "")+" and puts on the unassuming purple panties.")

		saynn("[say=artica]..just panties?.. At least they fit snuggly..[/say]")

		saynn("Nothing interesting happened from just putting them on.. and there doesn't seem to be any buttons or controls on them.. so she switches her focus to the other device.")

		saynn("[say=artica]..hm..[/say]")

		saynn("That one is way more interesting, featuring an array of buttons and a little screen. She takes a deep breath and presses one of them.")

		saynn("There is an electronic noise.. followed by the device lighting up.. almost like it's a flashlight.")

		saynn("[say=artica]Eek..[/say]")

		saynn("But it was actually something else. Artica's eyes widen in amazement as the device opens some kind of portal.. and inside of that portal.. she sees the unmistakable cyan folds of her own pussy..")

		saynn("[say=artica]Oh.. wait.. what.. h-how..[/say]")

		saynn("Her heart races as she brings the device.. which looks more like a fleshlight now.. closer.. Feeling the warmth of her own breath is making the pussy displayed on that fleshlight clench and get all wet. Artica instantly tries to look inside her panties.. but all she can do is free her cock, the panties are keeping themselves secure around her slit.. so there is no denying it anymore..")

		saynn("[say=artica]Is that.. how my pussy looks.. wow..[/say]")

		saynn("She drags her tongue over the folds.. and moans, feeling her pussy being licked.. Her eyes are sparkling with excitement..")

		addButton("Continue", "See what happens next", "artica_sits")
	if(state == "artica_sits"):
		playAnimation(StageScene.FleshlightSit, "tease", {pc="artica", bodyState={naked=true, hard=true}})
		saynn("Unable to resist any longer, she sits on the edge of her bed, positioning the fleshlight at the tip of her throbbing, knotted canine cock. She gently traces her own petals with it, precum mixing with her pussy juices.. before she suddenly stops and pulls the fleshlight away.")

		saynn("[say=artica]..am I.. r-really gonna do this?..[/say]")

		saynn("She is hesitating, her gaze turning desperate.")

		saynn("[say=artica]..am I really g-gonna fuck myself..[/say]")

		saynn("Artica sighs, her body fidgeting around, toes curling. She brings the fleshlight a little closer to her face.. and spreads the folds with her other paw.. looking deep inside.. seeing the whole slick love tunnel with a tight-looking cervix at the end.. Artica sees how her pussy clenches in great detail.. her own aroused scent hitting her nosetrills.. intoxicating scent..")

		saynn("[say=artica]..just a little bit maybe.. mmm.. I will just pull out before cumming.. y-yes..[/say]")

		saynn("She presses the fleshlight against the tip of her cock.. and lets it penetrate her folds and spread them aside.. her own member slipping into the welcoming wet slit..")

		addButton("Continue", "See what happens next", "artica_fucks_herself")
	if(state == "artica_fucks_herself"):
		playAnimation(StageScene.FleshlightSit, "sex", {pc="artica", bodyState={naked=true, hard=true}})
		saynn("The instantly pleasure was intense, her body responding to both the penetration and the internal sensation, a soft moan leaving her lips..")

		saynn("[say=artica]Ah..[/say]")

		saynn("Artica starts with slow, deliberate thrusts, each movement of that fleshlight sending shivers through her.")

		saynn("[say=artica]I can feel.. e-every inch.. of my own cock.. inside me.. ah..ah..[/say]")

		saynn("Her breaths become faster, mingled with all the cute moans that she produces while fucking herself, lost in the sea of pleasure..")

		addButton("Continue", "See what happens next", "artica_fucks_herself_faster")
	if(state == "artica_fucks_herself_faster"):
		playAnimation(StageScene.FleshlightSit, "fast", {pc="artica", bodyState={naked=true, hard=true}})
		saynn("With each thrust, she increases the pace without even realizing it, the fleshlight becoming slick with her juices. The dual stimulation of fucking adn being fucked drives her wild, her moans growing louder.")

		saynn("[say=artica]Y-yes.. ah.. hah..[/say]")

		saynn("She feels the knot at the base of her cock inflating with blood.. and slapping against the sensetive folds, unable to fit inside anymore.")

		saynn("[say=artica]I should stop.. r-right now.. ah.. just a few more.. mhmm-m.. and that's all..[/say]")


func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "in_workshop"):
		processTime(3*60)

	if(_action == "in_cell"):
		processTime(3*60)
		var thePanties = GlobalRegistry.createItem("PortalPanties")
		thePanties.coversPenis = false
		getCharacter("artica").getInventory().forceEquipStoreOtherUnlessRestraint(thePanties)

	if(_action == "artica_sits"):
		processTime(3*60)

	if(_action == "artica_fucks_herself"):
		processTime(3*60)

	if(_action == "artica_fucks_herself_faster"):
		processTime(3*60)

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
