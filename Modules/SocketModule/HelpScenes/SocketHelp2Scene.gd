extends SceneBase

var fuckedPussy = false

func _init():
	sceneID = "SocketHelp2Scene"

func _run():
	if(state == ""):
		addCharacter("socket")
		playAnimation(StageScene.Duo, "stand", {npc="socket"})
		saynn("[say=pc]How is your acclimation going?[/say]")

		saynn("Socket stares into her datapad.")

		saynn("[say=socket]Um.. I need to get to the bathroom.[/say]")

		saynn("[say=pc]Sure, I can wait for you here.[/say]")

		saynn("Socket tilts her head at you.")

		saynn("[say=socket]Not in that way, I need to check the ventilation in the bathroom. Could you please show me where it is?[/say]")

		saynn("Wait..")

		saynn("[say=pc]You don't know where it is? How do you.. pee.. then?[/say]")

		saynn("Socket smiles.")

		saynn("[say=socket]I can show you some other time.[/say]")

		saynn("Oh no. She sees your face deforming from disgust and decides to explain herself.")

		saynn("[say=socket]A device! I can show you a device that helps with that.. not show how I pee..[/say]")

		saynn("That makes it.. slightly better.")

		saynn("[say=socket]Although if you want to see me..[/say]")

		saynn("You grab her hand and pull her towards the lift.")

		saynn("[say=pc]Let's go![/say]")

		addButton("Lift", "Enter it", "bring_socket_lift")
	if(state == "bring_socket_lift"):
		aimCameraAndSetLocName("mining_elevator")
		saynn("You and Socket step into the lift. You press the 'cellblock' button and watch as the room begins to move up with a screech.")

		saynn("[say=socket]Thanks![/say]")

		saynn("[say=pc]Do you really need me though?[/say]")

		saynn("She nods many times.")

		saynn("[say=socket]I used to spend most of my time in cyberspace. There are no.. walls there.. you know?[/say]")

		saynn("Makes sense that she is struggling here now.")

		saynn("[say=pc]What does it look like?[/say]")

		saynn("[say=socket]Cyberspace? It's handmade by people. So it's pretty. It's like a spider web that you can run through! I have some implants that help me do that. Wanna see?[/say]")

		saynn("[say=pc]Sure?[/say]")

		saynn("Suddenly, Socket does a vertical split, raising her leg high and showing you her private bits in great detail.")

		saynn("[say=pc]Uh..[/say]")

		saynn("[say=socket]It's in there![/say]")

		saynn("She casually spreads the petals of her pussy and tries her best to show the depths of it. There is something metal in there.. some kind of.. port.. exactly where her cervix should be.")

		saynn("[say=pc]What's that in your.. womb.[/say]")

		saynn("[say=socket]That's the implant![/say]")

		saynn("Technically.. She is not wrong. It is implanted into her.")

		saynn("[say=pc]Does that mean you can't get pregnant?[/say]")

		saynn("Socket blinks many times.")

		saynn("[say=socket]Probably? Is that a problem?[/say]")

		saynn("You shrug. Socket lowers her leg and stands near.")

		saynn("[say=socket]Most places I worked at prohibit breeding. So it was.. kind of an advantage. Helps against people that really want to stretch the unstretchable too![/say]")

		saynn("Right.. One uncomfortable talk later, the lift finally arrives.")

		addButton("Bathroom", "Show Socket where the bathroom is", "socket_goes_bathroom")
	if(state == "socket_goes_bathroom"):
		aimCameraAndSetLocName("main_bathroom1")
		playAnimation(StageScene.Duo, "stand", {npc="socket", npcAction="crawl"})
		saynn("You walk Socket through the main hall and show her where the closest bathroom is. The door opens automatically, inviting you two in.")

		saynn("[say=socket]Thanks! Now I just need access to the vent.[/say]")

		saynn("Socket begins to follow the walls of the big room, trying to find any covered openings in the walls.")

		saynn("[say=socket]Where is it..[/say]")

		saynn("At some point she gets on all fours and starts crawling around, pushing her head into each corner.")

		saynn("[say=pc]Do you need help or?[/say]")

		saynn("[say=socket]I'm good![/say]")

		saynn("She crawls under the sinks, wiggling her ass a lot in the process.")

		saynn("You notice a panel on one of the walls.. a big metal panel that has an orange trim to it.. a trim that says.. maintenance.. You point at it.")

		saynn("[say=pc]Is that it?[/say]")

		saynn("Socket tilts her head.")

		saynn("[say=socket]Yep![/say]")

		addButton("Continue", "See what happens next", "socket_approaches_vent")
	if(state == "socket_approaches_vent"):
		playAnimation(StageScene.Duo, "stand", {npc="socket", flipNPC=true})
		saynn("Socket gets up and approaches it. She tries to use her access badge to open it.. but the maintenance door only buzzes, the motors inside it spinning loudly and fruitlessly.")

		saynn("[say=pc]Looks like it got stuck.[/say]")

		saynn("[say=socket]Yep! I know what to do.[/say]")

		saynn("Socket fetches a giant wrench from her backpack.. and, with one big swing, hits the door.. bonk!")

		saynn("The wrench bounces off the vent.. but the impact was enough to make something inside it shift and unlock the mechanism. The maintenance door opens, presenting.. a small square vent, slightly above floor..")

		saynn("[say=pc]Is that how you solve problems?[/say]")

		saynn("[say=socket]Yes.[/say]")

		saynn("If it works, it works..")

		saynn("[say=socket]That's not the task though. Need to check something inside.[/say]")

		saynn("Socket sticks her head inside the vent and tries to reach something.")

		addButton("Continue", "See what happens next", "socket_gets_stuck")
	if(state == "socket_gets_stuck"):
		playAnimation(StageScene.SexVent, "tease", {pc="socket", npc="pc"})
		saynn("Socket reaches further and further, trying to poke something that's far away with her wrench.")

		saynn("[say=pc]Don't get stuck in it.[/say]")

		saynn("[say=socket]I won't![/say]")

		saynn("She crawls more and more into it and reaches her wrench out far to tighten some pipe. Seconds later..")

		saynn("[say=socket]I think I'm stuck.[/say]")

		saynn("Indeed. Her wide hips got perfectly squeezed by walls of the vent, making it so she can't get out or crawl further.")

		saynn("Too late to say 'I told you so'. Now you gotta decide what you're gonna do with her..")

		addButton("Help her", "Avoid the temptation and help her", "help_socket")
		addButton("'Help her'", "Pretend to help her", "help_lewd_socket")
	if(state == "help_socket"):
		saynn("Such a silly fennec, got herself stuck like that.")

		saynn("Obviously you're not gonna take advantage of that fluffy butt.. and that cute little squeezed pussy.. and the tight-looking tailhole that she doesn't even try to hide with her tail.")

		saynn("[say=pc]How did you even manage to do that, hold on.[/say]")

		saynn("You squeeze your hands into the space between her hips and the walls of the vent. After that, you proceed to try and pull her out of there..")

		saynn("[say=socket]Whatcha doing..[/say]")

		saynn("[say=pc]Helping you?[/say]")

		saynn("Her fluffy tail tickles your face as you tug on her hips, trying to free them.")

		saynn("[say=socket]Looks like I got myself into quite the situation..[/say]")

		saynn("Your hands slide over her wide curves as you try to grab her from different angles. No matter what you do, it doesn't seem to help.")

		saynn("That tail is getting really annoying though, the fluff getting into your mouth. You pull on it to try to free Socket but you only make her shudder and let out a painful noise, her legs kick you away. Ouch.")

		saynn("[say=socket]Ow! Don't do that![/say]")

		saynn("She is awfully picky for someone who is stuck and needs help.")

		addButton("Just keep helping", "Whatever. You have to get her out of there somehow", "socket_help_actually")
		addButton("Spank her", "Punish her for kicking you", "socket_stuck_spank")
		addButtonWithChecks("Rail her pussy!", "Really punish her for doing this", "socket_rough_pussy", [], [[ButtonChecks.HasReachablePenis]])
		addButtonWithChecks("Rail her ass!", "Really-really punish her for doing this", "socket_rough_ass", [], [[ButtonChecks.HasReachablePenis]])
	if(state == "socket_help_actually"):
		playAnimation(StageScene.Duo, "stand", {npc="socket"})
		saynn("Oh well, you let the annoying tail tickle your chin as you keep pulling on Socket's butt. You pray that someone won't walk in on you because..")

		saynn("[say=nova]Kinky~.[/say]")

		saynn("One of the guards walks past you two.. of course.")

		saynn("[say=socket]Hi-i![/say]")

		saynn("[say=nova]Yes, hai. Don't mind me, carry on.[/say]")

		saynn("One awkward interaction later, you return to it. Your arms are getting tired by now.. just like your lusty eyes are tired of watching that fluffy butt trying to wiggle free.")

		saynn("[say=socket]Oh, I know. My shoulder pads got caught![/say]")

		saynn("Socket lowers her shoulders a bit.. and just casually pulls herself out of the vent, without your help even.")

		saynn("[say=pc]Really?[/say]")

		saynn("Socket shrugs and closes the maintenance door. Makes you feel like you should have punished her for this..")

		saynn("[say=socket]My bad![/say]")

		addButton("Continue", "See what happens next", "unlock_fast_travel")
	if(state == "unlock_fast_travel"):
		GM.pc.setLocation("main_bathroom1")
		saynn("Socket takes a better look at the vent. Then she pulls out her datapad and takes a look at some kind of map.")

		saynn("[say=socket]These vents seem to be all over the prison. Maybe I could overhaul them into a.. a quick transportation system of sorts? I would have to modify each vent and connect them all into a network.. but I think it's doable![/say]")

		saynn("[say=pc]Isn't that a little.. suspicious?[/say]")

		saynn("[say=socket]Suspicious?[/say]")

		saynn("[say=pc]What would staff think if they'd spot me using these?[/say]")

		saynn("Socket hums.")

		saynn("[say=socket]You're right. I guess that limits the list a little. You should be safe if you climb into the one in your cell though![/say]")

		saynn("[say=pc]Sure. Just make sure I won't get stuck in them.[/say]")

		saynn("She giggles and starts jogging away"+str(", her pussy still dripping your seed" if fuckedPussy else "")+".")

		saynn("[say=socket]Thanks by the way! I think I can find a way back.[/say]")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "socket_stuck_spank"):
		playAnimation(StageScene.Duo, "stand", {npc="socket"})
		saynn("You got really frustrated with how she kicked you.. so you return the favor by smacking her naked ass, making it jiggle!")

		saynn("[say=socket]Ouch!..[/say]")

		saynn("Socket jerks from the pain so hard that she manages to accidentally free herself. She hits her butt again as she falls onto the floor.")

		saynn("[say=socket]Ow-w-w..[/say]")

		saynn("[say=pc]Oh, that worked.[/say]")

		saynn("[say=socket]If you'd spank me any harder, you'd be punished right now![/say]")

		saynn("Huh? This girl doesn't seem like the kind that would do that.")

		saynn("[say=pc]My bad. It was you who kicked me.[/say]")

		saynn("Socket gets up and rubs her butt a bit.")

		saynn("[say=socket]Apology accepted![/say]")

		saynn("At least you got her out of there with minimal effort on your side.")

		addButton("Continue", "See what happens next", "unlock_fast_travel")
	if(state == "socket_rough_pussy"):
		playAnimation(StageScene.SexVent, "sex", {pc="socket", npc="pc", npcBodyState={exposedCrotch=true,hard=true}})
		saynn("Fuck it, you're too horny and annoyed not to take advantage of that slut.")

		saynn("You take a spot behind her and get a firm grasp on her ass with one hand while the other holds your hard cock ready, your eyes focussed on her pussy slit that she doesn't even try to hide, displaying it proudly for you.")

		saynn("[say=socket]Ow. How are you gonna pull me out like that?[/say]")

		saynn("Socket doesn't even realize.. but seconds later. You piece her cunt with one rough thrust that sends shivers through her body and makes her gasp. The sudden penetration catches her off-guard, her pussy walls gripping your length tightly!")

		saynn("[say=socket]AH! Hey! Easy!..[/say]")

		saynn("[say=pc]Walking around naked like that.. You're a free use slut now, get used to it.[/say]")

		saynn("You put both of your hands on her hips and start fucking her while she is completely helpless. Socket tries to kick you off again but you just yank on her tail again while shoving your cock deep inside.")

		saynn("[say=socket]Nhh![/say]")

		saynn("She still tries to resist.. but being stuck like that doesn't give her much wiggle room, she is forced to endure your onslaught, her pussy making wet noises as you pound her relentlessly.")

		addButton("Faster", "Use that girl for your pleasure", "socket_rough_pussy_fast")
	if(state == "socket_rough_pussy_fast"):
		playAnimation(StageScene.SexVent, "fast", {pc="socket", npc="pc", npcBodyState={exposedCrotch=true,hard=true}})
		var removedImplant = getFlag("SocketModule.removedWombImplant", false)
		if (!removedImplant):
			saynn("Your hips slap against her butt as you pick up the pace. Whatever Socket has in her womb, it doesn't allow you to penetrate her cervix. But your thrusts are enough to cause a bump on her belly anyway, little desperate moans begin to escape her lips.")

		else:
			saynn("Your hips slap against her butt as you pick up the pace. Your thrusts are enough to cause a bump on her belly, little desperate moans begin to escape her lips.")

		saynn("[say=socket]Huff.. ah..[/say]")

		saynn("She got tired of resisting and just lets you have it your way with her and her cunt, her inner walls are barely wet.")

		saynn("[say=socket]You will pay for it![/say]")

		saynn("[say=pc]Uh huh. Give me even more reasons to leave you like this, slut.[/say]")

		saynn("[say=socket]Huff-f..[/say]")

		saynn("At some point her moans get louder, her whole body starts to shiver, her pussy gripping your cock again. She feels so tight that you can't hold back anymore..")

		addButton("Cum inside", "Breed the fennec", "socket_rough_pussy_cuminside")
	if(state == "socket_rough_pussy_cuminside"):
		playAnimation(StageScene.SexVent, "inside", {pc="socket", npc="pc", npcBodyState={exposedCrotch=true,hard=true}})
		var removedImplant = getFlag("SocketModule.removedWombImplant", false)
		if (!removedImplant):
			saynn("She can't get pregnant anyway so you just push yourself over the edge with the last slow but rough thrusts, shoving your cock as deep as that pussy allows.")

		else:
			saynn("You really don't want to hold back so you just push yourself over the edge with the last slow but rough thrusts, shoving your cock as deep as that pussy allows.")

		saynn("[say=socket]Oh.. Are you.. ah..[/say]")

		saynn("Socket is still shivering a lot, her pussy squeezing your shaft as you start pumping her full of your spunk.")

		saynn("[say=pc]Yes. Why wouldn't I use a stuck whore?[/say]")

		saynn("[say=socket]Huff.. I'm not a whore! I'm.. I'm just stuck![/say]")

		saynn("You pull your cock out, leaving her stuffed pussy to leak your seed onto her fluffy trembling thighs. Whole bathroom smells of sex now..")

		saynn("[say=pc]Then I'm sure the next person who sees you will help.[/say]")

		saynn("You slap her ass, making her used slit push out more {pc.cum}.")

		saynn("[say=socket]Hey![/say]")

		saynn("And just like that, you leave her there.")

		addButton("Leave", "Time to go", "unlock_fasttravel_rough")
	if(state == "unlock_fasttravel_rough"):
		GM.pc.setLocation("main_bathroom1")
		saynn("Although, before you leave completely, you take one last look at the vent.")

		saynn("Hmm.. You have seen many of them throughout the station. They're all probably connected into one network. Maybe you can use them as a.. quick transportation system of sorts. Socket would probably be able to modify them to allow for that.. after she gets out of the precarious state that she is in.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "socket_rough_ass"):
		playAnimation(StageScene.SexVent, "inside", {pc="socket", npc="pc", npcBodyState={exposedCrotch=true,hard=true}})
		saynn("Fuck it, you're too horny and annoyed not to take advantage of that slut.")

		saynn("You take a spot behind her and get a firm grasp on her ass with one hand while the other holds your hard cock ready. Rather than going for that obvious needy cunt, why not try her other hole? It looks much tighter, even when you spread her fluffy buttcheeks.")

		saynn("[say=socket]Ow. How are you gonna pull me out like that?[/say]")

		saynn("Socket doesn't even realize.. but seconds later.. she feels your cock prodding her virgin-tight back entrance. You put more and more pressure on it, spreading the unwilling ring forcefully. The fennec starts squirming and whining as you do that.")

		saynn("[say=socket]AH! Ow!.. Wait! That's the wrong hole![/say]")

		saynn("[say=pc]Oh yeah? What are you gonna do? Stop me?[/say]")

		saynn("The more you slide your dick down her clenching asshole, the more she shivers.. and the more she tries to kick you back with her legs. You counter that by slapping her ass, sending it to jiggle. Her ass is dry as a dessert, making the penetration extremely uncomfortable for her.")

		saynn("[say=socket]Arh.. You can fuck the other hole! Please![/say]")

		saynn("[say=pc]I can?[/say]")

		saynn("[say=socket]Yes! Fuck my pussy! Please! I won't resist![/say]")

		saynn("Wow, what an offer.")

		addButton("Ravage her ass", "Ignore her begging and keep going", "socket_rough_ass_keepgoing")
		addButton("Switch to pussy", "Might as well leave her ass as is", "socket_rouch_ass_pussy")
	if(state == "socket_rough_ass_keepgoing"):
		playAnimation(StageScene.SexVent, "sex", {pc="socket", npc="pc", npcBodyState={exposedCrotch=true,hard=true}})
		saynn("Nope, Socket wasn't begging good enough for you to reconsider. You ignore her whining and keep pushing through, slapping and scratching her thighs as she keeps trying to push you back with her legs.")

		saynn("[say=socket]Don't do it, please! Agh!..[/say]")

		saynn("With one rough motion, you shove the rest of your length inside, stretching Socket's asshole wide. She is squirming and groaning painfully, her toes curling up in her boots, her tail spazzing out in the air. Despite how painful it is for her.. for you it feels amazing, her tailhole clenching around your cock is all the right ways.")

		saynn("[say=pc]Someone has to train your ass if you won't do it yourself.[/say]")

		saynn("[say=socket]Nhh.. it doesn't feel good![/say]")

		saynn("Who cares, you're not doing it for her. You let the slut get used to your cock a bit before you start moving your hips, almost pulling out before shoving your full length inside, abusing that dry tailhole for all the pleasure.")

		saynn("[say=socket]Ugh-h.. agh..[/say]")

		saynn("She knew what she was getting into. Maybe she wanted this to happen. You grab onto her spazzing tail and pull it while thrusting inside her tight asshole, her neglected pussy looking quite lonely under it.")

		saynn("It doesn't take long for you to already start feeling the orgasm approaching, Socket's inner walls are just refusing to stop gripping your cock, resulting in a lot of friction. You pound that ass hard, forcing more and more of those little painful noises out of her.")

		addButton("Cum inside", "Stuff her ass", "socket_rough_ass_cum")
	if(state == "socket_rough_ass_cum"):
		playAnimation(StageScene.SexVent, "inside", {pc="socket", npc="pc", npcBodyState={exposedCrotch=true,hard=true}})
		saynn("With one last powerful thrust of your hips, you grunt as your cock starts throbbing and pumping Socket's ass full of your {pc.cum}, its wall milking your balls for each last drop.")

		saynn("[say=socket]Huf-f-f.. You're gonna regret it..[/say]")

		saynn("Hearing her say that while she is stuck in that vent puts a smile on your face.")

		saynn("[say=pc]Sure. Just make sure to get some lube first.[/say]")

		saynn("You pull out, leaving her bruised asshole to pulse and release some of your seed back, creating quite a mess on her thighs.")

		saynn("[say=socket]Now help me.. Please?[/say]")

		saynn("You just spank that ass and proceed to leave.")

		saynn("[say=socket]Ow! Hey![/say]")

		addButton("Leave", "Time to go", "unlock_fasttravel_rough")
	if(state == "socket_rouch_ass_pussy"):
		playAnimation(StageScene.SexVent, "sex", {pc="socket", npc="pc", npcBodyState={exposedCrotch=true,hard=true}})
		saynn("She is begging you, how can you say no?")

		saynn("So, after a few seconds of deliberating, you pull your cock out of her tight ass and instead shove your it into her pussy, the tip spreading her petals as you slide inside without a warning.")

		saynn("[say=socket]Than.. AH![/say]")

		saynn("The sudden penetration makes her jerk her body. You agreed to fuck her pussy.. but you never said that you'd be gentle.")

		saynn("Your hands squeeze and grope her ass as you start using her slit, almost pulling out before ramming your dick deep inside, the penetration creating a slight bump on her belly.")

		saynn("[say=socket]Ah.. ah..[/say]")

		saynn("The more you pound her cunt, the more it gets wet, the less bruises her inner walls receive from you. She doesn't resist anymore, just letting you use her like she is some kind of free use toy.")

		addButton("Faster", "Increase the pace", "socket_rouch_ass_pussy_fast")
	if(state == "socket_rouch_ass_pussy_fast"):
		playAnimation(StageScene.SexVent, "fast", {pc="socket", npc="pc", npcBodyState={exposedCrotch=true,hard=true}})
		saynn("You increase the pace, your hips slapping against her fluffy butt with a soft noise. More moans begin to escape from Socket, her pussy coating your dick with plenty of juice, allowing you to pound her like that.")

		saynn("[say=socket]You're so rough..[/say]")

		saynn("[say=pc]Want me to switch to your ass again?[/say]")

		saynn("[say=socket]No.. ah.. please.. Keep fucking my pussy![/say]")

		saynn("You can feel her body starting to shiver, her legs shaking a little.")

		saynn("[say=socket]I'm.. I'm..[/say]")

		saynn("You spank her ass when she does, causing her pussy to grip your cock extremely tightly. All the while, you just keep fucking her, your cock pushing through her pulsing wet love-tunnel while she cums.")

		saynn("[say=socket]Ah!.. Hh-h..[/say]")

		saynn("It feels so good that you can't hold yourself from grunting as well, your {pc.penis} is twitching, about to release its load..")

		addButton("Cum inside", "Stuff that pussy!", "socket_rouch_ass_pussy_cum")
	if(state == "socket_rouch_ass_pussy_cum"):
		playAnimation(StageScene.SexVent, "inside", {pc="socket", npc="pc", npcBodyState={exposedCrotch=true,hard=true}})
		saynn("While Socket is still experiencing the orgasmic bliss, you ram your dick deep inside and let her pussy bring you over the edge.")

		saynn("More grunting.. followed by your balls tensing up.. your cock releasing its load inside her needy slit in waves, during each throb.")

		saynn("[say=pc]Using you like the free use slut that you are.[/say]")

		saynn("After properly breeding her cunt, you just stay inside for a little longer, using her as your cock warmer.")

		saynn("[say=socket]Huff.. I will find a way to get back at you![/say]")

		saynn("Hearing that while she is stuck in there.. is a bit funny.")

		saynn("[say=pc]You better hope that whoever finds you won't decide to have their way with you too.[/say]")

		saynn("[say=socket]What do you mean? Help me to get out![/say]")

		saynn("You just slap her ass and pull out, making her used pussy produce a cute little fountain of your {pc.cum}.")

		saynn("Time to go.")

		addButton("Leave", "Time to go", "unlock_fasttravel_rough")
	if(state == "help_lewd_socket"):
		saynn("Yeah, she got herself into quite a precarious situation. Might as well 'help her'.")

		saynn("You start by putting your hands on her hips and gently caressing them.")

		saynn("[say=pc]What a vulnerable position that you're in.[/say]")

		saynn("[say=socket]Yeah! So unfortunate, right?[/say]")

		saynn("You chuckle. Your hands jump on her fluffy butt and follow it curves, your digits digging into her short fur as you start groping her butt.")

		saynn("[say=pc]Uh huh. Would be a shame if someone would take advantage of that.[/say]")

		saynn("[say=socket]True, they can do so many wild things while I'm stuck here![/say]")

		saynn("Your palms reach her inner thighs and begin following them now, sliding up and down along, occasionally cupping the crotch, teasing the pussy folds.")

		saynn("[say=socket]They could play with me or even use me for their pleasure![/say]")

		saynn("One of your fingers casually rubs her clit while she says that. Socket's pussy produces such an inviting scent..")

		saynn("[say=socket]I wouldn't even be able to look at them, they have full control over what happens..[/say]")

		saynn("While doing all of that, you notice the reason behind why Socket is stuck there. Her shoulder pads got caught by the sticking out edge of the vent. If you push on them a little, you reckon you could get Socket out of there with zero effort.. if you want.")

		addButton("Save her", "Enough lewding", "help_lewd_save")
		addButton("Finger her", "Do a little more than just groping", "help_lewd_finger")
		addButtonWithChecks("Use her pussy", "Might as well enjoy her pussy first", "help_lewd_pussy", [], [[ButtonChecks.HasReachablePenis]])
		addButtonWithChecks("Use her ass", "Might as well enjoy her ass first", "help_lewd_ass", [], [[ButtonChecks.HasReachablePenis]])
	if(state == "help_lewd_save"):
		playAnimation(StageScene.Duo, "stand", {npc="socket"})
		saynn("After properly groping Socket's butt for some time, you decide that it's time to get the poor girl out of there. You reach your hand into the vent and push on her armored shoulder pads in the right place.. causing it to finally release her!")

		saynn("[say=pc]There you go.[/say]")

		saynn("Socket gets out of it and hums. She uses her paws to swipe off any dust off of her chest and butt.")

		saynn("[say=socket]Thanks for the help! It was quite lonely there.[/say]")

		addButton("Continue", "See what happens next", "unlock_fast_travel")
	if(state == "help_lewd_finger"):
		playAnimation(StageScene.SexVent, "finger", {pc="socket", npc="pc"})
		saynn("Nah, you can always save her later. For now, you might as well do something else.")

		var removedImplant = getFlag("SocketModule.removedWombImplant", false)
		if (!removedImplant):
			saynn("Your digits land on her pussy folds and spread them wide, revealing the pink slick tunnel that ends with some kind of.. implant. Luckily, you don't plan to reach that far.")

		else:
			saynn("Your digits land on her pussy folds and spread them wide, revealing the pink slick tunnel that ends with her tight cervix. Luckily, you don't plan to reach that far.")

		saynn("[say=socket]Interesting, I just realized that this vent has a pretty echo.[/say]")

		saynn("Casually, you slip two of your fingers inside and begin to wiggle them around, her juices dripping onto them.")

		saynn("[say=pc]Oh yeah?[/say]")

		saynn("[say=socket]Yeah, just listen. Ha! -Ha.. ha.. a..[/say]")

		saynn("You keep one of your hands warm using her fluffy butt while the second starts to finger her, your digits sliding in and out, aimed in such a way so they push on her pleasure spot.")

		saynn("[say=pc]That is indeed quite interesting.[/say]")

		saynn("[say=socket]It's probably.. very deep and long.. ah..[/say]")

		saynn("Her pussy pulsing around your fingers as you hammer away at her g-spot, juices dripping onto the floor.")

		saynn("[say=pc]Yeah, it would be very fun to explore, don't you think?[/say]")

		saynn("[say=socket]Mm-m-h-h.. h-hah..[/say]")

		saynn("Her legs shiver, her toes in her boots curling up, her tail swaying wildly.")

		saynn("[say=pc]Something is wrong?[/say]")

		saynn("[say=socket]No.. everything is fine..[/say]")

		saynn("You angle yourself a little more, which allows you to finger-fuck her pussy faster, so fast that it starts to make wet noises and squirt out some transparent fluids occasionally.")

		saynn("[say=pc]But you're still stuck, aren't you?[/say]")

		saynn("[say=socket]Oh yeah.. I am.. I'm.. ah..[/say]")

		saynn("Suddenly, her whole body tenses up, her legs start to shake, her pussy walls gripping your digits as you start to hear cute moans escaping from the vent, the echo giving them more volume and richness.")

		saynn("[say=pc]I know, the echo is nice.[/say]")

		saynn("The fennec is squirming, constrained by the vent, your digits keep pushing on her g-spot so much that they cause her to.. let go. Her pussy releases a storm of girlcum, creating a big wet puddle and making the fur on her thighs wet too.")

		saynn("[say=socket]Huff..[/say]")

		saynn("You wait for Socket to stop shivering.. before carefully pulling the digits out and drying them out against the fluff of her butt.")

		saynn("Time to help her.")

		addButton("Get her out", "Help Socket", "help_lewd_finger_help")
	if(state == "help_lewd_finger_help"):
		playAnimation(StageScene.Duo, "stand", {npc="socket"})
		saynn("You reach your hand into the vent and push on her armored shoulder pads in the right place.. causing it to finally release her!")

		saynn("[say=pc]There you go.[/say]")

		saynn("Socket gets out with your help, her legs still shaking a little.")

		saynn("[say=socket]Thanks for the help! It was getting quite hot there.[/say]")

		saynn("[say=pc]Hah.[/say]")

		addButton("Continue", "See what happens next", "unlock_fast_travel")
	if(state == "help_lewd_pussy"):
		playAnimation(StageScene.SexVent, "inside", {pc="socket", npc="pc", npcBodyState={exposedCrotch=true,hard=true}})
		saynn("Nah, you can always save her later. For now, you might as well do something else. Looking at Socket stuck in the vent like that.. made you quite hard. Why not let some steam out?")

		saynn("Casually, you position yourself behind her and align your {pc.penis} with her exposed tight lips. Brushing the tip against them doesn't seem to cause any resistance. You feel.. warmth.. radiating from her love tunnel.")

		saynn("[say=socket]It's dirty here, so much dust..[/say]")

		saynn("Without any warning, you slowly enter her, your cock spreading her slit wide and coating the walls with its precum. Her legs are closed, meaning her pussy feels tight..")

		saynn("[say=pc]Oh yeah?[/say]")

		saynn("[say=socket]Yeah, I should have grabbed a cleaner.[/say]")

		saynn("Socket seems to be content with you being inside her. She even moves her tail out of the way.")

		addButton("Fuck her", "Start moving your hips", "help_lewd_pussy_fuck")
	if(state == "help_lewd_pussy_fuck"):
		playAnimation(StageScene.SexVent, "sex", {pc="socket", npc="pc", npcBodyState={exposedCrotch=true,hard=true}})
		var removedImplant = getFlag("SocketModule.removedWombImplant", false)
		if (!removedImplant):
			saynn("And so you start moving your hips, fucking her at a slow pace, your dick exploring her depths. You don't go too deep so you don't break your dick on whatever she has in her womb.. but it still feels good, her slick pussy walls hug your length nicely.")

		else:
			saynn("And so you start moving your hips, fucking her at a slow pace, your dick exploring her depths. It feels good, her slick pussy walls hug your length nicely.")

		saynn("[say=pc]So you're saying that you're not a dirty girl?[/say]")

		saynn("[say=socket]Yeah, sure. I prefer to keep everything nice and clean![/say]")

		saynn("Her breathing gets a little deeper as you keep thrusting inside, little noises of pleasure escape her, the reverb making them sound richer.")

		saynn("[say=pc]Might I ask a personal question?[/say]")

		saynn("[say=socket]Sure-e![/say]")

		addButton("Faster", "Fuck her faster", "help_lewd_pussy_fast")
	if(state == "help_lewd_pussy_fast"):
		playAnimation(StageScene.SexVent, "fast", {pc="socket", npc="pc", npcBodyState={exposedCrotch=true,hard=true}})
		saynn("You grip her hips harder and increase the pace, your hips slapping against her fluffy butt, your cock getting stimulated by her clenching slit.")

		saynn("[say=pc]So that means that during sex, you prefer to keep everything.. inside?[/say]")

		saynn("[say=socket]Of course.. ah.. internal cumshots are the best. I don't have to groom my fur then![/say]")

		saynn("Discussing such a lewd topic so casually. Guess you better listen to her and not pull out.")

		saynn("[say=pc]Makes sense. I will try to avoid making a mess then.[/say]")

		saynn("[say=socket]Oh, thank you, you're so nice! Ah..[/say]")

		saynn("You can feel shivers going through her body, her lower part of the body is squirming a bit.. as much as the firm frame of the vent allows it.")

		saynn("Your orgasm draws near too..")

		addButton("Cum inside", "Breed that fennec", "help_lewd_pussy_cum")
	if(state == "help_lewd_pussy_cum"):
		playAnimation(StageScene.SexVent, "inside", {pc="socket", npc="pc", npcBodyState={exposedCrotch=true,hard=true}})
		saynn("..and rather than pulling out, you decide to commit to it and thrust deep inside! You hear cute moans and feel a girl squirming before you, her pussy quivering and kneading your cock tightly as you start pumping her full of your {pc.cum}!")

		saynn("[say=socket]Ah..[/say]")

		saynn("The more your {pc.penis} throbs inside her, the more she tries to stand on the tip of her boots, which frees her shoulder pads from being stuck!")

		saynn("[say=socket]Oh.. It worked!.. Ah.. I'm free![/say]")

		saynn("You leave your cock inside, using the girl as a cock warmer.")

		saynn("[say=pc]Who would have thought.[/say]")

		saynn("[say=socket]Yeah, sex is often the solution![/say]")

		addButton("Get her out", "Help Socket", "help_lewd_pussy_help")
	if(state == "help_lewd_pussy_help"):
		playAnimation(StageScene.Duo, "stand", {npc="socket"})
		saynn("After some time, you finally pull out, allowing that stuffed used pussy to start leaking your seed. Then you just help Socket to get out.")

		saynn("[say=pc]There you go.[/say]")

		saynn("Socket swipes the dust off her fur, her legs still shaking a little.")

		saynn("[say=socket]Thanks for the help! It was getting quite hot there.[/say]")

		saynn("[say=pc]Hah.[/say]")

		addButton("Continue", "See what happens next", "unlock_fast_travel")
	if(state == "help_lewd_ass"):
		playAnimation(StageScene.SexVent, "tease", {pc="socket", npc="pc", npcBodyState={exposedCrotch=true,hard=true}})
		saynn("Nah, you can always save her later. For now, you might as well do something else. Looking at Socket stuck in the vent like that.. made you quite hard. Why not let some steam out?")

		saynn("Casually, you position yourself behind her and align your {pc.penis} with her exposed virgin-tight tailhole. But as soon as your member prods her it.. Socket pulls her butt away, her tail covering it.")

		saynn("[say=socket]Wrong hole![/say]")

		saynn("[say=pc]Is it?[/say]")

		saynn("She shakes her butt at you.")

		saynn("[say=socket]Yeah, it's not for sex![/say]")

		saynn("Huh, what if you go slow though.. You move her tail out of the way and push more pressure on her ass.. but that only makes her push you back with her legs.")

		saynn("[say=socket]Please? You can use the other one![/say]")

		saynn("You can try to force her.. but you'd have to be rough, the girl seems to be resisting anal a lot.")

		addButton("Force anal", "Be rough with her", "socket_rough_ass_keepgoing")
		addButton("Switch to pussy", "Listen to her", "help_lewd_ass_switch")
	if(state == "help_lewd_ass_switch"):
		playAnimation(StageScene.SexVent, "inside", {pc="socket", npc="pc", npcBodyState={exposedCrotch=true,hard=true}})
		saynn("Sure, you decide to listen to the girl and lower your cock to her pussy. Brushing the tip against her moist petals doesn't seem to cause any resistance this time. You feel.. warmth.. radiating from her love tunnel.")

		saynn("[say=socket]Thanks.. It's dirty here, so much dust..[/say]")

		saynn("Without much warning, you slowly enter her, your cock spreading her slit wide and coating the walls with its precum. Her legs are closed, meaning her pussy feels very tight..")

		saynn("[say=pc]Oh yeah?[/say]")

		saynn("[say=socket]Yeah, I should have grabbed a cleaner.[/say]")

		saynn("Socket seems to be content with you being inside her. She even moves her tail completely out of the way.")

		addButton("Fuck her", "Start moving your hips", "help_lewd_pussy_fuck")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "bring_socket_lift"):
		processTime(3*60)

	if(_action == "socket_goes_bathroom"):
		processTime(3*60)

	if(_action == "socket_approaches_vent"):
		processTime(3*60)

	if(_action == "help_socket"):
		processTime(10*60)
		GM.pc.addStamina(-30)
		GM.pc.addLust(20)
		GM.pc.addPain(10)

	if(_action == "help_lewd_socket"):
		processTime(5*60)

	if(_action == "socket_help_actually"):
		processTime(10*60)
		GM.pc.addStamina(-30)

	if(_action == "socket_rough_pussy"):
		processTime(60*3)

	if(_action == "socket_rough_ass"):
		processTime(60*3)

	if(_action == "unlock_fast_travel"):
		processTime(3*60)
		addMessage("You can now ask Socket to modify the station's vents to make them traversable")

	if(_action == "socket_rough_pussy_fast"):
		processTime(6*60)

	if(_action == "socket_rough_pussy_cuminside"):
		processTime(3*60)
		getCharacter("socket").cummedInVaginaBy("pc")
		setFlag("SocketModule.socketWillPunish", true)
		setFlag("SocketModule.punishReason", "stuckroughfuck")

	if(_action == "unlock_fasttravel_rough"):
		addMessage("You can now ask Socket to modify the station's vents to make them traversable")

	if(_action == "socket_rough_ass_cum"):
		processTime(3*60)
		getCharacter("socket").cummedInAnusBy("pc")
		setFlag("SocketModule.socketWillPunish", true)
		setFlag("SocketModule.punishReason", "stuckroughassfuck")

	if(_action == "socket_rouch_ass_pussy_fast"):
		processTime(5*60)

	if(_action == "socket_rouch_ass_pussy_cum"):
		processTime(3*60)
		getCharacter("socket").cummedInVaginaBy("pc")
		setFlag("SocketModule.socketWillPunish", true)
		setFlag("SocketModule.punishReason", "stuckroughfuck")

	if(_action == "help_lewd_save"):
		processTime(5*60)

	if(_action == "help_lewd_finger"):
		processTime(5*60)

	if(_action == "help_lewd_pussy"):
		processTime(3*60)
		fuckedPussy = true

	if(_action == "help_lewd_ass"):
		processTime(3*60)

	if(_action == "help_lewd_finger_help"):
		processTime(3*60)

	if(_action == "help_lewd_pussy_fuck"):
		processTime(5*60)

	if(_action == "help_lewd_pussy_fast"):
		processTime(3*60)

	if(_action == "help_lewd_pussy_cum"):
		processTime(5*60)
		getCharacter("socket").cummedInVaginaBy("pc")

	if(_action == "help_lewd_pussy_help"):
		processTime(3*60)

	setState(_action)

func saveData():
	var data = .saveData()

	data["fuckedPussy"] = fuckedPussy

	return data

func loadData(data):
	.loadData(data)

	fuckedPussy = SAVE.loadVar(data, "fuckedPussy", false)
