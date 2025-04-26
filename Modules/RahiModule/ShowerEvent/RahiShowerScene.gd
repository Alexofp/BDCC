extends "res://Scenes/SceneBase.gd"

var usedCondom = false
var condomBroke = false
var isSlavery = false

func _init():
	sceneID = "RahiShowerScene"

func _initScene(_args = []):
	if(_args != null && _args.size() > 0):
		if(_args[0] == "slavery"):
			isSlavery = true

func _run():
	if(state == ""):
		if(isSlavery):
			aimCameraAndSetLocName("main_shower1")
			
			saynn("You tell Rahi that it's time to take a shower. She nods and follows you to the showers.")
			
			saynn("The feline strips her uniform in the undressing room and gets under one of the shower heads before twisting the nob that makes the water run.")
		
		addCharacter("rahi", ["naked"])
		playAnimation(StageScene.ShoweringDuo, "tease", {
			pc="rahi", npc="pc", 
			bodyState={naked=true,},
			npcBodyState={naked=true},
		})
		
	if(state == ""):
		saynn("You watch the familiar kitty that is standing under the shower, completely naked. She is taking her sweet time, washing herself, her hand holding a piece of soap that she uses on her hair. Her body is directed away from you but it still presents you with a nice view. Her wet fur now shows just how slim her curves are, something that is must have for an agile kitty. She is humming some tune to herself while slowly swaying her hips.")

		saynn("Her ponytail is undone, her long wet hair is covering her eyes. She finishes washing her head and moves her paws down to her girly shoulders and chest. Her shower sponge travels circles around her modest C-cup breasts and then goes over her perky pink nips too.")

		addButton("Intervene", "Announce your presence", "intervene")

	if(state == "intervene"):
		playAnimation(StageScene.ShoweringDuo, "shower", {
			pc="rahi", npc="pc", 
			bodyState={naked=true,},
			npcBodyState={naked=true},
		})
		
		saynn("You get under the shower head that is next to hers and wash yourself for a bit. Then you clear your throat loudly. The feline gasps, her ears direct themselves at you, shortly followed by her gaze.")
		
		if(isSlavery):
			saynn("[say=pc]I thought you hated water.[/say]")
			
			saynn("[say=rahi]Showers are different.. She can't drown here..")
		else:
			saynn("[say=rahi]Oh, hello there..[/say]")

		saynn("She keeps washing herself but her hand motions are more shy. She quickly rubs her breasts and then moves on to focusing on washing her belly and lower.")

		saynn("[say=pc]Need some help?[/say]")

		saynn("[say=rahi]Oh.. not really, no?..[/say]")

		saynn("You shrug and just stand under your shower head while the feline sneakily looks at you.")

		saynn("[say=rahi]Well, actually.. She can’t reach her back herself.[/say]")

		saynn("Oh yeah, you can help with that. You stand behind her and grab the sponge that she offers to you. Her hand shakes slightly, you can tell she is nervous.")

		addButton("Rub her back", "Help wash her", "rub_her_back")

	if(state == "rub_her_back"):
		saynn("You begin carefully rubbing her back. Your hand perfectly follows the feline’s body lines as you soap her back just so the running water can wash it off a few seconds later. From looking at her body from such a close distance you notice quite a few old claw marks, little scars, signs of many injuries. She rests her paws on her breasts and sneakily looks behind her every few seconds.")

		saynn("[say=pc]Life didn’t treat you well, did it.[/say]")

		saynn("[say=rahi]Why? She got used to living here..[/say]")

		saynn("[say=pc]What about the scars.[/say]")

		saynn("[say=rahi]Oh.. everyone here has them.[/say]")

		saynn("You feel that she is not as nervous as she was, she is even leaning into your touch as you keep rubbing her back, slowly shifting down and now focusing on the area around her calm tail. As you focus your attention on rubbing her tail, it wraps around your hand and you can hear quiet moaning coming from her, she keeps arching her back and rubbing against you.")

		# (if has dick)
		if(GM.pc.isWearingChastityCage()):
			saynn("You can’t help but to be aroused by that, your {pc.cock} fills with blood and tries to become hard but your chastity prevents it. Your cage rubs against the feline’s fit buttocks but she doesn’t seem to mind it. She embraces it, gently squeezing your member between her legs as best as your cage allows for it.")
		elif(GM.pc.hasReachablePenis()):
			saynn("You can’t help but to be aroused by that, your {pc.cock} fills with blood and becomes more hard each second, its tip rubs against the feline’s fit buttocks but she doesn’t seem to mind it. She embraces it, gently squeezing your member between her legs.")

		# (if has non-flat breasts)
		if(GM.pc.hasNonFlatBreasts()):
			saynn("You feel your nips becoming stiffer as she rubs against your {pc.breasts}. You can’t help but to let out a little pleasure noise of your own.")

		saynn("[say=pc]You like it?[/say]")

		saynn("[say=rahi]Kitty does..[/say]")

		saynn("You finish with her tail and move on to rubbing her thighs. Kitty doesn’t hold back her feelings, she leans back into you and nuzzles your face. Water runs down your wet and aroused bodies. You breathe warmly into the feline’s ear and feel her paws on your {pc.masc} legs.")

		addButton("Just kiss", "Embrace the intimacy of the moment", "just_kiss")
		addButtonWithChecks("Vaginal", "Ask if it’s okay first (It’s gonna be rough)", "vaginal", [], [ButtonChecks.HasReachablePenis])
		addButton("Lick her out", "Taste the kitty (Gonna be somewhat rough for her)", "lick_her_out")
		if(isSlavery && (getCharacter("rahi").hasEffect(StatusEffect.HasCumInsideVagina) || getCharacter("rahi").hasEffect(StatusEffect.HasCumInsideAnus))):
			addButton("Clean inside", "Remove any cum or other fluids from inside Rahi's holes", "clean_rahi_inside")
		elif(isSlavery):
			addDisabledButton("Clean inside", "Rahi doesn't have any cum or other fluids inside her holes")

	if(state == "clean_rahi_inside"):
		playAnimation(StageScene.ShoweringDuo, "rub", {
			pc="rahi", npc="pc", 
			bodyState={naked=true,},
			npcBodyState={naked=true},
		})
		
		saynn("[say=pc]Let's clean you inside too, kitty.[/say]")

		saynn("[say=rahi]Meow?..[/say]")

		saynn("Without explaining much, you place both of your hands on the kitty's buttcheeks and grope them slightly. You can hear subtle purring coming from her while she leans back into you.")

		saynn("After some caressing, you suddenly spread her butt. Kitty meows again while you put both of her pleasure holes on display. Her little pink tailhole in particular, Rahi tries to clench but she can't make it fully close while your hands are there. Her pussy looks spread too, the needy wet hole is obeying your touch.")

		saynn("[say=rahi]H-hey..[/say]")

		var hasCumInPussy = getCharacter("rahi").hasEffect(StatusEffect.HasCumInsideVagina)
		var hasCumInAnus = getCharacter("rahi").hasEffect(StatusEffect.HasCumInsideAnus)
		if (hasCumInPussy && hasCumInAnus):
			saynn("Very soon lewd stuff begins to leak out of both of her holes. {rahi.VaginaContents} leaks out of her pussy slit, dripping down her thighs before getting washed away by the water. Her butt is dripping {rahi.anusContents} onto the floor.")

		elif (hasCumInPussy):
			saynn("Her butt doesn't seem to be stuffed but her pussy is. {rahi.VaginaContents} begins to leak out of it, dripping down her thighs before getting washed away by the water.")

		else:
			saynn("Strangely enough, her pussy isn't stuffed with anything but her butt is. Very soon her tailhole begins to leak {rahi.anusContents} onto the floor before getting washed away into the drain.")

		saynn("The feline holds your hands with her paws but she doesn't try to pry them off.")

		saynn("[say=rahi]This is embarrassing.. a bit..[/say]")

		saynn("[say=pc]Relax, pussy cat. Well, no, you should try to push it out actually. Do it.[/say]")

		saynn("The feline blushes deeply but she seems to be obeying, her body visible tensing up while more and more lewd fluids continue to leak out of her. Her raised tail brushing against your {pc.masc} chest.")

		saynn("You wait until she stops dripping before letting go of her buttchecks. You give her shoulder a little kiss and prepare to leave.")

		addButton("Continue", "See what happens next", "cleanholesandend")

	if(state == "just_kiss"):
		saynn("You put both your hands on the feline’s hips and gently turn her around until she is facing you. You’re getting closer and closer, your foreheads softly bump together, her paws explore your {pc.masc} body, your {pc.breasts}..")

		saynn("[say=rahi]You feel so nice..[/say]")

		saynn("Your hand with the sponge rubs the feline’s butt. Even though you’re long past just showering.. It feels good.")

		saynn("[say=pc]You do too, kitty.[/say]")

		saynn("You move her long wet hair out of the way and move your lips closer to hers. You feel like you can drown in her deep blue eyes. And she looks back at you the same way. No shame, no shyness, no regret.. Just.. a strong desire.. to..")

		saynn("Your lips touch. A very short kiss. Like lightning. But then she puts her paws on the sides of your head and pulls you in for another, a much longer one.. She tilts her head slightly and parts her lips, inviting you in. She closes her eyes and gives in completely. The kiss between you is deep, tongues rub against each other in a little dance while your hands explore the feline’s curves.")

		saynn("Deep slow breathing.. Even if there are others around.. Who cares.. Minutes fly like seconds, you stand under the cold running water and can’t stop kissing each other. Eventually she breaks the interaction just to begin landing lots of little kisses on your cheeks and neck. You hug the feline tightly and nuzzle her face. She is blushing, so cute, you can’t help but to smile. You feel her squishy breasts pushing against your {pc.thick} body.")

		saynn("[say=rahi]Meow.. Why are you smiling..[/say]")

		saynn("[say=pc]Because you are so adorable, kitty.[/say]")

		saynn("[say=rahi]Meow..[/say]")

		addButton("Continue", "Good times", "continue")

	if(state == "continue"):
		saynn("You stay like this for a while, alone, in your own little world, away from the rest.")

		saynn("[say=rahi]We gotta wrap up.. Before anyone finds us..[/say]")

		saynn("[say=pc]I don’t mind it.[/say]")

		saynn("You finally stop hugging and quickly finish washing each other. You turn off the water and the kitten gives you the last little kiss on your cheek before leaving you to go get dried up and dress.")
		
		if(isSlavery):
			saynn("[say=rahi]Let's go back..[/say]")
		else:
			saynn("[say=rahi]See you around..[/say]")

		# (scene ends)
		addButton("Continue", "That's nice", "endthescene")

	if(state == "vaginal"):
		# (needs an exposed dick)
		playAnimation(StageScene.SexStanding, "tease", {
			npc="rahi", pc="pc", 
			bodyState={naked=true,hard=true,},
			npcBodyState={naked=true},
		})

		saynn("You begin gently moving your {pc.masc} hips back and forth, your {pc.cock} is sliding between the kitten's legs and rubbing against her cute pink slit, coating your member with her wetness that quickly gets washed away.")

		saynn("[say=pc]Do you want it, kitty?..[/say]")

		saynn("She mewls at your question and stays quiet for a few seconds. Her kitty eyes show desire but she needs to gather some strength to tell you this. She leans into you and starts to whisper.")

		saynn("[say=rahi]Kitty wants you.. she wants it.. very rough..[/say]")

		saynn("Seems like behind the shyness of this kitty hides something else. Her face blushes more as she starts moving her hips opposite to your motions, bringing you both extra pleasure.")

		saynn("Well, if she wants rough, why not give her rough.")

		addButton("No condom", "Go bare on her", "no_condom")
		addButtonWithChecks("Use condom", "No need to risk getting her pregnant", "use_condom", [], [ButtonChecks.HasCondoms])

	if(state == "fucking"):
		playAnimation(StageScene.SexStanding, "sex", {
			npc="rahi", pc="pc", 
			bodyState={naked=true,hard=true,condom=usedCondom},
			npcBodyState={naked=true},
		})
		
		saynn("Suddenly you press her chest against a wall, one your hand is on the back of her neck, pinning the feline into the cold concrete while another forcibly spreads her legs, giving you full access to her pink pussy. She lets out a gasp and tests you, already trying to break free but your growling and a smack on the ass shows kitty her place.")

		saynn("[say=pc]You’re gonna take it and you’re gonna love it, cat.[/say]")

		# (if condom)
		if(usedCondom):
			saynn("You produce a sealed condom, rip the package open with your teeth and then swiftly apply it to the whole length of your cock. Its tip is already filled with some of your precum.")

		saynn("You force her to arch her back and guide your member directly towards her needy cunt, the head already rubbing against her pussy lips, causing kitty to make little moans. You don’t long, with one powerful motion, your {pc.cock} spreads her pink slit and stretches it enough to let your dick slide deep inside. Pinned against the wall, she moans and shivers around your cock, feeling you stretching her from inside.")

		saynn("Your hand moves from her throat to her hair and grabs her wet undone hair back into a makeshift ponytail. You yank on it, causing lots of discomfort for her, as your second hand catches both her arms and wrenches them behind her back, rendering the feline slut helpless against you.")

		saynn("[say=rahi]Ah.. Please..[/say]")

		# (if condom)
		if(usedCondom):
			saynn("Your cock leaks more precum into the condom, luckily it’s lubricated from the outside, letting you move inside more easily. Her feline pussy seems to be quite stretchy, she is already used to your size. You slowly start pulling your dick out, leaving empty space. Though not for long, a second later you push your hips forward again, ramming that cock down her ready cunt and forcing another moan out of her. And you don’t stop, you keep her pinned into the wall as you start fucking her, slow but powerful thrusts, your {pc.cock} already pounding her inner barricade.")

		# (else)
		else:
			saynn("Your cock leaks precum into her, making the inner walls more slippery. Her feline pussy seems to be quite stretchy, she is already used to your size. You slowly start pulling your dick out, leaving empty space. Though not for long, a second later you push your hips forward again, ramming that cock down her ready cunt and forcing another moan out of her. And you don’t stop, you keep her pinned into the wall as you start fucking her, slow but powerful thrusts, your {pc.cock} already pounding her inner barricade.")

		saynn("The kitty can’t do anything, she has already given up even pretending to resist, her arms behind her back, legs spread, her hair being pulled is forcing her head straight. She is bent forward while her back is arched, her mouth is opened, tongue is out, she is moaning passionately, like a slut, while you slowly pick up the pace, thrusting your dick deep each time, her feline pussy is struggling to withstand your onslaught. Kitty’s tail, which was mostly idle before, now wraps around your torso like a fluffy leash.")

		saynn("[say=rahi]S-she is.. c-close..[/say]")

		saynn("Already, huh. You can feel her soft inner walls clenching around your shaft, her legs shivering. The running water hides it but inside she is wet and fully aroused. Your hips smaking against her butt makes it jiggle with each thrust, her breasts are bouncing up and down as you pound at her cervix, slowly stretching it open too. You feel like you’re close too..")
	
		if(!usedCondom):
			addButton("Cum inside", "Breed the needy kitty", "cum_inside")
		else:
			addButton("Cum inside", "Fill that condom up", "cum_inside")

	if(state == "cum_inside"):
		playAnimation(StageScene.SexStanding, "fast", {
			npc="rahi", pc="pc", 
			pcCum=true, npcCum=true,
			bodyState={naked=true,hard=true,condom=usedCondom},
			npcBodyState={naked=true},
		})
		
		saynn("Like some kind of animal, you keep ravaging her poor kitty cunt, it only takes a few more thrusts before the feline lets out a series of loud long moans, her pussy tightens around your cock and squirts with her female juices, she is cumming! Her feline body shakes and tries to squirm but your grasp is hard, you keep her body still as you keep fucking her slit even through her orgasm. Any pain she might be experiencing now just amplifies her climax instead, the contrast makes it so much more pleasurable.")

		saynn("[say=rahi]Ah-h!.. Y-yes!.. D-don’t stop![/say]")

		# (if condom)
		if(usedCondom && !condomBroke):
			saynn("Her pussy is milking your {pc.cock} for all its precum and bringing you to your edge. You switch to a slow powerful pace, pounding her cunt while your cock throbs inside her. Her cervix is way softer now, one strong thrust and you break through it, sending more pleasure waves through the poor kitty, her slit is squirting again and again. You cum hard, your cock starts filling the condom inside the kitty's womb with your {pc.cum} until it’s nice and full. You growl and bite into the kitten’s neck. She doesn’t care about the pain, right now she wants it, wants to be fucked like a slut she is.")

		# (if condom broke)
		elif(usedCondom && condomBroke):
			saynn("Her pussy is milking your {pc.cock} for all its precum and bringing you to your edge. You switch to a slow powerful pace, pounding her cunt while your cock throbs inside her. Her cervix is way softer now, one strong thrust and you break through it, sending more pleasure waves through the poor kitty, her slit is squirting again and again. You cum hard, your cock starts filling the condom inside the kitty's womb with your {pc.cum} but [b]the condom couldn’t hold it all and breaks, spilling all the {pc.cum} and stuffing the womb for real, oh no[/b]! But you don’t yet notice that, you growl and bite into the kitten’s neck. She doesn’t care about the pain, right now she wants it, wants to be fucked like a slut she is.")

		# (else)
		else:
			saynn("Her pussy is milking your {pc.cock} for all its precum and bringing you to your edge. You switch to a slow powerful pace, pounding her cunt while your cock throbs inside her. Her cervix is way softer now, one strong thrust and you break through it, sending more pleasure waves through the poor kitty, her slit is squirting again and again. You cum hard, your cock starts stuffing the kitty’s womb with your {pc.cum} until it’s nice and full. You growl and bite into the kitten’s neck as you breed her. She doesn’t care about the pain, right now she wants it, wants to be fucked and bred like a slut she is.")

		saynn("She drains your balls, looking from the side there is a visible bump on kitty’s crotch and lower abdomen. She pants heavily and lets out more little pleasure noises. That felt good, you almost don’t wanna pull out.")

		# (if no condom)
		if(!usedCondom):
			saynn("[say=rahi]You came.. i-inside..[/say]")

		# (if condom)
		if(usedCondom && !condomBroke):
			saynn("You let go of her neck and hair, letting her rest her head against the concrete wall again. The condom seems to hold all your jizz inside her, nothing even leaks out. You carefully pull your cock out and tie the condom close, then you pull it out and store it so you can dispose of it yourself. Kitty slides down to her knees, still trying to catch her breath, her used slit is quickly recovering its shape and tightness, seems like feline pussies are good like that.")

		# (if condom broke)
		elif(usedCondom && condomBroke):
			saynn("You let go of her neck and hair, letting her rest her head against the concrete wall again. You notice that her pussy seems to be leaking {pc.cum}. When you pull your cock out you notice that the condom is split open at its tip and didn’t protect you at all. A few seconds of silence pass and the feline notices it too.")

			saynn("[say=rahi]Oh.. Does that mean..[/say]")

			saynn("[say=pc]Yes..[/say]")

			saynn("[say=rahi]She.. doesn’t really mind.. If she gets pregnant from you..[/say]")

			saynn("The shower water quickly cleans your messy cock. Kitty slides down to her knees and tries to catch her breath as more {pc.cum} is gushing out of her used slit.")

		# (else)
		elif(!usedCondom):
			saynn("You let go of her neck and hair, letting her rest her head against the concrete wall again. Her stuffed pussy starts leaking with some {pc.cum}.")

			saynn("[say=rahi]Thank y-you..[/say]")

			saynn("You pull your messy cock out, the shower water quickly cleans it. Kitty moans again as more {pc.cum} is gushing out of her used slit. You let go of her hands and she slides down to her knees, still trying to catch her breath.")

			# (end)

		saynn("[say=rahi]S-she will clean herself.. S-see you around..[/say]")

		saynn("You give her a quick smooch on the cheek and leave like so.")

		# (scene ends)
		addButton("Continue", "That's nice", "endthescene")

	if(state == "lick_her_out"):
		playAnimation(StageScene.SexOral, "start", {
			pc="rahi", npc="pc", 
			bodyState={naked=true,},
			npcBodyState={naked=true},
		})
		
		saynn("You put your hand on her shoulder and turn her around until she is facing you before embracing her again. She can’t hide her blushing face anymore, you give her lips a swift lick and she mewls back. Your hand slides down from the kitty’s shoulder and follows her slim curves, it cups her perky breasts and then explores lower, brushing over her belly and then sliding between her legs, finding the little sensitive bean that is her cilt.")

		saynn("Her breathing changes to be more deep, she closes her legs around your hand, preventing you from exploring her further, her own paws are pushed into your chest. You gently bite on her ear and then whisper to her.")

		saynn("[say=pc]Want me to go easy on you, Kitty?[/say]")

		saynn("She is being shy and quiet, her ears droop and her tail wraps around her leg.")

		saynn("[say=rahi]No.. please be rough..[/say]")

		saynn("Interesting answer. The kitty is clearly way more kinky than you thought. Well then, you put on your mean face for her and an intimidating voice.")

		saynn("[say=pc]Gonna ask only once. Hands behind your back.[/say]")

		saynn("Kitty picks up on the shift in tone of your voice. She is not too fast to obey so you help her by catching her hands and wrenching them behind her. She seems to obey and holds her hands still, her submissive stare is directed down at the shower drainage panel.")

		saynn("Then you shove your knee between her legs and force-spread them before giving her thighs a smack. Your hands pin the kitty against the wall while your knee is pushed into her crotch, rubbing against her pink pussy lips and the clit. Kitty can’t hold her moans from escaping anymore, she clearly enjoys it.")

		saynn("[say=pc]You love being used?[/say]")

		saynn("[say=rahi]..maybe[/say]")

		saynn("You chuckle and then replace your knee with your hand, your digits land on her snatch and spread the petals open, showing how wet and juicy the kitty is inside. Your big thumb is teasing her clit again, doing little circular motions, they make the feline moan louder and try to close her legs again. But after you give her thighs another smack, she is spreading her legs open for you again and stands still.")

		addButton("Crouch", "Get down to business", "crouch")

	if(state == "crouch"):
		playAnimation(StageScene.SexOral, "lick", {
			pc="rahi", npc="pc", 
			bodyState={naked=true,},
			npcBodyState={naked=true},
		})
		
		saynn("Seeing that the kitty is not gonna resist anymore, you grab her by the chin and force her to look at you.")

		saynn("[say=pc]Don’t be quiet, I wanna hear you moan. Got it?[/say]")

		saynn("She nods. You let go of her chin and then lower yourself to your knees before her. You get a great view of her pussy, the pink petals look nice and careful, the sensitive bump is barely visible from under its hood. Little brown bush above the pussy looks nicely trimmed. You almost don’t see any wear and tear. And the scent.. Well, she is clearly aroused.")

		saynn("You stick your tongue out and give her slit a nice lick, you drag your tongue along her petals until you reach her little bump. You trace some circles around it, making it wet with your saliva and then suck on it, causing kitty to arch her back slightly and let out a few cute pleasure noises.")

		saynn("You can see, hear and feel that she likes it so you increase your onslaught, you grab one of her legs under the knee and raise it up before pinning the leg to the wall, causing the kitty to meow surprised. That gives you even more access to her pussy that now looks slightly spread by itself. You press your lips against her private ones and begin prodding at her pussy entering, getting a feel for how tight she is. You get her arousal onto your tongue and wow, she tastes amazing. You keep trying and eventually your tongue manages to stretch her enough and then slips inside.")

		saynn("She is.. warm.. very warm. Her body reacts by squirming around your tongue as you explore her from the inside. Her moans are quiet but she drags each one. You rub your nose into her clit while lapping at her soft inner walls, sending lots of pleasure her way.")

		saynn("[say=rahi]T-this feels very good..[/say]")

		saynn("She keeps her mouth opened, her tongue out. She is panting and moaning as you begin to thrust your tongue in and out, tongue-fucking the cat. You can feel it becoming easier as her walls become lubed from your saliva and her juices. You think you found something very interesting, a little button inside her. You, of course, begin to hammer at it with your tongue, causing the feline to arch her back even more and yank her head up as she feels her g-spot being stimulated.")

		saynn("Her legs begin to shiver, she is clearly struggling to keep her hands where they are but she loves this too much to disobey, her moans are unrestricted, loud, passionate, her pussy is clenching around your tongue, she is clearly about to cum.")

		saynn("[say=rahi]She is g-gonna.. Ah..[/say]")

		addButton("Make her cum", "Only one way out", "make_her_cum")

	if(state == "make_her_cum"):
		saynn("And you don’t stop, you want that kitty to cum hard so you only increase your pace. You slide your tongue inside her with your full strength while trying to curve it so its tip would pound at the kitty’s pleasure spot. And it doesn’t take long..")

		saynn("After about ten seconds of full blown assault on her g-spot, kitty lets out some very loud moans and cums. Her body starts to shake before you, she bends forward and then arches her back the next second, her supporting leg barely keeps her up standing. Your tongue overstimulated her so much that her needy pussy squirts directly into your face and on your tongue. You catch all the juices you can and swallow them, the rest quickly gets washed away by the shower. Kitty keeps squirming and moaning while you keep tongue-fucking her through her climax. Luckily the sound of running water hides the noises somewhat.")

		saynn("[say=rahi]S-she can’t s-stop.. it f-feels so g-good..[/say]")

		saynn("And soon enough, her slit pulsates and squirts more of her female juices, noticeably less this time as she becomes tired. But still, you carefully lap at her insides and gather everything you can before swallowing it all up. Kitty is panting and so are you, your tongue got some very nice exercise. You pull it out and let the kitty rest.")

		saynn("[say=pc]You can relax, kitty.[/say]")

		saynn("[say=rahi]T-thank you..[/say]")

		saynn("You let go of her leg and stand up. Kitty’s face is red as a sun, somehow she still looks shy even though you just watched her cum in front of you. You chuckle and give her a quick kiss on the lips while the shower cleans you both of any bodily fluids.")

		saynn("[say=rahi]We s-should stop.. before anyone finds us..[/say]")

		saynn("[say=pc]I don’t mind that.[/say]")

		saynn("Kitty turns off the water and then gives you a warm hug.")

		saynn("[say=rahi]She will see you around..[/say]")

		saynn("Then she proceeds to sneak out of your grasp and into the dressing room.")

		# (scene ends)

		addButton("Continue", "That's nice", "endthescene")
		

