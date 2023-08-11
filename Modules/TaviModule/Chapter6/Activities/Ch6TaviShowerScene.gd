extends SceneBase

var isCorrupt = false
var isPure = false
var isNormal = false
var isVirgin = false
var isMessy = false
var hasHorns = false
var tookVirginity = false

func _init():
	sceneID = "Ch6TaviShowerScene"

func _run():
	if(state == ""):
		addCharacter("tavi")
		isCorrupt = getModule("TaviModule").isCorrupt()
		isPure = getModule("TaviModule").isPure()
		isNormal = (!isCorrupt && !isPure)
		isVirgin = getModule("TaviModule").isVirgin()
		isMessy = getCharacter("tavi").isCoveredInFluids()
		hasHorns = getModule("TaviModule").hasHorns()
		playAnimation(StageScene.Duo, "stand", {npc="tavi", npcBodyState={naked=isCorrupt}})
		saynn("You walk to Tavi and invite her to go take a shower.")

		if (isMessy):
			saynn("She takes a look at herself and notices the signs of {tavi.bodyMess} on her fur.")

			saynn("[say=tavi]"+str(taviSpeak("Yeah, I'm a messy slut.. Lead the way.", "It would be such a shame to wash it all away. But. I get a feeling that won't stay clean for long~.", "Oh. I mean. Sure. I really need a shower, huh."))+"[/say]")

		else:
			saynn("She takes a look at herself and notices no obvious signs of any fluids on her fur.")

			saynn("[say=tavi]"+str(taviSpeak("I usually lick myself clean.. But.. Let's go, a shower won't hurt.", "You wanna spend some time in the shower together~? Sure.", "I'm not dirty yet but sure. Showers are refreshing."))+"[/say]")

		addButton("Shower", "Go to the bathrooms", "go_showers")
	if(state == "go_showers"):
		aimCameraAndSetLocName("main_shower1")
		playAnimation(StageScene.Duo, "stand", {npc="tavi", npcBodyState={naked=true}})
		if (isCorrupt):
			saynn("You and Tavi walk to the bathrooms. Your horny pet doesn't seem to mind walking around the prison naked, she loves the attention she is getting.")

			saynn("She skips the dressing room and goes straight for the showers. Tavi stands under one of the showerheads and turns towards you, her paws teasingly caress her own curves.")

			saynn("[say=tavi]Wanna join~? Or you'd rather just watch the show~?[/say]")

		elif (isPure):
			saynn("You and Tavi walk to the bathrooms. A flashy pair like you gets a lot of attention from other inmates. And that makes Tavi a bit uncomfortable, she never really was an attention whore.")

			saynn("She stops at the dressing room and takes off her uniform before storing it in one of the lockers. After that, she covers her privates with her paws and proceeds to the main area before standing under one of the showerheads.")

			saynn("You catch little sneaky gazes from Tavi. She also sways her hips ever so slightly, inviting you?")

		else:
			saynn("You and Tavi walk to the bathrooms. A flashy pair like you gets a lot of attention from other inmates.")

			saynn("She stops at the dressing room and takes off her uniform before storing it in one of the lockers. After that, she proceeds to the main area and stands under one of the showerheads. She wiggles her rear teasingly at you.")

			saynn("[say=tavi]Wanna join?[/say]")

		addButton("Join", "Have a shower as well", "shower_with_tavi")
		addButton("Just watch", "Let Tavi shower alone", "shower_alone")
	if(state == "shower_with_tavi"):
		playAnimation(StageScene.Hug, "hug", {npc="tavi", npcBodyState={naked=true}, bodyState={naked=true, hard=true}})
		saynn("Tavi stands beneath the soothing stream of water. Sensing her need for comfort, you undress completely and step in, embracing the feline.")

		saynn("Water is.. colder than you expected.. But Tavi's warm body makes up for it. Your gazes meet causing Tavi's cheeks to start glowing green, her lips curling into a little soft smile. With a gentle touch, you begin rubbing her back, helping to wash away any dirt.")

		saynn("[say=tavi]Mm-m~..[/say]")

		saynn("Tavi returns the favor and begins washing you too, her paws kneading your shoulders and arms before slowly sliding over your {pc.masc} chest and giving your {pc.breasts} some love too.")

		saynn("Words are not really needed here. Both of you are just enjoying your time in each other's hands. Even when wet, Tavi's fur doesn't become a wet mess because of its short length. Her glowy spots create interesting patterns when refracting against the many water drops.")

		saynn("Eventually, both of you become clean.. cleaner than you were before for sure.")

		if (hasHorns):
			saynn("As a finishing touch, your hands reach out for Tavi's horns and begin stroking them gently to get them cleaned. But as soon as you start doing that, the feline produces an incredibly cute moan and even goes cross-eyed for a second.")

			saynn("Awkward silence. Both of you realize how strange that was.")

			saynn("[say=tavi]You can do that.. again.. if you want?[/say]")

		addButton("Enough", "That was wholesome", "pair_enough")
		if (getCharacter("tavi").hasEffect(StatusEffect.HasCumInsideVagina) || getCharacter("tavi").hasEffect(StatusEffect.HasCumInsideAnus)):
			addButton("Clean inside", "Help Tavi clean her stuffed holes", "duo_cleaninside")
		else:
			addDisabledButton("Clean inside", "Tavi doesn't have any cum in her holes")
		if (getModule("TaviModule").canTrainSkill("taviSkillWatersports")):
			addButton("Make Tavi pee", "Help Tavi let go", "make_tavi_pee")
		if (hasHorns):
			addButton("Rub horns", "See how much you can push Tavi just by rubbing her horns", "rub_horns")
	if(state == "pair_enough"):
		playAnimation(StageScene.Duo, "stand", {npc="tavi", npcBodyState={naked=isCorrupt}})
		saynn("You decide that it was enough showering for now and stop.")

		saynn("[say=tavi]"+str(taviSpeak("Fresh and clean.. But for how long, heh.", "Can't wait for you to cum all over me~.", "Fresh and clean.. Thank you for being there."))+"[/say]")

		saynn("You return back to Tavi's cell.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "rub_horns"):
		saynn("With delicate touches, your fingers land on her horns again, tracing the rough edges. The more your fingertips make contant, the more Tavi's breath hitches, her cheeks turning more and more green. A quiet sigh of pleasure escapes her lips, her toes instinctively curl.")

		saynn("[say=pc]How does it feel?[/say]")

		saynn("[say=tavi]H-harder!..[/say]")

		saynn("Empowered by that response, your touch becomes more bold. Both of your hands get a better grip and begin sliding across the dark surface of Tavi's horns, each stroke igniting a spark of pleasure that courses through her body. Her moans slowly grow to be more lusty and slutty even, echoing through the empty room.")

		saynn("[say=tavi]That feels so fucking g-good!..[/say]")

		saynn("For whatever reason, rubbing Tavi's horns brings her a weird kind of pleasure. Her nips look perky and stiff, her whole body is squirming under your touch.. her pussy dripping like she is in heat again..")

		saynn("[say=pc]You wanna cum? Beg.[/say]")

		saynn("[say=tavi]P-please make me cum!.. I will do a-anything..[/say]")

		saynn("This source of pleasure being so close to her brain is probably what's affecting her so much. Tavi leans into your touches and lets her tongue roll out. She is drooling, panting and moaning while her eyes want to roll up again. All from just her horns being stroked..")

		addButton("Make her cum", "Don't stop and let Tavi cum from this", "horns_cum")
		addButton("Deny Tavi", "Make her feel extremely desperate", "horns_deny")
	if(state == "horns_cum"):
		playAnimation(StageScene.SexStart, "start", {npc="tavi", npcbodyState={naked=true}})
		saynn("You don't stop and only increase the onslaught on Tavi's horns. Very soon it becomes too much for her and her body. Her eyes rolled up, her long tongue fully out, her frame trembling.")

		saynn("[say=tavi]Fu-u-u-uck..[/say]")

		saynn("Waves of pleasure crash over her. Tavi's pussy hasn't received any stimulation this time but it suddenly starts pulsing around a cock that's not there and even squirts, producing a strong fountain of juices that quickly gets away from the water flow.")

		saynn("By the end of it, she looks fucked silly, her face showing sheer satisfaction.. euphoria..")

		saynn("[say=tavi]Nya-a-a..[/say]")

		saynn("Cute. You finish washing Tavi and help her get back to her cell. It still takes her some time to recover completely.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "horns_deny"):
		playAnimation(StageScene.Solo, "struggle_gag", {pc="tavi", bodyState={naked=true}})
		saynn("You bring Tavi to her edge. Her eyes rolling up, her long tongue fully out and drooling, her frame trembling. But then you decide to play with her and suddenly stop stroking her horns.")

		saynn("Noises of confusion begin to escape from the feline.")

		saynn("[say=tavi]..ahh-h.. h-h?.. H-hey.. Why did you..[/say]")

		saynn("When her gaze focusses on your eyes, she realizes what's happening. You pull your hands away from her, trying to deny her!")

		saynn("[say=tavi]No!.. Please!.. Make me cum.. ple-e-ease.. I want this so much..[/say]")

		saynn("Tavi is desperate. Seeing that you are not planning to make her cum, she begins stroking her horns with her own paws, trying to keep the fire going. But.. for some reason.. doing that brings her no pleasure..")

		saynn("[say=tavi]No-o..[/say]")

		saynn("Her body begins to cool under the running water.. Very soon all the desire is gone.")

		saynn("[say=tavi]Huff..[/say]")

		saynn("You finish washing Tavi and help her get back to her cell. She is a bit upset.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "duo_cleaninside"):
		saynn("[say=pc]Let's clean you inside too, Tavi.[/say]")

		saynn("You place your hands on Tavi's butt and spread it wide, causing both of her holes to open.")

		saynn("[say=tavi]"+str(taviSpeak("Kinky..", "Want me to swallow what comes out~?", "Oh.. That's a bit embarrassing.."))+"[/say]")

		var hasCumInPussy = getCharacter("tavi").hasEffect(StatusEffect.HasCumInsideVagina)
		var hasCumInAnus = getCharacter("tavi").hasEffect(StatusEffect.HasCumInsideAnus)
		if (hasCumInPussy && hasCumInAnus):
			saynn("Soon, both her"+str(" virgin" if getModule("TaviModule").isVirgin() else "")+" pussy and her anus begin to leak. {tavi.VaginaContents} drips out of her sex onto the floor where it gets washed by the water. Her butt is leaking {tavi.anusContents} which gets washed away too.")

		elif (hasCumInPussy):
			saynn("Soon, {tavi.vaginaContents} begins to drip out of her sex onto the floor where it gets washed by the water.")

		else:
			saynn("Soon, {tavi.anusContents} begins to drip out of her ass onto the floor where it gets washed by the water.")

		saynn("Tavi moans softly as she feels stuff leaking out of her.")

		saynn("[say=tavi]"+str(taviSpeak("I'm such a slut..", "You will stuff me again soon, right~?", "Very embarrassing.."))+"[/say]")

		saynn("You wait until she stops dripping before letting go of her buttchecks. You give her a little kiss and prepare to leave.")

		addButton("Continue", "That was lewd", "cleanholesandend")
	if(state == "make_tavi_pee"):
		playAnimation(StageScene.Hug, "hug", {npc="tavi", npcBodyState={naked=true}, bodyState={naked=true, hard=true}})
		var waterLevel = getModule("TaviModule").getSkillScore("taviSkillWatersports")
		var isNoob = (waterLevel <= 3)
		var isGood = (waterLevel <= 6)
		#var isPro = (waterLevel > 6)
		saynn("You lean closer to Tavi's ear and tease her.")

		saynn("[say=pc]Let's do a little naughty thing..[/say]")

		saynn("Her eyes look curious. So you continue.")

		saynn("[say=pc]I want to watch you pee.[/say]")

		if (isNoob):
			saynn("Tavi instantly understands what you mean. Her cheeks blush brightly as one of her old tricks gets used against her.")

			saynn("[say=tavi]"+str(taviSpeak("I like sex.. But peeing.. Isn't that considered gross..", "Wow.. Somehow you managed to make me feel embarrassed..", "That's how I humiliate others.. And you're gonna do it to me?.."))+"[/say]")

			saynn("She clearly requires some extra convincing to overcome her fear. And the best way to do that.. is exposure..")

			saynn("Your fingers trace a gentle path along her arm, your touch soft. You can feel tension radiating from Tavi. But you're not deterred. With a playful smile, your fingers trail down Tavi's body until they reach the inmate area between her legs. Tavi purrs softly when she feels your digits teasing her folds.")

			saynn("[say=tavi]Are you doing what I think you're doing..[/say]")

			saynn("She is probably right. With a teasing grin, your fingers find their mark and begin to gently tickle Tavi's peeing hole, your touch is light like you're using feathers.")

			saynn("[say=tavi]Ah.. Yes, you are..[/say]")

			saynn("[say=pc]Nothing to be ashamed of.[/say]")

			saynn("Tavi gasps and then a helpless giggle escapes her as the tickling sensation overwhelms her. Any attempts to step away are met with a firm grip from you, your finger dancing and brushing against her sensitive hole.")

			saynn("[say=tavi]Please.. I can't..[/say]")

			saynn("She can't do it? Or she can't hold back? Either way, you press on. Tickling Tavi's pussy there causes the muscles there to tense up and slowly get more and more tired.. Until the inevitable dam gets breached..")

			saynn("[say=tavi]Ah!..[/say]")

			saynn("With a sudden gasp, she can't hold it back any longer. A powerful stream of warm liquid erupts from her pissing hole, mingling with the trickling shower water. Tavi's resistance crumbles completely. You stand a little to the side and just.. watch. Your pet's giggling turns into a moan of pleasure as she empties her full bladder.. so effortlessly.")

			saynn("Finally, after a sigh of relief, her body relaxes when the last drops of her pee escape her and get washed away.")

			saynn("[say=tavi]"+str(taviSpeak("That felt.. Kinda good..", "If you're gonna keep doing this.. I might become a piss-slut too, you know..", "So that's how it feels.."))+"[/say]")

			saynn("You spend some more time together before it's time to return back to the cell.")

		elif (isGood):
			saynn("Tavi tilts her head slightly. A cute smile shows up on her face.")

			saynn("[say=tavi]"+str(taviSpeak("Well.. Watch it then..", "Sure. Watch me humiliate myself~", "I mean. I can try.."))+"[/say]")

			saynn("Your fingers brush over Tavi's pussy a little, causing her to bite her lip. She is still a little tense.")

			saynn("[say=pc]There is just us. Doesn't it feel good.. to let go?[/say]")

			saynn("She nods subtly and focuses on her urge. Tavi is panting softly while both you and her watch her intimate spot. Soon, she finally allows her body to relax..")

			saynn("And then, with a deep breath.. Tavi spreads her legs more and lets herself go. A golden stream of gross fluids spawns from her pisshole, mingling with the water, before getting washed away by it.")

			saynn("[say=tavi]Mm-m..[/say]")

			saynn("While Tavi is peeing, her gaze is glued to you now. Her cheeks are glowing green.. and yet.. She seems to like that you are watching her. A little moan escapes from her.")

			saynn("Finally, Tavi produces a sigh of relief when the last drops of her pee escape her and get washed away.")

			saynn("[say=tavi]"+str(taviSpeak("I'm getting good at this, aren't I?..", "I'm so naughty, aren't I~?", "Feels so good.."))+"[/say]")

			saynn("You spend some more time together before it's time to return back to the cell.")

		else:
			saynn("Tavi instantly understands what you mean. Her cheeks blush slightly as she purrs and smiles, her eyes sparkling with mischief.")

			saynn("[say=tavi]"+str(taviSpeak("I've been hoping you'd ask~.", "Yes. Your piss-slut can do that for you~.", "I thought you'd never ask.."))+"[/say]")

			saynn("As your fingers trail sensually along her pussy, Tavi's sensitive flesh prickles with anticipation. Feeling bold, her stance shifts subtly. She parts her leg, her posture unapologetically proud. Under your greedy gaze, she lets herself go, allowing the urge to happen.")

			saynn("[say=tavi]Ah~..[/say]")

			saynn("A soft moan escapes Tavi's lips as a warm, steady stream of piss emerges from her peehole, merging with the water that's cascading over her body before getting washed away by it.")

			saynn("While her bladder is still far from empty, Tavi reaches her paw out down to her crotch. Her fingers begin catching some of the gross fluids as she keeps pissing. Then, with a little cute smile, she quickly brings her wet paw to her lips and playfully licks it, her tongue actively cleaning her digits.")

			saynn("[say=tavi]Mmm.. I like the taste..[/say]")

			saynn("Her stream of fluids finally begins to die down. Tavi tries to keep it going by playing with her pisshole but eventually she stops.")

			saynn("[say=tavi]Too bad I can't pee into my own mouth..[/say]")

			saynn("She chuckles. And then bites her lips while watching you and your crotch.")

			saynn("[say=tavi]But you..[/say]")

			saynn("Her voice lowers to a whisper.")

			saynn("[say=tavi]You can.. Would you be up to.. use your piss-slut.. right now..[/say]")

			saynn("You can agree.. or just finish here.")

			addButton("Use Tavi", "Make use of Tavi's mouth", "use_tavi_as_toilet")
		addButton("Enough", "Return back to the cell", "endthescene")
	if(state == "use_tavi_as_toilet"):
		if (GM.pc.hasReachablePenis()):
			playAnimation(StageScene.SexOral, "tease", {npc="tavi", bodyState={naked=true, hard=true}, npcBodyState={naked=true}})
		else:
			playAnimation(StageScene.SexOral, "start", {npc="tavi", bodyState={naked=true, hard=true}, npcBodyState={naked=true}})
		saynn("[say=pc]Yeah. Get on your knees.[/say]")

		if (GM.pc.isWearingChastityCage()):
			saynn("Tavi smiles and slowly lowers herself to her knees before admiring the sight before her. Your locked away member is twitching slightly behind its contains, feeling Tavi's breath. She drags her tongue over your chastity cage before slipping it under it and licking the tip.")

			saynn("[say=tavi]Use me as your piss toilet.. I won't lose a drop..[/say]")

			saynn("Tavi parts her lips and lets your cage into her mouth. Her obedient lusty eyes look up at you, she is waiting patiently..")

		elif (GM.pc.hasReachablePenis()):
			saynn("Tavi smiles and slowly lowers herself to her knees before admiring the sight before her. Your {pc.penis} is semi-hard and twitching slightly, feeling Tavi's breath. She drags her tongue over your length before kissing the tip.")

			saynn("[say=tavi]Use me as your piss toilet.. I won't lose a drop..[/say]")

			saynn("Tavi parts her lips and grabs the head of your member with them. Her obedient lusty eyes look up at you, she is waiting patiently..")

		elif (GM.pc.hasVagina()):
			saynn("Tavi smiles and slowly lowers herself to her knees before admiring the sight before her. Your {pc.pussyStretch} pussy is twitching slightly, feeling Tavi's breath. She drags her tongue over your folds before kissing the little clit.")

			saynn("[say=tavi]Use me as your piss toilet.. I won't lose a drop..[/say]")

			saynn("Tavi parts her lips and presses them around your little pisshole. Her obedient lusty eyes look up at you, she is waiting patiently..")

		else:
			saynn("Tavi smiles and slowly lowers herself to her knees before admiring the sight before her. She drags her tongue over your crotch.")

			saynn("[say=tavi]Use me as your piss toilet.. I won't lose a drop..[/say]")

			saynn("Tavi parts her lips and presses them around your little pisshole. Her obedient lusty eyes look up at you, she is waiting patiently..")

		saynn("And soon, her patience is rewarded. You grunt softly as a powerful stream of piss meets her tongue and starts sloshing inside Tavi's mouth while begins to swallow it all with an eager thirst.")

		saynn("It's clearly gross.. Piss was never meant to be drinked, that's why it developed that awful taste. But Tavi still seems to love it.. Maybe being your piss toilet is what she actually wanted.. She keeps greedily collecting your urine in her mouth before quickly swallowing it in one gulp and already preparing for the next.")

		saynn("As the last drop gets swallowed, Tavi lets out a sigh of contentment.")

		saynn("[say=tavi]Thank you..[/say]")

		saynn("Is she.. thanking you for swallowing your piss? Sure, you give the feline some pats, making her purr and nuzzle your hand.")

		saynn("[say=pc]Such a good little piss toilet.[/say]")

		saynn("Tavi gets up and licks her lips before preparing to follow you back.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "shower_alone"):
		playAnimation(StageScene.Duo, "stand", {npc="tavi", npcBodyState={naked=true}})
		saynn("You decide to just watch since you don't need a shower yourself. Your arms crossed as you lean against the wall.")

		if (isNormal):
			saynn("Tavi's eyes lock onto yours as she reaches for a soft sponge and then lets it glide along her girly curves, removing any dirt while also teasing you in the process.")

			saynn("With a knowing smile, Tavi turns her back to you, allowing the shower water to cascade down her spine, finding little pathways through her short layer of fur and making the green glow of her spots illuminate the surroundings.")

			saynn("[say=tavi]Enjoying the view?.. So sad that you didn't join..[/say]")

			saynn("Her words are clearly an invitation. She says that while arching her back slightly, a subtle yet deliberate move that emphasizes the curves of her hips and her round butt. Her fluffy feline tail swishes ever so slightly, sometimes letting you get a peek at her"+str(" virgin" if getModule("TaviModule").isVirgin() else " neat")+" green folds and the cute tight tailhole.")

			saynn("What a tease. But at least she seems to be washing herself too.")

			addButtonWithChecks("Rail her", "Fuck Tavi here in the shower for being such a tease", "do_rail_tavi", [], [ButtonChecks.HasReachablePenis])
		elif (isCorrupt):
			saynn("Tavi's movements are deliberate, every gesture she does is full of sensuality.. allure.. She arches her back and allows the water to glide down her body, emphasizing the curves that have been enhanced by her transformation. With a playful glance over her shoulder, she locks eyes with you, her gaze filled with a mix of mischief and.. need.")

			saynn("[say=tavi]So sad that I'm here alone.. But at least.. You're enjoying this, right~?[/say]")

			saynn("She sways her hips, offering you a little dance during which she puts her paws on her buttocks and teasingly spreads them in such a way that her tail can barely hide her"+str(" virgin" if getModule("TaviModule").isVirgin() else " neat")+" glowing pussy and the cute tight tailhole.")

			saynn("It becomes incredibly hard to resist her seduction.. Tavi turns around and lets her paws wander along her body before cupping her {tavi.breasts} and squeezing them slightly"+str(" until some of her milk comes out" if getCharacter("tavi").canBeMilked() else "")+". She arches her back even more and pushes her chest forward, silently urging you to succumb to your desires..")

			saynn("What a tease. But at least she seems to be washing herself too in the process.")

			addButton("Rail her", "Fuck Tavi here in the shower for being such a tease", "do_rail_tavi")
		else:
			saynn("A faint blush can be seen on Tavi's cheeks as she stands under the showerhead while feeling your eyes on her. It seems that when her thoughts are not all corrupted, the feline is not that eager to display herself to you. Her movements are cautious, almost shy, as she washes herself, using some soft sponge to brush her short wet fur.")

			saynn("As Tavi turns her back to you, your eyes see the water coursing down her body, tracing the contours of her curves. Your gaze sends a shiver down her spine. Her digits play over her fur, gliding them along the curves of her breasts and hips, out of sight mostly..")

			saynn("No one is saying a word but the situation is somewhat.. tense.. even if wholesome. Tavi continues to wash herself until she is clean.")

		addButton("Enough", "That was wholesome", "pair_enough")
		if (getCharacter("tavi").hasEffect(StatusEffect.HasCumInsideVagina) || getCharacter("tavi").hasEffect(StatusEffect.HasCumInsideAnus)):
			addButton("Clean inside", "Tell Tavi to clean her holes too", "solo_cleaninside")
		else:
			addDisabledButton("Clean inside", "Tavi doesn't have any cum in her holes")
	if(state == "solo_cleaninside"):
		var hasCumInPussy = getCharacter("tavi").hasEffect(StatusEffect.HasCumInsideVagina)
		var hasCumInAnus = getCharacter("tavi").hasEffect(StatusEffect.HasCumInsideAnus)
		saynn("[say=pc]Clean inside too.[/say]")

		if (isNormal):
			saynn("[say=tavi]Aw. You're gonna put more seed in me soon, right?[/say]")

			saynn("Tavi's heart beats faster from your order. Without much hesitation, she turns around so her back is now facing you. Then, with a slow motion, Tavi reaches her paws down to her buttcheeks and spreads them wide for you. Her tail getting out of the way too, revealing her most intimate places such as her pussy and anus.")

		elif (isCorrupt):
			saynn("[say=tavi]But.. I love having all sorts of cum inside me. It's so.. filling..[/say]")

			saynn("Tavi stands with her back facing you. Her digits glide over her wet fur while she teasingly sways her hips. Then, with a seductive glance over her shoulder, Tavi spreads her buttcheeks wide while pulling her tail out of the way, displaying you all of her fuckable holes like an eager slut.")

		else:
			saynn("[say=tavi]Oh.. If you want..[/say]")

			saynn("Tavi's gaze flickers towards you, the feline seems surprised. Nodding slightly, she reaches behind her and uses her paws to spread her buttcheeks.")

		if (hasCumInPussy && hasCumInAnus):
			saynn("A quiet moan escapes Tavi's lips as she pushes. Soon, both her"+str(" virgin" if getModule("TaviModule").isVirgin() else "")+" pussy and her anus begin to leak. {tavi.VaginaContents} drips out of her sex onto the floor where it gets washed by the water. Her butt is leaking {tavi.anusContents} which gets washed away too.")

		elif (hasCumInPussy):
			saynn("A quiet moan escapes Tavi's lips as she pushes. Soon, {tavi.vaginaContents} begins to drip out of her sex onto the floor where it gets washed by the water.")

		else:
			saynn("A quiet moan escapes Tavi's lips as she pushes. Soon, {tavi.anusContents} begins to drip out of her ass onto the floor where it gets washed by the water.")

		saynn("[say=tavi]"+str(taviSpeak("I'm such a slut..", "You like this~?", "Very embarrassing.."))+"[/say]")

		saynn("You wait until she stops dripping and lets go of her buttchecks. You give her a little kiss and prepare to leave.")

		addButton("Continue", "That was lewd", "cleanholesandend")
	if(state == "do_rail_tavi"):
		playAnimation(StageScene.SexStanding, "fast", {npc="tavi", pc="pc", bodyState={naked=true,hard=true}, npcBodyState={naked=true}})
		saynn("You can't endure Tavi's teasing anymore, she needs to pay for making you hard.")

		saynn("As soon as she turns her back to you, your restraint snaps. With a sudden burst of power, you grab her paws and pin her to the shower wall before aligning your {pc.penis} with her slutty pussy hole and ramming it in"+str(", [b]forcefully stealing Tavi's virginity![/b]" if tookVirginity else ".")+"")

		if (tookVirginity):
			saynn("Tavi produces a painful cry from the sudden sharp pain between her legs. Her previously virgin pussy has taken its first cock and is now bleeding, dripping green toxic-like blood. Tavi is not a girl anymore.. but a woman.. even if everything happened extremely fast..")

			saynn("[say=tavi]Ah!.. It hurts.. Hurts so good..[/say]")

			saynn("It was gonna happen one day anyway.. Might as well make her first time special.")

		else:
			saynn("Tavi finds herself pressed against the wall.. but she doesn't seem to resist. Your cock makes her moan in fact..")

			saynn("[say=pc]What a slut.[/say]")

		saynn("You slap her ass and begin to pound her pussy rough while the cold shower keeps spraying water over you, keeping you both wet. After that, your hand lands on her neck and grips it, just above the collar.")

		saynn("[say=pc]You've been pushing your limits, whore. That's what you get.[/say]")

		saynn("Even though you're holding her pinned, Tavi is squirming actively under you. Her tail has wrapped around your leg. Her gasps turn into quiet moans as you thrust inside, fucking your pet passionately, your hips slapping against her fluffy butt with a muffled noise.")

		saynn("With every motion, every second that Tavi's is getting choked, her body squirms and writhes against the wall, her claws digging into the concrete. Her inner walls are clenching around you so well, Tavi is a tight slut and she knows it.. she wants it..")

		if (tookVirginity):
			saynn("You're close.. Now you need to decide if you're gonna cum inside Tavi during her first time..")

		else:
			saynn("You're close.. Pulling out now would be such a waste..")

		addButton("Cum inside", "Try to breed Tavi", "rough_cuminside")
		addButton("Pull out", "Fight the urge to breed Tavi", "rough_pullout")
	if(state == "rough_cuminside"):
		playAnimation(StageScene.SexStanding, "inside", {npc="tavi", pc="pc", bodyState={naked=true,hard=true}, npcBodyState={naked=true}})
		saynn("After a few final thrusts, you reach your peak.. and decide to use this moment to the end, ramming your cock as deep as Tavi's pussy allows!")

		saynn("[say=tavi]Ah!.. Yes!.. Breed..[/say]")

		saynn("You let go of her throat and pull on her hair instead, causing Tavi to throw her head back and cry out from pleasure while your {pc.penis} is throbbing and erupting with jets of hot sticky {pc.cum} that floods her inviting womb to the brim."+str(" Isn't that a nice way to lose your virginity.." if tookVirginity else "")+"")

		saynn("As the waves of pleasure subside, the cold water helps to cool both of you down. You pull out and watch Tavi offering you a great view of her stuffed kitty, seed dripping down her thighs and then quickly getting washed away.")

		saynn("[say=tavi]That felt good..[/say]")

		saynn("Both of you finish taking a shower and prepare to leave back. Tavi has a constant little smirk on her face.")

		addButton("Continue", "That was good", "endthescene")
	if(state == "rough_pullout"):
		playAnimation(StageScene.SexStanding, "tease", {npc="tavi", pc="pc", bodyState={naked=true,hard=true}, npcBodyState={naked=true}})
		saynn("After a few final thrusts, you reach your peak.. And begin fighting yourself. With a growl, you overpower your need to breed and pull out at the last possible second, your {pc.penis} is throbbing and shooting hot sticky strings of {pc.cum} all over Tavi's butt, all of which gets quickly washed away.")

		saynn("[say=tavi]Aw-w.. huff..[/say]")

		saynn("As the waves of pleasure subside, the cold water helps to cool both of you down. You take a step back and take a better look at Tavi's clean neat-looking pussy"+str(" that has just lost its hymen and so is glowing slightly" if tookVirginity else "")+".")

		saynn("[say=pc]I decide if you deserve to be creampied, Tavi.[/say]")

		saynn("She huffs again.. and then nods.")

		saynn("Both of you finish taking a shower and prepare to leave back. Tavi has a constant little smirk on her face.")

		addButton("Continue", "That was good", "endthescene")
func taviSpeak(normalSpeak, corruptSpeak, pureSpeak):
	if(isCorrupt):
		return corruptSpeak
	if(isPure):
		return pureSpeak
	return normalSpeak


func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "go_showers"):
		processTime(5*60)

	if(_action == "shower_with_tavi"):
		processTime(5*60)
		GM.pc.afterTakingAShower()
		getCharacter("tavi").afterTakingAShower()

	if(_action == "shower_alone"):
		processTime(5*60)
		getCharacter("tavi").afterTakingAShower()
		getModule("TaviModule").addCorruption(-1)

	if(_action == "duo_cleaninside"):
		processTime(5*60)

	if(_action == "make_tavi_pee"):
		processTime(3*60)
		getModule("TaviModule").advanceSkill("taviSkillWatersports")

	if(_action == "rub_horns"):
		processTime(10*60)
		getModule("TaviModule").addCorruption(1)

	if(_action == "horns_cum"):
		processTime(2*60)
		getModule("TaviModule").addCorruption(2)

	if(_action == "horns_deny"):
		processTime(2*60)
		getModule("TaviModule").addCorruption(-8)

	if(_action == "cleanholesandend"):
		getCharacter("tavi").clearOrificeFluidsCheckBlocked()
		endScene()
		return

	if(_action == "use_tavi_as_toilet"):
		processTime(5*60)
		getCharacter("tavi").cummedInMouthBy("pc", FluidSource.Pissing)
		getModule("TaviModule").addCorruption(2)

	if(_action == "do_rail_tavi"):
		processTime(10*60)
		GM.pc.afterTakingAShower()
		if(getModule("TaviModule").isVirgin()):
			tookVirginity = true
			setFlag("TaviModule.TaviIsNotVirgin", true)

	if(_action == "solo_cleaninside"):
		processTime(5*60)
		getModule("TaviModule").addCorruption(-2)

	if(_action == "rough_cuminside"):
		processTime(3*60)
		getCharacter("tavi").cummedInVaginaBy("pc")
		GM.pc.orgasmFrom("tavi")
		getModule("TaviModule").addCorruption(3)

	if(_action == "rough_pullout"):
		processTime(3*60)
		GM.pc.orgasmFrom("tavi")
		getModule("TaviModule").addCorruption(-3)

	setState(_action)

func saveData():
	var data = .saveData()

	data["isCorrupt"] = isCorrupt
	data["isPure"] = isPure
	data["isNormal"] = isNormal
	data["isVirgin"] = isVirgin
	data["isMessy"] = isMessy
	data["hasHorns"] = hasHorns
	data["tookVirginity"] = tookVirginity

	return data

func loadData(data):
	.loadData(data)

	isCorrupt = SAVE.loadVar(data, "isCorrupt", false)
	isPure = SAVE.loadVar(data, "isPure", false)
	isNormal = SAVE.loadVar(data, "isNormal", false)
	isVirgin = SAVE.loadVar(data, "isVirgin", false)
	isMessy = SAVE.loadVar(data, "isMessy", false)
	hasHorns = SAVE.loadVar(data, "hasHorns", false)
	tookVirginity = SAVE.loadVar(data, "tookVirginity", false)
