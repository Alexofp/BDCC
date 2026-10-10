extends RecruitSceneBase

var condomType = ""
var condomUsed = false
var condomBroke = false
var straponUsed = false

func _init():
	sceneID = "ElizaRecSceneSexOrgasmDenial"

func _reactInit():
	getCharacter("eliza").getInventory().clearSlot(InventorySlot.Body)
	putOn("eliza", "LatexStraitjacket")
	putOn("eliza", "oldcollar")

func _run():
	if(state == ""):
		condomType = extra("condom", "no")
		condomUsed = (condomType != "no")
		straponUsed = (extra("strapon", "") != "")
		addCharacter("eliza", ["naked"])
		aimCameraAndSetLocName("hideout_breakroom")
		playAnimation(StageScene.Duo, "stand", {npc="eliza"})
		saynn("You enter the cold cell. Eliza is still chained to the pipe above her. She is still wearing a straitjacket that came from her own mental ward. Her tits are exposed, her own bound arms supporting them. A metal chastity belt is locked around her waist.. a belt that you still have a key for.")

		saynn("She glares at you.")

		saynn("[say=pc]"+str(ch1("...", "Hey there, slut.", "Getting used to it, I see."))+"[/say]")

		saynn("Eliza says nothing back, just glaring. You approach her, holding the small key.")

		saynn("You insert it into the lock on her chastity belt and turn it. The thing clicks, the whole assembly unlocking itself and then falling to the floor with a heavy clang, revealing Eliza's tight-looking pussy in the process.")

		saynn("Her breath hitches, eyelids twitching a bit. It's like she knows what is coming. She pulls at her chains.. but they don't offer her any give, keeping her helpless before you.")

		saynn("[say=eliza]Whatever it is.. Just get it over with..[/say]")

		saynn("[say=pc]"+str(ch1("...", "With pleasure.", "You don't get a say in this, slave."))+"[/say]")

		addButton("Continue", "See what happens next", "straight_to_sex")
	if(state == "straight_to_sex"):
		playAnimation(StageScene.SexMatingPress, "sex", {npc="eliza", bodyState={exposedCrotch=true,hard=true}})
		if (!straponUsed):
			saynn("The next moment, Eliza is on the floor, pinned, her back pressed against the cold floor. Her legs are pushed up high, folding her almost in half, giving you full access to her. And so you don't waste any time, you thrust your cock into her pussy raw.")

		else:
			saynn("The next moment, Eliza is on the floor, pinned, her back pressed against the cold floor. Her legs are pushed up high, folding her almost in half, giving you full access to her. Your strapon harness is already secured around your waist. And so you don't waste any time, thrusting your new shiny pre-lubed rubber cock into her pussy.")

		saynn("[say=eliza]Nnh.. fucking animal..[/say]")

		if (!straponUsed):
			saynn("She is pretty tight, her inner walls try to resist by clenching around you immediately. They squeeze and hug your shaft like they're trying to push you out. But they can't.")

		else:
			saynn("She is pretty tight.. you don't exactly feel it yourself but the friction is quite high, her inner walls are trying to resist by clenching around the rubber toy immediately. They squeeze and hug your shaft like they're trying to push you out. But they can't.")

		saynn("You start to fuck her. Doing slow, deep thrusts.. keeping eye contact. Your hands are pressed against the floor by her sides, keeping you stable as you rail her sex, each rough motion pushing her into the floor more.")

		saynn("[say=pc]"+str(ch1("...", "Take it, you fucking bitch.", "You like that, don't you? Fucking slut."))+"[/say]")

		saynn("[say=eliza]Nh.. gh.. fuck you..[/say]")

		saynn("On your hardest thrusts, the tip of your "+str("cock" if !straponUsed else "strapon")+" smashes the entrance to her womb, creating a little bump below her belly. Her emerald eyes are wide, darting around the cell, refusing to look into yours for very long.")

		saynn("Despite her attempts to resist, her body is betraying her, making her slick down there for you.")

		addButton("Continue", "See what happens next", "sex_faster")
	if(state == "sex_faster"):
		playAnimation(StageScene.SexChoke, "fast", {npc="eliza", bodyState={exposedCrotch=true,hard=true}})
		saynn("You speed up, railing her pussy slit harder, the wet sounds echoing in the small cell. All the onslaught starts forcing cute stifled moans out of Eliza, her inner walls shivering around you.")

		saynn("[say=eliza]Ah.. ahh.. hh..[/say]")

		saynn("Each thrust is pushing her frame along the floor forward a bit.. but your legs, firmly planted, keep her from sliding too much.")

		saynn("You break eye contact and just focus on fucking her, giving in to the animalistic desire. The feline isn't exactly in the mood for chatting too, throwing her head back and moaning into the ceiling.")

		saynn("[say=pc]"+str(ch1("...", "Such a good sextoy.", "Nothing but a sextoy."))+"[/say]")

		saynn("You grunt"+str(", feeling yourself getting close" if !straponUsed else ", the friction wearing you down")+". Eliza's whole body is tensing up too. She is about to cum.")

		saynn("It would be such a shame to ruin that.")

		addButton("Deny her", "Deny Eliza the orgasm", "deny_eliza")
	if(state == "deny_eliza"):
		playAnimation(StageScene.SexChoke, "inside", {npc="eliza", bodyState={exposedCrotch=true,hard=true}, pcCum=!straponUsed, cum=!straponUsed})
		saynn("Suddenly, you stop, completely. Almost fully pulling, only leaving the"+str(" rubber" if straponUsed else "")+" tip inside.")

		saynn("Eliza's whole body continues to stay sense, little moans are still escaping her from inertia. She looks up at you, her chest moving fast, a wild look in her eyes.")

		saynn("[say=eliza]You.. stopped.. ah..[/say]")

		saynn("You offer her a very mean, strict expression.")

		saynn("[say=pc]"+str(ch1("Submit.", "Only if you submit.", "Say that you're submitting, worthless."))+"[/say]")

		saynn("[say=eliza]Or.. or what?.. hh.. Gonna deny me?..[/say]")

		saynn("Hopefully your face can answer that question.")

		saynn("But then.. a slow, wicked smile starts spreading across her face.")

		saynn("[say=eliza]Too bad I find orgasm denial extremely hot.. mmh..[/say]")

		saynn("Her pussy pulses.. clenching around your still "+str("cock" if !straponUsed else "toy")+". And then.. she suddenly lets out a sharp cry, her back arching.")

		saynn("[say=eliza]Ahhh~..[/say]")

		saynn("The thought alone was enough to push her over the edge. The bitch is moaning and squirming beneath you, her inner walls milking "+str("you" if !straponUsed else "your strapon")+" in waves.")

		saynn("[say=pc]"+str(ch1("...", "Fucking bitch.", "Stupid fucking slave."))+"[/say]")

		if (!straponUsed):
			saynn("Well.. there is no reason to hold back anymore. And so you slam your whole length inside her, burying yourself to the hilt. More grunts come out of you as your {pc.penis} starts pumping your seed deep into her womb. Her orgasming pussy is still milking your balls, drawing out every last drop. You feel your {pc.cum} flooding her, filling her up..")

		else:
			saynn("Well.. there is no reason to hold back anymore. And so you slam the whole rubber length inside her, burying that strapon to the hilt. It extends her orgasm, pushing her further into this ecstatic state. Her orgasming pussy is still trying to milk you.")

		saynn("[say=eliza]Mhh.. f-fuck~..[/say]")

		saynn("When you finally pull out, her pussy is left gaping"+str(", a stream of thick seed gushing out from her used slit onto the cold floor" if !straponUsed else " for a bit, her folds and fur are soaked in her juices")+".")

		saynn("You don't say a word. You pick up the chastity belt, put it back on her and lock it. Then you turn and leave.")

		saynn("It didn't exactly go how you'd expect it.")

		addButton("Continue", "See what happens next", "endthescene")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "straight_to_sex"):
		if(straponUsed):
			recWearStrapon()

	if(_action == "deny_eliza"):
		if(straponUsed):
			getCharacter("eliza").cummedInVaginaBy("pc", FluidSource.Strapon)
		else:
			getCharacter("eliza").cummedInVaginaBy("pc", FluidSource.Penis)
		GM.pc.orgasmFrom("eliza")

	if(_action == "endthescene"):
		recRemoveStrapons()
		endScene()
		return

	setState(_action)

func saveData():
	var data = .saveData()

	data["condomType"] = condomType
	data["condomUsed"] = condomUsed
	data["condomBroke"] = condomBroke
	data["straponUsed"] = straponUsed

	return data

func loadData(data):
	.loadData(data)

	condomType = SAVE.loadVar(data, "condomType", "")
	condomUsed = SAVE.loadVar(data, "condomUsed", false)
	condomBroke = SAVE.loadVar(data, "condomBroke", false)
	straponUsed = SAVE.loadVar(data, "straponUsed", false)
