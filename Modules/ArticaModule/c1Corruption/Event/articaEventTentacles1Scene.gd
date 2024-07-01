extends SceneBase

var isNaked = false
var isCaged = false
var corruption = 0.0
var isSlut = false
var isVerySlut = false
var isLusty = false
var nakedAndShy = false

func _init():
	sceneID = "articaEventTentacles1Scene"

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
		aimCameraAndSetLocName("yard_vaulthere")
		saynn("Looks like Artica wants to just have a nice walk through the yard area.")

		saynn("She follows the stone pathways while breathing in all the air."+str(" Her paws are covering her private bits from any random onlookers.. trying to." if nakedAndShy else "")+"")

		saynn("You just follow the fluff while staying a fair distance away, being curious about her sudden eagerness for adventures. She didn't want to leave the canteen for quite a while after all..")

		saynn("Artica peeks her head into the gym.. and sees a bunch of dudes and gals working out.. something that she doesn't seem to have much interest in.")

		saynn("That second floor though.. Artica keeps looking towards the staff-only area of this yard.. the greenhouses are making her quite curious for some reason. Is she hungry?")

		saynn("She walks into the dead-end that is the closest to them. The greenhouses themselves are on a raised platform.. one that she is clearly unable to climb. She is trying though, jumping as high as she can and trying to at least see what's out there.")

		saynn("After some fruitless attempts, Artica stops.. and sighs. She seems to be ready to give up and return to her spot.")

		addButton("Follow", "See what will happen next", "artica_near_stairs")
	if(state == "artica_near_stairs"):
		aimCameraAndSetLocName("yard_nearstairs")
		playAnimation(StageScene.Solo, "walk", {pc="artica"})
		saynn("While walking back to her spot, Artica notices a.. secret passage of sorts. Hidden behind some tall green bushes, they are.. stairs.. heading directly to where Artica wanted to get to! They seem to be clearly marked as off-limits for inmates though.")

		saynn("Artica stops.. and starts thinking. She is probably deliberating if it is worth it to break the rules.. just to satisfy her curiosity.")

		addButton("Continue", "See what happens next", "sudden_nova")
	if(state == "sudden_nova"):
		addCharacter("nova")
		playAnimation(StageScene.Duo, "stand", {pc="artica", npc="nova"})
		saynn("[say=nova]Thinking about stealing something~?[/say]")

		if (isNaked):
			saynn("Artica jumps when a guard approaches from behind."+str(" Her paws momentarily spot covering her private bits, exposing her hard cyan cock to their gaze.." if nakedAndShy else " Her exposed hard cock is bouncing up and down as she does it..")+"")

		else:
			saynn("Artica jumps when a guard approaches from behind. The guard's eyes quickly take note of Artica's bulging shorts..")

		saynn("[say=artica]Eek!..[/say]")

		saynn("[say=nova]Ohh~. Is someone really that horny for apples?[/say]")

		saynn("[say=artica].. ..[/say]")

		saynn("When not startled, Artica is talking so quietly.. You can't hear a word that she is saying to the husky.")

		saynn("[say=nova]Not just apples, yeah. But, you know, the other plants that they grow in there are quite.. let's say.. exotic. Why are you so curious?[/say]")

		saynn("Artica blinks many times, her cheeks flush.")

		saynn("[say=artica].. .. .. ..[/say]")

		saynn("[say=nova]No idea, I'm just guarding this place. Your best bet would be asking someone in medbay, they make medicine out of some of them.[/say]")

		saynn("Artica nods subtly.")

		saynn("[say=artica].. ..[/say]")

		saynn("[say=nova]Maybe you want a tour? I will have to strip-search you after though, to make sure you didn't steal anything~.[/say]")

		saynn("The girl's cheek blush deeply. The guard closes the distance and smiles kindly.")

		saynn("[say=nova]C'mon.. I don't bite~. Only if you will beg me to mark you~.[/say]")

		saynn("Artica lowers her gaze.")

		saynn("[say=artica].. ..[/say]")

		saynn("[say=nova]Aww~. Well, go ahead then, cutie, I'm not holding you. But if you ever want me to help satisfy that need of yours..[/say]")

		saynn("The guard winks.")

		saynn("[say=artica]..[/say]")

		saynn("[say=nova]Hehe~.[/say]")

		saynn("Artica nods and starts heading away, towards the main elevator it seems. She really is exploring.")

		addButton("Follow", "See what happens next", "in_medical")
	if(state == "in_medical"):
		removeCharacter("nova")
		addCharacter("eliza")
		playAnimation(StageScene.Duo, "stand", {pc="artica", npc="eliza"})
		aimCameraAndSetLocName("med_lobby_start")
		saynn("You obviously can't ride the same elevator as Artica.. so you just wait and take the next one..")

		saynn("As you sneakily enter the medical lobby and sit on one of the benches, you see Artica in the middle of chatting with a feline doctor. Whatever her desire is, it seems to be enough to push the fluff out of her comfort zone and start talking with people."+str(" Even while naked.." if isNaked else "")+"")

		saynn("[say=artica].. ..[/say]")

		saynn("But she is still talking quietly..")

		saynn("[say=eliza]I'd love to help you, really. I just don't think I can, my hands are tied on this one. Damn bureaucracy.[/say]")

		saynn("Artica looks sad, she lowers her gaze and starts stroking her tail.")

		saynn("[say=eliza]Actually.. I think there is something that we can do.[/say]")

		saynn("The doctor grabs her datapad and pulls Artica to the side, away from everyone, before showing her something. You're sitting too far to see it..")

		saynn("[say=eliza]See this plant? They're not letting me anywhere close to it. And I think I know why! Its molecular structure can be a base for a very potent artificial fertilizer.. among some other things.. Think you can bring it to me?[/say]")

		saynn("[say=artica].. .. ..?[/say]")

		saynn("Doctor shrugs and scratches behind her ear.")

		saynn("[say=eliza]I mean.. if you put it like, of course it sounds bad. But it's for science![/say]")

		saynn("The feline smiles.")

		saynn("[say=eliza]Bring it to me.. and I think I can help you~.[/say]")

		saynn("Artica nods.. reluctantly.. and heads back into the elevator.")

		saynn("Interesting.. Looks like Artica is on a mission now.")

		addButton("Follow", "See what she will do", "artica_near_stairs_again")
	if(state == "artica_near_stairs_again"):
		removeCharacter("eliza")
		playAnimation(StageScene.Solo, "walk", {pc="artica"})
		aimCameraAndSetLocName("yard_nearstairs")
		saynn("You follow the girl as she heads back to the yard area.. to that half-secret passage to the higher floor.")

		saynn("At first, she just looks around to make sure no one sees her. Not very successfully as you manage to avoid her gaze just fine. But oh well.")

		saynn("After that, she starts sneaking up those stairs, careful to avoid any obvious danger..")

		saynn("With nothing better to do, you decide to crouch and follow the fluff's steps.. As a guardian of sorts.")

		addButton("Follow", "See what happens next", "artica_sneaks")
	if(state == "artica_sneaks"):
		playAnimation(StageScene.Solo, "crawl", {pc="artica"})
		aimCameraAndSetLocName("green_chokepoint")
		saynn("Despite how shy and nervous the girl can sometimes be, she is not silly. Artica is avoiding any patrols with ease, preemptively peeking only her head out and choosing the route that is the least guarded.")

		saynn("You follow her, but stay a few obstacles behind to not spook her. The route she is taking is quite smart..")

		saynn("Soon enough, she reaches the greenhouses! But, first, she has to pass through a choke point of sorts.. a corridor that has no way around it.. and there is a guard, of course..")

		saynn("Artica hides some metal crates.. and awaits patiently.")

		saynn("She is out of luck though, nothing seems to be changing, the guard is still blocking the only path.")

		saynn("For some reason Artica looks straight up at a ceiling.. and then suddenly produces a high-pitched chirp.. that sounds a lot like birds chirping..")

		saynn("[sayMale]Huh? Is someone here?[/sayMale]")

		saynn("Artica chirps again, the loud noise echoes around the whole yard.")

		saynn("[sayMale]Who is doing that.. The heck..[/sayMale]")

		saynn("The confused guard turns towards the lower level.. and starts looking closely. While he is busy with that, Artica gets on all fours and quickly crawls past him into one of the greenhouses!")

		saynn("You are fast to follow..")

		addButton("Greenhouses", "See what she will do", "artica_takes_plant")
	if(state == "artica_takes_plant"):
		aimCameraAndSetLocName("main_greenhouses")
		playAnimation(StageScene.Solo, "stand", {pc="artica"})
		saynn("You look inside and notice Artica searching for something. There are many trays with various plants here and the girl is going through all of them, searching for the one she needs..")

		saynn("Artica's gaze stops on a particular small one. She quickly grabs and stores it.")

		saynn("But just before she can leave..")

		saynn("[say=nova]Ohh, look who's back already~.[/say]")

		addButton("Continue", "See what happens next", "nova_catches_artica")
	if(state == "nova_catches_artica"):
		addCharacter("nova")
		playAnimation(StageScene.Duo, "stand", {pc="artica", npc="nova"})
		saynn("That guard stands near the entrance, blocking the only exit for Artica. You manage to stay unseen, hiding behind some trays.")

		saynn("[say=artica]Eep..[/say]")

		saynn("[say=nova]Somehow I knew I'd find you here~. Got lost, sweetie?[/say]")

		saynn(""+str("Naked Artica shrugs and covers her privates" if isNaked else "Artica shrugs")+", her legs shaking a little.")

		saynn("[say=nova]So.. what are we gonna do with you? I guess you can start by emptying your pockets..[/say]")

		saynn("The guard starts slowly approaching the girl, each loud step of her armored boots makes Artica get smaller and smaller.. Until she gives up and shows the flower that she took.")

		saynn("[say=artica].. .. ..[/say]")

		saynn("[say=nova]Really, huh~? You love flowers that much~? Never would have guessed.[/say]")

		saynn("[say=artica]..[/say]")

		saynn("Artica carefully puts the colorful plant on the floor and steps back. The guard smiles and licks her lips, still advancing.")

		saynn("[say=nova]Somehow I doubt that you came here because of your love of flowers~. You will have to show me.. everything that's you've got, cutie pie.[/say]")

		saynn("Poor Artica is shivering, her eyes opened wide."+str(" For some reason her state of fear isn't affecting her arousal, the girl is hard as a rock.." if isNaked else " For some reason her state of fear isn't affecting her arousal, the girl's shorts are bulging..")+"")

		addButton("Just watch", "(Corruption) Let Nova grope Artica during a strip-search..", "let_nova_fun")
		addButton("Fight Nova", "Let yourself be known", "fight_nova")
		addButton("Psst..", "Try to distract the husky enough to make a fast escape. You will have to come back for the plant some other time..", "psst_husky")
	if(state == "fight_nova"):
		playAnimation(StageScene.Duo, "shove", {npc="nova", npcAction="hurt"})
		saynn("You're not gonna let that guard bully Artica, with a swift dash you shove the husky away from your fluff.. both of them seem quite surprised.")

		saynn("[say=artica]Ah![/say]")

		saynn("[say=nova]Agh.. Wow, where did you come from?[/say]")

		saynn("Nova switches her full attention to you.")

		saynn("[say=nova]Are you her guardian angel~? I'm the real Angel here though~.[/say]")

		saynn("She reaches for her stun baton.. While Artica just hugs the wall behind her, blinking lots.")

		saynn("Time for a fight!")

		addButton("Fight", "Start the fight", "start_fight")
	if(state == "won_nova"):
		playAnimation(StageScene.Duo, "stand", {npc="nova", npcAction="defeat"})
		saynn("Defeated, Nova drops to her knees before you.")

		saynn("[say=nova]Agh..[/say]")

		saynn("Artica quickly runs up to you.")

		saynn("[say=artica]How d-did you..[/say]")

		saynn("[say=pc]I steal from here too, you know.[/say]")

		saynn("[say=artica]Oh..[/say]")

		saynn("Nova smiles seeing you two together.")

		saynn("[say=nova]You two.. are adorable.[/say]")

		saynn("[say=pc]Uh huh.[/say]")

		saynn("You whisper to Artica to go grab whatever she needs. The girl quickly picks up the flower that she dropped when surrendering to Nova and returns to you.")

		saynn("[say=artica]G-got it..[/say]")

		saynn("While the husky is still busy recovering, you just grab Artica's hand and run away before any more guards show up!")

		saynn("[say=nova]Not even a goodbye kiss..[/say]")

		addButton("Run", "Leave fast", "won_runaway")
		addButton("Goodbye kiss", "Just because she is asking..", "meme_kiss")
	if(state == "meme_kiss"):
		playAnimation(StageScene.Hug, "kiss", {pc="pc", npc="nova"})
		saynn("You stop dead in your tracks.. and return to Nova.")

		saynn("With a stern gaze, you help her to get up.. before pulling into a tight hug, your lips colliding with hers, delivering a long passionate kiss, your tongue sneaking into her maw and swirling around hers.")

		saynn("Artica just stands and blinks a lot, her maw opened wide.")

		saynn("By the end of it, Nova's gaze becomes spaced out..")

		saynn("[say=pc]There you go. A small goodbye kiss.[/say]")

		saynn("[say=nova]W-wow..[/say]")

		saynn("You grab Artica's hand and run away.. for real this time..")

		addButton("Run", "Leave fast", "won_runaway")
	if(state == "won_runaway"):
		setFlag("ArticaModule.nextReaction", "t1won")
		removeCharacter("nova")
		playAnimation(StageScene.Duo, "stand", {npc="artica"})
		aimCameraAndSetLocName("yard_vaulthere")
		GM.pc.setLocation("yard_vaulthere")
		saynn("You and Artica vault over one of the railing, ending up in the lush yard area.")

		saynn("[say=artica]Thank y-you.. I n-need that flower to.. um..[/say]")

		saynn("[say=pc]You don't have to tell me, Artica. It's yours.[/say]")

		saynn("She nods and chrrrrs quietly.")

		saynn("[say=artica]You're so nice.. I will s-see you around..[/say]")

		saynn("After that, the girl walks towards her spot. Seeing how lusty she is still, she will probably go back to that doctor soon..")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "lost_nova"):
		setFlag("ArticaModule.nextReaction", "t1lost")
		playAnimation(StageScene.Duo, "defeat", {npc="nova"})
		saynn("Defeated, you drop to your knees before the guard.. Artica gasps and rushes to you, trying to help you.")

		saynn("[say=nova]Aww.. Now you're making me feel bad.[/say]")

		saynn("[say=artica]Are you o-okay?..[/say]")

		saynn("[say=pc]Yeah, sorry, I couldn't do it.[/say]")

		saynn("Nova frowns.")

		saynn("[say=nova]Sorry I couldn't help you steal? You two deserve to be punished for being here.[/say]")

		saynn("[say=artica]It's ok-kay.. I can g-go work in the mines again if that's n-needed..[/say]")

		saynn("The guard's expression softens.")

		saynn("[say=nova]Aww.. Whatever. Leave, you two. Before I changed my mind.[/say]")

		addButton("Leave", "Run while you can!", "lose_nova_run")
	if(state == "lose_nova_run"):
		removeCharacter("nova")
		playAnimation(StageScene.Duo, "stand", {npc="artica"})
		aimCameraAndSetLocName("yard_vaulthere")
		GM.pc.setLocation("yard_vaulthere")
		saynn("You grab Artica's hand and rush out of the greenhouses before leaping over one the railings to avoid other guards.")

		saynn("[say=artica]T-thank you.. H-h-how did you..[/say]")

		saynn("[say=pc]I steal from there too.[/say]")

		saynn("[say=artica]Oh..[/say]")

		saynn("Artica lowers her gaze, realizing something.")

		saynn("[say=artica]I.. d-dropped it there..[/say]")

		saynn("[say=pc]It's okay. Maybe I can help?[/say]")

		saynn("She shrugs.")

		saynn("Looks like you will have to get back there some other time and steal that flower yourself.")

		saynn("[say=artica]I'm not a g-good thief.. I w-will be at my spot..[/say]")

		saynn("You nod and let her go.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "psst_husky"):
		setFlag("ArticaModule.nextReaction", "t1ran")
		playAnimation(StageScene.Duo, "stand", {npc="artica"})
		saynn("Maybe you can try to distract the husky the same way Artica distracted that other guard..")

		saynn("[say=pc]Psst..[/say]")

		saynn("Nova stops, her ears perk.. just like the fluff's.")

		saynn("[say=nova]Gonna play nice I.. what was that?[/say]")

		saynn("You change your hiding spot, hiding behind a different tray while Nova is checking where the noise is coming from.")

		saynn("[say=pc]Psst..[/say]")

		saynn("Only Artica notices you this time, her eyes look surprised. You try to make her come to you, speaking quietly.")

		saynn("[say=pc]..let's go, c'mon..[/say]")

		saynn("Hearing Artica's hind paws tippy-toe along the floor tiles makes Nova go into alert mode instantly.")

		saynn("[say=nova]Hey![/say]")

		saynn("The guard notices you too.. so you quickly get up and grab Artica's hand before pulling her towards the exit.")

		saynn("[say=nova]Come back here, right now![/say]")

		addButton("Run!", "Time to leave", "after_escape")
	if(state == "after_escape"):
		removeCharacter("nova")
		aimCameraAndSetLocName("yard_vaulthere")
		GM.pc.setLocation("yard_vaulthere")
		saynn("You rush out of the greenhouses and leap over the first railing that you see. It's a little high.. but luckily you manage to land on some soft grass.")

		saynn("Nova tries to catch you.. but she quickly loses track, running the wrong direction.")

		saynn("Artica is panting.")

		saynn("[say=artica]Wow.. ah.. hah.. how d-did you..[/say]")

		saynn("[say=pc]I steal from there occasionally too.[/say]")

		saynn("She nods.. and then lowers her gaze, realizing something.")

		saynn("[say=artica]Oh yeah.. Sadly, I d-didn't keep anything.. t-thank you for saving me though..[/say]")

		saynn("Looks like you will have to come back there and get her the required plant yourself. At least you know how it looks now!")

		saynn("[say=artica]I g-guess I will return back to my spot..[/say]")

		saynn("You nod and notice that she is still aroused.. the fear that she experienced didn't extinguish her desire at all.")

		saynn("[say=pc]Take care.[/say]")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "let_nova_fun"):
		setFlag("ArticaModule.nextReaction", "t1bully")
		playAnimation(StageScene.SexStanding, "tease", {pc="nova", npc="artica", npcBodyState={naked=true, hard=true}})
		addCharacter("artica", ["naked"])
		saynn("You decide to stay and see how this scene will unravel itself. Maybe you will get a chance to get that plant that Artica needs..")

		saynn("[say=nova]Gonna play nice I hope~?[/say]")

		if (!isNaked):
			saynn("Without much effort, Nova makes Artica lean against one of the walls with her hands positioned high.")

			saynn("[say=nova]Good. Be an obedient girl for me and stay still while I do this.[/say]")

			saynn("The husky puts her paws all over Artica's lilac uniform, searching for anything that's poking out too much.. And obviously finding some.. but nothing criminal.")

			saynn("[say=nova]Hmm.. No contraband. Will have to strip-search you though to make sure that you're clean~.[/say]")

			saynn("[say=artica]Eep..[/say]")

			saynn("With some fast paws, Nova unbuttons Artica's shirt and makes her take it off, exposing Artica's {artica.breasts}.")

			saynn("[say=nova]Cute~.[/say]")

			saynn("Then, she presses Artica against the wall again and pulls down her shorts this time, exposing her tight tailhole that's covered up by her tail.. and also her aroused slit and her "+str("locked away member" if isCaged else "hard dripping member")+"..")

			if (isCaged):
				saynn("[say=nova]Someone caged you? That is adorable.[/say]")

			else:
				saynn("[say=nova]A herm.. just like me. Interesting~.[/say]")

		else:
			saynn("Without much effort, Nova makes Artica lean against one of the walls with her hands positioned high.")

			saynn("[say=nova]Good. Be an obedient girl for me and stay still while I do this.[/say]")

			saynn("Nova's paws roam around Artica's fur while she is doing a quick visual check, obviously noticing that Artica has both, an aroused slit and a "+str("locked away member" if isCaged else "hard dripping member")+"..")

			if (isCaged):
				saynn("[say=nova]Someone caged you? That is adorable.[/say]")

			else:
				saynn("[say=nova]A herm.. just like me. Interesting~.[/say]")

			saynn("The guard checks Artica's legs and arms too, dragging her palms along their curves.")

			saynn("[say=nova]No contraband. I think I need to do a.. more thorough search.. to make sure~.[/say]")

		saynn("Artica doesn't dare to even move a muscle, the fear makes her freeze up completely.. And Nova sees that.")

		saynn("[say=nova]Aw.. Relax, I won't hurt you~. You should be afraid only if you've been a bad girl that deserves to be punished..[/say]")

		saynn("Doesn't make it much easier for the poor fluff.")

		saynn("Nova's fingers trace the curves of Artica's breasts.. before squeezing them firmly, eliciting a soft gasp from her lips.."+str(" Some breast milk squirts out from her swollen dark nips.." if getCharacter("artica").isLactating() else "")+"")

		if (getCharacter("artica").isLactating()):
			saynn("[say=nova]Such milky breasts you've got there~.[/say]")

		else:
			saynn("[say=nova]Such nice breasts you've got there~.[/say]")

		saynn("With a sly smile on her face, the guard moved lower, her digits following the girl's"+str(" pregnant" if getCharacter("artica").isVisiblyPregnant() else " fluff")+" belly and her sides until she reaches that nice girly butt.")

		var hasCumInHoles = (getCharacter("artica").hasEffect(StatusEffect.HasCumInsideVagina) || getCharacter("artica").hasEffect(StatusEffect.HasCumInsideAnus))
		saynn("Nova kneads Artica's buttcheeks for a bit, removing tension.. before carefully spreading them"+str(", making the fluff's holes leak some of the mess onto her thighs.." if hasCumInHoles else ", making the fluff's tight holes look stretched")+".")

		if (hasCumInHoles):
			saynn("[say=nova]Ohh.. Such a messy girl~. But no contraband.[/say]")

		else:
			saynn("[say=nova]Slick and clean~. No contraband.[/say]")

		saynn("Artica is squirming under Nova's touch, her"+str(" cock pulsing in its small cage" if isCaged else " cock throbbing with need")+" as she is being teased relentlessly. The guard takes note of that..")

		saynn("[say=nova]So needy.. Turn around for me, cutie.[/say]")

		addButton("Continue", "See what happens next", "nova_makes_artica_cum")
	if(state == "nova_makes_artica_cum"):
		playAnimation(StageScene.Grope, "grope", {pc="artica", npc="nova", pcCum=true, bodyState={naked=true, hard=true}})
		saynn("Artica does so, presenting herself to the guard. But when Nova grabs her stun baton, the fluff's eyes go wide again.")

		saynn("[say=artica]..[/say]")

		saynn("[say=nova]This~? I just want to do this..[/say]")

		saynn("The husky squeezes the handle of her weapon, making it zap the air. Seeing that sends waves of fear through Artica, her body squirming more..")

		if (!isCaged):
			saynn("Nova relaxes the grip on the handle and then traces the tip of the baton along Artica's hard cock, making it pulse wildly, her balls tensing up even without any electricity going through them..")

		else:
			saynn("Nova relaxes the grip on the handle and then traces the tip of the baton along Artica's metal chastity cage, making the cock inside pulse wildly, her balls tensing up even without any electricity going through them..")

		saynn("[say=nova]What did you steal, cutie pie?[/say]")

		saynn("[say=artica].. ..!..[/say]")

		saynn("[say=nova]Just the flower, huh..[/say]")

		saynn("Nova holds the weapon a few inches away before squeezing the handle again, making it spark with electricity. Artica gasps and arches her back, "+str("her locked cock putting more pressure on its cage, precum actively leaking from the tip.." if isCaged else "her hard cock throbbing hard, the knot near the base inflating with blood..")+"")

		saynn("[say=artica].. .. ..[/say]")

		saynn("[say=nova]Uh huh~. I hear you~.[/say]")

		saynn("Nova seems to be fascinated by that reaction, she relaxes the grip and brings the baton closer to Artica's pussy instead, the cold tip of her weapon brushing against the wet sensitive folds.")

		saynn("Artica is shivering, her gaze glued to that baton.. And the guard takes full advantage of that, by pretending that she is squeezing the handle.. until Artica suddenly cums!")

		saynn("Almost like from an electrifying jolt, an orgasm takes over her body, her legs shaking as her {artica.penis} erupts in a torrent of hot cum, strings of it flying out far and landing on some of the plants..")

		saynn("[say=artica]N-nya-ah-h..[/say]")

		saynn("Nova is smiling non-stop, watching the embarrassed orgasming girl struggle to contain herself.")

		saynn("[say=nova]Did you just cum from fear alone~?[/say]")

		saynn("She chuckles as Artica's cheek blush deeply.")

		saynn("[say=nova]I'm so impressed, I'm not even sure if I should punish you by this point~. Fine, "+str("grab your clothes and " if !isNaked else "")+"let me show you out.[/say]")

		saynn("Nova clicks a chain to Artica's collar.. before pulling her away. The fluff's eyes track the lonely flower that is left on the floor..")

		addButton("Flower!", "Grab it", "after_nova_grab_flower")
	if(state == "after_nova_grab_flower"):
		removeCharacter("nova")
		removeCharacter("artica")
		playAnimation(StageScene.Solo, "stand")
		GM.pc.setLocation("main_greenhouses")
		saynn("When they walk away, you quickly rush to the flower and pick it up.")

		saynn("Artica will probably be glad to have it.")

		saynn("Time to go though.. before someone spots you here.")

		addButton("Continue", "See what happens next", "endthescene")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "artica_near_stairs"):
		processTime(5*60)

	if(_action == "sudden_nova"):
		processTime(5*60)

	if(_action == "in_medical"):
		processTime(5*60)

	if(_action == "artica_near_stairs_again"):
		processTime(5*60)

	if(_action == "artica_sneaks"):
		processTime(5*60)

	if(_action == "artica_takes_plant"):
		processTime(3*60)

	if(_action == "nova_catches_artica"):
		processTime(3*60)

	if(_action == "start_fight"):
		runScene("FightScene", ["nova"], "novaFight")
		return

	if(_action == "won_runaway"):
		processTime(3*60)

	if(_action == "meme_kiss"):
		processTime(3*60)

	if(_action == "lose_nova_run"):
		processTime(3*60)
		addMessage("You will have to sneak to the greenhouses yourself to steal that plant for Artica")

	if(_action == "after_escape"):
		processTime(3*60)
		addExperienceToPlayer(20)
		addMessage("Steal a plant from the greenhouses to help Artica")

	if(_action == "nova_makes_artica_cum"):
		processTime(3*60)
		getModule("ArticaModule").triggerCorruption(0.05)

	if(_action == "after_nova_grab_flower"):
		processTime(5*60)
		setFlag("ArticaModule.TentaclesPcHasFlower", true)
		addExperienceToPlayer(50)

	setState(_action)

func _react_scene_end(_tag, _result):
	if(_tag == "novaFight"):
		processTime(20 * 60)
		var battlestate = _result[0]
		
		if(battlestate == "win"):
			setState("won_nova")
			addExperienceToPlayer(50)
			setFlag("ArticaModule.TentaclesArticaHasFlower", true)
			getModule("ArticaModule").addCorruption(0.02)
		else:
			setState("lost_nova")
			addExperienceToPlayer(5)

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
