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
		GM.pc.setLocation(GM.pc.getCellLocation())
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
		addButtonWithChecks("Vaginal", "Breed the fluff", "do_vag", [], [[ButtonChecks.HasReachablePenis]])
		addButtonWithChecks("Anal", "Be a little mean and fuck Artica's other hole", "do_anal", [], [[ButtonChecks.HasReachablePenis]])
		addButtonWithChecks("Oral", "Stretch Artica's throat a bit", "do_deepthroat", [], [[ButtonChecks.HasReachablePenis]])
		addButtonWithChecks("Grind face", "Grind your pussy against her face", "do_grind", [], [[ButtonChecks.HasReachableVagina]])
	if(state == "do_grind"):
		playAnimation(StageScene.RopesOralSex, "lick", {pc="artica", npc="pc", bodyState={naked=true, hard=true}, npcBodyState={exposedCrotch=true, hard=true}})
		saynn("Without saying much, you push your exposed {pc.pussyStretch} pussy into Artica's face, straddling her canine muzzle and proceeding to grind it.")

		saynn("[say=artica]Eep..[/say]")

		saynn("[say=pc]Oh yeah~. I can do whatever I want with you..[/say]")

		saynn("It feels nice, Artica's muffled whimpers only fuel your passion, making you grind her face more and more, forcing your scent into her fur, marking it with your juices..")

		saynn("Eventually, the hot scent that the fluff is forced to breathe in is making her obey your rough touch, she parts her lips and sticks her tongue out, catching your sensitive folds as they slide over her mouth.")

		saynn("[say=pc]Such an eager pussy licker..[/say]")

		addButton("Faster", "Grind her face faster", "do_grind_cum")
	if(state == "do_grind_cum"):
		playAnimation(StageScene.RopesOralSex, "lickfast", {pc="artica", npc="pc", npcCum=true, bodyState={naked=true, hard=true}, npcBodyState={exposedCrotch=true, hard=true}})
		saynn("You find yourself moving faster, both your hands land on her head and hold it steady as you grind her face with your drippy slit.. the sensations making you moan passionately..")

		saynn("All the while tied up Artica just does her best, dragging her cyan tongue over your folds, catching any fluids onto it.")

		saynn("[say=pc]Ah.. a-alright.. Oh f-fuck~..[/say]")

		saynn("With a gasp, you get shot over the edge, the orgasm making your legs weak as your pussy starts pulsing and squirting all over Artica's face, making her fur all wet and smelly..")

		saynn("[say=pc]Nh-h.. yeah-h.. there you go.. marking you like the whore that you are..[/say]")

		saynn("Artica is blushing deeply.. as you stop grinding her, she is still whining for some reason.")

		saynn("[say=pc]What? I was too rough?[/say]")

		saynn("[say=artica]N-no.. um.. I'm.. I'm s-still..[/say]")

		saynn("You look behind her.. wow.. her own pussy is creating a puddle of juices on the floor while producing an extremely alluring scent..")

		saynn("You can leave her horny and unsatisfied.. or give her the release that she wants..")

		addButton("No release", "Keep Artica horny", "no_release")
		addButton("Lick her out", "Make Artica cum by eating her pussy", "eat_artica_out")
	if(state == "do_deepthroat"):
		playAnimation(StageScene.RopesOralSex, "sex", {pc="artica", npc="pc", bodyState={naked=true, hard=true}})
		saynn("Mean.. so mouthy that fluff is. Better use that for your advantage.")

		saynn("With a gentle but firm touch, you guide her head towards your exposed {pc.penis}, inviting her to take you into her mouth.")

		saynn("[say=artica]Um.. eep..[/say]")

		saynn("Artica hesitates for a moment, your shaft brushing against her closed lips. But the more she breathes in your scent, the more she gives in, slowly opening her mouth, her lips parting wider and wider..")

		saynn("[say=pc]Be a good girl..[/say]")

		saynn("With a slow steady motion, you ease some of your cock into her maw, the head quickly reaching the back of her mouth and dripping pre into her throat. It's so warm and wet in there, her cyan tongue teasing your cock and coating it with her saliva.")

		saynn("[say=pc]All of it..[/say]")

		saynn("Slowly, you start putting more pressure.. until the head of your cock manages to slip into her throat-hole, stretching it wide.")

		saynn("[say=artica]Akh-h..[/say]")

		saynn("And so you begin to thrust inside, working more of your member inside, stretching her tight throat walls further.. the metal collar around her neck makes it extremely pleasurable to fuck her..")

		addButton("Faster", "Really test her", "throatfuck_cum")
	if(state == "throatfuck_cum"):
		playAnimation(StageScene.RopesOralSex, "fast", {pc="artica", npc="pc", bodyState={naked=true, hard=true}})
		saynn("As your confidence in Artica's sucking abilities grows, you begin to fuck her throat faster and harder, her lips hugging your member as it goes deep, creating a bump on her neck each time. You can feel her gag reflex kicking in soon after.. poor fluff is choking on your cock, her throat making all sorts of wet slurps..")

		saynn("[say=artica]Khh-h.. hhh.. khh..[/say]")

		saynn("It feels.. too.. good.. So you ignore her need for fresh air for a bit and just keep ravaging her throat-hole, her own cock dribbling precum eagerly as she is forced to deepthroat you.")

		saynn("[say=pc]Ngh.. Here it comes, slut.. Don't you dare miss a single drop..[/say]")

		saynn("With one final, deep thrust, you ram your cock as deep as that throat allows.. and then just explode inside her, your {pc.penis} pumping Artica's belly full of your {pc.cum} as her own body convulses with pleasure, her cyan lusty eyes rolling high up.")

		saynn("It feels so good that your legs are shaking.. but you also feel Artica getting weaker.. time to pull out before she passes out completely..")

		addButton("Continue", "See what happens next", "deepthroat_pull")
	if(state == "deepthroat_pull"):
		playAnimation(StageScene.RopesOralSex, "tease", {pc="artica", npc="pc", bodyState={naked=true, hard=true}})
		saynn("As yank your member out of her throat, Artica starts gasping for air and coughing.")

		saynn("[say=artica]Khh.. kh.. kh..[/say]")

		saynn("Your cock looks.. clean. Wet.. but clean.")

		saynn("[say=pc]Wow, good job.[/say]")

		saynn("You dry yourself using her fluffy cheeks and take a step back.")

		saynn("For some reason.. the girl is whining.. while panting heavily.")

		saynn("[say=pc]What's up? I was too rough?[/say]")

		saynn("[say=artica]N-no.. um.. I'm.. I'm s-still..[/say]")

		saynn("You look behind her.. wow.. her pussy is creating a puddle of juices on the floor while producing an extremely alluring scent..")

		saynn("You can leave her horny and unsatisfied.. or give her the release that she wants..")

		addButton("No release", "Keep Artica horny", "no_release")
		addButton("Lick her out", "Make Artica cum by eating her pussy", "eat_artica_out")
	if(state == "no_release"):
		saynn("[say=pc]Sorry, fluff. I'd rather keep your slutty butt horny~.[/say]")

		saynn("You can hear more whimpers and whining back, Artica is squirming in her ropes.")

		saynn("Time to untie and bring her back to her spot.")

		addButton("Continue", "See what happens next", "endthescene_getharness")
	if(state == "eat_artica_out"):
		if (isCaged):
			playAnimation(StageScene.RopesSex, "lick", {pc="artica", npc="pc", pcCum=true, bodyState={naked=true, hard=true}})
			saynn("You sigh and kneel behind her.. before stuffing your face into that needy pussy.")

			saynn("[say=artica]Ah..[/say]")

			saynn("Her cock is caged so you just squeeze her balls while your tongue starts lapping her juices up, following the cyan sensitive folds and also giving her hidden clit plenty of attention.")

			saynn("[say=artica]Ahh.. y-yes!.. ahh.. g-gods.. ah..[/say]")

			saynn("Soon you find yourself tongue-fucking her pussy, exploring and lapping her up from the inside while she is squirming, her inner walls hugging your tongue tightly. The scent is amazing, you can not get enough of it.")

			saynn("[say=artica]I'm.. I'm.. nyaaa-aaaa-ah-..[/say]")

			saynn("Suddenly, her pulsing slit spawns a fountain of juices that washes all over your face, her caged up cock shooting weak strings of seed onto the floor while her balls tense up.")

		else:
			playAnimation(StageScene.RopesSex, "lickstroke", {pc="artica", npc="pc", bodyState={naked=true, hard=true}})
			saynn("You sigh and kneel behind her.. before stuffing your face into that needy pussy.")

			saynn("[say=artica]Ah..[/say]")

			saynn("Your hand lands on her cock and strokes it while your tongue starts lapping her juices up, following the cyan sensitive folds and also giving her hidden clit plenty of attention.")

			saynn("[say=artica]Ahh.. y-yes!.. ahh.. g-gods.. ah..[/say]")

			saynn("Soon you find yourself tongue-fucking her pussy, exploring and lapping her up from the inside while she is squirming, her inner walls hugging your tongue tightly. The scent is amazing, you can not get enough of it.")

			saynn("[say=artica]I'm.. I'm.. nyaaa-aaaa-ah-..[/say]")

			saynn("Suddenly, her pulsing slit spawns a fountain of juices that washes all over your face, her knotted canine cock shooting strong strings of seed onto the floor while her balls tense up.")

		saynn("[say=pc]There we go, messy slut.. That was quick.[/say]")

		saynn("[say=artica]T-thank y-you-u-u.. ahh..[/say]")

		saynn("Well, at least you scratched her itch. You let Artica rest for a bit before loosening the ropes and helping her to get up and get back to her spot.")

		addButton("Continue", "See what happens next", "endthescene_getharness")
	if(state == "do_anal"):
		playAnimation(StageScene.RopesSex, "tease", {pc="artica", npc="pc", bodyState={naked=true, hard=true}, npcBodyState={exposedCrotch=true, hard=true}})
		var isPreg = getCharacter("artica").isVisiblyPregnant()
		if (isPreg):
			saynn("Artica is pregnant.. so you will just fuck her asshole this time!")

		else:
			saynn("Mean, huh.. Let's see how she will sing after this.")

		saynn("Your hands lang on her butt and grope it eagerly, spreading her buttcheeks and bringing them back together, massaging and kneading. While doing so, you can see her tight tailhole blinking at you.")

		saynn("[say=pc]Such a helpless little prey. I can do anything I want with you..[/say]")

		saynn("[say=artica]Y-yeah..[/say]")

		saynn("[say=pc]Even this.[/say]")

		saynn("Artica tenses up as she feels your cock brushing against her little fuckhole, the teasing causes the ring to clench up tightly.")

		saynn("[say=artica]E-eep.. I'm n-not..[/say]")

		saynn("[say=pc]Not trained? Let's train your butt then.[/say]")

		saynn("With a gentle push, you press the tip of your cock against her tight entrance, making her muscles tense up again in response. Slowly, you begin to push forward.. again and again, your cock stretching her tight hole inch by inch..")

		saynn("The fluff is squirming in her ropes as you do that, her neglected pussy getting all wet and needy.")

		saynn("[say=artica]W-why n-not.. ah.. w-why not my..[/say]")

		if (isPreg):
			saynn("[say=pc]Why not your pussy? You can beg me again after you give birth to the current litter.[/say]")

			saynn("[say=artica]Nh-h..[/say]")

		else:
			saynn("[say=pc]Why not just ram it in? Great idea.[/say]")

			saynn("[say=artica]W-wai-!..[/say]")

		addButton("Continue", "See what happens next", "anal_inside")
	if(state == "anal_inside"):
		playAnimation(StageScene.RopesSex, "inside", {pc="artica", npc="pc", bodyState={naked=true, hard=true}, npcBodyState={exposedCrotch=true, hard=true}})
		saynn("It's not going that well.. which could be cause you're not using any lube. So you spit on your cock.. and then start working it in again, the tip finally slips past the tight anal ring and slides deeper inside her.")

		saynn("Artica gasps as she feels that, the weird sensations making her squirm more.. Your cock quickly finds her squishy prostate and starts putting pressure on it.")

		saynn("[say=artica]Ah!..[/say]")

		if (isCaged):
			saynn("Stimulating that spot makes Artica's cage get tight as her own member is trying to leave its sheath, desperate to get hard.. But the metal is too strong..")

		else:
			saynn("Stimulating that spot makes Artica's own member leave its sheath and get all hard and drippy.")

		saynn("With slow, deliberate movement, you work more of your cock into Artica's ass, stretching her tight cyan hole to its limits..")

		addButton("Continue", "See what happens next", "anal_sex")
	if(state == "anal_sex"):
		playAnimation(StageScene.RopesSex, "sex", {pc="artica", npc="pc", bodyState={naked=true, hard=true}, npcBodyState={exposedCrotch=true, hard=true}})
		saynn("At the same time, you increase the pace too, now slowly thrusting inside her ass, Artica's body rocking back and forth, suspended in the air with the ropes.")

		saynn("[say=artica]Ah.. ah..[/say]")

		saynn("The fluff is still incredibly tight, her inner walls hugging your {pc.penis} so well that you might unload any second.. But you keep yourself from doing that for now and just rail her butt, your hands landing on her sides and pulling her towards you as you thrust inside.")

		saynn("[say=pc]Hah.. what a tight prey.[/say]")

		if (isCaged):
			saynn("Her drippy pussy isn't getting stimulated at all.. but her useless caged cock does, transparent fluid dripping from the tip as it twitches more and more, her prostate getting all firm and swollen..")

		else:
			saynn("Her drippy pussy isn't getting stimulated at all.. but her canine cock does, transparent fluid dripping from the tip as it twitches more and more, its knot inflating slightly, her prostate getting all firm and swollen..")

		saynn("[say=artica]Nh-h.. ghh-h.. ah.. y-you're s-stretching m-me so m-much.. ah..[/say]")

		saynn("Artica sticks her tongue out and moans into the air.. until you make her pass the point of no return.."+str(" Weak spurts of seed fly out of her caged throbbing dick" if isCaged else " Powerful spurts of seed erupt from her hard throbbing dick")+", her neglected pussy pulsing around air while the slick walls of her tailhole start milking you.")

		saynn("[say=artica]I'm.. ahh-h.. l-like.. a buttslut.. ah.. ahh..hh..[/say]")

		saynn("While that is happening, you feel your own orgasm drawing near..")

		addButton("Cum inside", "Stuff her butt to the brim!", "anal_sex_cum")
	if(state == "anal_sex_cum"):
		playAnimation(StageScene.RopesSex, "inside", {pc="artica", npc="pc", pcCum=true, npcCum=true, bodyState={naked=true, hard=true}, npcBodyState={exposedCrotch=true, hard=true}})
		var pcHasKnot = GM.pc.bodypartHasTrait(BodypartSlot.Penis, PartTrait.PenisKnot)
		if (pcHasKnot):
			saynn("Holding back is not required anymore.. and it's too late for pulling out.. you ram your cock deep inside.. forcing the fat knot to stretch her entrance wide!")

			saynn("[say=artica]Ah! K-knott-tt!..[/say]")

			saynn("Your fat meaty orb is pushing on her little prostate, smashing it and milking it dry,"+str(" Artica's cock is hard as rock again as it shoots out more lines of thick cum!" if !isCaged else " Artica's cock is throbbing in its tight cage again as it shoots out more lines of thick cum!")+"")

		else:
			saynn("Holding back is not required anymore.. and it's too late for pulling out.. you ram your cock deep inside.. until your full length is buried inside her.")

			saynn("[say=artica]Ah!..[/say]")

			saynn("Your shaft is pushing on her little prostate, smashing it and milking it dry,"+str(" Artica's cock is hard as rock again as it shoots out more lines of thick cum!" if !isCaged else " Artica's cock is throbbing in its tight cage again as it shoots out more lines of thick cum!")+"")

		saynn("At the same time, your own member is throbbing inside her, waves of your {pc.cum} flooding her ass, painting her clenching walls and filling her up to the brim!")

		saynn("[say=pc]Nghh.. Such a tight whore..[/say]")

		saynn("You're both breathing heavily, your legs barely support you..")

		addButton("Rest", "Let the fluff hang around a bit more", "vag_cum_rest")
	if(state == "do_vag"):
		playAnimation(StageScene.RopesSex, "tease", {pc="artica", npc="pc", bodyState={naked=true, hard=true}, npcBodyState={exposedCrotch=true, hard=true}})
		saynn("Mean, huh.. Let's see how she will sing after this.")

		saynn("Your hand lands the fur of her back and travels along it, caressing her girly curves. As your digits reach the base of her fluffy tail, it curls around your wrist instinctively.. but she herself doesn't resist against the ropes, just awaiting her faith..")

		saynn("[say=pc]Such a helpless little prey.[/say]")

		saynn("[say=artica]Y-yeah..[/say]")

		saynn("With that, you free your cock and take a spot behind her, your hands now stroking her thighs, the ropes keeping them spread for you.")

		saynn("Such a great view.. both of her hungry holes out on display.. But you're gonna go for the slick one today..")

		saynn("[say=artica]I'm.. s-supposed to be a p-predator.. n-not a c-caught prey..[/say]")

		saynn("Your words seem to call up to Artica's tribal origins.. Might as well push on her buttons more.")

		addButton("Continue", "See what happen next", "vag_sex")
	if(state == "vag_sex"):
		playAnimation(StageScene.RopesSex, "sex", {pc="artica", npc="pc", bodyState={naked=true, hard=true}, npcBodyState={exposedCrotch=true, hard=true}})
		saynn("Artica is trying to look behind her.. but the ropes make it difficult to see what you are doing.. Time to make her feel it..")

		saynn("After swiftly aligning yourself with that juicy pussy, you thrust yourself deep inside her, your {pc.penis} sinking into her wet sex, spreading the cyan folds wide and sending her body to swing forward.")

		saynn("[say=artica]Ahh-h..[/say]")

		saynn("With a low growl, you catch her on the way back, thrusting inside again, your hips slapping against her fluffy thighs as the fluff gasps, her pussy clenching around your intruding member, coating it with her heat..")

		saynn("[say=artica]Ah.. ahh.. s-so much..[/say]")

		saynn("[say=pc]Grrh.. And here I thought.. A predator.. Moaning like a slut on my cock.[/say]")

		saynn("Each thrust is sending shivers of pleasure through her body, causing her to squirm against the ropes, her hips rocking back to meet your cock each time."+str(" Her own cock swayed freely between her legs, leaking precum as you stimulate one of her sensitive spots.." if !isCaged else " Her own cock twitched in its tight chastity cage, leaking precum as you stimulate one of her sensitive spots..")+"")

		saynn("[say=artica]Ah.. s-slut.. a s-slutty.. p-prey.. e-enjoying c-cocks.. f-fucking me.. nh..h-h..[/say]")

		addButton("Faster", "Rail her faster", "vag_faster")
	if(state == "vag_faster"):
		playAnimation(StageScene.RopesSex, "fast", {pc="artica", npc="pc", bodyState={naked=true, hard=true}, npcBodyState={exposedCrotch=true, hard=true}})
		var isPreg = getCharacter("artica").isVisiblyPregnant()
		saynn("As you ravage Artica's needy slit with increasing urgency, her moans are filling the air, her shy maw struggling to produce any words, just letting out cute noises.")

		if (!isPreg):
			saynn("[say=pc]And not just fucking, this slutty predator is not walking away without my pups inside her.[/say]")

			saynn("[say=artica]Y-yes.. ah.. h-h.. breed.. me.. b-breed t-this s-slutty.. p-predator.. ah-h..[/say]")

		else:
			saynn("[say=pc]And not just fucking, this slutty pregnant predator is gonna be kept bred until she learns her place.[/say]")

			saynn("[say=artica]Y-yes.. ah.. h-h.. bred.. a-always.. hh-ha..ah.. l-litter.. in me..[/say]")

		saynn("Her toes curling up,"+str(" her pregnant belly swaying back and forth.. just like her swollen milky tits.." if isPreg else " her {artica.breasts} swaying back and forth")+".. until her body suddenly convulses with pleasure!")

		saynn("[say=artica]Ahh-h!..[/say]")

		saynn("Artica arches her back as much as the ropes allow, her pussy juices flow freely around your cock, coating it fully, her inner walls gripping your shaft, her tailhole twitching visibly as a steady rate.. "+str("while her caged cock is throbbing in its prison, shooting weak spurts of seed onto the floor" if isCaged else "while her knotted canine cock is throbbing and shooting strong spurts of seed onto the floor")+"..")

		saynn("She feels so tight.. makes you want to.. do it..")

		addButton("Cum inside", "Breeeeed", "vag_cum")
	if(state == "vag_cum"):
		playAnimation(StageScene.RopesSex, "inside", {pc="artica", npc="pc", pcCum=true, npcCum=true, bodyState={naked=true, hard=true}, npcBodyState={exposedCrotch=true, hard=true}})
		var pcHasKnot = GM.pc.bodypartHasTrait(BodypartSlot.Penis, PartTrait.PenisKnot)
		var isPreg = getCharacter("artica").isVisiblyPregnant()
		if (pcHasKnot):
			saynn("While Artica is still going through her orgasmic waves, your own climax finally catches up with you. With a loud growl, you force your member deep inside, your knot slapping Artica's pulsing pussy.. before slipping inside! A fat orb stretching her slit is making the fluff arch her back again, her pussy squirting again from overstimulation. Moments after, your cock starts to throb and stuff her babymaker full of your seed!")

		else:
			saynn("While Artica is still going through her orgasmic waves, your own climax finally catches up with you. With a loud growl, you force your member deep inside! Your full girth is stretching her slit and making her arch her back again, her pussy squirting again from overstimulation. Moments after, your cock starts to throb and stuff her babymaker full of your seed!")

		if (isPreg):
			saynn("[say=pc]Grhh-h.. Stay pregnant, whore..[/say]")

		else:
			saynn("[say=pc]Grrhh-h.. Get pregnant, whore..[/say]")

		saynn("[say=artica]Ny-ya-a-ah..[/say]")

		saynn("Her tongue is out drooling, poor fluff squirming around your cock eagerly,"+str(" her own caged cock keeps dribbling seed onto the floor.." if isCaged else " her own member keeps dribbling seed onto the floor..")+"")

		saynn("The cell quickly starts to smell like sex.. So many odors.. You and Artica both pant, your whole member inside her sex, inner walls massaging and milking it..")

		saynn("[say=artica]S-s-so m-mu-uch.. g-gods..[/say]")

		addButton("Let her rest", "Let the fluff hang around a bit more", "vag_cum_rest")
	if(state == "vag_cum_rest"):
		playAnimation(StageScene.RopesOralSex, "tease", {pc="artica", npc="pc", bodyState={naked=true, hard=true}, npcBodyState={exposedCrotch=true, hard=true}})
		var pcHasKnot = GM.pc.bodypartHasTrait(BodypartSlot.Penis, PartTrait.PenisKnot)
		if (pcHasKnot):
			saynn("You wait a bit until your knot deflates.. before yanking it out, causing a torrent of your seed to start gushing out of her gaping used hole..")

		else:
			saynn("You let Artica be your cock warmer for a bit.. before pulling out, causing a torrent of your seed to start gushing out of her gaping used hole..")

		saynn("[say=artica]Ah.. I'm s-such a.. b-breeding bitch..[/say]")

		saynn("Then, you stand in front of her panting muzzle, giving her a great view of your messy cock..")

		saynn("[say=pc]Clean up after yourself, breeding bitch.[/say]")

		saynn("You rest your cock on her face and just admire as she sticks her tongue out and proceeds to clean you up, licking off any cum while sniffing the hot scent hungrily..")

		saynn("[say=artica]Hh-h.. nn-nn..nh.. slrp..[/say]")

		saynn("[say=pc]That's a good cock slut.[/say]")

		saynn("Since your member is still.. wet.. you just wipe it against her snowy-white fluffy cheeks.. making her blush.")

		saynn("[say=artica]Y-yes.. c-cock-hungry.. prey.. slut..[/say]")

		saynn("Time to let her go though. You loosen the ropes and help the fluff to stand up and grab her belongings.."+str(" which there are none obviously.." if isNaked else "")+"")

		addButton("Continue", "See what happens next", "endthescene_getharness")
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
		playAnimation(StageScene.RopesSolo, "struggle", {pc="artica", pcCum=true, bodyState={naked=true, hard=true}})
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

	if(_action == "do_grind_cum"):
		processTime(5*60)
		getCharacter("artica").cummedOnBy("pc", FluidSource.Vagina)
		getModule("ArticaModule").addCorruption(0.01)
		GM.pc.orgasmFrom("artica")

	if(_action == "throatfuck_cum"):
		processTime(5*60)
		getCharacter("artica").cummedInMouthBy("pc")
		getModule("ArticaModule").addCorruption(0.01)
		GM.pc.orgasmFrom("artica")

	if(_action == "deepthroat_pull"):
		processTime(5*60)

	if(_action == "no_release"):
		processTime(2*60)

	if(_action == "eat_artica_out"):
		processTime(5*60)
		getModule("ArticaModule").triggerCorruption(0.02)
		GM.pc.cummedOnBy("artica", FluidSource.Vagina)

	if(_action == "anal_inside"):
		processTime(5*60)

	if(_action == "anal_sex"):
		processTime(5*60)

	if(_action == "anal_sex_cum"):
		processTime(5*60)
		getCharacter("artica").cummedInVaginaBy("pc")
		getModule("ArticaModule").triggerCorruption(0.03)
		GM.pc.orgasmFrom("artica")

	if(_action == "vag_sex"):
		processTime(5*60)

	if(_action == "vag_faster"):
		processTime(3*60)

	if(_action == "vag_cum"):
		processTime(5*60)
		getCharacter("artica").cummedInVaginaBy("pc")
		getModule("ArticaModule").triggerCorruption(0.02)
		GM.pc.orgasmFrom("artica")

	if(_action == "vag_cum_rest"):
		processTime(10*60)

	if(_action == "endthescene_getharness"):
		if(harnessID != ""):
			var theHarness = getCharacter("artica").getInventory().getItemByUniqueID(harnessID)
			if(theHarness != null):
				getCharacter("artica").getInventory().removeEquippedItem(theHarness)
				GM.pc.getInventory().addItem(theHarness)
		playAnimation(StageScene.Solo, "stand")
		endScene()
		return

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
		getCharacter("artica").getInventory().removeEquippedItemsWithBuff(Buff.GagBuff)

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
