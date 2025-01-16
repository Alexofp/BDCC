extends SceneBase

func _init():
	sceneID = "ElizaDrugTestDemoniXScene"

func _run():
	if(state == ""):
		addCharacter("eliza")
		playAnimation(StageScene.Duo, "stand", {npc="eliza"})
		saynn("[say=pc]Wanna try that pill yourself maybe?[/say]")

		saynn("Eliza raises a brow.")

		saynn("[say=eliza]I'm not a test subject, you know.[/say]")

		saynn("She isn't it.. so you will have to say something smart to trick her.")

		saynn("[say=pc]So you're saying.. that you're not brave enough. Or is the real reason.. that you don't actually like experimenting.. Maybe you don't like science that much?[/say]")

		saynn("Oof. That was a huge blow, Quinn's ears flick back momentarily.. but her smirk never wavers. She twirls the pill between her fingers, her sharp eyes fixed on you.")

		saynn("[say=eliza]You think you can goad me into this, patient? I don't need to be tricked.. I've been itching for a proper experiment. Just don't say I didn't warn you~.[/say]")

		saynn("Without hesitation, she pops the pill into her mouth, swallowing it dry. For a moment, nothing happens.. she raises a brow at you.")

		saynn("[say=eliza]Tastes like bad life decisions.. My favourite~.[/say]")

		saynn("[say=pc]Nothing?[/say]")

		saynn("[say=eliza]Give it a second. Transformations are slow.. make take days even. See me tomorrow.[/say]")

		saynn("Suddenly, a ripple courses through her body. Her tail stiffens, her claws dig into the nearest table.")

		saynn("[say=eliza]Oh.. oh, this is quite something.[/say]")

		addButton("Continue", "See what happens next", "eliza_switch")
	if(state == "eliza_switch"):
		playAnimation(StageScene.Duo, "stand", {npc="elizaDemon"})
		saynn("Her voice quivers briefly before dropping into a deeper, richer tone.. accompanied by a strange, resonating echo. Small horns pierce through the fur on her head, curving upward with an intimidating kind of grace.")

		saynn("You're not sure how to react.. she is clearly suffering from a huge discomfort.. but that's to be expected.")

		saynn("[say=pc]Quinn?[/say]")

		saynn("She huffs as her hind paws suddenly begin to change shape, toes losing their definition.. until they merge into two bulky hooves. A sinuous, spaded tail unfurls behind her, flicking with dangerous energy.")

		saynn("So fast.. she said that it would take days.. and yet.. here she is.")

		saynn("After all that is over, Eliza is left panting. She straightens up slowly, her top and pencil skirt stretching taut over her now more muscular and curvy frame. Her fur seems to shimmer with a faint glow, her green eyes burning brighter than before.")

		saynn("[say=eliza]Well, well..[/say]")

		saynn("Her voice is intoxicating now, the echo sending a shiver down your spine. She flexes her fingers, her claws now looking much sharper and longer. She catches her reflection in one of the polished surfaces and lets out a throaty chuckle.")

		saynn("[say=eliza]Not bad.. Not bad at all. I feel so powerful..[/say]")

		saynn("She turns towards you, her new pointy tail lashing behind her. A demon in sheep's clothes, standing right in front of you. Flashing emerald eyes scan you, her rough tongue polishing her top lip. A second of deafening silence is broken by a single word.")

		saynn("[say=eliza]Kneel.[/say]")

		saynn("It vibrates through the air, carrying a weight of pure dominance with it. Your body hesitates, your mind caught between awe and.. an unexplainable desire to make her will a reality.")

		saynn("She takes a step closer, her hooves clacking against the inviting floor.")

		saynn("[say=eliza]Did I stutter, inmate?[/say]")

		saynn("She did not..")

		addButton("Submit", "Obey her will", "submit")
		addButton("Resist", "Be a brat about it and see what happens", "resist")
	if(state == "submit"):
		playAnimation(StageScene.Duo, "kneel", {npc="elizaDemon"})
		saynn("Unchallenged obedience is pumping through your veins, you lower yourself before your new mistress and get on your knees.. exactly like told.")

		saynn("[say=eliza]Hands behind your head, little assistant.[/say]")

		saynn("Her voice is laced with a hypnotic, demonic echo that vibrates inside your chest and wraps around your senses like a vice. The heat of her body is overwhelming as she comes and leans closer, her breath teasing your ear.")

		saynn("[say=eliza]Good pets do exactly what I say..[/say]")

		saynn("She takes a small step back.. while her spaded tail curls around your neck, forming a second collar of sorts.. complete with a hands-free leash. The faint, musky scent of her arousal fills the air, making your head spin.")

		saynn("Her clawed hands reach for her clothing.")

		addButton("Continue", "See what happens next", "eliza_naked")
	if(state == "eliza_naked"):
		# (( new anim forced oral tease underwear
		saynn("Her labcoat, her top, her pencil shirt, all fall down to the floor. All that's left on her is the fancy black lingerie. Her alluring curves, her gorgeous six-pack, her busty chest, wide hips and a firm ass, it's all out on display.")

		saynn("[say=eliza]Liberating.[/say]")

		saynn("She tilts her head slightly while looking down at you, her expressionless eyes catching your hungry glances.")

		saynn("[say=eliza]You're lucky I'm in a good mood.[/say]")

		saynn("Her flexible tail pulls you forward, towards her crotch.. until your lips are inches away from her lace panties. Her paws grab your wrists and raise them higher, above your head.")

		saynn("[say=eliza]Think I should keep you?[/say]")

		saynn("The scent.. it's so much stronger near the source. Your mind is clouded, only one thought is loud and clear.. obey..")

		saynn("[say=pc]Yes.. please..[/say]")

		saynn("[say=eliza]Then worship your demon queen. Prove you're worth keeping around.[/say]")

		saynn("She frees one hand and pulls off the rest of her cloth, revealing her moist demonic flower.. flower that's overflowing with juices.")

		saynn("[say=eliza]Mortal clothing is so uncomfortable.[/say]")

		saynn("She then tightens her grip on your wrists, holding them firmly, her strength making it impossible to resist anymore. Her tail tugs at the back of your head, guiding your lips closer.")

		saynn("[say=eliza]No hesitation. Get to work, pet.[/say]")

		addButton("Lick", "Worship your queen", "do_lick")
	if(state == "do_lick"):
		# (( new anim forced oral lick naked
		saynn("Your tongue flicks out, its tip touches and follows along the soft, slick folds of her demonic pussy. Quinn exhales sharply, her claws digging slightly into your wrists.")

		saynn("[say=eliza]Hmm~..[/say]")

		saynn("Her tail loosens slightly, allowing you more movement as you lap at her, your tongue exploring every inch of her slit with eager desperation, drawing little circles around her sensitive clit and traveling along the counters of her drippy lips. Quinn throws her head back, a low throaty growl escaping her as she pushes her crotch into your face, enjoying your licks.")

		saynn("[say=eliza]Better than I expected. Maybe you're not entirely useless after all.[/say]")

		saynn("Your tongue spreads her folds and presses deeper, earning another little gasp from her. That tail is still curled around your neck, keeping you in place as she rocks her hips ever so slightly, meeting your tongue. Her demonic voice is filled with a mix of satisfaction and playful cruelty.")

		saynn("[say=eliza]That's it.. Keep licking like a good little pet. You're mine now, you know that? Every. Single. Inch of you belongs to me.[/say]")

		addButton("Continue", "See what happens next", "lick_faster")
	if(state == "lick_faster"):
		# (( new anim forced oral lick fast naked
		saynn("She moves her hips again.. and again.. her pussy sliding along your face as she begins to ride it. The soft sounds of your worship fill the room, mingling with her growly moans. All the while you just give it your all, your tongue licking away at her hot inner walls, lapping up any juices with full devotion. You're drowning in her heat.. and you can't get enough..")

		saynn("[say=eliza]Such a good.. little.. pet..[/say]")

		saynn("Her movements quickly become more erratic as the peak begins to draw near. She stands strong on her hooves.. but the little shivers, the way her pussy tightens around your tongue.. it tells you all..")

		saynn("[say=eliza]Mmhh.. Yes.. Take it all.[/say]")

		saynn("With a final, growly noise of love, a wave of ecstasy comes rushing through her demonic frame, her pussy pulsing and gushing juices all over your lips and cheeks in an overwhelming torrent.")

		saynn("[say=eliza]Fuck~..[/say]")

		saynn("She keeps grinding your face, prolonging her orgasm as her fluids continue to coat your face, dripping down your chin and onto the cold floor.")

		saynn("[say=eliza]Look at you.. Drenched in me.. My servant.[/say]")

		saynn("Your mind wants to scream.. to sell off your soul to her.. right here and now..")

		addButton("Continue", "See what happens next", "after_lick")
	if(state == "after_lick"):
		playAnimation(StageScene.SexStart, "start", {pc="elizaDemon", bodyState={naked=true}})
		saynn("She finally releases your wrists.. making you slump. You can finally start catching your breath. Her tail, however, tightens briefly around your neck, lifting your face to meet her intense gaze.")

		saynn("[say=eliza]Let me look at my assistant.. I think I proved my point well enough?[/say]")

		saynn("You nod.. and feel the vibrations of her demonic chuckle.")

		saynn("[say=eliza]As much as I.. enjoy this.. I think it's corrupting my mind.. I can't think straight.[/say]")

		saynn("She reaches for her labcoat and pulls out some pill from her pockets. Eliza stares at it.. and hums. She was about to eat it.. but something stopped her.")

		saynn("[say=eliza]Or maybe I should say fuck it.. who cares about science when you can have a worshipper or two..[/say]")

		saynn("You can hear her breathing. She closes her eyes.. furrows her brows.. and focuses.")

		saynn("[say=eliza]No..[/say]")

		saynn("Finally, she throws the pill into her mouth and swallows it with no regrets.")

		addButton("Continue", "See what happens next", "after_lick_undo_tf")
	if(state == "after_lick_undo_tf"):
		playAnimation(StageScene.Duo, "stand", {npc="eliza"})
		saynn("Whatever Eliza ate, it seems to have an opposite effect to DemoniX. Her horns begin to retract back into her skull, getting smaller and smaller. Her pointy tail morphs, getting a bit shorter, losing its sharp tip and growing fur.. her hooves go away, replaced by the digitigrade hind paws. Her body loses some of its curviness..")

		saynn("[say=eliza]Mmhh..[/say]")

		saynn("After the process is over.. Eliza opens her eyes..")

		saynn("[say=eliza]That was.. something.[/say]")

		saynn("[say=pc]Welcome.. back?[/say]")

		saynn("She chuckles and starts putting on her clothes.")

		saynn("[say=eliza]Got you a bit wet.[/say]")

		saynn("That's an understatement.")

		saynn("[say=pc]It's okay.[/say]")

		saynn("[say=eliza]I guess the pill worked~. Of course it did.[/say]")

		saynn("Eliza helps you to get up..")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "resist"):
		playAnimation(StageScene.Duo, "stand", {npc="elizaDemon", npcBodyState={naked=true}})
		saynn("Her order.. it's very tempting.. but something inside you makes you grit your teeth and fight the compulsion.")

		saynn("[say=pc]No.. Maybe you're the one who should kneel.[/say]")

		saynn("Your words hang in the air for a moment, daring and defiant. Eliza's smirk widens, revealing her sharp, long fangs. She tilts her head slightly, her horns catching the sterile light of the lab as her tail flicks behind her with an audible crack.")

		saynn("[say=eliza]Really~?[/say]")

		saynn("Her clawed paws reach for her clothing.. and begin stripping it. Her labcoat, her top, her pencil shirt, all fall down to the floor. Even her fancy black lingerie doesn't survive it and experience the same fate.")

		saynn("Her alluring curves, her gorgeous six-pack, her busty chest, wide hips and a firm ass, it's all out on display.. as well as her moist demon pussy. The scent of her arousal is making your head spin slightly even from a distance.")

		saynn("[say=eliza]How about now, mortal? Don't you just want to worship this sexy body~?[/say]")

		saynn("Fuck.. The way her voice reverbs in your mind.. it's becoming harder and harder to say no to.. You focus all of your will power into the next few words.")

		saynn("[say=pc]Kneel yourself.. then we will talk, demon.[/say]")

		saynn("She winks, her grin just as bright.")

		saynn("[say=eliza]You've got guts, I will give you that. But you're about to learn something very important, my little assistant..[/say]")


func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "eliza_switch"):
		processTime(3*60)

	if(_action == "submit"):
		processTime(3*60)

	if(_action == "resist"):
		processTime(3*60)

	if(_action == "eliza_naked"):
		processTime(3*60)

	if(_action == "do_lick"):
		processTime(3*60)

	if(_action == "lick_faster"):
		processTime(3*60)
		GM.pc.cummedOnBy("eliza", FluidSource.Vagina)
		GM.pc.cummedInMouthBy("eliza", FluidSource.Vagina)

	if(_action == "after_lick"):
		processTime(3*60)

	if(_action == "after_lick_undo_tf"):
		processTime(3*60)

	setState(_action)
