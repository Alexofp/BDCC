extends SceneBase

var isFirst = true
var isStrapon = false

func _init():
	sceneID = "DrugDenKidlat6Scene"

func _run():
	if(state == ""):
		addCharacter("kidlat")
		playAnimation(StageScene.Duo, "stand", {npc="kidlat"})
		var drunkHap = getFlag("DrugDenModule.KidlatDrunkHappened", false)
		if (drunkHap):
			isFirst = false
		else:
			isFirst = true
			setFlag("DrugDenModule.KidlatDrunkHappened", true)
		if (isFirst):
			saynn("The tunnels are as damp and dimly lit as ever.. You navigate the winding paths, stepping over old debris.. when suddenly..")

			saynn("[say=kidlat]Oi, oi, oi..! That you, luv?[/say]")

			saynn("The slurred, sing-songy voice catches your attention..")

			saynn("A few steps ahead, sits Kidlat, her butt resting on some rusted pipe. She seems happy.. but something is off..")

			saynn("[say=kidlat]Hah.. 'bout bloody time someone showed up..[/say]")

			saynn("You approach her.. and see her swaying slightly, ears flicking in lazy motions, eyes half-lidded, unfocused, tail flicking about in slow, wobbly movements.")

			saynn("[say=kidlat]Hai, luv~.[/say]")

			saynn("Her uniform is barely holding together.. some buttons undone, one sleeve slipping off her shoulder, shorts pulled down, barely hiding her bits.")

			saynn("[say=kidlat]Welcome to.. hic.. my humble little shop~.[/say]")

			saynn("Kidlat leans forward, her chin resting on her palm. She gives you a slow, smug smirk while her paw waves over her usual setup.. a cardboard box.. with a few scattered items inside..")

			saynn("Under the pipe that she is sitting at.. you notice a bottle. Yeah.. the smell is unmistakable.")

			saynn("[say=kidlat]Got all sortsa good shite today.. hic.. 'm talkin'.. real premium..[/say]")

			saynn("Her attempt at looking composed seems a bit weak.")

			saynn("Then, as if suddenly remembering something, she gets up and leans in close.. Too close.. almost collapsing even.. Her breath is warm, sweet..")

			saynn("[say=kidlat]But also.. got an extra special offer.. just for you, luv..[/say]")

			saynn("Her voice dips into a purr.. and then swaps to a light giggle. Her paw is trailing her clawed digits up her own arm.. before dragging them down her chest, slipping between the barely buttoned fabric of her uniform.. and cupping her breast underneath.")

			saynn("[say=kidlat]S'me.[/say]")

			saynn("Her bedroom eyes are met with your unsure stare. She leans back and spreads her arms dramatically, her leg shoves the cardboard box away.")

			saynn("[say=kidlat]C'monnnnn.. Will even give you a special price.. hic.. Free!  I'm free to use. Free to fuck~.[/say]")

			saynn("Her grin is utterly shameless, her tail curling playfully behind her, paw letting go of her chest and sliding down into her shorts.. the visible fabric shuffling tells you what she is doing in there.")

			saynn("Kidlat tilts her head slightly, exposing the curve of her neck.. before committing to a stretch.. her chest rises and falls as she reaches high, her body tensing up.. before a cute moan escapes her lips.")

			saynn("[say=kidlat]Ah~.. Watcha waitin' for, luv? Scared this lil' kitty shopkeeper can't handle ya?[/say]")

			saynn("She licks her lips.")

			saynn("[say=kidlat]Pfft.. hic.. nah, I'd be so good for ya. Promise. Jus' gimme a ride, eh? Let me be your lil' plaything for the night~.[/say]")

			saynn("She pulls her shorts down more, teasing you with the sight of her cyan clit.. her digits idly rubbing it.")

			saynn("You feel her eyes lock onto you.. needy.")

			saynn("[say=kidlat]Wellll? You takin' me up on the offer, luv.. or you gonna be a bloody coward?[/say]")

			saynn("She giggles, biting her lip.")

			if (!GM.pc.hasReachablePenis()):
				saynn("[say=kidlat]C'mon.. I even have a cute toy 'ere that you can use..[/say]")

				saynn("Oh yeah, there is a strapon harness in her box. Kitty really came prepared.")

		else:
			# (( Not the first time
			saynn("The tunnels twist and turn as you make your way through, the familiar scent lingering in the air..")

			saynn("Alcohol.")

			saynn("[say=kidlat]Oi, oi.. that you, luv?[/say]")

			saynn("Playful, drunk voice grabs your attention. Yep, there she is.")

			saynn("Kidlat is leaning against a wall, her uniform a mess.. again.. shirt is half-open, shorts riding dangerously low. A half-empty bottle is dangling from her fingers, swaying with lazy movements.")

			saynn("She grins up at you, purring quietly. Looks like Kidlat is drunk.. again.")

			saynn("[say=kidlat]Knew you'd come find me again~.[/say]")

			saynn("She pushes away from the wall, stretching and letting out a cute moan. Then, without hesitation, she slides her free hand between her thighs, rubbing herself right there in front of you.. drunk and horny.")

			saynn("[say=kidlat]I'm open for business again, hun~. Wanna exchange some stuff~?[/say]")

			saynn("She giggles, her cheeks blushing shamelessly.")

			saynn("[say=kidlat]C'mon.. ain't gonna make a lady beg, are ya?[/say]")

			saynn("She bites her lip, her other hand tugging her shorts down just enough to show a glimpse of her cyan clit.")

			if (!GM.pc.hasReachablePenis()):
				saynn("[say=kidlat]C'mon.. I even have a cute toy 'ere that you can use..[/say]")

				saynn("Oh yeah, there is still a strapon harness in her box. Kitty really wants you to use it..")

		addButton("Drunk?", "Ask her why she is drunk", "ask_why_drunk")
		addButton("Sex", "Might as well fuck that horny kitty", "do_sex")
		if (GM.pc.getInventory().getAmountOf("AnaphrodisiacPill") >= 1):
			addButton("Anaphrodisiac", "(Progress story) Feed her a pill that will kill her libido", "give_anaphrodisiac")
		else:
			addDisabledButton("Anaphrodisiac", "(Anaphrodisiac pill missing) Feed her a pill that will kill her libido. She will probably be more willing to answer your questions when not so horny.")
		addButton("Browse shop", "You don't wanna handle this horny kitty", "just_browse_shop")
	if(state == "ask_why_drunk"):
		saynn("[say=pc]Didn't take you for a drinker, Kidlat.[/say]")

		saynn("She snorts, rolling her head back.")

		saynn("[say=kidlat]You're wroooong, buzz kill. I'm not a drinker.. hic. And if you wanna lecture me.. just don't, hun.. I'm way too horny for that.[/say]")

		saynn("Looks like you will need to find a way to kill that libido.. otherwise you won't get any answers.")

		saynn("[say=pc]I just wanna know if you're okay.[/say]")

		saynn("[say=kidlat]I'm thrivin', luv~.[/say]")

		saynn("She stares at you, her eyes still playful, her paw in her shorts, teasing her pussy.. right in front of you.")

		saynn("[say=kidlat]So.. now fuck me~.. or piss off. I ain't in the mood for heart-to-hearts.. only dicks-to-pussies~..[/say]")

		saynn("[say=kidlat]Well.. you can also just buy something before you piss off.. works for me.[/say]")

		addButton("Sex", "Might as well fuck that horny kitty", "do_sex")
		if (GM.pc.getInventory().getAmountOf("AnaphrodisiacPill") >= 1):
			addButton("Anaphrodisiac", "(Progress story) Feed her a pill that will kill her libido", "give_anaphrodisiac")
		else:
			addDisabledButton("Anaphrodisiac", "(Anaphrodisiac pill missing) Feed her a pill that will kill her libido. She will probably be more willing to answer your questions when not so horny.")
		addButton("Browse shop", "You don't wanna handle this horny kitty", "just_browse_shop")
	if(state == "just_browse_shop"):
		saynn("You successfully resist Kidlat's attempts at seducing you.")

		saynn("[say=pc]Can I just.. buy something?[/say]")

		saynn("[say=kidlat]Awww! Sure, I guess.[/say]")

		saynn("She stands behind her cardboard box, still swaying.")

		addButton("Browse", "See what she has to sell", "do_browse")
	if(state == "give_anaphrodisiac"):
		playAnimation(StageScene.Hug, "hug", {npc="kidlat"})
		saynn("You watch as Kidlat sways slightly, a dopey, drunken grin plastered across her face as she teases herself in her shorts. She is practically offering herself to you..")

		saynn("And for a moment.. you consider it.")

		saynn("She is cute, so cute.. all drunk and needy like this.")

		saynn("It doesn't sit right though.. Still, you play along, getting closer to her, your arms embracing the horny kitty.")

		saynn("[say=kidlat]Heh.. finally makin' a move, luv? 'Bout bloody time~..[/say]")

		saynn("Sneakily, you reach into your things and pull out a little pill.. a pill that you put into your mouth.")

		saynn("[say=kidlat]What's that, hunnnn?[/say]")

		saynn("Before she can finish, you gently press your lips together with hers.. and push the pill past her teeth with your tongue. She barely registers what's happening, instinctively swallowing before blinking up at you in confusion.")

		saynn("[say=kidlat]Wha?..[/say]")

		saynn("She shifts slightly, licking her lips. Then.. a flicker of realization.")

		addButton("Continue", "See what happens next", "an_explanation_cuddle")
	if(state == "an_explanation_cuddle"):
		playAnimation(StageScene.Cuddling, "idle", {npc="kidlat"})
		saynn("Her drunken haze doesn't fully disappear.. but the heat in her eyes dims, pretty much gone now. She pulls away from your lips, her shoulders slump, ears droop, no longer held up by lust-driven excitement.")

		saynn("[say=kidlat]Right..[/say]")

		saynn("She lets out a dry sigh and plops down onto her old sitting spot, her arms wrapped around her knees.")

		saynn("[say=kidlat]I see what you did..[/say]")

		saynn("The sad kitty wants to be alone, seemingly. But you just can't see her like this.. so you join her.. and pull her into your warm embrace.")

		saynn("She doesn't argue.. and just lets out another sigh.")

		saynn("For a long moment, there is silence.")

		saynn("Until you decide to break it.")

		saynn("[say=pc]Why are you drinking, Kidlat?[/say]")

		saynn("Probably came out a bit too judge-y for your taste..")

		saynn("[say=pc]I'm just curious.[/say]")

		saynn("That's better. She doesn't answer right away anyway, staring off into the dimly lit tunnels. Her tail escapes from your embrace and flicks lazily against the cold ground.. occasionally brushing against the half-full bottle..")

		saynn("[say=kidlat]Heh.. why not?[/say]")

		saynn("Good question. She is still hugging her knees, looking quite.. vulnerable.")

		saynn("[say=pc]You know how to get it?[/say]")

		saynn("[say=kidlat]Others are selling it. You know.. contraband.. Costs me a pretty penny. Still worth it, in my opinion. Helps with the dark thoughts.[/say]")

		saynn("Some things make more sense now.. Wait.. Looks like you've been helping her to pay for her alcohol.")

		saynn("You could interrogate her. Find out the whole reason.. Order her to quit.. But looking around.. yeah.. Popping a cold one here seems like a dream come true.")

		saynn("[say=kidlat]Look.. it's..[/say]")

		saynn("She hesitates and then shrugs.")

		saynn("[say=kidlat]It helps, alright?[/say]")

		saynn("She leans under the pipe and grabs the bottle.")

		saynn("[say=kidlat]It only happens occasionally that I need it.. Just don't worry, hun.[/say]")

		saynn("[say=pc]What if I do want to worry?[/say]")

		saynn("She smiles, her paw plays with the bottle.")

		saynn("[say=kidlat]Ain't like it matters..[/say]")

		saynn("[say=pc]Matters to me.[/say]")

		saynn("You place your chin on her shoulder and watch the bottle together.")

		saynn("[say=kidlat]Sometimes this dumb cat-shaped thing doesn't understand you..[/say]")

		saynn("[say=pc]I'm just looking after this blue cat-shaped cat.[/say]")

		saynn("She chuckles softly.")

		saynn("[say=kidlat]Yeah, heh.. Who else is gonna sell you random crap, right, hah..[/say]")

		saynn("[say=pc]That's not why I'm here. Not why I gave you that pill. Same for the stolen uniform and the cuffs.[/say]")

		saynn("Her ears perk. But she stays silent for some time.. thinking. She leans forward and looks back at you over her shoulder.")

		saynn("[say=kidlat]Well.. why do all of that then?[/say]")

		saynn("The obvious answer isn't so obvious for her. You don't hesitate.")

		saynn("[say=pc]'Cause I care.[/say]")

		saynn("She stiffens. Just slightly. Her big feline eyes are searching for insincerity in yours.. but they will never find any.. you look as serious as only some can.")

		saynn("[say=kidlat]Heh..[/say]")

		saynn("She looks away, unable to keep eye contact any longer.")

		saynn("[say=kidlat]That's.. real sweet.. luv..[/say]")

		saynn("[say=pc]You don't trust me?[/say]")

		saynn("[say=kidlat]..well..[/say]")

		saynn("She stays silent.")

		saynn("[say=kidlat]It's just that.. I'm a dumb drama queen that sometimes just drinks her problems away. Why would anyone care for me..[/say]")

		saynn("[say=pc]Look at me, Kidlat.[/say]")

		saynn("Her ear perk.. her chin lowers. She plays with the bottle of alcohol in her paw.")

		saynn("[say=pc]Please, just for a bit.[/say]")

		saynn("Slowly, she looks at you again. Her sad eyes are watery.")

		saynn("[say=pc]You are my friend, that's why I care for you. I can't solve all your problems, I have a bunch of my own. And.. At some point we might go our own separate ways, that's just how life works. But while I'm here, I wanna help with what I can.[/say]")

		saynn("She keeps staring into your deep eyes.")

		saynn("[say=pc]Not because you have a nice ass.. even though you totally do..[/say]")

		saynn("A cute smile flashes on her face from your joke. A smile that is so infectious..")

		saynn("[say=pc]Not because you sell me things.. although I'm very grateful for that too.[/say]")

		saynn("Too? Better not focus on it.")

		saynn("[say=pc]I just.. like you.. I wanna see you be happy. Because you're my friend. When you're happy, I also become happier.[/say]")

		saynn("[say=kidlat]A friend? Heh.[/say]")

		saynn("Kidlat seems to be cheering up. That's good.")

		saynn("[say=pc]Maybe a bit more than that, who knows. I'd use the word fuckbuddies but it might be too much.[/say]")

		saynn("You hear a chuckle.. and feel a slight bap of her paw on your nose. Oh yeah, the bottle is on the floor now.")

		saynn("[say=kidlat]I'm just teasing.. Relax, luv..[/say]")

		saynn("[say=pc]We're here together, in this mess. Might as well make the most out of it. Together.[/say]")

		saynn("You end your speech there.. and just stare back at the smiling cat.")

		saynn("[say=kidlat]Well.. I'm happy to be your friend~. Or your fuckbuddy, that sounds fancy, hah.[/say]")

		saynn("Why not.. Fuckbuddies are like buddies.. but better.")

		saynn("[say=kidlat]You help me, I help you. Still sounds transactional.. but you know what.. fuck it, I'm willing to empty my account on this one~.[/say]")

		saynn("[say=pc]I'd be a bit more responsible with your savings. They might just run out at some point.[/say]")

		saynn("[say=kidlat]Hah. I knoo-o-ow.. At some point our paths might diverge. Doesn't stop us from being friends.. or fuckbuddies~.[/say]")

		saynn("[say=pc]Yeah.[/say]")

		saynn("She rubs into you and nuzzles your face.. her purring reverberates through your whole body.")

		saynn("Then she just rests against you, her tail brushing against your legs..")

		saynn("Time slowly draws by.. It is usually quite chilly here.. but you only feel warmness.")

		saynn("Kidlat breaks the silence.")

		saynn("[say=kidlat]This life sucks sometimes.[/say]")

		saynn("You raise a brow.")

		saynn("[say=kidlat]But it sucks less with friends like you~.[/say]")

		saynn("[say=pc]Same for you.[/say]")

		addButton("Continue", "See what happens next", "after_cuddle")
	if(state == "after_cuddle"):
		playAnimation(StageScene.Duo, "stand", {npc="kidlat"})
		saynn("After some time, Kidlat gets up and stretches.")

		saynn("[say=kidlat]Well.. If you wanna buy something, I'm happy to provide, luv. For some reason I get a feeling that I won't need as many credits anymore~.[/say]")

		saynn("[say=pc]They don't hurt though, right?[/say]")

		saynn("[say=kidlat]I will bap you![/say]")

		saynn("You smile and shrug.")

		addButton("Browse", "See what she has to sell", "do_browse_resetshop")
	if(state == "do_vagsex"):
		playAnimation(StageScene.SexLowDoggy, "tease", {pc="pc", npc="kidlat", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		addCharacter("kidlat", ["naked"])
		saynn("She is being quite.. persuasive.. so why not take her up on that great offer.")

		if (!isStrapon):
			saynn("Without an extra word, your hand reaches out to grab her by the collar and bring her drunken form down.. lower and lower.. pretty much pinning her into the floor with her rear stuck up.")

		else:
			saynn("Her eyes shift from side to side as you grab that offered strapon harness from her box and secure it around your waist. Then, without an extra word, your hand reaches out to grab her by the collar and bring her drunken form down.. lower and lower.. pretty much pinning her into the floor with her rear stuck up.")

		saynn("[say=kidlat]Eek.. Such a strong lad..[/say]")

		saynn("[say=pc]Such a cute prey.[/say]")

		saynn("Her drunken fluffy tail finds your forehead.. and misses.. but then tries again and baps you.")

		saynn("[say=kidlat]I'm not cu-u-ute.[/say]")

		saynn("Tail was easy to deal with with a quick tug.. Your hands then swiftly strip her shirt off.. and pull her shorts down, tossing the needless clothing aside.")

		saynn("Underneath you is now a naked body that's trembling with a mix of desire and helplessness, arched in such a way that her slick entrance already meets with your "+str("hardening" if !isStrapon else "new rubber")+" length..")

		addButton("Continue", "See what happens next", "do_vagsex_sex")
	if(state == "do_vagsex_sex"):
		playAnimation(StageScene.SexLowDoggy, "sex", {pc="pc", npc="kidlat", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("A soft, startled moan escapes her as you press forward, the tip of your "+str("{pc.penis}" if !isStrapon else "strapon")+" sliding into her waiting pussy. She gasps as her tight walls envelop you, every inch of "+str("your" if !isStrapon else "that")+" shaft met with a warm, wet flesh. She doesn't seem to resist.. even if you're not exactly being gentle.")

		saynn("[say=kidlat]Ah.. You sure are taking the most out of your special offer..[/say]")

		saynn("One of your hands is pressed into the floor, supporting you.. while the second finds her fluffy neck and wraps its digits around it, just above the collar. A somewhat tight squeeze makes her produce another little gasp.")

		saynn("[say=pc]Is that a problem? I thought you're free to use.[/say]")

		saynn("[say=kidlat]Eek.. This cat-shaped thing is free to use indeed..[/say]")

		saynn("And so you begin a steady, deliberate rhythm, almost forceful, really. Each thrust sends shivers up her spine. Her body quivers against the unyielding concrete as her cyan pussy grips you tighter, inner walls spreading juices along "+str("your cock" if !isStrapon else "that rubber cock")+". Your hand stays on her neck, idly choking her at same time as you're fucking her..")

		saynn("Her breasts, those perfect mounds - complete with a heart-shaped dark spot - slide along the floor from each thrust, her breathing becomes quicker, little moans escaping from her lips more and more.")

		saynn("[say=kidlat]Fuck.. luv.. ah..[/say]")

		addButton("Faster", "Use this kitty for your pleasure", "do_vagsex_sex_fast")
	if(state == "do_vagsex_sex_fast"):
		playAnimation(StageScene.SexLowDoggy, "fast", {pc="pc", npc="kidlat", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("The sound of flesh meeting flesh echoes in the tunnel, mingling with the low hum of emergency lights and Kidlat's pants.. Her hips buck reflexively, meeting yours.. as you adjust your rhythm, increasing the onslaught on her needy pussy.")

		saynn("Your hand still reminds Kidlat of her place.. underneath you.. as your eager fucktoy. She doesn't seem to disagree. Instead, her wet, needy slit keeps squeezing your "+str("cock" if !isStrapon else "shiny shaft")+" with a beat of her heart.. a beat that you can just feel through her neck.")

		saynn("[say=kidlat]Hh..ah.. hh.[/say]")

		saynn("The tip of your"+str(" new" if isStrapon else "")+" cock starts reaching a natural wall inside her, leaving a visible bump on her belly on each thrust. She squirms.. but her body is unable to escape from under you, forced to endure the rough pounding.")

		saynn("And soon, her body convulses, arching even harder as an overwhelming wave of pleasure surges through her. Her pussy clenches tightly around you as a cascade of juices floods the space between you.")

		saynn("[say=kidlat]Nh.. hh-h.. c.. cu..[/say]")

		if (!isStrapon):
			saynn("You feel the explosive rush of her release.. her clenching pussy pushes you further, making you feel your own approaching climax. You don't even realize that you're blocking her from breathing air..")

			addButton("Cum inside", "Breed the drunk kitty", "do_vagsex_inside")
			addButton("Pull out", "Rather not risk it", "do_vagsex_pullout")
		else:
			saynn("You feel the explosive rush of her release.. her clenching pussy making it so the strapon is pushing against your crotch, the friction making you grunt softly.")

			addButton("Pull out", "Enough fun", "do_vagsex_pullout")
	if(state == "do_vagsex_pullout"):
		playAnimation(StageScene.SexLowDoggy, "tease", {pc="pc", npc="kidlat", pcCum=true, bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		if (!isStrapon):
			saynn("You let her inner muscles contract tightly, milking your {pc.penis}.. but as soon as your orgasm begins to overwhelm your senses, you pull out, your throbbing shaft sending your seed flying through the air in beautiful arcs with some of it landing on Kidlat's ass and back and the rest hitting the floor.")

			saynn("[say=pc]Nhh..[/say]")

		else:
			saynn("You let her inner muscles contract tightly, milking that strapon.. but as soon as her orgasm comes to an end, you pull out.")

		saynn("For a long, breathless moment, you both remain stationary like this. Everything else fades away into the background.. dark tunnels, distant echoes, blinking lights.. leaving only the sounds of her body shuffling on the floor, her pulsing pussy that is not yet fully closed..")

		saynn("As you let go of her neck, she starts to hungrily grab air with her mouth.")

		saynn("[say=kidlat]Ah.. fucking hell, luv..[/say]")

		saynn("Her chest is rising and falling in rapid, uneven breaths. Her ass is still stuck up, giving you a great view of her dripping cunt.")

		saynn("[say=kidlat]You've really done me good this time..[/say]")

		saynn("You give that bratty booty a smack, making it jiggle.")

		saynn("[say=kidlat]Ow.. you're damaging the goods..[/say]")

		saynn("[say=pc]You're saying that you're cute and soft and fragile?[/say]")

		saynn("She huffs and baps you with her tail.")

		saynn("[say=kidlat]You silly-y-y..[/say]")

		addButton("Help her up", "You still might want to buy something", "do_sex_helpup")
	if(state == "do_vagsex_inside"):
		playAnimation(StageScene.SexLowDoggy, "inside", {pc="pc", npc="kidlat", pcCum=true, bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("You just let her inner muscles contract tightly, milking your {pc.penis}.. and soon.. a thick, warm creampie begins to fill her waiting depths, your shaft throbbing inside her, pumping her womb full of your {pc.cum} to the brim.")

		saynn("[say=pc]Ngh..[/say]")

		saynn("For a long, breathless moment, you both remain locked in that intense climax. Everything else fades away into the background.. dark tunnels, distant echoes, blinking lights.. leaving only the sounds of her body shuffling on the floor, her stuffed pussy dripping seed..")

		addButton("Pull back", "Enough fucking", "do_vagsex_pullback")
	if(state == "do_vagsex_pullback"):
		playAnimation(StageScene.SexLowDoggy, "tease", {pc="pc", npc="kidlat", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("When you finally pull back, your cock is still pulsing faintly.. just like Kidlat's pussy. As you let go of her neck, she starts to hungrily grab air with her mouth.")

		saynn("[say=kidlat]Ah.. fucking hell, luv..[/say]")

		saynn("Her chest is rising and falling in rapid, uneven breaths. Her ass is still stuck up, giving you a great view of her stuffed dripping cunt.")

		saynn("[say=kidlat]You've really done me good this time..[/say]")

		saynn("You give that bratty booty a smack, making her clench enough for a small spurt of seed to come flying out of her used slit.")

		saynn("[say=kidlat]Ow.. you're damaging the goods..[/say]")

		saynn("[say=pc]You're saying that you're cute and soft and fragile?[/say]")

		saynn("She huffs and baps you with her tail.")

		saynn("[say=kidlat]You silly-y-y..[/say]")

		addButton("Help her up", "You still might want to buy something", "do_sex_helpup")
	if(state == "do_sex_helpup"):
		addCharacter("kidlat")
		playAnimation(StageScene.Duo, "stand", {npc="kidlat"})
		saynn("Kidlat's legs are shaky so you help her to get up.")

		saynn("She looks at you, her hair messy, her eyes satisfied.")

		saynn("[say=kidlat]Meow.. Something else, luv?..[/say]")

		saynn("You stare at her box.")

		saynn("[say=kidlat]Oh, right.. the silly shop..[/say]")

		saynn("She grabs the box and plops it between you and her.")

		saynn("[say=kidlat]Welcome, hun![/say]")

		addButton("Browse", "See what she has to sell", "do_browse")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "do_sex"):
		if(GM.pc.hasReachablePenis()):
			setState("do_vagsex")
		else:
			isStrapon = true
			setState("do_vagsex")
			GM.pc.getInventory().forceEquipStoreOtherUnlessRestraint(GlobalRegistry.createItem("StraponCanine"))
		return

	if(_action == "give_anaphrodisiac"):
		GM.pc.getInventory().removeXOfOrDestroy("AnaphrodisiacPill", 1)

	if(_action == "do_browse"):
		endScene()
		runScene("DrugDenKidlatShopScene")
		return

	if(_action == "after_cuddle"):
		processTime(10*60)
		addMessage("Kidlat will now have better prices. Task updated!")

	if(_action == "do_browse_resetshop"):
		setFlag("DrugDenModule.Kidlat6Hap", true)
		getModule("DrugDenModule").regenerateKidlatItems()
		endScene()
		runScene("DrugDenKidlatShopScene")
		return

	if(_action == "do_vagsex_sex"):
		processTime(5*60)

	if(_action == "do_vagsex_sex_fast"):
		processTime(3*60)

	if(_action == "do_vagsex_inside"):
		processTime(3*60)
		getCharacter("kidlat").cummedInVaginaBy("pc")
		GM.pc.orgasmFrom("kidlat")

	if(_action == "do_vagsex_pullout"):
		processTime(3*60)
		GM.pc.orgasmFrom("kidlat")

	if(_action == "do_vagsex_pullback"):
		processTime(3*60)

	if(_action == "do_sex_helpup"):
		processTime(3*60)
		if(isStrapon):
			GM.pc.removeStrapon()

	setState(_action)

func saveData():
	var data = .saveData()

	data["isFirst"] = isFirst
	data["isStrapon"] = isStrapon

	return data

func loadData(data):
	.loadData(data)

	isFirst = SAVE.loadVar(data, "isFirst", true)
	isStrapon = SAVE.loadVar(data, "isStrapon", false)
