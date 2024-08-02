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
		removeCharacter("eliza")
		addCharacter("artica", ["naked"])
		aimCameraAndSetLocName("main_greenhouses")
		GM.pc.setLocation("main_greenhouses")
		playAnimation(StageScene.Solo, "stand", {pc="artica", bodyState={naked=true,hard=true}})
		saynn("You follow the fluff as she masterfully avoids the guard patrols on her way to the sacred spot..")

		saynn("Artica steps into the greenhouse, her heart is probably racing right now. She had returned to this place that had given her such intense pleasure before.."+str(" With a deep breath, she began to undress, completely willingly, her shirt and shorts falling to the floor, rendering her completely naked.." if !isNaked else "")+"")

		saynn("[say=artica]C-can't believe I'm a-about to d-do this..[/say]")

		saynn("Her {artica.breasts} rose and fell with each breath, her perky pierced nipples hardening in the cold air. With a shiver of excitement and nervousness passing through her spine, she approaches the peaceful normal-looking plants, holding two vials of green glowing fluid in her paws..")

		saynn("With a determined look, she uncaps one of the vials.. and pours its contents onto the plants.. just holding onto the second one for now..")

		addButton("Continue", "See what happens next", "artica_teased")
	if(state == "artica_teased"):
		playAnimation(StageScene.TentaclesTease, "tease", {pc="artica", plant=true, bodyState={naked=true, hard=true}})
		saynn("Immediately, the plants react, transforming before Artica's eyes, their stems growing, getting thicker and shaking off any leaves and petals, revealing the smooth slick green tendrils.. tentacles really..")

		saynn("Almost like they're sentient, they reach out towards the fluff, the first one wrapping around her ankle and brushing against her thigh, probably feeling the heat that's radiating from Artica's sex..")

		saynn("[say=artica]Ah..[/say]")

		saynn("No hesitation, no resistance, Artica lets the tentacles tease her, the little touches making her moan softly, her pussy growing more wet.. and dripping juices onto the slick stems.. that seem to be growing and growing.. not that different from the first time..")

		addButton("Continue", "See what happens next", "artica_first_penetration")
	if(state == "artica_first_penetration"):
		playAnimation(StageScene.TentaclesTease, "inside", {pc="artica", plant=true, bodyState={naked=true, hard=true}})
		saynn("More tentacles join in, wrapping around her legs, waist and arms. Artica gasps softly as they all begin to play with her body, teasing her {artica.breasts}, caressing the"+str(" swollen milky nips" if getCharacter("artica").isLactating() else " perky cyan nips")+", rubbing her clit and"+str(" slipping inside her chastity cage, brushing against her trapped canine cock" if isCaged else " brushing against her erect canine cock")+"..")

		saynn("[say=artica]Ah.. hah..[/say]")

		saynn("The less freedom Artica has, the more she seems to be enjoying it, the tentacles pulling on her wrists and forcefully making her spread her legs wider.. while a pair of thin tendrils tease her wet folds and then spread them wide, allowing for a big, fat one to ram itself inside.. immediately making the fluff feel so stretched and filled..")

		saynn("[say=artica]Ah!.. EEP![/say]")

		saynn("The thrust was so forceful that Artica loses the grip on the second vial.. and then watches as it flies in an arc towards the plant..")

		saynn("The vial shatters.. covering the green tendrils in a glowing fluid.. that seems to instantly get absorbed..")

		saynn("[say=artica]..o-oops..[/say]")

		addButton("Continue", "See what kind of monster Artica has created..", "tentacles_grow")
	if(state == "tentacles_grow"):
		playAnimation(StageScene.TentaclesSex, "tease", {pc="artica", plant=true, bodyState={naked=true, hard=true}})
		saynn("Almost instantly, the tentacles' growth continues.. as it starts occupying more and more space in the greenhouse, shoving all the other trays and the other hydroponics equipment out of the way..")

		saynn("It was too late to run, the tentacles quickly gathered enough strength to lift Artica off the floor, suspending her in the air, exploring every inch of her helpless body.")

		saynn("[say=artica]W-waitt-tt.. what is.. ah.. oh n-no.. p-put me d-down..[/say]")

		saynn("After lifting the fluff, the tentacles forcefully spread her legs again, some caressing her pussy folds and some playing with her {artica.penis}.. but there is also one tentacle that presses against her tight clenching tailhole, its fat girth preventing it from penetrating the poor girl..")

		saynn("[say=artica]N-no t-there.. w-wait.. p-please.. e-easy.. ah..[/say]")

		saynn("As if listening to her, an extra tentacle sprouts out and reaches towards her maw, the slick pointy tip hovering near her mouth, probably waiting for her to invite it in..")

		saynn("You notice that some of the tentacles mutate.. their tips changing shape. Makes you wonder why..")

		addButton("Continue", "See if Artica will manage to endure this..", "artica_tentaclessex")
	if(state == "artica_tentaclessex"):
		playAnimation(StageScene.TentaclesSex, "sex", {pc="artica", plant=true, bodyState={naked=true, hard=true}})
		saynn("Artica desperately tries to keep the eager tendrils away from her holes.. but loses quick.. she suddenly throws her head back and cries out a notice of pleasure as two fat ones stretch both of her holes enough to force themselves in, already pounding her pussy and ass, and now stretching the inner walls too..")

		saynn("[say=artica]AH!.. H-H.. Hh-hhhmhh..[/say]")

		saynn("As soon as Artica parts her lips, a sneaky tentacle finds it way past her teeth, forcing her jaw to stay opened wide as it starts fucking and stretching her throat.."+str(" All the while the tentacle that's wrapped around her cock is stroking her shaft with a smooth, rhythmic motion, its tip is gently teasing the cockhole, threatening to stretch that hole as well.." if !isCaged else " All the while the tentacle that has found its way into her chastity cage is doing swirling motions inside the sheath, circling around the locked away pulsing shaft, its tip is gently teasing the cockhole, threatening to stretch that hole as well..")+"")

		saynn("[say=artica]MMmmhh-hmm.. ghhhmmh-.. hh..[/say]")

		saynn("Artica's eyes widened as the plant is now fucking all her holes.. pleasuring her in all the unspeakable ways..")

		addButton("Continue", "See if Artica's mind will endure this..", "artica_tentaclessex_fast")
	if(state == "artica_tentaclessex_fast"):
		playAnimation(StageScene.TentaclesSex, "fast", {pc="artica", pcCum=true, plant=true, bodyState={naked=true, hard=true}})
		saynn("The tentacles begin to move faster, their trusts deep and powerful.. more little tentacles manage to slip inside her.. before growing big and thick, stretching her pussy and tailhole to extreme levels, fucking them raw..")

		saynn("Poor helpless fluff is moaning around the tentacle in her mouth, her body trembling with raw pleasure. You can just sense her climax building already, the pressure rising with each passing second of this.. experiment.."+str(" The knot at the base of Artica's is inflating with blood.. and getting squeezed by the tentacle who is also now thrusting it's thin tip down her urethra, fucking her little cockhole.." if !isCaged else " Her chastity cage is twitching a lot as the trapped cock is pulsing inside.. pleasured by the tentacle who is also now thrusting it's thin tip down her urethra, fucking her little cockhole..")+"")

		saynn("As she approaches her orgasm, the tentacles inside her pussy and ass seem to grow even thicker, their tips swelling and throbbing, pushing on Artica's g-spot and her prostate at the same time, never leaving her empty..")

		saynn("[say=artica]HHH-Hh-h!.. Mhhh-mmhhHH!..[/say]")

		saynn("One of the trusts finally set off the chain reaction.. Artica's body convulses in an explosive orgasm, the tentacles holding her squirming form as her needy pussy and tight asshole clench around the intruding green swirly rods, "+str("her balls tensing up, her cock twitching as it shoots thick ropes of cum onto the tentacles stroking it, letting it get absorbed by them." if !isCaged else "her balls tensing up, her locked cock twitching inside its cage as it shoots thick ropes of cum from the sheath onto the tentacles fucking her, letting it get absorbed by them..")+"")

		if (getCharacter("artica").isLactating()):
			saynn("The orgasm is so strong that Artica's nips squirt milk during each throb of her cock.. which is quickly absorbed by the tentacles as well..")

		saynn("Even though Artica came, the tentacles don't stop railing her thigh holes, only getting more eager instead.. You notice them changing again, their green texture becoming translucent for some reason..")

		saynn("[say=artica]Hhh-h.. hhhmmhhh-h..[/say]")

		saynn("Poor fluff's mind begins to melt from the overwhelming sensations, her thoughts dissolving into a hazy of pleasure, obvious by her lusty, shaky eyes that keep rolling up. The rhythmic thrusts of the tentacles are driving her to the edge again and again.. With each climax, Artica's body grows more sensitive, her muffled moans growing hotter, her balls getting milked dry more by the plant that seems to be hungry for any.. material..")

		saynn("You notice.. something.. traveling.. up the transparent overgrown stems.. something big and round..")

		addButton("Continue", "See the result of Artica's actions..", "artica_gets_stuffed_with_eggs")
	if(state == "artica_gets_stuffed_with_eggs"):
		playAnimation(StageScene.TentaclesSex, "inside", {pc="artica", pcCum=true, cum=true, plant=true, bodyState={naked=true, hard=true}})
		saynn("As another climax washes over her, the tentacles inside her holes suddenly push themselves even deeper, their tips expanding.. as some kind of.. eggs.. travel up them, slipping inside her well-prepared gaping-stretched holes without much trouble..")

		saynn("Artica's eyes widened in shock as she felt the tentacles start depositing big round eggs inside her, stuffing her womb, ass and stomach full of them, her belly swelling slightly more with each egg adding more and more volume to it..")

		saynn("[say=artica]Grhh-h!.. gh-h.. grlhh.. hh..[/say]")

		saynn("And before she can catch her breath, the same tentacles begin to pump the girl full of warm, thick fluid, filling the empty space between the eggs inside her womb, belly and ass to the brim, with some already leaking out of her stuffed holes..")

		saynn("[say=artica]Mmmm-mhh!.. mmh.h.hh..[/say]")

		saynn("The weird sensation of being used as some kind of egg storage is so strong that she came once more, her holes clenching tight around the tendrils, milking them for every drop of that fluid..")

		saynn("As the final waves of pleasure start to fade, Artica was left hanging in the air, her body limp and thoroughly used..")

		saynn("The plant, after seemingly serving purpose, begins to slowly wither away, its molecular structure probably got damaged too much by all the mutagen..")

		addButton("Continue", "See what happens next", "artica_recover")
	if(state == "artica_recover"):
		setFlag("ArticaModule.nextReaction", "t3hap")
		playAnimation(StageScene.GivingBirth, "idle", {pc="artica", bodyState={naked=true, hard=true}})
		saynn("The tentacles slowly retracted, leaving Artica gasping for breath as her gaping holes began gushing with plant's fluids.. They carefully set her on the floor.. before retracting away.. letting her be..")

		saynn("[say=artica]Khh.. kh.. ah..[/say]")

		saynn("Artica's mind is clearly a blur, she looks down and sees her belly swollen with eggs.. she can hardly put her paws around it now..")

		saynn("[say=artica]S-so m-much.. h..hah..[/say]")

		saynn("Little moans escape from her as she gropes and kneads it.. the eggs shifting inside her holes as she does it..")

		saynn("Artica catches her breath.. and then starts to get up.. all the extra weight really dragging her down.")

		saynn("But eventually, she succeeds.. and starts waddling towards her spot..")

		saynn("Wow. You'd never thought you would be able to see something like that..")

		saynn("But now it was time to go.")

		addButton("Continue", "See what happens next", "endthescene")

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

	if(_action == "artica_first_penetration"):
		processTime(5*60)

	if(_action == "tentacles_grow"):
		processTime(5*60)

	if(_action == "See if Artica will manage to endure this.. artica_tentaclessex"):
		processTime(5*60)

	if(_action == "artica_tentaclessex_fast"):
		processTime(5*60)

	if(_action == "artica_gets_stuffed_with_eggs"):
		processTime(10*60)
		getModule("ArticaModule").triggerCorruption(0.1)
		getCharacter("artica").addEffect(StatusEffect.ArticaFullWithPlantEggs, [RNG.randi_range(7, 12)])
		getCharacter("artica").cummedInVaginaBy("plantTentacles")
		getCharacter("artica").cummedInAnusBy("plantTentacles")
		getCharacter("artica").cummedInMouthBy("plantTentacles")
		getCharacter("artica").cummedOnBy("plantTentacles")

	if(_action == "artica_recover"):
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
