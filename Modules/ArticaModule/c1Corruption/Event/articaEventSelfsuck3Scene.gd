extends SceneBase

var isNaked = false
var isCaged = false
var corruption = 0.0
var isSlut = false
var isVerySlut = false
var isLusty = false
var nakedAndShy = false

func _init():
	sceneID = "articaEventSelfsuck3Scene"

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
		GM.pc.setLocation("cellblock_lilac_nearcell")
		aimCameraAndSetLocName("cellblock_lilac_nearcell")
		playAnimation(StageScene.Solo, "walk", {pc="artica"})
		saynn("Artica seems to be heading towards her cell. Looks like someone is horny..")

		saynn("Might as well see what she will do.")

		addButton("Continue", "See what happens next", "artica_selfsucking")
	if(state == "artica_selfsucking"):
		addCharacter("artica", ["naked"])
		playAnimation(StageScene.SelfSuck, "sex", {pc="artica", bodyState={naked=true, hard=true}})
		saynn("You peek your head inside her cell.. and see that Artica is already on her bed, her legs pulled up high, her spine bent in a perfect arc.")

		saynn("She is sucking her own cock! Her lips are wrapped around her cyan shaft as she is moving her head, her tongue actively swirling around the member, sending electrifying jolts of pleasure through her body, causing her to curl her toes.")

		saynn("[say=artica]Mmm-m..[/say]")

		saynn("She moans around her cock, so lost in this activity that she doesn't notice your eyes staring at her.")

		addButton("Continue", "See what happens next", "artica_selfsucks_faster")
	if(state == "artica_selfsucks_faster"):
		playAnimation(StageScene.SelfSuck, "fast", {pc="artica", bodyState={naked=true, hard=true}})
		saynn("With a needy muffled whimper, Artica sped up, now thrusting her hips as well, sucking herself off faster.")

		saynn("Somehow, she learned to keep the perfect balance, her hind paws working expertly to counteract her thrusts, allowing her cock to reach the back of her throat, thanks to her trained flexibility..")

		saynn("Her wet pussy is so exposed in this position.. you bet that it's possible to take advantage of that..")

		addButton("Fuck her", "Join in on the fun", "fuck_artica")
		addButton("Strapon her", "Join in on the fun", "strapon_artica_pick")
		addButton("Just watch", "See what happens next", "nofuck_artica_cum")
	if(state == "fuck_artica"):
		playAnimation(StageScene.SelfSuck, "fuckfast", {pc="artica", npc="pc", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("Before Artica could react, you were already on her, pinning her in this position, your cock exposed and hard. Her eyes widened in surprise.. but your grip the burning lust in your eyes silenced her protest.")

		saynn("[say=artica]MMMmhmmh![/say]")

		saynn("With a swift thrust, you bury your {pc.penis} deep inside her, making Artica let out a muffled moan around her own cock. The sensation of being stretched so suddenly, combined with the feeling of her own dick in her mouth, was overwhelming. You don't give her any time to just, instead just immediately proceeding to fuck her pussy with raw passion.")

		saynn("Artica's mind was flooded with intense pleasure, her shaky lusty eyes rolling up as she is desperately sucking her own cock.. while your thrusts are making it impossible for her to focus on anything. Her pussy is clenching hard around your cock, her body eagerly responding to your rough treatment. With each thrust, you were ramming your dick deeper, hitting her g-spot at a perfect angle and making her shiver wildly, legs wrapping around your back and pulling you in with her hind paws..")

		saynn("[say=pc]Such a slut.. Sucking her own cock while getting her pussy pounded raw.[/say]")

		saynn("Her cock is throbbing in her mouth, the blood pressure making her knot into a fat meaty orb. She could feel her climax approach, her body trembling.. and you were close too..")

		addButton("Cum inside", "Breed the eager fluff", "fuck_artica_cum")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "artica_selfsucking"):
		processTime(5*60)

	if(_action == "artica_selfsucks_faster"):
		processTime(3*60)

	if(_action == "fuck_artica"):
		processTime(3*60)

	if(_action == "strapon_artica_pick"):
		processTime(3*60)

	if(_action == "nofuck_artica_cum"):
		processTime(3*60)
		getModule("ArticaModule").triggerCorruption(0.1)
		getCharacter("artica").cummedInMouthBy("artica")

	if(_action == "fuck_artica_cum"):
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
