extends SceneBase

var isNaked = false
var isCaged = false
var corruption = 0.0
var isSlut = false
var isVerySlut = false
var isLusty = false
var nakedAndShy = false
var harnessID = ""

func _init():
	sceneID = "articaSexRopesScene"

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
		saynn("Which rope harness do you want to use to tie up Artica?")

		addPumpButtons("do_pick_harness")
		addButton("Cancel", "You changed your mind", "endthescene")
		if (false):
			addButton("Nope", "You shouldn't see this", "do_pick_harness")
	if(state == "do_pick_harness"):
		saynn("After spending so much time with the fluff, you notice how kinky she has become.. Makes you wonder if she will admit to some of her kinks.")

		saynn("[say=pc]Hey, Artica. I'm curious about something.[/say]")

		saynn("[say=artica]What is?..[/say]")

		saynn("[say=pc]Do you like not being in control?[/say]")

		saynn("[say=artica]Um.. well.. I d-don't know.. I'm.. I'm n-not..[/say]")

		saynn("The familiar stuttering returns, the girl keeps her chin lower, her hands start caressing her "+str("fluffy sides" if isNaked else "clothed sides")+", her shoulders shrugging.")

		saynn("[say=pc]Yes or no?[/say]")

		saynn("[say=artica]I.. um..[/say]")

		saynn("The way she shuffles her hind paws while swaying her rear.. the way her cheeks flush and her tail curls around her leg.. she will never admit to it in her current state.")

		saynn("[say=pc]Here is a different question. Do you enjoy.. hanging around.. in my cell?[/say]")

		saynn("You put the emphasis on hanging.")

		saynn("[say=artica]Oh.. yeah.. haha. Why do you ask?..[/say]")

		saynn("Silently, you begin circling the"+str(" naked" if isNaked else " clothed")+" girl.. your stare.. is that of a predator.")

		saynn("[say=artica]Y-you're being.. s-scary..[/say]")

		saynn("You just smile.. waiting for her to stop you.. or to run away.. but the fluff never does.")

		addButton("Grab her", "Bring her into your cell", "kidnap")
	if(state == "kidnap"):
		addCharacter("artica", ["naked"])
		playAnimation(StageScene.RopesSolo, "struggle", {pc="artica", bodyState={naked=true, hard=true}})
		aimCameraAndSetLocName(GM.pc.getCellLocation())
		GM.pc.setPosition(GM.pc.getCellLocation())
		saynn("You stop behind her.. before getting close and putting your hand on her maw, shushing any her protests.")

		saynn("[say=artica]..ee-e.. p..[/say]")

		saynn("[say=pc]Because I want you to hang around in my cell, Artica.[/say]")

		saynn("Before she has the chance to break free, you yank the fluff to your personal cell.. where you"+str(" undress her and then" if !isNaked else "")+" start wrapping tight ropes around her wrists, ankles and chest.. ropes that were already prepared by you, their other ends tied up to the ceiling.")

		saynn("[say=artica]W-what a-are.. Ah![/say]")

		saynn("As you tighten the ropes, they dig into Artica's fur.. but also make her hind paws lose grip with the floor, not letting the girl fall but instead suspending her high above it.")

		saynn("[say=pc]There we go.[/say]")

		saynn("A particular feeling quickly sinks in Artica's mind. No matter how much she tries to wiggle.. she can't escape the ropes, her naked body is suspended helplessly above the floor.. all her privates out on display.. and at your full mercy..")

		saynn("[say=artica]Ah.. D-did you.. k-kidnap me?..[/say]")

		saynn("[say=pc]Depends. Are you gonna play nice or be a total bitch about it?[/say]")

		saynn("She looks around.. and wiggles her tail.. her toes curling up.. That is about all that she can do.")

		saynn("[say=artica]I.. um.. I k-know better t-than to not behave..[/say]")

		saynn("[say=pc]Oh yeah? That'd be a really bad end for you, huh? Stuck here, in my cell.. forever as my fucktoy.[/say]")

		saynn("[say=artica]T-that would b-be.. r-really bad.. indeed..[/say]")

		saynn("Her"+str(" dark swollen" if getCharacter("artica").isLactating() else " cyan")+" pierced nips perk up as you say that.. her "+str("cyan member leaking pre in its cage" if isCaged else "cyan member peeking from its sheath, leaking pre")+"..")

		saynn("Makes you want to tease her more..")

		saynn("[say=pc]I'd keep you high on breeding drugs.."+str(" Maybe with your belly full of someone's pups.." if !GM.pc.hasReachablePenis() else " With your belly full of pups..")+"Your mind broken, your holes constantly stretched and plugged..[/say]")

		saynn("The more things you say, the more Artica is squirming and whining, her pussy dripping juices onto the floor.")

		saynn("[say=artica]S-so.. m-mean..[/say]")

		addButton("Continue", "See what happens next", "in_cell")
	if(state == "in_cell"):
		playAnimation(StageScene.RopesOralSex, "tease", {pc="artica", npc="pc", bodyState={naked=true, hard=true}})
		saynn("How do you want to have fun with the fluff?")

		addButton("Toys", "Attach a few vibrating toys to her bits..", "do_toys")
	if(state == "do_toys"):
		playAnimation(StageScene.RopesSolo, "idle", {pc="artica", bodyState={naked=true, hard=true}})
		saynn("[say=pc]Mean~? I can show you mean.[/say]")

		saynn("While Artica is busy struggling against her bonds, you approach her, holding something in your hands.")

		saynn("[say=pc]Open your mouth, fluff.[/say]")

		saynn("She blinks many times.. and then shakes her head. You sigh and reach out to pinch her nips.. oh wow, they have fancy purple piercings in them.")

		saynn("[say=artica]Eep!..[/say]")

		saynn("As soon as Artica parts her lips, you slide a rubber ball inside before quickly securing the leather straps around her head.")

		saynn("[say=pc]Thank you.. Now.. this..[/say]")

		saynn("Your hands produce a piece of black fabric that you begin tying around Artica's shy eyes, stealing her sight..")

		saynn("[say=artica]I.. I w-will b-behave.. w-will d-do a-anything.. e-eep..[/say]")

		saynn("[say=pc]All I hear is.. be more mean to me please~. Don't worry, I will.[/say]")

		saynn("With Artica silenced, blindfolded and immobilized, you waste no time and whip out a full set of toys, big and small. You grab a few small pink vibes and then "+str("attach one to the tip of her canine cock with a little strap" if !isCaged else "slide one under her chastity cage")+" while the second one gets taped to her clit..")

		saynn("[say=pc]You think this is it? Tail out of the way, my slave~.[/say]")

		saynn("All you hear back is quiet whining.. so you give her rump a smack, sending the girl flying.. almost literally, the ropes make Artica spin and swing a bit from the impact.")

		saynn("[say=artica]Mhh-h..[/say]")

		saynn("[say=pc]Don't make me order you twice..[/say]")

		saynn("Artica moves her tail out of the way.. revealing her needy drippy cunt and also the cute tight-looking asshole..")

		saynn("You grab a small buttplug and cover it with lube.. before working it into her tailhole, making the girl squirm.")

		saynn("[say=pc]C'mon, I'm not making you a buttslut here, relax~.[/say]")

		saynn("Next.. a dildo of an average size.. you align it with Artica's slit and carefully slide it inside, plugging her second hole.")

		saynn("[say=pc]You're so wet.. so ready for cocks.[/say]")

		saynn("Even though the toys are all disabled, the fluff is already wiggling her rear, her holes visibly clenching around the toys..")

		saynn("[say=pc]Let's have some fun.[/say]")

		addButton("Turn all on", "See how much Artica can endure..", "do_toys_cum")
	if(state == "do_toys_cum"):
		playAnimation(StageScene.RopesSolo, "struggle", {pc="artica", bodyState={naked=true, hard=true}})
		saynn("You switch all the toys on, letting them buzz away.. while you just sit on your bed and watch.")

		saynn("As the pleasurable vibrations hit all Artica's sensitive spots, she lets out a muffled moan. Her body is squirming while the vibes stimulate her male and female bits at the same time, the dildo vibrating inside her slick slit.")

		saynn("[say=artica]Nhh-h-hhh!..hhh..h.h..[/say]")

		saynn("After less than a minute of this, she already arches her back, her hips bucking uncontrollably against the relentless stimulation.")

		saynn("[say=pc]Oh yeah? Cumming already?[/say]")

		saynn("Her cock is throbbing"+str(" in its cage" if isCaged else "")+", aching for release as pre-cum is dribbling from the tip, splattering onto the floor below. Meanwhile, her pussy is clenching and spasming around the vibrating dildo buried deep inside her, the sensations making her drool..")

		saynn("[say=pc]Just let me know when. I don't want to miss it.[/say]")

		saynn("Her tight asshole clenches around the buttplug, the squirming makes it shift inside and massage the girl's prostate.. As the vibrations continue to ripple through her, Artica's is getting closer and closer..")

		saynn("[say=artica]Nhhhh-hhh.. NHHhhh!.. MHHh-hh!..[/say]")

		saynn("With a sharp muffled cry, Artica's body convulses in ecstasy, her muscles tensing against the tight ropes as her "+str("locked cock starts throbbing and shooting jets of cum from the little hole of the cage" if isCaged else "hard canine cock starts throbbing and shooting jets of cum")+" onto the floor, her pussy and asshole spasming around the toys, milking them for all they were worth..")

		saynn("Squirt after squirt, Artica's juices gushing from her pussy, soaking the floor beneath as the clit vibes continues to work tirelessly, extending the fluff's orgasm longer and longer, making her arch her back against the ropes hard.. You're almost jealous..")

		saynn("Maybe it's enough..")

		addButton("Turn off toys", "Let Artica calm down", "toys_turnoff")
	if(state == "toys_turnoff"):
		playAnimation(StageScene.RopesSolo, "idle", {pc="artica", bodyState={naked=true, hard=true}})
		saynn("The toys keep overstimulating Artica's sensitive bits, her balls keep tensing up more and more as her cum dribbles from the tip of her"+str(" caged" if isCaged else "")+" cock. You finally turn them off.. but the fluff is still squirming.")

		saynn("You peek under her blindfold.. and see completely spaced out cyan eyes.. her body is trembling, her holes clenching around the toys that are inside her..")

		saynn("[say=pc]Oh wow. I might have broken you a bit. Good.[/say]")

		saynn("She is drooling still, cheeks blushing, her gaze unfocussed..")

		saynn("Letting the girl out into the wild like that.. will surely lead to a real bad end for her..")

		addButton("Cuddle", "Help the girl to come back to senses", "toys_cuddle")
	if(state == "toys_cuddle"):
		playAnimation(StageScene.Cuddling, "idle", {pc="pc", npc="artica", npcBodyState={naked=true}})
		saynn("Once you pull out all the toys out of her stretched holes.. and remove all the vibes.. you carefully relax the ropes, settling the fluff onto the cold floor.. where she starts licking her own fluids off of it.. Luckily her white fur hides any mess.")

		saynn("[say=pc]Come here, silly.[/say]")

		saynn("You pull Artica into your warm lap and cuddle her on the bed. Your hands gently stroke her hair, soothing her senses.")

		saynn("Resting in your embrace, her breathing slowly returns to normal.")

		saynn("[say=artica]N-nyah.. s-such a.. s-slut..[/say]")

		saynn("You raise a brow?")

		saynn("[say=pc]Who is?[/say]")

		saynn("[say=artica]..me.. h-haha..[/say]")

		saynn("You chuckle and nuzzle her chin.")

		saynn("After some time cuddling, you help her to return to her spot, her mind a little more corrupted with pleasure than before..")

		addButton("Continue", "See what happens next", "endthescene")
