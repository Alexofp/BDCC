extends RecruitSceneBase

var condomType = ""
var condomUsed = false
var condomBroke = false
var straponUsed = false

func _init():
	sceneID = "ElizaRecSceneSexBreathplay"

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
		playAnimation(StageScene.SexChoke, "sex", {npc="eliza", bodyState={exposedCrotch=true,hard=true}})
		if (!straponUsed):
			saynn("The next moment, Eliza is on the floor, pinned, her back pressed against the cold floor. You have one of her legs pushed up high, opening her completely for you. Your {pc.penis} is hard and out.. and so you don't wait.. you push inside her pussy raw.")

		else:
			saynn("The next moment, Eliza is on the floor, pinned, her back pressed against the cold floor. You have one of her legs pushed up high, opening her completely for you. Your pre-lubed strapon harness is already secured around your waist.. and so you don't wait.. you push inside her pussy.")

		saynn("[say=eliza]Nnh.. fucking animal..[/say]")

		if (!straponUsed):
			saynn("She is pretty tight, her inner walls try to resist by clenching around you immediately. They squeeze and hug your shaft like they're trying to push you out. But they can't.")

		else:
			saynn("She is pretty tight.. you don't exactly feel it yourself but the friction is quite high, her inner walls are trying to resist by clenching around the rubber toy immediately. They squeeze and hug your shaft like they're trying to push you out. But they can't.")

		saynn("You start to fuck her. Doing slow, deep thrusts.. keeping eye contact. Your free hand darts for her neck, your digits wrapping around her throat. You squeeze, just enough to make her feel owned.")

		saynn("[say=pc]"+str(ch1("...", "Take it, you fucking bitch.", "You like that, don't you? Fucking slut."))+"[/say]")

		saynn("[say=eliza]Khh-h.. hh..[/say]")

		saynn("Her eyes go wider, her breathing becoming shallow. You can feel her pulse going sky-high under your palm. You fuck her harder, the tip of"+str(" your cock" if !straponUsed else " the rubber shaft")+" reaching deep, running into the entrance to her womb.")

		saynn("Eliza's body starts to tremble. Small, choked noises escape her throat, her pussy slit getting wetter, the walls pulsing around you.")

		addButton("Continue", "See what happens next", "sex_faster")
	if(state == "sex_faster"):
		playAnimation(StageScene.SexChoke, "fast", {npc="eliza", bodyState={exposedCrotch=true,hard=true}})
		saynn("You go faster on her, railing her pussy slit. The sound of your hips slapping against her wet flesh fills the small cell.")

		saynn("[say=eliza]F-fuck.. you.. hh..[/say]")

		saynn("You tighten the grip on her throat.. until she can't make a sound. Her mouth is open.. but only a completely silent moan comes out. Her cheeks are quickly turning red.")

		saynn("[say=eliza]..[/say]")

		saynn("Suddenly, her body arches off the floor, squirming and shaking. Her pussy clenches down on you hard.. pulsing in waves. She tries to throw her head back.. but you got her firmly locked for yourself.")

		saynn("Even while she is busy orgasming, you keep pounding her little cunt, enjoying the tightness that it provides. Her eyes look weaker and weaker though, oxygen running out fast.")

		if (!straponUsed):
			addButton("Cum inside", "Breed that cat", "cum_inside")
		else:
			addButton("Continue", "See what happens next", "cum_inside")
	if(state == "cum_inside"):
		playAnimation(StageScene.SexChoke, "inside", {npc="eliza", pcCum=!straponUsed, cum=!straponUsed, bodyState={exposedCrotch=true,hard=true}})
		if (!straponUsed):
			saynn("When Eliza becomes weak enough.. that's when you finally ram your cock all the way in, burying it to the base! Moments later.. you cum.")

			saynn("Your {pc.penis} starts throbbing inside her, pumping hot seed deep inside her, her womb getting stuffed full. Her pussy walls are still clenching just as hard, milking your balls, pulling every last drop of {pc.cum} from you.")

			saynn("[say=pc]"+str(ch1("...", "Take my cum, you whore.", "This is all that you're good for."))+"[/say]")

			saynn("You hold yourself there, deep inside.. until you are done. Then you let go of her throat.")

		else:
			saynn("When Eliza becomes weak enough.. that's when you ram the strapon all the way in, burying it to the base!")

			saynn("Poor kitty is writhing as much as she can, pinned by both, your hand and your rubber cock. Her pussy walls are still clenching just as hard, trying to milk your toy.")

			saynn("[say=pc]"+str(ch1("...", "Such a fucking whore.", "This is all that you're good for."))+"[/say]")

			saynn("You hold yourself there, deep inside.. until she is done cumming. Then you let go of her throat.")

		saynn("[say=eliza]KHhh-h..[/say]")

		saynn("Eliza gasps.. one huge breath.. followed by her starting to cough violently, her whole body shaking. What a mess.")

		addButton("Pull out", "Enough choking", "do_pull_out")
	if(state == "do_pull_out"):
		playAnimation(StageScene.SexChoke, "tease", {npc="eliza", bodyState={exposedCrotch=true,hard=true}})
		if (!straponUsed):
			saynn("You pull out.. allowing her slit to gush with your {pc.cum}.")

		else:
			saynn("You pull the toy out.. allowing her drippy slit to gape for a bit.")

		saynn("[say=eliza]Khh.. hghh.. f-fhh..[/say]")

		saynn("The feline is still very much.. busy. Doesn't stop you from picking up the chastity belt and putting it back onto her. You lock it"+str(", trapping all the seed inside" if !straponUsed else "")+".")

		saynn("You look down at her, still coughing on the floor. Pathetic.")

		saynn("Time to leave.")

		addButton("Continue", "See what happens next", "endthescene")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "straight_to_sex"):
		if(straponUsed):
			recWearStrapon()

	if(_action == "cum_inside"):
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
