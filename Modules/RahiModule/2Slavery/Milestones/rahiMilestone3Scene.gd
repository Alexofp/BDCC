extends SceneBase

var wasKind = false
var isTrib = false
var usedCondom = false
var condomBroke = false

func _init():
	sceneID = "rahiMilestone3Scene"

func _reactInit():
	if(getFlag("RahiModule.rahiMile2Embraced", false)):
		wasKind = true

func _run():
	if(state == ""):
		addCharacter("rahi")
		playAnimation(StageScene.Duo, "stand", {npc="rahi"})
		if (wasKind):
			saynn("Kitty runs up to you and gives you a short hug before smooching you on the cheek. Seems like your last big conversation helped with kitty's mood. Good.")

			saynn("[say=rahi]Hey.. {rahiMaster}.. Would you like to go rest near the waterfall?[/say]")

			saynn("You can't help but to get reminded of how that one ended last time.")

			saynn("[say=pc]You sure, kitty?[/say]")

			saynn("She nods slightly.")

			saynn("[say=rahi]It will be fun, she promises..[/say]")

		else:
			saynn("Kitty runs up to you and gets on her knees before slipping her head under your palm until you begin to pet her. Seems like making her count the spanks last time made her more willing to obey. Good.")

			saynn("[say=rahi]Hey.. {rahiMaster}.. Sorry for asking.. but.. Would you like to go rest near the waterfall?[/say]")

			saynn("You can't help but to get reminded of how that one ended last time.")

			saynn("[say=pc]You sure, kitty? Last time that you were there I had to enslave you.[/say]")

			saynn("She nods slightly.")

			saynn("[say=rahi]That won't repeat.. promise..[/say]")

		saynn("Well, might as well. Kitty needs to spend more time outside of her cell.")

		addButton("Continue", "See what happens next", "follow_to_the_waterfall")
	if(state == "follow_to_the_waterfall"):
		playAnimation(StageScene.Duo, "stand", {npc="rahi"})
		aimCameraAndSetLocName("yard_firstroom")
		if (wasKind):
			saynn("Kitty produces a meow of surprise as you grab her paw. She instantly lowers her chin and blushes, her tail curling around her leg. Rahi is so cute, you decide to keep holding onto her paw as you step out of the cell and head for the yard area.")

			saynn("You get a few curious gazes from inmates and staff that spot you. They make the kitty get close to you, pretty much rubbing into your shoulder.")

			saynn("[say=pc]Something is wrong kitty?[/say]")

			saynn("[say=rahi]E-Everyone's watching..[/say]")

			saynn("[say=pc]You can let go of my hand if you want.[/say]")

			saynn("She nods but doesn't do that, deciding that this gesture is more important.")

		else:
			saynn("You produce a chain leash and present it to the kitty. She sees it and raises her chin, giving you full access to her collar. You clip the leash and hold the other end in your hand before stepping out of the cell and heading for the yard area.")

			saynn("You get some curious gazes from the inmates and staff, all the strangers' eyes make kitty close distance with you so she can use your {pc.masc} body to hide.")

			saynn("[say=pc]You don't wanna show that you're mine?[/say]")

			saynn("[say=rahi]E-Everyone's watching..[/say]")

			saynn("[say=pc]So? I will protect you.[/say]")

			saynn("She nods and slow downs for a bit, letting the chain be more visible.")

		addButton("Continue", "See what happens next", "arrive_at_waterfall")
	if(state == "arrive_at_waterfall"):
		playAnimation(StageScene.Duo, "sit", {npc="rahi", npcAction="kneel"})
		aimCameraAndSetLocName("yard_waterfall")
		if (wasKind):
			saynn("You arrive at the spot. The waterfall over a concrete blue pond is still there. And it's still just as beautiful. You decide to take a seat on the bench while the kitty stops at a safe distance from the edge of the pond and just sits on her butt.")

			saynn("[say=rahi]The air here.. it's so nice.. Fresh..[/say]")

			saynn("[say=pc]Yeah, it's because there is so much green.[/say]")

			saynn("[say=rahi]Can she get closer to the water, {rahiMaster}?.. She won't jump in, don't worry..[/say]")

			saynn("Her words seem to be genuine. But you saw how well she can lie to you. Either way, you're close enough to stop her if she decides to do something silly again.")

			saynn("[say=pc]I don't see why not, kitty. Just be careful.[/say]")

			saynn("Rahi nods and crawls closer to the edge, making sure to sway her feline hips for you in the process. She sits near the edge and glances at the waterfall, at the spot where she used to hide the bottle. Then she directs her eyes at you.")

			saynn("[say=rahi]You still have that bottle of whiskey, {rahiMaster}?..[/say]")

			saynn("[say=pc]I do, it's in my eternal possession. You're feeling thirsty for alcohol?[/say]")

			saynn("Kitty sighs softly, her eyes becoming sad.")

			saynn("[say=rahi]It's.. yeah, a little bit.. no.. Quite a bit.. But she really wants to quit.. Don't let her swallow a single gulp no matter what..[/say]")

			saynn("Seems like kitty is busy battling herself. You chuckle softly.")

			saynn("[say=pc]I appreciate the permission, kitty. Who knows, I might change my mind.[/say]")

			saynn("Kitty nods and turns her head towards the pond and stares down at the water. The slow waves create all sorts of interesting patterns on the concrete floor. The silence settles, everyone seems to have something they have to think about.")

		else:
			saynn("You arrive at the spot. The waterfall over a concrete blue pond is still there. And it's still just as beautiful. You unclip the leash and decide to take a seat on the bench while the kitty stops at a safe distance from the edge of the pond and just sits on her butt.")

			saynn("[say=rahi]The air here.. it's so nice.. and fresh..[/say]")

			saynn("[say=pc]Sounds like I should take you out for walkies more often.[/say]")

			saynn("[say=rahi]Can she get closer to the water, {rahiMaster}?.. She won't jump in, don't worry.. she.. promises..[/say]")

			saynn("That's the second promise she made in one day. You saw how well she can lie to you. But at least this time you're close enough to stop her if she decides to do something silly again.")

			saynn("[say=pc]Sure, I can allow that. Just don't do things that you will regret later.[/say]")

			saynn("Rahi nods and crawls closer to the edge, making sure to sway her feline hips for you in the process. She sits near the edge and glances at the waterfall, at the spot where she used to hide the bottle. Then she directs her eyes at you.")

			saynn("[say=rahi]You still have that bottle of whiskey, {rahiMaster}?..[/say]")

			saynn("[say=pc]I do. But you better forget about it. Focus on being the best kitty that you can for me.[/say]")

			saynn("Kitty sighs softly, her eyes glance at the floor for a bit. But then kitty offers you a small smile.")

			saynn("[say=rahi]Thank you, {rahiMaster}.. She won't lie, it's really-really hard for her not to think about it.. But she will do her best.. For you and for her..[/say]")

			saynn("Seems like kitty is busy battling herself. You chuckle softly.")

			saynn("[say=pc]Keep it up, kitty. We're not even halfway through it, yet. But I will make sure to guide you,[/say]")

			saynn("Kitty nods and turns her head towards the pond and stares down at the water. The slow waves create all sorts of interesting patterns on the concrete floor. The silence settles, everyone seems to have something they have to think about.")

		addButton("Continue", "See what happens next", "sit_with_kitty_near_water")
	if(state == "sit_with_kitty_near_water"):
		playAnimation(StageScene.Duo, "kneel", {npc="rahi", npcAction="kneel"})
		if (wasKind):
			saynn("You look around. The yard is basically one huge room with a very high ceiling. Seeing all the nature under it feels.. strange. And yet, you got so used to this place that such sights became boring.")

			saynn("You do the best next thing and just approach kitty before sitting near her, your hand lands on her shoulder.")

			saynn("[say=pc]I wonder, kitty..[/say]")

			saynn("She stops gazing at the ways and turns her head towards you.")

			saynn("[say=pc]Would you wanna talk about.. you know.. your father and you. I wanna know what happened.[/say]")

			saynn("Kitty instantly gets sad again, her eyes stare.. just somewhere.. avoiding yours.")

			saynn("[say=rahi]She.. she is very sorry, {rahiMaster}.. She really wishes she could tell you.. But what happened.. it was about the death of Rahi.. She was dead long ago actually.. But that was the moment when she realized that..[/say]")

			saynn("You rub Rahi's shoulder. What she talks about doesn't make much sense to you. But you think that you must support her no matter what.")

			saynn("[say=rahi]She is not talking about the body.. The body is fine, she is controlling it.. But the soul of Rahi.. is dead.. Trying to remember it.. she is afraid it will kill her too.. Because it's all her fault..[/say]")

			saynn("That means there are.. two of Rahi? Or that Rahi shares a body with someone else.. Just thinking about it.. makes you sad too. So you try to cheer the kitty up by pulling her towards you and leaving a little kiss on her cheek.")

			saynn("[say=pc]Let's just.. put that away. I don't wanna make you talk about something that would hurt your mentally, kitty. You won't hear that question again.[/say]")

			saynn("You can hear subtle purring after the kiss, the corners of her mouth raised slightly.")

			saynn("[say=rahi]Meow-meow-meow..[/say]")

			saynn("She focuses on the water again. Her paw.. brushing over the wet surface, the paw beans creating some disturbance. Then she gets more bold and lets the digits sink slightly, getting wet themselves. You can't help but to get fascinated.")

			saynn("[say=pc]Do you like it?[/say]")

			saynn("[say=rahi]It's.. warm.. and nice..[/say]")

			saynn("You chuckle and nuzzle kitty's cheek before whispering into her ear some lewd things.")

			saynn("[say=pc]You're also warm and nice when you're wet~.[/say]")

			saynn("Rahi keeps smiling but she also rolls her eyes. She suddenly slaps the water surface with her palm, sending some water your way and getting you wet. Ohh, the audacity of that cat.")

		else:
			saynn("You look around. The yard is basically one huge room with a very high ceiling. Seeing all the nature under it feels.. strange. And yet, you got so used to this place that such sights became boring.")

			saynn("You do the best next thing and just approach kitty before sitting near her, your hand lands on her shoulder.")

			saynn("[say=pc]I was wondering, kitty.[/say]")

			saynn("She stops gazing at the ways and turns her head towards you.")

			saynn("[say=pc]Would you like to tell me why you began calling yourself kitty? And why are you so afraid of the name Rahi? I'm.. somewhat curious.[/say]")

			saynn("Kitty becomes sad after you ask that, her eyes stare.. just somewhere.. avoiding yours.")

			saynn("[say=rahi]She.. she is very sorry, {rahiMaster}.. She really wishes she could tell you.. But what happened.. it was about the death of Rahi.. She was dead long ago actually.. But that was the moment when she realized that..[/say]")

			saynn("You rub Rahi's shoulder. What she talks about doesn't make much sense to you. Maybe it wasn't the best idea to demand any answers now.")

			saynn("[say=rahi]She is not talking about the body.. The body is fine, she is controlling it.. But the soul of Rahi.. is dead.. Trying to remember it.. she is afraid it will kill her too.. Because it's all her fault..[/say]")

			saynn("That means there are.. two of Rahi? Or that Rahi shares a body with someone else.. Just thinking about it.. makes you sad too. So you try to distract the kitty by grabbing her chin and making her look at you.")

			saynn("[say=pc]I see what you mean, kitty. I will help you forget that. You will be the happiest kitty, serving me and only me.[/say]")

			saynn("You can hear subtle purring coming from her, the corners of her mouth raised slightly.")

			saynn("[say=rahi]Meow-meow-meow..[/say]")

			saynn("As you let go of her chin, she focuses on the water again. Her paw.. brushing over the wet surface, the paw beans creating some disturbance. Then she gets more bold and lets the digits sink slightly, getting wet themselves. You can't help but to get fascinated.")

			saynn("[say=pc]Do you like it?[/say]")

			saynn("[say=rahi]It's.. warm.. and nice..[/say]")

			saynn("You chuckle and nuzzle kitty's cheek before whispering into her ear some lewd things.")

			saynn("[say=pc]You're also warm and nice when you're wet~.[/say]")

			saynn("Rahi keeps smiling but she also rolls her eyes. She suddenly slaps the water surface with her palm, sending some water your way and getting you wet. Ohh, the audacity of that cat.")

		addButton("Splash her!", "That kitty is asking for it", "splash_rahi")
	if(state == "splash_rahi"):
		playAnimation(StageScene.Duo, "kneel", {npc="rahi", npcAction="kneel", bodyState={naked=true}, npcBodyState={naked=true}})
		addCharacter("rahi", ["naked"])
		saynn("If she thinks she can get away with this, she is wrong! You reach for the pond and splash some back at her, getting the feline's uniform wet too. Rahi squints at you, the war is on.")

		saynn("Without much thought she unbuttons her shirt and takes it off, revealing her cute perky tits with pink nipples surrounded by a very short layer of fur. Now that she is not afraid to get her clothes drenched, she violently splashes more water at you!")

		saynn("[say=pc]Trying to prove that I'm right~?[/say]")

		saynn("[say=rahi]She tests if that works for you too![/say]")

		saynn("You try to dodge her splashes and get some good of your own. Rahi seems.. to be enjoying herself. Her eyes.. happy. Wow, you haven't seen that emotion in a while. In the end you both got soaked in water. At least it's warm enough to not be afraid of a cold.")

		saynn("It looks like she is winning, splashing you with water again and again. Time for a big attack that will turn the tides!")

		addButton("Tackle her", "Pin that naughty kitty to the floor", "tackle_kitty")
	if(state == "tackle_kitty"):
		playAnimation(StageScene.SexMissionary, "tease", {npc="rahi", bodyState={naked=true}, npcBodyState={naked=true}})
		saynn("You tackle your kitty, gently pinning her to the floor before getting a hold of her paws and holding them pressed against the gray concrete.")

		saynn("The feline catches eye contact with you and instantly blushes, she is panting deeply, her chest is moving a lot, causing her {rahi.breasts} to bounce up and down seductively.")

		saynn("[say=pc]I think I won, kitty.[/say]")

		saynn("She.. she nods. Rahi gets enough courage to look you in the eyes again.")

		saynn("[say=rahi]You did, {rahiMaster}.. May she.. get a pity prize maybe..[/say]")

		saynn("[say=pc]Oh, I don't know if-[/say]")

		saynn("She suddenly cuts you off by reaching for your lips and leaving a small kiss on them. You raise a brow. After licking your lips for a bit, you decide to return the favor and kiss her back.")

		saynn("But your kiss.. is much more passionate.. and deep. Your hands keep holding Rahi's while your tongue slips past her fangs and does a little dance with hers. She closes her eyes and just lets you be the boss.. You feel her stiff nips poking your chest, brushing against your {pc.breasts}.")

		saynn("After some time, you finally end the kiss and raise your head. There is a visible string of saliva hanging between your and her lips. She finally opens her eyes again.. her gaze couldn't be more lusty.")

		saynn("[say=rahi]Please.. any way you want..[/say]")

		addButtonWithChecks("Vaginal", "Breed her pussy", "start_vaginal", [], [ButtonChecks.HasReachablePenis])
		addButtonWithChecks("Tribadism", "Rub pussies with Rahi", "start_tribadism", [], [ButtonChecks.HasReachableVagina])
		addButton("Eat her out", "Just make that kitty feel good with your mouth", "start_eat_her_out")
	if(state == "start_vaginal"):
		playAnimation(StageScene.SexMissionary, "tease", {npc="rahi", bodyState={naked=true, hard=true}, npcBodyState={naked=true}})
		saynn("Her words.. make you eager already. Your hands stop holding Rahi pinned and instead work on exposing your {pc.penis} and getting it ready, any intimacy in such an open place only ignites the passion in you.")

		saynn("The feline drags her free paws over your {pc.masc} body, caressing your {pc.thick} curves. Her eyes explore every inch of your body, her teeth biting her lip slightly, ears tilting down.")

		saynn("After that, you get closer to her again, your member resting on her crotch while your mouth breathes warmly and gently nibbles her ear.")

		saynn("[say=pc]You're okay with doing it raw, kitty?[/say]")

		saynn("[say=rahi]Y-your choice, {rahiMaster}..[/say]")

		saynn("[say=pc]But what would you want?[/say]")

		saynn("Your questions make kitty all blushy, she just lowers her gaze, secretly eyeing your organ near her drippy sex.")

		addButton("No condom", "Go raw on kitty", "vaginal_no_condom")
		addButtonWithChecks("Use condom", "Put on your best condom", "vaginal_condom", [], [ButtonChecks.HasCondoms])
	if(state == "vaginal_start"):
		playAnimation(StageScene.SexMissionary, "tease", {npc="rahi", bodyState={naked=true, hard=true, condom=usedCondom}, npcBodyState={naked=true}})
		if (usedCondom):
			saynn("You decide to play it safe and produce an unwrapped rubber before masterfully ripping the package open using teeth and then wrapping it around your stiff shaft. Kitty follows your hand motions with great interest, she is only getting more needy with each minute.")

		else:
			saynn("You decide that any rubber is only gonna lead to waste of perfectly fine seed. Instead of putting one on, your hand catches some of your precum and rubs it into Rahi's crotch, causing your scents to mix. She is only getting more needy with each minute.")

		saynn("You can hear the faintest of footsteps, Kitty's ears perk.")

		if (getModule("RahiModule").getSkillScore("rahiSkillExhibit") >= 5):
			saynn("[say=rahi]Someone might see.. That would be so-o hot..[/say]")

			saynn("Seems like training your kitty to be more open to nudity starts to pay off. You offer her a warm smile and a little kiss on the lips.")

		else:
			saynn("[say=rahi]Someone might see..[/say]")

			saynn("[say=pc]That's okay, kitty.[/say]")

			saynn("Your kitty receiving some exhibitionism training might be handy in such situations. You offer her a little warm kiss on the lips to silence her worries.")

		saynn("While your lips are busy with the kiss, your hand starts guiding your stiff member, making its tip rub against Rahi's petals, slightly spreading them in the process. Kitty is audibly breathing, her crotch meets your motions with hers while her legs are spreading more, inviting.")

		saynn("And you take her up on that offer, one little thrust and the tip of your member finds her needy pit of love and spreads the sensitive walls enough to slip inside. Rahi reacts by throwing her head back slightly, breaking the kiss and producing a lusty moan instead.")

		addButton("Continue", "See what happens next", "vaginal_fucking")
	if(state == "vaginal_fucking"):
		playAnimation(StageScene.SexMissionary, "sex", {npc="rahi", bodyState={naked=true, hard=true, condom=usedCondom}, npcBodyState={naked=true}})
		saynn("You start off slow, gently moving your hips, letting the kitty get used to your member and its size while you thrust inside her pussy slit. Kitty is squirming ever so slightly under you, she is so warm on the inside that you have to fight yourself to not just take her now.")

		saynn("Her paws land on your sides, gently brushing over your {pc.masc} curves, your chest, your {pc.breasts}, doing little circles with her claws around your nips. She tries to avoid any contact while you're fucking her, each time your gazes collide she tilts her head down and blushes hard.")

		saynn("[say=rahi]You can be.. r-rougher.. if you want..[/say]")

		if (getModule("RahiModule").getSkillScore("rahiSkillMasochist") >= 5):
			saynn("It's almost like she is begging for it. You're not surprised though, you saw the potential in your kitty when you began training her as a painslut.")

		else:
			saynn("It's almost like she is begging for it. You're not surprised though.")

		saynn("[say=pc]How rough are we talking about, pussy cat.[/say]")

		saynn("She suddenly grabs one of your wrists and moves it up to her neck, just above her bulky collar. Why not, you use one hand for support while this one squeezes the feline's throat ever so slightly, just to make her feel owned.")

		saynn("All the while your lower part of the body picks up the pace, ramming your {pc.penis} down into that needy slit until you feel the natural barricade stopping you, which manifests in a little bump on her belly each time you thrust inside. Kitty parts her lips and starts to pant softly, her paws holding onto your authoritative hand while you use her breeding hole for your pleasure.")

		addButton("Continue", "See what happens next", "vaginal_faster_fuck")
	if(state == "vaginal_faster_fuck"):
		playAnimation(StageScene.SexMissionary, "fast", {npc="rahi", bodyState={naked=true, hard=true, condom=usedCondom}, npcBodyState={naked=true}})
		saynn("[say=rahi]D-don't stop..[/say]")

		saynn("That's not for her to decide, is it? You show your kitty her place but putting more pressure around her throat, your digits digging into her short fur, causing shortness of breath for her. But kitty seems to enjoy it. And her pussy.. she seems to get tighter the less oxygen she has to work with. Fucking her feels so pleasurable when her inner walls are kneading your veiny cock so well, you can't help but to produce a few noises too.")

		saynn("[say=rahi]Ah-h..[/say]")

		saynn("You let the passion take over and start ramming your cock inside her slutty cunt as fast as you can."+str(" Somewhere during all that you hear and feel [b]something snapping[/b] but you didn't pay much attention to it, you were too busy railing your kitty." if condomBroke else "")+" Her drippy stretched slit starts making wet noises. Your member clearly pushes some of her buttons because her body tries to wiggle and squirm more but you're not letting her, instead keeping her pinned to one spot and pounding her pussy roughly, only her "+str("lactating " if getCharacter("rahi").canBeMilked() else "")+" breasts are bouncing for your enjoyment while she shifts back and forth on the concrete.")

		saynn("You were wondering if you should pull out when the kitty suddenly locks her legs around you, pulling you in. Passionate moans try to escape from her throat but they come out muffled and weak. Her stretched needy slit gets extremely tight while squirting girlcum everywhere, kitty is going through her climax while arching her back and leaving scratch marks on yours.")

		addButton("Cum inside", "Might as well", "vaginal_cum_inside")
	if(state == "vaginal_cum_inside"):
		playAnimation(StageScene.SexMissionary, "inside", {npc="rahi", pcCum=true, npcCum=true, bodyState={naked=true, hard=true, condom=usedCondom}, npcBodyState={naked=true}})
		saynn("Her pussy tries to milk your cock so well that your own peak draws close too. And instead of fighting with Rahi's leglock, you decide to lean into it and ram your throbbing dick inside her twitching squirting slit, breaking into her womb before "+str("stuffing the condom full of seed inside her" if (usedCondom && !condomBroke) else "stuffing it full of your seed")+"."+str(" Oops, you didn't even realize that the [b]condom broke[/b] a long time ago and you've been going raw on her all this time." if condomBroke else "")+" You let go of her throat, letting kitty moan loudly while your body shivers and shakes, your balls tensing up while Rahi's slit keeps draining them.")

		saynn("[say=rahi]Ngh-ah-h..[/say]")

		if (!usedCondom):
			saynn("Some {pc.cum} already begins to leak out of her used slit. After the orgasm fades, you pull out of her, leaving her messy pussy to gape, so lewd.")

			saynn("[say=rahi]So much..[/say]")

			saynn("Rahi is proudly showing off the creampie that she has received.")

		elif (condomBroke):
			saynn("Some {pc.cum} already begins to leak out of her used slit. After the orgasm fades, you pull out of her, leaving her messy pussy to gape. Huh? Messy? You look at your member and notice that the tip of the condom has a huge hole in it, the thing didn't protect her and you at all. Rahi notices it too.")

			saynn("[say=rahi]Oh..[/say]")

			saynn("[say=pc]Yeah..[/say]")

			saynn("[say=rahi]It's.. it's.. fine?..[/say]")

			saynn("Maybe, it depends on your expectations. Either way, Rahi is proudly showing off the creampie that she has received.")

		else:
			saynn("Seems like all of your {pc.cum} got neatly stuffed into the condom, you can't spot any leaks. After the orgasm fades, you pull out of Rahi and quickly tie the full condom up before pulling it out of her shiny wet hole too, leaving it to gape.")

			saynn("[say=rahi]So much.. could have been inside her..[/say]")

			saynn("It's not too late to fix that but you decide to be on the safe side. Rahi is still proudly presenting her clean moist pussy that has got a slight reddish tint to it after you railed her so hard.")

		saynn("[say=rahi]T-thank you..[/say]")

		if (wasKind):
			saynn("[say=pc]Of course, kitty.[/say]")

		else:
			saynn("[say=pc]You belong to me, kitty.[/say]")

		saynn("She nods. You both begin to cuddle and rest together.")

		addButton("Continue", "See what happens next", "rahi_takes_a_bath")
	if(state == "start_foreplay"):
		saynn("Right now there is nothing you want more than to make love with Rahi. You lean closer to her body and start covering it with little kisses, starting with her face. The feline is purring and brushing her paws over your back while you continue leaving a smooch after smooch on her cheeks, chin, neck, shoulder.. Then shift yourself lower and leave some on her chest, your tongue doing little circles around Rahi's perky nips before you give each one a kiss too. Kitty is purring louder.")

		saynn("You don't stop there, your tongue latches onto one of Rahi's before you begin licking and sucking on it."+str(" Very soon you begin to feel a taste of her milk in your mouth. It's tasty and lewd so you increase the pressure, slightly squeezing her breasts until you feel her nipple squirting milk directly onto your tongue." if getCharacter("rahi").canBeMilked() else "")+" After giving her lovely breasts some love, you lower yourself even more and reach her belly.")

		saynn("Kitty doesn't know what to do while you give her all these signs of affections, she is just gently brushing your hair with her paw while you keep landing kiss after kiss around her belly button. She probably knows where this is going.")

		saynn("Your drag travels down, over the girl's crotch, until you reach the sensitive bean that is her clit. You wrap your lips around and suck on it while gently flicking with your tongue, making the kitty moan suddenly.")

		saynn("[say=rahi]Ah..[/say]")

		saynn("She is so warm down there, your tongue finishes playing with the clit and brushes against the moist sensitive pussy lips, gathering some of her wetness. Swallowing it makes you quite aroused too..")

		if (isTrib):
			addButton("Continue", "See what happens next", "trib_prepare")
		else:
			addButton("Continue", "See what happens next", "eat_rahi_lick")
	if(state == "trib_prepare"):
		playAnimation(StageScene.SexTribadism, "tease", {npc="rahi", bodyState={naked=true}, npcBodyState={naked=true}})
		saynn("It's time, both you and Rahi seem to be ready. You pull away from her slit and instead bring your lower part closer to hers, your legs interlocking. Kitty meows at you, her pussy lets out a strong scent that makes you eager for more.")

		saynn("You shift yourself closer and closer until your pussies finally kiss. They're both aroused, leading to an exchange of juices. Rahi feels so warm down there..")

		saynn("[say=rahi]You're gonna.. fuck her like this?..[/say]")

		saynn("Her cheeks blushing.")

		saynn("[say=pc]Yes, kitty.[/say]")

		saynn("Enough foreplay, time to make love.")

		addButton("Continue", "See what happens next", "trib_start_grind")
	if(state == "trib_start_grind"):
		playAnimation(StageScene.SexTribadism, "sex", {npc="rahi", bodyState={naked=true}, npcBodyState={naked=true}})
		saynn("You start off slow, moving your hips and grinding your pussy against Rahi's. The most pleasurable part is of course your clit rubbing against each other. The sensations make the feline start producing warm moans for you. And since you're in charge, you can listen to her cute noises and focus on where it feels the best for you and Rahi.")

		if (getModule("RahiModule").getSkillScore("rahiSkillSex") >= 5):
			saynn("She does eventually begin to help you generate these beautiful sensations by meeting your hips motions with hers, amplifying the pleasure. Seems like teaching your kitty some sex skills had a positive effect on her eagerness.")

		saynn("[say=rahi]S-she loves this..[/say]")

		saynn("Your juices combine and create a sizable wet spot under you. One of your hands supports you while the second reaches and grabs one of Rahi's paws. You use to pull Rahi towards you while you grind your slit into hers, increasing the friction. That makes your kitty moan faster, her breathing becoming deep.")

		saynn("You gradually increase the speed of grinding until you begin to feel Rahi's paws and legs shivering. Her needy eyes shine brightly, cheeks are red. You moan together with her but Rahi seems to be very close to her peak, stopping now would be a crime.")

		saynn("[say=pc]You're gonna cum kitty?[/say]")

		saynn("[say=rahi]Y-yes.. S-she really wants to.. from your.. pussy.. against hers.. ah..[/say]")

		saynn("Well, why not let it happen.")

		addButton("Cum", "The pleasure is too strong", "trib_cum_together")
	if(state == "trib_cum_together"):
		playAnimation(StageScene.SexTribadism, "fast", {npc="rahi", pcCum=true, npcCum=true, bodyState={naked=true, hard=true}, npcBodyState={naked=true}})
		saynn("Your motions get more fast and shaky, your pussies grinding quickly bring you and Rahi over the edge, sending both of you into an uncontrollable spiral. Your kitty's body is shivering while she is letting out long passionate noises, her slit is pulsating around yours until it suddenly gushes with a strong stream of girlcum.")

		saynn("Your body and mind joins very soon too, you can't help but to squirm around Rahi's pussy while yours is squirting all over hers too. This sure isn't dry humping, the ecstatic sensations make your mind go blank for a few seconds, you catch yourself drooling at some point.")

		if (GM.pc.hasPenis()):
			saynn("This pussy orgasm drains your balls too, causing your {pc.penis} to shoot out many strings of {pc.cum}, creating quite a mess!")

		saynn("You both keep riding your orgasms out, the constant grinding causes overstimulation to your pussies, making you want to quiver harder.")

		saynn("After you both ride your orgasmic waves, it's time to start calming down..")

		addButton("Continue", "See what happens next", "trib_calming_down")
	if(state == "trib_calming_down"):
		playAnimation(StageScene.SexTribadism, "tease", {npc="rahi", bodyState={naked=true, hard=true}, npcBodyState={naked=true}})
		saynn("You both just.. rest. Lying down on the floor, legs idly rubbing against each other. Kitty is panting heavily, her eyes show that she is.. satisfied beyond belief.")

		saynn("[say=pc]Did you like it, kitty?[/say]")

		saynn("She nods eagerly and lowers her head.")

		saynn("[say=rahi]T-thank you, {rahiMaster}..[/say]")

		if (wasKind):
			saynn("[say=pc]Of course, kitty.[/say]")

		else:
			saynn("[say=pc]You belong to me, kitty.[/say]")

		saynn("She nods. You both begin to cuddle and rest together.")

		addButton("Continue", "See what happens next", "rahi_takes_a_bath")
	if(state == "eat_rahi_lick"):
		saynn("Your hands land on Rahi's thighs and make her spread her legs more, forcing her to give you more access to her pussy. And wow, her aroused scent is so inviting, you can't help but to continue licking the wetness off of her petals and teasing her clit with the tip of your tongue. Rahi is squirming under you, her pussy reacts to your actions by twitching and producing more of her juices.")

		saynn("Your tongue continues to play with her bean while your hand reaches for her petals and spreads them using two digits while two digits between them tease the stretched hole. Rahi keeps making little noises but when you slide two digits inside and start wiggling them inside, occasionally hitting the g-spot, Rahi arches her back and starts to moan louder, her paws holding onto your head, pushing it into her pussy harder.")

		saynn("[say=rahi]Ah-h!.. T-this feels too g-good..[/say]")

		saynn("Your wet digits work on stretching her pussy hole for a bit before you pull them out and replace them with your tongue, easily sliding it past her entering and proceeding to lap at her inner walls. All the while, your big thumb flicks her clit to the sides. Rahi seems to be closing in on her orgasm already, her pussy tries to clench around your organ while you only tongue-fuck her harder.")

		addButton("Continue", "See what happens next", "eat_rahi_cum")
	if(state == "eat_rahi_cum"):
		saynn("Her moans become more passionate, her breathing rapid, her girly thighs closing around your head, trapping you. But you don't mind, you just keep eating her out, thrusting your tongue in and out while occasionally swallowing what wetness you manage to collect.")

		saynn("Very soon Rahi throws her head back and starts actively squirming under you, her pussy clenching around your tongue before suddenly spraying your face with her girlcum, forcing her scent into you.")

		saynn("You don't stop, constantly trying to hammer at Rahi's pleasure spot while she is riding her climax out. Your thumb quickly rubs-rubs her clit until she squirts into your face again, poor kitty is squirming so much you have to apply lots of strength to hold her still.")

		saynn("[say=rahi]F-f-fu-uck..[/say]")

		saynn("A rare occasion where Rahi swears but it's a fitting time for that. When her orgasm fades, the kitty is left panting and moaning softly. She finally relaxes the grip around your head, letting you pull away.")

		saynn("[say=rahi]Oh.. sorry, {rahiMaster}.. She didn't realize..[/say]")

		saynn("You chuckle and lick your lips.")

		saynn("[say=rahi]T-thank you..[/say]")

		saynn("Speaking is a bit hard since your jaw and tongue are kinda tired.")

		if (wasKind):
			saynn("[say=pc]Of course, kitty.[/say]")

		else:
			saynn("[say=pc]You belong to me, kitty.[/say]")

		saynn("She nods. You both begin to cuddle and rest together.")

		addButton("Continue", "See what happens next", "rahi_takes_a_bath")
	if(state == "rahi_takes_a_bath"):
		playAnimation(StageScene.Duo, "sit", {npc="rahi", npcBodyState={naked=true}})
		saynn("Some time passes. You sit on the bench again and just think about stuff, waiting for your kitty to be ready.")

		saynn("Rahi is sitting on the actual edge of the pond, her legs submerged under the warm water. That wasn't enough for her it seems because she suddenly gets into the pond. It's not too deep, kitty can comfortably stand in it. Huh. You give her a look of surprise.")

		saynn("[say=rahi]Meow?.. Kitty just needed a wash after what we did.. She is too lazy to go to the shower..[/say]")

		saynn("Fair enough. You just sit and watch her brushing her paws over her girly curves, making sure to go over her breasts, butt and crotch. Her smart tail swishes under the water slightly.")

		saynn("After being done, she climbs out of the pond and shakes her legs and arms to try and get at least some water off.")

		saynn("[say=rahi]She will wait here until her fur dries enough to put on clothes.. You can go.. probably?..[/say]")

		saynn("You nod.")

		saynn("[say=pc]I will wait.[/say]")

		saynn("She smiles and sits near you, water dripping off of her.")

		addButton("Continue", "See what happens next", "bring_rahi_back")
	if(state == "bring_rahi_back"):
		playAnimation(StageScene.Duo, "stand", {npc="rahi"})
		aimCameraAndSetLocName("cellblock_orange_nearcell")
		if (wasKind):
			saynn("You spend some time together and then return back to her cell.")

		else:
			saynn("You spend some time together and then return back to her cell. You make sure to keep your kitty on a leash while doing so.")

		addButton("Continue", "See what happens next", "endthescene")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "follow_to_the_waterfall"):
		processTime(6*60)

	if(_action == "arrive_at_waterfall"):
		processTime(6*60)

	if(_action == "sit_with_kitty_near_water"):
		processTime(5*60)

	if(_action == "splash_rahi"):
		processTime(6*60)

	if(_action == "tackle_kitty"):
		processTime(5*60)

	if(_action == "start_tribadism"):
		setState("start_foreplay")
		isTrib = true
		return

	if(_action == "start_eat_her_out"):
		setState("start_foreplay")
		isTrib = false
		return

	if(_action == "vaginal_no_condom"):
		usedCondom = false
		setState("vaginal_start")
		return

	if(_action == "vaginal_condom"):
		usedCondom = true
		var chance = GM.pc.useBestCondom()
		condomBroke = GM.pc.shouldCondomBreakWhenFucking("rahi", chance)
		setState("vaginal_start")
		return

	if(_action == "vaginal_fucking"):
		processTime(5*60)

	if(_action == "vaginal_faster_fuck"):
		processTime(5*60)

	if(_action == "vaginal_cum_inside"):
		processTime(5*60)
		if(!usedCondom || condomBroke):
			getCharacter("rahi").cummedInVaginaByAdvanced("pc", {condomBroke=condomBroke})
		else:
			addFilledCondomToLootIfPerk(getCharacter("pc").createFilledCondom())
		GM.pc.addSkillExperience(Skill.SexSlave, 30)
		GM.pc.orgasmFrom("rahi")

	if(_action == "rahi_takes_a_bath"):
		processTime(30*60)
		getCharacter("rahi").afterTakingAShower()

	if(_action == "trib_prepare"):
		processTime(5*60)

	if(_action == "eat_rahi_lick"):
		processTime(5*60)

	if(_action == "trib_start_grind"):
		processTime(3*60)

	if(_action == "trib_cum_together"):
		processTime(5*60)
		GM.pc.rubsVaginasWith("rahi")
		GM.pc.orgasmFrom("rahi")
		GM.pc.cummedOnBy("rahi", FluidSource.Vagina)
		getCharacter("rahi").cummedOnBy("pc", FluidSource.Vagina)
		GM.pc.addSkillExperience(Skill.SexSlave, 30)

	if(_action == "trib_calming_down"):
		processTime(10*60)

	if(_action == "eat_rahi_cum"):
		processTime(5*60)
		getCharacter("rahi").cummedOnBy("rahi", FluidSource.Vagina, 0.2)
		GM.pc.cummedOnBy("rahi", FluidSource.Vagina, 0.3)
		GM.pc.cummedInMouthBy("rahi", FluidSource.Vagina, 0.4)
		GM.pc.addSkillExperience(Skill.SexSlave, 30)

	if(_action == "bring_rahi_back"):
		processTime(10*60)

	setState(_action)

func saveData():
	var data = .saveData()

	data["wasKind"] = wasKind
	data["isTrib"] = isTrib
	data["usedCondom"] = usedCondom
	data["condomBroke"] = condomBroke

	return data

func loadData(data):
	.loadData(data)

	wasKind = SAVE.loadVar(data, "wasKind", false)
	isTrib = SAVE.loadVar(data, "isTrib", false)
	usedCondom = SAVE.loadVar(data, "usedCondom", false)
	condomBroke = SAVE.loadVar(data, "condomBroke", false)

func getDevCommentary():
	return "This scene is just.. light at the end of the tunnel. It's that glimpse of hope that makes us keep going.. You can be happy even in a shitty situation.."

func hasDevCommentary():
	return true