func _react(_action: String, _args):
	if(_action in ["intervene", "rub_her_back", "crouch", "cum_inside"]):
		processTime(RNG.randi_range(3, 10)*60)
		
	if(_action in ["make_her_cum", "use_condom", "just_kiss", "no_condom"]):
		processTime(RNG.randi_range(20, 40)*60)
	
	if(_action == "rub_her_back"):
		GM.pc.afterTakingAShower()
		getCharacter("rahi").afterTakingAShower()
	
	if(_action == "use_condom"):
		usedCondom = true
		setState("fucking")
		return
		
	if(_action == "no_condom"):
		usedCondom = false
		setState("fucking")
		return

	if(_action == "make_her_cum"):
		GM.pc.addSkillExperience(Skill.SexSlave, 30, "rahi_showerlick")
		getModule("RahiModule").advanceSkill("rahiSkillSex")

	if(_action == "cum_inside"):
		getModule("RahiModule").advanceSkill("rahiSkillSex")
		if(usedCondom):
			var chance = GM.pc.useBestCondom()
			condomBroke = GM.pc.shouldCondomBreakWhenFucking("rahi", chance)
		
		if(!usedCondom || (usedCondom && condomBroke)):
			getCharacter("rahi").cummedInVaginaByAdvanced("pc", {condomBroke=condomBroke})
			GM.pc.addSkillExperience(Skill.SexSlave, 30, "rahi_showerfuck")
		else:
			GM.pc.addSkillExperience(Skill.SexSlave, 50, "rahi_showerfuck")
			addFilledCondomToLootIfPerk(getCharacter("pc").createFilledCondom())
		GM.pc.orgasmFrom("rahi")

	if(_action == "endthescene"):
		endScene()
		return
	
	if(_action == "cleanholesandend"):
		getCharacter("rahi").clearOrificeFluidsCheckBlocked()
		endScene()
		return
	
	setState(_action)

func saveData():
	var data = .saveData()
	
	data["usedCondom"] = usedCondom
	data["condomBroke"] = condomBroke
	data["isSlavery"] = isSlavery
	
	return data
	
func loadData(data):
	.loadData(data)
	
	usedCondom = SAVE.loadVar(data, "usedCondom", false)
	condomBroke = SAVE.loadVar(data, "condomBroke", false)
	isSlavery = SAVE.loadVar(data, "isSlavery", false)
