extends SceneBase

var didBreed = false

func _init():
	sceneID = "DrugDenKidlatBoundGropeScene"

func _run():
	if(state == ""):
		addCharacter("kidlat", ["naked"])
		playAnimation(StageScene.Grope, "grope", {pc="kidlat", npc="pc", bodyState={naked=true, hard=true}})
		saynn("The fur around the crotch of that kitty is shining in the faint light.. might as well help that poor needy shopkeeper.")

		saynn("You approach her closer.. and take in the sight of her bound body. Her black fur has that fancy cyan pattern on her belly that you can now admire in full detail. Her arms have blue zig-zags on them.. they look like lightning. Her breasts have a cute dark spot in the shape of a heart.")

		saynn("Kidlat's whiskers are twitching from your breath.")

		saynn("[say=kidlat]Hey.. uh.. lad. You don't have to be so close, I'm not for sale, haha..[/say]")

		saynn("One of your hands reaches out and cups her firm breasts, making them bounce up and down a few times. A silent gasp escapes Kidlat..")

		saynn("[say=kidlat]Come on, now. Buy something or leave..[/say]")

		saynn("Her chest is much more interesting than her wares and she knows that. She tries to take a step back but you just follow, your hand lands back on her breast and squeezes it.")

		saynn("[say=kidlat]Ah~.. Hey, now.. Why are you touching me?[/say]")

		saynn("You don't respond, instead just choosing to continue playing with her, your second hand joining, caressing her cute tits. You can feel her blue nips harden under your touch, and you can't help but smile. Kidlat's breathing becomes shallow.. you can hear her panting quietly.")

		saynn("[say=kidlat]Mm.h..[/say]")

		saynn("She takes a few more steps back.. until her back gets pressed against one of the walls.")

		saynn("[say=kidlat]Oopsie.. now I'm cornered.. We can talk this out, right?..[/say]")

		saynn("You cup her breasts again, fingers sinking into her soft, fur-covered squishy orbs. You lift them slightly before letting them bounce back into place, drawing another gasp from the feline.")

		saynn("[say=kidlat]Ah.. how about you don't go too far.. and then I won't have a reason to resist.. much..[/say]")

		saynn("Your fingers find her nips and pinch them, making her hips jerk slightly, your actions clearly sending jolts of pleasure through her body. You roll the hardened buds between your digits, twisting them just enough to make her squirm.")

		saynn("[say=kidlat]Bloody 'ell..[/say]")

		saynn("You notice her rubbing her legs against each other more.. There is an obvious wet spot of fur growing on her inner thighs. Kidlat lets out a soft meow as your hands release her breasts, only to slide lower, tracing the cyan fur of her belly until you reach her needy slit.")

		saynn("Indeed.. she is all damp down there. You run two digits along the folds and teasing the little blue sensitive clit with little rubs. Kidlat's thighs tremble.. and she tries to press her legs together.. but there is no escape.")

		saynn("[say=kidlat]Mmf.. damn it.. You have a.. soft touch.. but you don't h-have to..[/say]")

		saynn("Despite her words, her body whispers something else.. it's arching into your touch, desperate.. One of your hands still rests on her breasts, fondling them.. while the second spreads her aroused folds.. catching a few strings of her juices on your digits.")

		saynn("[say=kidlat]Nh.. I can still bite, you know..[/say]")

		saynn("Can she really though? You catch some more of her delicious wetness and quickly bring that hand up to her bratty lips, your digits boldly slipping past her teeth.")

		saynn("[say=kidlat]Mhhhm?!..[/say]")

		saynn("Her cheeks burn cyan, her body squirming while you continue to play with her tits.. but she doesn't bite. You can feel her rough tongue gently sliding along your digits, tasting her own juice.")

		saynn("After letting her thoroughly clean your fingers, you pull back and watch her.. The helpless kitty is left in a much more needy state than before, her hips swaying in round seductive motions, her long tail wrapped around her leg.")

		saynn("[say=kidlat]Bloody tease.. I'm.. ngh.. I'm not gonna beg..[/say]")

		addButton("Make her cum", "Push Kidlat further with your touches", "do_finger")
		addButton("Enough fun", "Let Kidlat cool down", "do_cooldown")
		addButtonWithChecks("Forced BJ", "Time for you to have some fun too", "do_bj", [], [[ButtonChecks.HasReachablePenis]])
		addButtonWithChecks("Forced lick", "Time for you to have some fun too", "do_lick", [], [[ButtonChecks.HasReachableVagina]])
		addButtonWithChecks("Breed", "Enough playing around", "do_breed", [], [[ButtonChecks.HasReachablePenis]])
	if(state == "do_cooldown"):
		saynn("Enough is enough, you decide to stop the teasing here and step back.")

		saynn("Kidlat feels that.. and pouts. Her legs still instinctively rub against each other.")

		saynn("[say=kidlat]What a rude lad.. It's not like I can reach it myself.. huff.[/say]")

		saynn("Seeing her struggle is so cute.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "do_finger"):
		playAnimation(StageScene.Grope, "gropefast", {pc="kidlat", npc="pc", bodyState={naked=true, hard=true}})
		saynn("You step closer again, Kidlat's breath hitching as she senses your presence. Her trembling body is pinned between you and the cold wall, her wrists bound tight behind her back. Her chest is rising and falling quickly, her perky tits still heaving from your teasing.")

		saynn("[say=kidlat]I swear.. don't toy with me.. whoever you are..[/say]")

		saynn("Her bratty is gone.. replaced with not-so-subtle desperation that she can't hide anymore. Your hands find her breasts again, fingers immediately seeking her stiff nipples. You roll them firmly, pinching and tugging.. until her legs begin to shaky, unable to resist the electric pulses shooting through her body.")

		saynn("[say=kidlat]Hhh.m..[/say]")

		saynn("Her back arches, pressing her breasts harder into your hands, her body moving on instinct now. You lower one hand, gliding it over her soft belly before slipping between her thighs again. Her slit is.. simply soaked.. radiating so much heat that you're not sure how she is still staying so composed. You trace slow, teasing circles around her clit, feeling her hips jerk at every movement.")

		saynn("[say=kidlat]Ngh.. j-just there..[/say]")

		saynn("Her breathing becomes ragged as you press two fingers against her entrance, sliding inside her with ease. Her bound wrists tug against the restraints, fingers flexing as she tries to touch you back, her tail lashing out and curling around one of your legs.")

		saynn("[say=kidlat]F-fuck..[/say]")

		saynn("She gasps, back arching again as you find her sweet spot, curling your fingers just right, your second hand still playing with her breasts, fingers twisting and tugging on it. She moans.. and her moans grow louder, hips bucking wildly as you push her higher and higher, your digits playing inside her.")

		saynn("[say=kidlat]I'm.. about.. hh.. to..[/say]")

		saynn("Her entire body shudders violently.. and she lets out a high-pitched noise of love as the orgasm crashes over her. Her legs nearly give out.. but you hold her steady as the pleasure washes through her, wave after wave. Her slit clenches around your fingers, soaking your hand as her climax takes over.")

		saynn("You keep teasing her just a little longer, drawing out every last shiver until she is completely spent.")

		saynn("[say=kidlat]Bloody hell..[/say]")

		addButton("Continue", "See what happens next", "do_finger_cuddle")
	if(state == "do_finger_cuddle"):
		playAnimation(StageScene.BreastGroping, "tease", {pc="pc", npc="kidlat", npcBodyState={naked=true, hard=true}})
		saynn("She slumps against the wall, her head falling forward as she tries to catch her breath, her body still trembling with aftershocks. You catch her and help her land onto the floor.")

		saynn("[say=kidlat]You really know how to make a kitty purr.. whoever you are..[/say]")

		saynn("What a cute kitty.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "do_breed"):
		playAnimation(StageScene.SexAgainstWall, "tease", {pc="pc", npc="kidlat", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("Enough playing around.")

		saynn("Kidlat's body quivers against you as your hands press her firmly against the cold surface of the nearest wall, raising her legs to her shoulders so that she is not touching the floor anymore. In this pinned position, her soaked slit already brushes against your {pc.penis}..")

		saynn("[say=kidlat]Ohh fuck.. You're not a shy lad, are you..[/say]")

		saynn("She squirms against your tight grip.. but there is nowhere for her to go. You shift her body slightly, pressing the tip of your cock against her inviting cyan flower.. the petals spreading without much force.")

		saynn("[say=kidlat]Mmmhhph.. I'm s-screwed, aren't I..[/say]")

		addButton("Ram it in", "Take her raw", "do_breed_fuck")
	if(state == "do_breed_fuck"):
		playAnimation(StageScene.SexAgainstWall, "sex", {pc="pc", npc="kidlat", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("Her intuition wasn't betraying her.. but her body is.")

		saynn("Kidlat lets out a choked gasp as you slide in, filling her in one deep motion. Her slick, hot walls tighten around your shaft immediately, her breasts bouncing wildly as you begin pounding into her without restraint, each thrust shaking her entire body.")

		saynn("[say=kidlat]Nhh.. d-damn junkie.. w-why do you fuck so well.. ah.. you in particular..[/say]")

		saynn("Her mouth is slightly opened, tongue out. Her moans begin to echo through the tunnel, her long fluffy tail is sweeping the floor. You want more.. so you lean in and force a deep kiss, invading her mouth and letting your tongues play, exchanging fluids.")

		saynn("As you pull free, there is a string of saliva hanging between your and her lips. You two are so close.. and yet she can't see you.. while you see her cyan deep blushing face in full detail.")

		saynn("[say=kidlat]Ngh..[/say]")

		addButton("Faster", "Speed up the action", "do_breed_fast")
	if(state == "do_breed_fast"):
		playAnimation(StageScene.SexAgainstWall, "fast", {pc="pc", npc="kidlat", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("Before she can say anything else, you thrust harder, faster, driving your cock into her with a primal need. Kidlat lets out a gasp as her entire body shudders, her pussy clenching around you even tighter.")

		saynn("[say=kidlat]W-wai.. I'm.. ah.. hah.. Ah-h..[/say]")

		saynn("You can feel it.. And you keep going, ravaging that cute cyan slit, keeping your pace fast and hard. Poor kitty is shivering in your hands, her lips parted as she is panting and huffing at you, her hot breathing tickling your nose.. while you just keep fucking her.")

		saynn("Her pussy clenches around your {pc.penis} one last time.. before her climax washes over her.. her walls spasming around you as her juices drip down her thighs, dripping onto the floor.")

		saynn("[say=kidlat]Hhh..ah..[/say]")

		saynn("You don't stop, thrusting through her orgasm, overpowering her clenched inner walls.. grunting silently as the pleasurable friction makes your own legs shiver slightly too..")

		addButton("Inside", "Breed the kitty", "do_breed_inside")
		addButton("Pull out", "You'd rather not risk it", "do_breed_pullout")
	if(state == "do_breed_inside"):
		playAnimation(StageScene.SexAgainstWall, "inside", {pc="pc", npc="kidlat", pcCum=true, bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("You're close.. and the thought of breeding her completely fills your mind. You pull back.. before burying your cock as deep as possible, pinning her into the wall as your climax hits. Your {pc.penis} smashes into her cervix.. and begins throbbing.. spilling waves of hot, creamy {pc.cum} directly into her womb.")

		saynn("[say=kidlat]Hhh-ahh.. f-fuck.. damn.. animal.. ah.. s-so much..[/say]")

		saynn("Kidlat's restrained body trembles against you.. her long tail wrapping around your leg as you fill her up.. right here in these tunnels.. She is panting like crazy while your member is still inside, pumping her with the last bits of your seed.")

		saynn("By the end of it, you're left panting..")

		didBreed = true
		addButton("Continue", "See what happens next", "do_breed_after")
	if(state == "do_breed_pullout"):
		playAnimation(StageScene.SexAgainstWall, "tease", {pc="pc", npc="kidlat", pcCum=true, bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("You're close.. But the thought of breeding her here, in these dirty tunnels doesn't seem appealing. You keep ramming it in.. but as soon as you feel the point of no return.. you pull out, your cock leaving her wet slit with a satisfying wet noise.")

		saynn("[say=kidlat]Ah!..[/say]")

		saynn("More silent grunts leave your lips as your {pc.penis} begins shooting beautiful strings of {pc.cum} into the wall behind Kidlat. Some of it lands on her fluffy tail that wraps around your leg during this.")

		saynn("[say=kidlat]F-fuck..[/say]")

		saynn("Her cyan pussy still clenches around hot empty air, moans escaping her.")

		saynn("By the end of it, you're left panting..")

		addButton("Continue", "See what happens next", "do_breed_after")
	if(state == "do_breed_after"):
		playAnimation(StageScene.SexStart, "start", {npc="kidlat", npcBodyState={naked=true}})
		saynn("Carefully, you lower the squirming feline onto the floor. All without a single word.")

		if (didBreed):
			saynn("As you pull out, her used pussy instantly starts to drip with your seed, creating a little puddle of creamy stuff under her.")

		else:
			saynn("Her pussy is still dripping, creating a little puddle of juices under her.")

		saynn("You step back, escaping the grasp of her tail.")

		saynn("[say=kidlat]You're one.. awful.. shopper..[/say]")

		saynn("She looks at you.. tries to.. through the tight blindfold.")

		saynn("[say=kidlat]But maybe I will forgive you.. this time..[/say]")

		saynn("What a cute kitty. Enough fun for now though.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "do_bj"):
		playAnimation(StageScene.SexOralForced, "tease", {pc="pc", npc="kidlat", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("She had her share of fun.. time for you to do the same.")

		saynn("Without any notice, you force Kidlat down to her knees in front of you, pulling her cuffed paws high above her head.")

		saynn("[say=kidlat]Eek.. That was pretty rude.. Guess I should've expected it..[/say]")

		saynn("She can't see anything.. but she can surely feel it when the tip of your {pc.penis} presses against her soft lips, smearing a bead of precum onto them. Kidlat flinches, her ears flicking at the sensation. She tries to instinctively pull away.. but you just bring her back, holding her wrists with a tight grip.")

		saynn("[say=kidlat]You're really makin' me do this, lad?[/say]")

		saynn("One of your hands tangles into her dark hair, keeping her extremely still as you drag your shaft along her cheek, feeling the warmth of her blushing furred skin against you. Her tail flicks in frustration.. but when you press your length against her lips again, her rough feline tongue sneakily flicks out to give you a quick lick.")

		saynn("[say=kidlat]You're gonna buy something from me then, okay?[/say]")

		saynn("A silent smirk appears on your face as she willingly parts her lips and grabs the head of your cock with them, her tongue gently plays with its tip, catching the next few drops of pre.")

		saynn("You're not gonna go easy on her..")

		addButton("Face-fucking", "Ramp it up real fast", "do_bj_sex")
	if(state == "do_bj_sex"):
		playAnimation(StageScene.SexOralForced, "suck", {pc="pc", npc="kidlat", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("She barely has time to react before you ram your whole length inside her bratty mouth, the head of your cock bending against the back of her mouth before going down her throat. Her muffled protest is lost as her walls instinctively clenche around you. You feel her struggle, trying to pull her bound arms away.. but there is no way for her to stop you.")

		saynn("[say=kidlat]Mmf!.. Nngh..[/say]")

		saynn("With her wrists in your hands, she can't push you away.. she can only take what you give. And so you begin sliding inside, letting her warm mouth envelop you, pulling out of her throat.. just to stretch it again a few moments later.")

		saynn("She gags slightly but tries to adjust, drool already dripping down her chin as you fuck her like this. Each time her throat gets tight around your cock only spurs you on, various wet noises accompanying your motions.")

		addButton("Faster", "Really fuck her face", "do_bj_fast")
	if(state == "do_bj_fast"):
		playAnimation(StageScene.SexOralForced, "suckfast", {pc="pc", npc="kidlat", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("Her breathes come in short, needy gasps whenever you pull back.. but you don't give her much time before thrusting in again, fucking her face at a faster and faster pace. Her whole body trembles under your onslaught on her throat, her nipples hard, her thighs pressed together as she struggles to keep up.")

		saynn("Kidlat keeps gagging and choking on your cock.. which feels great.. the walls of her throat squeezing your length in all of the various pleasurable ways.")

		saynn("[say=kidlat]Nhhnn.. m..mhhff.. hh..[/say]")

		saynn("Her cheeks are burning cyan.. her body is tense.. but by now she has stopped trying to break free.. just holding her shaky paws clenched into fists.. while you ravage her throat, stretching it and using it for your pleasure.")

		saynn("Her feline tongue is unmistakable.. She could do some real damage with it if she wanted to.. but she just curls around your dick, spreading her saliva along it. What a good kitty.")

		saynn("Her breasts jiggle slightly with each time, her body trembling as she submits to you, her chest rising and falling quickly as she tries her best to keep up.")

		saynn("The way her throat treats you.. makes you want to grunt.. you're getting so close..")

		addButton("Throatpie", "Send it all down her throat", "do_bj_throatpie")
	if(state == "do_bj_throatpie"):
		playAnimation(StageScene.SexOralForced, "suckinside", {pc="pc", npc="kidlat", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("You thrust deeper one last time.. and just stay like this.. holding her in place as you feel yourself reaching your orgasm. You hear her letting quiet, muffled whimpers, her throat is pulsing around your cock.. pushing you over the edge.")

		saynn("Your balls tense up hard.. as your {pc.penis} starts shooting waves of sticky {pc.cum} deep inside her with multiple throbbing motions..")

		saynn("Kidlat gags a lot by this moment.. but tries to swallow instinctively.. only to realize that there is nothing to swallow, your load is sent directly down her throat, past her mouth into her belly.")

		saynn("[say=kidlat]Nhh.h.. glk.. hh..hhh.. glk.. hh..[/say]")

		saynn("The way her walls milk you for all your seed.. it's amazing.. making you wish you could stay like this forever.")

		saynn("Sadly, you begin to notice Kidlat's strength fading away, her body struggling again.. out of desperation.. as her only source of air was cut off.. replaced with a constant supply of jizz..")

		addButton("Pull out", "Let her breathe", "do_bj_end")
	if(state == "do_bj_end"):
		playAnimation(StageScene.SexOralForced, "tease", {pc="pc", npc="kidlat", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("You'd rather not make the girl black out on you.. so you pull out as soon as her throat stops draining your balls.")

		saynn("Kidlat gasps for air and starts coughing loudly.. all while still hanging by her arms above her head.")

		saynn("[say=kidlat]Ghh-hh. hhhkhh.. B-bloody f-fucking hell.. kh..[/say]")

		saynn("A thin strand of saliva and {pc.cum} connects her lips to your cock. She coughs more, trying to catch her breath.")

		saynn("[say=kidlat]How about a little warnin' first, huh? F-fuck.. kh..[/say]")

		saynn("Her expression is a mix of clear frustration and something else. She lowers her head and just breathes for a bit while moving her jaw.")

		saynn("[say=kidlat]I kept up pretty well, eh?.. All things considered..[/say]")

		saynn("Slowly, she licks her lips, catching and swallowing any lingering mess. She finds the tip of your cock again and cleans it too, dragging her tongue along its length.")

		saynn("[say=kidlat]Customer always right..[/say]")

		saynn("Looks like she has just made herself a new loyal customer.")

		saynn("You let go of her wrists and help her get up. It's time to wrap up.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "do_lick"):
		playAnimation(StageScene.SexOralForced, "tease", {pc="pc", npc="kidlat", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("She had her share of fun.. time for you to do the same.")

		saynn("Without any notice, you force Kidlat down to her knees in front of you, pulling her cuffed paws high above her head.")

		saynn("[say=kidlat]Eek.. That was pretty rude.. Junkies these days..[/say]")

		saynn("Your {pc.foot} nudges her thighs, making her spread her legs for you, revealing just how wet she already is. The fur around her cyan slit is all shiny and slick.")

		saynn("[say=kidlat]I'm not for sale, lad.. But I hope you will buy somethin' after this![/say]")

		saynn("You stand close to her.. so close that your own wet flower is hovering a few inches away from her blushing face. Her chest is rising and falling in deep, long breaths.. yeah, she can totally feel your heat.")

		saynn("[say=kidlat]That's a.. very wet.. scent. I'm sorry, I don't take payments in fish.[/say]")

		saynn("So cheeky. You know just the way to use those bratty lips.")

		addButton("Pull close", "Make her work", "do_lick_sex")
	if(state == "do_lick_sex"):
		playAnimation(StageScene.SexOralForced, "lick", {pc="pc", npc="kidlat", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("Without a word, you push your {pc.masc} hips forward. Your dripping slit presses against her lips.")

		saynn("[say=kidlat]O-oi-..[/say]")

		saynn("The sudden contact makes her entire body tense, her mouth parts around your sensitive folds while the scent of your arousal fills her senses.")

		saynn("She instinctively tries to pull away.. but your firm grasp on her cuffed wrists prevents it, forcing her into your crotch instead as you roll your hips against her face, rubbing your soaked folds against her soft lips.")

		saynn("[say=kidlat]Mmfff-..[/say]")

		saynn("She muffles a protest, her warm breathing spreading against your clit and folds. It sends a shiver through you, your pussy dripping arousal onto the fur of her cheeks.. onto her snout.. making her blush harder.")

		saynn("You press harder against her mouth, your juices smearing against her lips.. until she has no choice but to taste you.")

		saynn("[say=kidlat]Huff..f..[/say]")

		saynn("She huffs warmly.. But then.. slowly.. tentatively.. her tongue flicks out.")

		saynn("[say=kidlat]Mmf..[/say]")

		saynn("She laps at your slit once, as if testing.. before another slow lick drags from your entrance up to your clit. Her cyan tongue has such a great texture, it makes you shiver, your legs giving up a little.")

		saynn("[say=kidlat]Ngh.. hah.. yer real into this..[/say]")

		saynn("Even now, she is trying to stay smug. So you roll your hips again, making her snout press against your mound, covering up her nostrils. She gasps softly, her tongue slipping out again, flicking against your clit.. it makes you let out a silent grunt.")

		saynn("[say=kidlat]Heh..[/say]")

		saynn("She keeps giving you teasing licks.. while you slowly ride her face, enjoying the sensations. The feline doesn't seem to resist much anymore, her own pussy dripping onto the floor.")

		addButton("Faster", "Really grind her face", "do_lick_fast")
	if(state == "do_lick_fast"):
		playAnimation(StageScene.SexOralForced, "lickfast", {pc="pc", npc="kidlat", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("Your shivering and the quiet noises make her smirk again.. so you speed up, proceeding to grind her face harder, forcing her deeper into your soaked needy folds.")

		saynn("[say=kidlat]Mmmph-!..[/say]")

		saynn("She tries to lean back.. but your grip keeps her right where she belongs.. between your legs.")

		saynn("[say=kidlat]Haah.. f-fuckin'.. mmhhph..[/say]")

		saynn("She gets the message.")

		saynn("Her tongue is pressed firmly against your slit now, no longer hesitant. She does slow, deep strokes up and down your dripping pussy with it. The contrast of her rough tongue against your soft, sensitive folds sends more jolts of pleasure through you. Your thighs squeeze slightly around her head.. and she lets out a muffled whine.. but doesn't stop.")

		saynn("[say=kidlat]Mmhh.. tastes.. hh.. nice..[/say]")

		saynn("The way her voice vibrates between your legs adds to the sensations. She adjusts a little, tilting her head just enough to let her tongue prod at your pussy entrance.. and then sliding inside.")

		saynn("Your breath hitches, your inner walls hugging the invading tongue.. tongue that is littered with little barbs all over. Her little brat grin returns. But it feels so good..")

		saynn("She laps at you hungrily now, swirling her tongue inside you before pulling back to flick at your clit a few more times. Slow, lazy strokes are followed by sudden quick licks.. all the while you gently grind her face, making that blindfold on her eyes very wet by now..")

		saynn("She purrs, the vibrations making your whole body shudder. Your fingers tighten against her wrists, pulling her into you.")

		saynn("[say=kidlat]Mmhh~..[/say]")

		saynn("Her tongue works your clit faster, her mouth sealing around you to suck gently before flicking it again. You feel needier and needier.. your hips buck against her face as you are ramping up the grinding again, chasing that pleasure..")

		saynn("[say=kidlat]Mmmmhh.. ngh..[/say]")

		saynn("She lets out a low purring again.. and that's what pushes you over.")

		saynn("Your orgasm slams into you. Your whole body locks up, your legs trembling, thighs clamping around her head as you let out a silent cry, pleasure crashing through in overwhelming waves..")

		saynn("Kidlat doesn't stop.. even as your juices gush onto her tongue, she keeps licking, keeps sucking, keeps devouring every last drop of your release. Her tongue slides inside you again and starts lapping at your pulsating inner walls, extending your peak..")

		addButton("Continue", "See what happens next", "do_lick_after")
	if(state == "do_lick_after"):
		playAnimation(StageScene.SexOralForced, "tease", {pc="pc", npc="kidlat", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("She only pulls away when your grip loosens, her lips shiny, her breath heavy.. just like yours.")

		saynn("Kidlat tilts her head up, grinning breathlessly into the darkness.")

		saynn("[say=kidlat]Fuckin' hell.. haven't had customers like you before.[/say]")

		saynn("You smirk and brush a thumb over her soaked lips.. making her lick them.")

		saynn("Her ears flick, her tail swishes behind her.")

		saynn("[say=kidlat]Tell other junkies I have the best customer service.. wait, don't..[/say]")

		saynn("Licking and sniffing your pussy for so long clearly made her space out a little.")

		saynn("Better stop there.")

		addButton("Continue", "See what happens next", "endthescene")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "do_breed_fuck"):
		processTime(5*60)

	if(_action == "do_breed_fast"):
		processTime(5*60)

	if(_action == "do_breed_inside"):
		processTime(3*60)
		getCharacter("kidlat").cummedInVaginaBy("pc")
		GM.pc.orgasmFrom("kidlat")

	if(_action == "do_breed_pullout"):
		processTime(3*60)
		GM.pc.orgasmFrom("kidlat")

	if(_action == "do_breed_after"):
		processTime(3*60)

	if(_action == "do_bj_sex"):
		processTime(3*60)

	if(_action == "do_bj_fast"):
		processTime(3*60)

	if(_action == "do_bj_throatpie"):
		processTime(3*60)
		getCharacter("kidlat").cummedInMouthBy("pc")
		GM.pc.orgasmFrom("kidlat")

	if(_action == "do_bj_end"):
		processTime(3*60)

	if(_action == "do_lick_sex"):
		processTime(3*60)

	if(_action == "do_lick_fast"):
		processTime(3*60)
		getCharacter("kidlat").cummedInMouthBy("pc", FluidSource.Vagina)
		GM.pc.orgasmFrom("kidlat")

	if(_action == "do_lick_after"):
		processTime(3*60)

	setState(_action)

func saveData():
	var data = .saveData()

	data["didBreed"] = didBreed

	return data

func loadData(data):
	.loadData(data)

	didBreed = SAVE.loadVar(data, "didBreed", false)