func addPumpButtons(go_id):
	var pumps = GM.pc.getInventory().getItemsWithTag(ItemTag.RopeHarness)
	for pump in pumps:
		addButton(pump.getVisibleName(), pump.getVisibleDescription(), go_id, [pump])


func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "do_pick_harness"):
		var pump = _args[0]
		harnessID = pump.getUniqueID()
		#GM.pc.getInventory().removeItem(pump)
		#getCharacter("artica").getInventory().forceEquipRemoveOther(pump)

	if(_action == "kidnap"):
		processTime(5*60)
		if(harnessID != ""):
			var theHarness = GM.pc.getInventory().getItemByUniqueID(harnessID)
			if(theHarness != null):
				GM.pc.getInventory().removeItem(theHarness)
				getCharacter("artica").getInventory().forceEquipRemoveOther(theHarness)

	if(_action == "do_toys"):
		processTime(3*60)
		getCharacter("artica").getInventory().forceEquipStoreOtherUnlessRestraint(GlobalRegistry.createItem("blindfold"))
		getCharacter("artica").getInventory().forceEquipStoreOtherUnlessRestraint(GlobalRegistry.createItem("ballgag"))

	if(_action == "do_toys_cum"):
		processTime(20*60)
		getModule("ArticaModule").triggerCorruption(0.03)

	if(_action == "toys_turnoff"):
		processTime(5*60)
		getCharacter("artica").getInventory().removeEquippedItemsWithBuff(Buff.BlindfoldBuff)

	if(_action == "toys_cuddle"):
		processTime(3*60)
		if(harnessID != ""):
			var theHarness = getCharacter("artica").getInventory().getItemByUniqueID(harnessID)
			if(theHarness != null):
				getCharacter("artica").getInventory().removeEquippedItem(theHarness)
				GM.pc.getInventory().addItem(theHarness)
		getCharacter("artica").removeEquippedItemsWithBuff(Buff.GagBuff)

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
	data["harnessID"] = harnessID

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
	harnessID = SAVE.loadVar(data, "harnessID", "")
