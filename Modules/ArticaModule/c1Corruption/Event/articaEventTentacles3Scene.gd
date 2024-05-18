extends SceneBase

var isNaked = false
var isCaged = false
var corruption = 0.0
var isSlut = false
var isVerySlut = false
var isLusty = false
var nakedAndShy = false

func _init():
	sceneID = "articaEventTentacles3Scene"

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
		saynn("Artica seems to be heading towards the medical block again. Interesting..")

		saynn("You do the usual, taking the next elevator after her.")

		addButton("Continue", "See what happens next", "in_medical")
	if(state == "in_medical"):
		addCharacter("eliza")
		playAnimation(StageScene.Duo, "stand", {pc="artica", npc="eliza"})
		aimCameraAndSetLocName("med_lobbymain")
		saynn("Quietly, you step out into the medical lobby and sit on one of the benches..")

		saynn("[say=eliza]So~? Tell me everything.[/say]")

		saynn(""+str("Naked " if isNaked else "")+"Artica blushes deeply, not sure where to start.")

		saynn("[say=artica].. .. ..[/say]")

		saynn("[say=eliza]And-d~?[/say]")

		saynn("[say=artica].. .. .. ..[/say]")

		saynn("Doctor's eyes go big, she takes off her glasses for a bit and eyes Artica from toes to ears.")

		saynn("[say=eliza]Wow.. that is amazing. They looked like tentacles, you're saying? I guess it wasn't really a fertilizer then..[/say]")

		saynn("Artica sways from side to side, her toes sprawling wide while her tail is curled around her waist.")

		saynn("[say=artica].. .. .. ..[/say]")

		saynn("[say=eliza]Wow! HAH! Inside you? I should have been there to watch~.[/say]")

		saynn("Artica blushes again.. before suddenly offering the feline doctor many flowers.. the same flowers that she brought the other time.")

		saynn("[say=eliza]Oh wow, I see how it is~. Alright, give me some time.[/say]")

		saynn("Doctor Quinn grabs the flowers and heads towards her lab to prepare the drug..")

		saynn("All the while, Artica just bounces in place, struggling to contain herself.")

		saynn("Finally, after some minutes, the doctor returns.")

		saynn("[say=eliza]I know you want all of it.. but I'm only giving you two.[/say]")

		saynn("The feline doctor hands Artica two vials with that green glowing fluid..")

		saynn("[say=eliza]It's not fertilizer.. we made some kind of mutagen I think. And that means the plants might mutate into anything.. including something dangerous.[/say]")

		saynn("Somehow that only seems to make the fluff more curious. She nods-nods and heads straight to the elevator.")

		saynn("[say=eliza]..I'm totally gonna destroy this station by accident one day.. oh well~.[/say]")

		addButton("Follow", "See where Artica is heading", "near_greenhouses")
	if(state == "near_greenhouses"):
		addCharacter("artica", ["naked"])
		aimCameraAndSetLocName("main_greenhouses")
		playAnimation(StageScene.Solo, "stand", {pc="artica", bodyState={naked=true,hard=true}})
		saynn("You follow the fluff as she masterfully avoids the guard patrols on her way to the sacred spot..")

		saynn("Artica steps into the greenhouse, her heart is probably racing right now. She had returned to this place that had given her such intense pleasure before.."+str(" With a deep breath, she began to undress, completely willingly, her shirt and shorts falling to the floor, rendering her completely naked.." if isNaked else "")+"")

		saynn("[say=artica]C-can't believe I'm a-about to d-do this..[/say]")

		saynn("Her {artica.breasts} rose and fell with each breath, her perky pierced nipples hardening in the cold air. With a shiver of excitement and nervousness passing through her spine, she approaches the peaceful normal-looking plants, holding two vials of green glowing fluid in her paws..")

		saynn("With a determined look, she uncaps the vials.. and pours their contents onto the plants..")

		addButton("Continue", "See what happens next", "artica_teased")
	if(state == "artica_teased"):
		playAnimation(StageScene.TentaclesTease, "tease", {pc="artica", plant=true, bodyState={naked=true, hard=true}})

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "in_medical"):
		processTime(5*60)

	if(_action == "near_greenhouses"):
		processTime(10*60)

	if(_action == "artica_teased"):
		processTime(5*60)

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
