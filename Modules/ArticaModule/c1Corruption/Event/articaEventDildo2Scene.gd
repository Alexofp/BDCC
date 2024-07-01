extends SceneBase

var isNaked = false
var isCaged = false
var corruption = 0.0
var isSlut = false
var isVerySlut = false
var isLusty = false
var nakedAndShy = false
var npcID = ""

func _init():
	sceneID = "articaEventDildo2Scene"

func resolveCustomCharacterName(_charID):
	if(_charID == "npc"):
		return npcID

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
		aimCameraAndSetLocName("cellblock_lilac_nearcell")
		saynn("Artica, excited about something, rushes towards her cell, her hind paws hitting the floor with cute pit-pat sounds.")

		saynn("But when she steps in, her excitement quickly fades, replaced with disappointment.")

		saynn("She looks around and finds a note.. She quickly reads it and gasps before quickly heading off somewhere else"+str(", making sure her paws are covering her private bits." if nakedAndShy else "")+".")

		addButton("Note", "Take a look at it", "read_note")
	if(state == "read_note"):
		playAnimation(StageScene.Solo, "stand")
		saynn("You wait for Artica to leave and step into her cell. You grab the note that she left on her pillow and read it..")

		saynn("It's clearly from Socket.")

		saynn("[say=socket]Heya! I finished 3D printing the piece but no one seems to want to deliver it. I wrapped it up and everything, very discrete. I would do it myself but I don't know where your cell is, sorry! I left it in the workshop, under one of the benches. No one will find it I'm sure.[/say]")

		saynn("Makes you wonder how this note got here then..")

		addButton("Workshop", "Head over there", "in_workshop")
	if(state == "in_workshop"):
		playAnimation(StageScene.CanineDildoSex, "tease", {pc="artica", bodyState={hard=true}})
		aimCameraAndSetLocName("eng_workshop")
		saynn("As you step into the workshop, you see Artica's blushing face, her eyes wide.")

		saynn("She is staring at a package.. her package. It was indeed all wrapped up.. but it was soft wrapping, the shape was unmistakable. Obviously something also went wrong with the printing because its size is way bigger than Artica asked for, the thing is at least twice the size of her member..")

		saynn("For some reason, this sight makes you smile. Artica is blinking a lot, "+str("her shorts bulging heavily" if !isNaked else "her real cock throbbing eagerly")+"..")

		saynn("With a deep breath, she picks up the package, trying to act as nonchalant as possible.. but clearly failing. No pockets big enough to store this monster.. she holds it behind her back, her fluffy tail wrapped around it to conceal it as best as possible.")

		addButton("Continue", "See what happens next", "artica_walks_with_dildo")
	if(state == "artica_walks_with_dildo"):
		playAnimation(StageScene.Solo, "walk", {pc="artica", bodyState={hard=true}})
		aimCameraAndSetLocName("mining_nearentrance")
		saynn("The corridors feel longer than usual, each Artica's step accompanied by the fear of getting spotted.")

		saynn("She tries to take the least crowded route.. but she obviously can't avoid the elevator. She presses the button to call it with her hind paw, her hands busy holding the heavy thing behind her..")

		saynn("Artica freezes when a couple of inmates walk by, their conversation stops when they glance at her. The fluff's heart is pounding in her chest as she forces a smile.")

		saynn("They give her a few curious gazes.. but eventually decide to head towards the mine shafts, letting Artica exhale audibly.")

		saynn("The doors of the elevator finally open..")

		saynn("[say=risha]Oh, it's you.[/say]")

		saynn("[say=artica]Eep..[/say]")

		addButton("Continue", "See what happens next", "risha_meets_artica")
	if(state == "risha_meets_artica"):
		addCharacter("risha")
		playAnimation(StageScene.Duo, "stand", {pc="artica", npc="risha", bodyState={hard=true}})
		saynn("The mean guard steps out of the elevator, coming face-to-face with Artica.")

		if (isNaked):
			saynn("[say=risha]The slut is getting used to staying naked, huh."+str(" And carrying someone's cubs too, such a breeding whore." if getCharacter("artica").isVisiblyPregnant() else "")+"[/say]")

		else:
			saynn("[say=risha]Surprised you're still not forced to be naked, huh."+str(" At least someone has knocked you up." if getCharacter("artica").isVisiblyPregnant() else "")+"[/say]")

		saynn("[say=artica].. ..[/say]")

		saynn("Risha's eyes narrow as she inspects Artica up and down, feeling that something is off..")

		saynn("[say=risha]What's that you're hiding, slut?[/say]")

		saynn("Artica's mind is racing. Who knows what will happen to her toy if it will be discovered by that asshole guard..")

		saynn("[say=artica].. .. ..[/say]")

		saynn("Risha's skeptical gaze stays on.")

		saynn("[say=risha]Really? Your tail got tangled? Let me see, I know how to bend and unbend anything.[/say]")

		saynn("Desperation was pumping through Artica's veins..")

		addButton("Continue", "See what happens next", "artica_gets_on_her_knees")
	if(state == "artica_gets_on_her_knees"):
		playAnimation(StageScene.Duo, "kneel", {pc="artica", npc="risha", bodyState={hard=true}})
		saynn("Summoning all her courage, Artica does the only thing she could think of. She drops to her knees and lowers her head, assuming a position of total submission.. but with her paws still behind her back.")

		saynn("[say=artica].. .. ..[/say]")

		saynn("[say=risha]Why would I care if you had a hard day in the mineshaft. I'm glad that you're not being useless though.[/say]")

		saynn("Artica puts on her big puppy eyes.")

		saynn("[say=artica].. .. ..? ..[/say]")

		saynn("Risha raises an eyebrow, clearly enjoying the sight of Artica humiliating herself.")

		saynn("[say=risha]Anything, you say?[/say]")

		saynn("The fluff's cheeks blush as she feels a mix of shame and determination.. before nodding.")

		saynn("Risha smirks.")

		saynn("[say=risha]Hands against the wall, slut. Spread your legs too, you don't want barbs scratching you too much.[/say]")

		saynn("Artica's heart sank, her attempts to save her butt didn't work. Seems like she needs some help. You notice that the elevator doors are still open..")

		addButton("Yoink Artica", "Help her to get out of this situation", "help_artica_unstuck_risha")
	if(state == "help_artica_unstuck_risha"):
		removeCharacter("risha")
		playAnimation(StageScene.Duo, "stand", {npc="artica"})
		saynn("Casually, you walk past the two, stopping for a second.")

		saynn("[say=pc]Hey there.[/say]")

		saynn("Risha's mean eyes follow you, her hand reaching for her weapon.")

		saynn("[say=risha]Mind your own business, inmate.[/say]")

		saynn("Artica's big eyes stare at you. You give her a subtle wink.")

		saynn("[say=pc]Mhm. I do, I do.[/say]")

		saynn("Seeing Risha's weapon, you pretend that you're scared..  You step into the elevator.. and press the button that corresponds to the cellblock floor.")

		saynn("[say=artica]Wai-..[/say]")

		saynn("But before the doors close, you suddenly reach your hand out and grab Artica's collar.. before yanking her into the elevator.")

		saynn("You only hear..")

		saynn("[say=risha]What a bitch..[/say]")

		saynn("..before the doors finally break your eye contact. The metal room starts moving up with an annoying screech.")

		saynn("Artica is panting heavily, still holding something behind her.")

		saynn("[say=pc]How are you?[/say]")

		saynn("[say=artica]Y-yeah.. I'm okay.. t-thank you![/say]")

		saynn("[say=pc]Need any help?[/say]")

		saynn("You lean a bit, teasingly trying to see what Artica is holding. But she turns away.")

		saynn("[say=artica]Not really.. I'm good I think..[/say]")

		saynn("Your smug smile makes her blush. Better not to embarrass the poor fluff any more, she deserves to have some fun too.")

		saynn("[say=pc]Fine, keep your secrets.[/say]")

		saynn("The doors open.. Artica rushes off.")

		addButton("Follow", "See what she will do", "artica_in_cellblock_oops")
	if(state == "artica_in_cellblock_oops"):
		aimCameraAndSetLocName("cellblock_nearcells")
		playAnimation(StageScene.Solo, "jog", {pc="artica"})
		saynn("Trying to avoid too many gazes, Artica runs down the corridor, her cheeks blush from embarrassment.. and excitement. She holds the wrapped package tightly, the tail wrapped around it, concealing it mostly.")

		saynn("She sees the lilac block, probably already imagining how much fun she is gonna have..")

		saynn("But then..")

		addButton("Continue", "See what happens next", "artica_trips")
	if(state == "artica_trips"):
		playAnimation(StageScene.Solo, "defeat", {pc="artica"})
		aimCameraAndSetLocName("cellblock_lilac_nearcell")
		GM.pc.setLocation("cellblock_lilac_nearcell")
		saynn("..in her haste, she trips.")

		saynn("[say=artica]EE-eek![/say]")

		saynn("As Artica sprawls all over the floor, the package slips from her hands, skidding across the floor before coming to a stop in the middle of the lilac cellblock..")

		saynn("Poor fluff is not having the best day, huh. As she scrambles to her feet, she realizes that it was too late, other lilacs already noticed the strange new object..")

		addButton("Continue", "See what happens next", "lilacs_near_dildo")
	if(state == "lilacs_near_dildo"):
		playAnimation(StageScene.CanineDildoSex, "tease", {pc="artica"})
		saynn("A crowd quickly gathers around the package, their eyes widening as they realize what it was.")

		saynn("[sayMale]What's this?[/sayMale]")

		saynn("[sayFemale]Looks like a giant dildo![/sayFemale]")

		saynn("Whispers and giggles fill the air. More and more lilacs surround the object like it's some kind of art piece..")

		saynn("[sayMale]Who does it belong to?[/sayMale]")

		saynn("Artica desperately tries to push her way through the crowd to reclaim her toy.. but she is quickly met with resistance from stronger folks.")

		saynn("[say=artica]..eek.. c-can I..[/say]")

		saynn("[sayFemale]I saw it first, it's mine![/sayFemale]")

		saynn("[sayMale]Nu huh. Fuck off. I'm taking it for myself![/sayMale]")

		saynn("[sayFemale]Fuck you, give me![/sayFemale]")

		saynn("The crowd seems to want to fight for that dildo, every lilac seemingly wanting to have it. Artica's heart sinks, any hope seems to be disappearing fast as she has no chance of beating anyone.. let alone everyone. So much effort to get that toy.. just to lose it..")

		addButton("Continue", "See what happens next", "a_solution")
	if(state == "a_solution"):
		saynn("Lilacs begin kicking each other, pulling on each other's hair, biting ankles.. until a loud voice stops them.")

		saynn("[sayMale]Wait! Wait! Stop fighting! How about this, I know how we can handle this! A challenge for the brave ones![/sayMale]")

		saynn("The crowd gives the random lilac a benefit on the doubt.")

		saynn("[sayMale]Listen, the dildo has a giant knot. Let's say.. whoever can get knotted by it.. deserves to keep it![/sayMale]")

		saynn("There is a murmur of agreement happening between the lilacs. It seems.. The crowd was filled with like-minded sluts, all eager for a good challenge. Artica looks.. hopeful again.")

		addButton("Continue", "See what happens next", "first_person_rides")
	if(state == "first_person_rides"):
		playAnimation(StageScene.CanineDildoSex, "sex", {pc=npcID, skipToHover=true, bodyState={naked=true, hard=true}})
		saynn("The toy.. if you could call it that.. was kindly lubed by someone generous. A giant queue forms naturally, sorted by inmate's strength.")

		var npcHasPussy = getCharacter(npcID).hasReachableVagina()
		saynn("The crowd watches eagerly as the first inmate approaches the giant dildo. {npc.He} straddles it, {npc.his} legs spread wide. Taking a deep breath, {npc.he} lowers {npc.himself} onto the shaft, {npc.his} "+str("wet pussy" if npcHasPussy else "eager tailhole")+" enveloping the girthy toy. {npc.He} lets out a soft moan, {npc.his} hips moving in a slow, deliberate rhythm.. but quickly gaining speed..")

		saynn("[sayMale]Come on, try it already![/sayMale]")

		saynn("{npc.He} increased {npc.his} pace, riding the dildo faster and harder, {npc.his} moans growing louder. {npc.He} rocked {npc.his} hips, trying to force the full length, knot included, inside.. but it was proving to be too large.."+str(" {npc.his} pussy just wasn't stretching wide enough to take that fat orb in.." if npcHasPussy else " {npc.his} ass just wasn't stretching wide enough to take that fat orb in..")+"")

		saynn("[sayFemale]Let me try![/sayFemale]")

		saynn("With a final, desperate thrust, {npc.he} tries to take the knot.. but failing to do, {npc.his} body getting so tight around the giant rubber cock that {npc.he} cums fast, {npc.his} body shaking and shivering.."+str(" {npc.his} pussy clenching tightly around the shaft, {npc.his} juices coating it and dripping onto the floor.." if npcHasPussy else " {npc.his} anal walls clenching tightly around the shaft..")+""+str(" {npc.his} {npc.penis} shooting spurts of seed super far!" if getCharacter(npcID).hasReachablePenis() else "")+"")

		saynn("[sayMale]Alright! Me-me-meee[/sayMale]")

		addButton("Continue", "See what happens next", "second_person")
	if(state == "second_person"):
		playAnimation(StageScene.CanineDildoSex, "fast", {pc=npcID, skipToHover=true, bodyState={naked=true, hard=true}})
		saynn("One by one, people started taking turns riding the dildo.. Seeing all the various inmates ride the exact replica of Artica's cock.. makes her moan softly, her legs rubbing against each other..")

		var npcHasPussy = getCharacter(npcID).hasReachableVagina()
		var npcHasPenis = getCharacter(npcID).hasReachablePenis()
		saynn("Another inmate approaches and straddles the toy gracefully, positioning {npc.himself} over the slick, rubber cock. The crowd became quiet, watching intently as {npc.he} began {npc.his} attempt.")

		saynn("{npc.He} lowers {npc.himself} onto the shaft slowly, letting out a soft, breathy moan as it stretched {npc.his} "+str("pussy slit" if npcHasPussy else "eager tailhole")+" wide open. {npc.His} hips began to move.. fast. way faster than anyone who tried it before.")

		saynn("The inmate was practically slamming {npc.himself} down onto that toy, the fat knot slapping against {npc.his} stretched fuckhole with each thrust.. and slowly stretching it more and more, the pointy tip creating a bumpy outline on {npc.his} belly.."+str(" {npc.his} cock bobbing up and down, the toy stimulating {npc.his} pleasure spot.." if npcHasPenis else "")+"")

		saynn("Could this be it? Artica looks scared..")

		saynn("[sayMale]{npc.He} is doing it![/sayMale]")

		saynn("[sayFemale]Don't you fucking dare! I wanna try stretching my ass with it first![/sayFemale]")

		addButton("Continue", "See the fate of that dildo..", "second_cums")
	if(state == "second_cums"):
		playAnimation(StageScene.CanineDildoSex, "inside", {pc=npcID, pcCum=true, bodyState={naked=true, hard=true}})
		var npcHasPussy = getCharacter(npcID).hasReachableVagina()
		var npcHasPenis = getCharacter(npcID).hasReachablePenis()
		var npcHasProstate = (npcHasPenis && !npcHasPussy)
		var npcHasPenisGspot = (npcHasPenis && npcHasPussy)
		saynn("The inmate could feel the toy stretching {npc.him} wider.. almost slipping inside..")

		saynn("With a final, powerful thrust, {npc.he} tries to force it inside.. letting out a cry of ecstasy in the process as {npc.he} cums hard, {npc.his} body convulsing from the intense stretching, "+str("{npc.his} pussy clenching hard and squirting juices all over the toy, inner walls milking the thick shaft.." if npcHasPussy else "{npc.his} asshole clenching hard, inner walls milking the thick shaft..")+" "+str("{npc.his} {npc.penis} spurted thick ropes of {npc.cum} as {npc.his} prostate was milked dry, {npc.his} body shaking uncontrollably.." if npcHasProstate else "")+""+str("{npc.his} {npc.penis} spurted thick ropes of {npc.cum} as {npc.his} g-spot was squeezed hard, {npc.his} body shaking uncontrollably.." if npcHasPenisGspot else "")+"")

		saynn("And yet.. {npc.he} couldn't take it in.. no matter what.")

		saynn("[sayMale]Haha, the dildo is still up for grabs! Who is gonna prove that they're the biggest slut here?![/sayMale]")

		saynn("{npc.He} just stayed there, panting and trembling.. before slowly lifting {npc.himself} off the dildo, {npc.his} face showing satisfaction.. but also anger. {npc.He} came so close after all.")

		saynn("Artica's heart was pounding as she watched the others take turns with the rubber copy of her cock.. But now it was her turn..")

		addButton("Artica", "See what she will do", "artica_turn")
	if(state == "artica_turn"):
		addCharacter("artica", ["naked"])
		playAnimation(StageScene.CanineDildoSex, "hover", {pc="artica", bodyState={naked=true, hard=true}})
		saynn("The fluff steps forward, her legs trembling with a mix of excitement and anxiety. Artica takes a deep breath"+str(" and undresses, exposing herself fully to the eager crowd, putting out on display both her wet pussy and {artica.penis}.." if !isNaked else ", her wet pussy and {artica.penis} are both out on display for the eager crowd..")+" There was no turning back now.")

		saynn("She grabs a bottle of the offered lube.. and puts some on her paws before spreading it all over the surface of that dildo. Seeing what is essentially her own cock.. from up so close.. with all of its veins and bumps faithfully represented.. makes Artica swallow a lot, her mouth watering non-stop.. The rest of the lube she uses on her sensitive cyan pussy folds, making them nice and slick..")

		saynn("After that, the fluff positions herself above the giant toy, the tip already brushing against her wet dripping slit."+str(" Her caged up member is twitching a lot behind its metal prison.." if isCaged else " Her real member is twitching a lot..")+"")

		saynn("[sayFemale]We don't have all the time, hurry up![/sayFemale]")

		saynn("[sayMale]Let the girl enjoy herself, that's the last time she is seeing this dildo anyway.[/sayMale]")

		saynn("The pressure was on..")

		addButton("Continue", "See what happens next", "artica_starts_riding")
	if(state == "artica_starts_riding"):
		playAnimation(StageScene.CanineDildoSex, "sex", {pc="artica", bodyState={naked=true, hard=true}})
		saynn("The size of that toy made Artica hesitate for a moment.. but she decides to commit, lowering herself onto it. The pointy tip slides inside her pussy easily, stretching Artica just enough to make her let out a soft moan and bite her lip.")

		saynn("[say=artica]..mmmh..[/say]")

		saynn("She was lowering herself more and more, her slick inner walls stretching wide. When she reaches the fat knot.. she stops and starts raising instead, moving very slowly, taking her time to adjust to the girth. An immense amount of lube makes it easier.. but not easy by any means..")

		saynn("Artica closes her eyes and moans more, feeling the crowd's eyes on her even while not looking at them.. their whispers and words of encouragement blending with her love noises..")

		saynn("[say=artica]Mmmhh.. mmhha.. ah.. mmmh..[/say]")

		saynn("Over time, she begins to push harder, riding that dildo at a respectable pace, "+str("her locked cock dripping plenty of pre inside of its little cage, bobbing up and down a lot.." if isCaged else "her real cock dripping eagerly, bobbing up and down a lot..")+"")

		addButton("Continue", "See what happens next", "artica_rides_faster")
	if(state == "artica_rides_faster"):
		playAnimation(StageScene.CanineDildoSex, "fast", {pc="artica", bodyState={naked=true, hard=true}})
		saynn("Her breathing was deep and quick, her hips moving in a steady rhythm, each thrust bringing her closer to the knot, the swollen orb pressing insistently against her pussy entrance more and more, spreading it wide.. unnaturally wide.")

		saynn("[say=artica]Ah.. ahh-.. ah.. so big..ah..[/say]")

		saynn("She kept riding and riding, biting her lip as she was bringing herself down onto that rubber rod hard, now purposefully trying to get herself knotted.. The sensation of being stretched so much is making her toes curl, her tail wagging in short bursts, her ears twitching.")

		saynn("[say=artica]Mmm-m.. mmhh.. mh-ahh..ah.. p-please.. ah..[/say]")

		saynn("You can see it clearly.. Artica is taking more of that knot each time she slams her body onto it.. Her cyan pussy is stretched beyond limit.. but she keeps going at it, the pleasure waves making her whole body shiver.")

		saynn("[sayMale]Wow, she is fucking doing it! The slut almost got the knot inside![/sayMale]")

		saynn("[sayFemale]I will believe it when I see it.[/sayFemale]")

		saynn("She could feel it.. She knew she could do it.. She had to..")

		addButton("Continue", "See what happens next", "artica_fails_to_take_the_knot")
	if(state == "artica_fails_to_take_the_knot"):
		playAnimation(StageScene.CanineDildoSex, "inside", {pc="artica", pcCum=true, bodyState={naked=true, hard=true}})
		saynn("With one final incredible push, she breaks through the mental barrier, bringing herself down with all her strength.. so hard that the orgasm overwhelms her soon after. Her pussy clenches hard around the dildo, squirting juices onto it, her "+str("caged cock shooting cum wildly, sending thick ropes of seed to splatter all over the floor" if isCaged else "hard cock shooting cum wildly, sending thick ropes of seed to splatter all over the floor")+".. She trembles uncontrollably, the organic waves mixing with a deep sense of.. disappointment..")

		saynn("[say=artica]NHHhh.. AHh-h..ah..[/say]")

		saynn("[sayFemale]Ha, I knew it![/sayFemale]")

		saynn("Artica didn't manage to take the knot.. realization hitting her hard..")

		saynn("[sayMale]Alright-alright, who is next then?[/sayMale]")

		saynn("[say=artica]..n-no.. oh no.. h-h..[/say]")

		saynn("She tried a few more times.. but to no avail.. her legs are shaking, messing with her balance. The crowd was cheering for her effort.. but Artica only heard the mean comments.. her body exhausted.. her mind full of sadness..")

		addButton("Continue", "See what happens next", "artica_getsup_after_fail")
	if(state == "artica_getsup_after_fail"):
		playAnimation(StageScene.Duo, "stand", {npc="artica", npcBodyState={naked=true}})
		saynn("Artica slowly lifts herself off the dildo, panting heavily as her stretched wide pussy tries to close up. She looks.. spaced out.. just staring at other inmates that begin riding her toy..")

		saynn("Her lips are trembling.. tail squeezed between her legs.. ears lowering..")

		addButton("Comfort her", "Try to calm the fluff down", "do_comfort")
		addButton("Participate yourself!", "Try to win that dildo for Artica", "do_participate")
	if(state == "do_comfort"):
		setFlag("ArticaModule.nextReaction", "d2won")
		playAnimation(StageScene.Hug, "hug", {pc="pc", npc="artica", npcBodyState={naked=true, hard=true}})
		saynn("You offer the fluff a warm hug, your arms wrapping around her trembling body while she buries her face into your shoulder.")

		saynn("[say=pc]You did great, Artica. Really. Was a great show.[/say]")

		saynn("[say=artica]..but I didn't..[/say]")

		saynn("[say=pc]Yeah, it's fine.[/say]")

		saynn("Random inmates continue to push their luck with the toy, trying to force it inside fully, their moans echoing around the whole cellblock..")

		saynn("[say=pc]Sometimes giving up is the right choice. Gotta learn when to cut your losses.[/say]")

		saynn("Artica rests on her head on your shoulder.. sneakily watching others try and fail."+str(" Seeing her scaled up cock is making her horny again, her real member brushing against your leg as she is hugging you.." if !isCaged else " Seeing her scaled up cock is making her horny again, her chastity cage rubbing against your leg and she is gently humping your leg..")+"")

		saynn("[say=artica]..you t-think.. I can t-try again maybe?..[/say]")

		saynn("[say=pc]Are you sure? That might not be a good idea, your..[/say]")

		saynn("While you were saying that, Artica was already standing in the queue again, waiting for her turn.")

		saynn("[say=artica]I will try again..[/say]")

		saynn("She sure wants that dildo.. makes sense though.")

		addButton("Continue", "See what happens next", "again_start")
	if(state == "again_start"):
		playAnimation(StageScene.CanineDildoSex, "hover", {pc="artica", bodyState={naked=true, hard=true}})
		saynn("Soon, it was her turn once more. Artica stepped forward, meeting with her dildo again. You give her a reassuring nod, a good luck of sorts..")

		saynn("The fluff positions herself above the giant knotted dildo, her pussy already slick from anticipation.")

		saynn("[sayMale]You again? You really want to destroy your cunt, don't you?![/sayMale]")

		saynn("[sayFemale]I mean.. loose holes are good for double penetrations..[/sayFemale]")

		saynn("She didn't listen to the crowd, just focussing on her body and her breathing..")

		addButton("Continue", "See what happens next", "again_starts_riding")
	if(state == "again_starts_riding"):
		playAnimation(StageScene.CanineDildoSex, "sex", {pc="artica", bodyState={naked=true, hard=true}})
		saynn("Slowly, she lowers herself onto the toy, feeling the thick shaft filling her pussy once again, every vein and ridge pressing against her inner walls. She began with a gentle rhythm, bouncing up and down on the toy, letting her body adjust to the shape. She is going deeper and deeper on it though..")

		saynn("[say=artica]Mmhh-.. ah..[/say]")

		saynn("A first moan leaves her lips as the toy's tip finds her tight cervix, sending electrifying jolts of pleasure though her, "+str("her cock twitching eagerly" if !isCaged else "her caged cock twitching eagerly")+"..")

		saynn("[sayFemale]Mmm.. doubt that she will do it.. but this is so hot..[/sayFemale]")

		saynn("Even when the dildo starts hammering away at her womb entrance, Artica keeps trying to impale herself deeper, creating a cute bump on her belly as the toy squeezes and pushes on her tight babymaker..")

		addButton("Continue", "See what happens next", "again_artica_rides_faster")
	if(state == "again_artica_rides_faster"):
		playAnimation(StageScene.CanineDildoSex, "fast", {pc="artica", bodyState={naked=true, hard=true}})
		saynn("Gradually, Artica picks up the pace, her hips moving faster, pussy greedily swallowing the fat girthy shaft. She could feel the knot pressing insistently at her entrance.. but she just tried not to think about it, enjoying the ride and letting the fat orb stretch her pussy wider with each thrust.")

		saynn("[say=artica]Mmhh.. ah.. ahh..ah.. s-such a good c-cock.. ah..[/say]")

		saynn("You can tell that the pressure is already building in her, the fluff is moaning patiently, her body shivering.")

		saynn("[sayMale]C'mon, cum already and move on, you're wasting our time.[/sayMale]")

		saynn("Whoever that is, they are wrong.. Something is about to happen, for sure..")

		addButton("Continue", "See what happens next", "artica_knots_dildo_yay")
	if(state == "artica_knots_dildo_yay"):
		playAnimation(StageScene.CanineDildoSex, "knotinside", {pc="artica", pcCum=true, bodyState={naked=true, hard=true}})
		saynn("The pressure built to an almost unbearable peak, Artica's pussy clenching tightly around the thick shaft. But then, suddenly, after one of the big thrusts, the fluff feels the knot slip inside her with a wet, satisfying pop..")

		saynn("[say=artica]AHHHhhh..!..[/say]")

		saynn("Artica screams in ecstasy, her body convulsing as the full length went inside her, the pointy tip breaking through her cervix and pushing on the womb. All her muscles tensing up, she instinctively tries to yank herself away.. but the heavy toy keeps her grounded, instead making her slump back, her shaking paws supporting her from collapsing and hurting herself..")

		saynn("[sayMale]Holy.. What the..[/sayMale]")

		saynn("[sayFemale]NOOOO! IT SHOULD HAVE BEEN ME![/sayFemale]")

		saynn("[sayMale]I've never seen someone hilt that big of a knot..[/sayMale]")

		saynn("The girl throws her head back and cums hard, her pussy gushing out girlcum and milking that big fat replica of her own cock as her mind is flooded with pleasure. Her real cock throbs and shoots strings of cum, her balls tensing up from her g-spot being smashed by that fat orb..")

		saynn("[sayMale]And so, we got a winner! This white and cyan lilac gets to keep the dildo all for herself![/sayMale]")

		saynn("[sayFemale]She will surely need it to get off after destroying her cunt like this..[/sayFemale]")

		saynn("Someone walks up to Artica and pats her on the head. While the fluff just moans and drools eagerly, her cock and pussy are still pulsing..")

		saynn("[sayMale]Anything you wanna say?[/sayMale]")

		saynn("[say=artica]Ahh-h.. y-yess.. I'm s-such a.. k-knot slut.. ahh-h..[/say]")

		saynn("Endearing. Makes you feel happy for the girl.")

		saynn("[sayMale]That you are. Enjoy your new toy, you earned it.[/sayMale]")

		addButton("Artica", "Go check on her", "after_won_artica")
	if(state == "after_won_artica"):
		playAnimation(StageScene.Duo, "stand", {npc="artica", npcBodyState={naked=true,hard=true}})
		saynn("Slowly, the crowd begins to disperse.. leaving you and Artica alone..")

		saynn("[say=pc]You did it, Artica.[/say]")

		saynn("[say=artica]Y-yeah.. ah.. t-thank you. I might.. n-need some help.. g-getting up.. ah..[/say]")

		saynn("You nod and offer her a hand.. two hands. Gently, you begin to pull her up off the toy. The thick knot, that's still lodged deep inside her, resisted at first, stretching her pussy even wider.. but it slowly began to slip out.")

		saynn("[say=artica]Ah.. AH![/say]")

		saynn("With a wet, audible pop, the knot finally slides out, leaving her pussy to gape wide open.. You support Artica as her legs are still weak.")

		saynn("The toy.. looks wet.. coated in a layer of lube and Artica's juices..")

		saynn("[say=artica]I will.. b-bring it to my cell..[/say]")

		saynn("[say=pc]Sure. Enjoy yourself.[/say]")

		saynn("[say=artica]I will.. haha.. Thank you..[/say]")

		saynn("She grabs the toy and starts taking a few shaky steps, her hind paws slowly regaining their strength.")

		saynn("After that great show, it was time to go..")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "do_participate"):
		setFlag("ArticaModule.nextReaction", "d2pc")
		playAnimation(StageScene.CanineDildoSex, "tease", {pc="pc"})
		saynn("You can't watch Artica when she is so sad. You gotta help her win that dildo.. So you join the queue.")

		saynn("Artica tilts her head, seeing you.")

		saynn("[say=pc]Don't worry, you're not alone in this. I will help you get the toy.[/say]")

		saynn("[say=artica]You will?.. H-how?..[/say]")

		saynn("Your eager smile tells her everything. Her eyes go big, she opens her mouth to tell you something secret.. but decides against it.")

		saynn("The queue of inmates moves quickly, people cumming from that toy only after a few minutes each..")

		saynn("It was finally your turn..")

		saynn("[say=artica]G-good luck..[/say]")

		saynn("Seeing how many people failed to hilt that dildo.. you will surely need it..")

		addButton("Dildo", "Approach it", "pc_approach_dildo")
	if(state == "pc_approach_dildo"):
		playAnimation(StageScene.CanineDildoSex, "hover", {pc="pc", bodyState={naked=true, hard=true}})
		saynn("You stepped forward confidently"+str(", undressing and revealing your naked form to the crowd" if GM.pc.isFullyNaked() else ", displaying your naked form to the crowd proudly")+".")

		saynn("Without wasting much time, you position yourself over the giant knotted dildo. Your "+str("pussy is already slick and needy just from looking at it, arousal dripping down your juices." if GM.pc.hasReachableVagina() else "tailhole is already twitching needy just from looking at it.")+"")

		if (GM.pc.hasReachableVagina()):
			saynn("You guide the tip towards your {pc.pussyStretch} entrance.. and begin to lower yourself slowly, feeling the pointy silicon tip part your slit.. and spread the petals open.")

		else:
			saynn("You guide the tip towards your {pc.anusStretch} entrance.. and begin to lower yourself slowly, feeling the pointy silicon tip push on your star.. and spread it open.")

		addButton("Deeper..", "Take it as deep as you can", "pc_deeper")
	if(state == "pc_deeper"):
		playAnimation(StageScene.CanineDildoSex, "inside", {pc="pc", bodyState={naked=true, hard=true}})
		saynn("The toy's massive girth stretches your slick inner walls as you take more of it in, each inch making you feel fuller. Your hips move with deliberate slowness as you're trying to get used to Artica's scaled up member inside you, your "+str("pussy" if GM.pc.hasReachableVagina() else "tailhole")+" molding around its shape, feeling every ridge and vein..")

		saynn("[say=pc]So big.. nhh..[/say]")

		saynn("Artica bites her lip, watching you lowering yourself onto that toy.. Her paws keep nervously her body, cupping her {artica.breasts} and gently squeezing them"+str(", making some milk come out" if getCharacter("artica").canBeMilked() else "")+"..")

		saynn("[sayMale]C'mon, get it over with already, people are waiting.[/sayMale]")

		saynn("[sayFemale]Shut up and let {pc.him} enjoy it.[/sayFemale]")

		saynn("Eventually, the knot hits your "+str("pussy folds" if GM.pc.hasReachableVagina() else "anal star")+".. the ultimate challenge. You try to lower yourself further, feeling the swollen orb pressing against your entrance, stretching your "+str("slit" if GM.pc.hasReachableVagina() else "ass")+" to its natural maximum.. but not nearly enough to squeeze in..")

		saynn("It's obvious that it won't be that easy..")

		addButton("Ride it", "Try to work it in", "pc_ride_dildo_sex")
	if(state == "pc_ride_dildo_sex"):
		playAnimation(StageScene.CanineDildoSex, "sex", {pc="pc", bodyState={naked=true, hard=true}})
		saynn("Determined to help Artica, you start riding the dildo, sliding your "+str("pussy along its slick surface, its tip hammering at your cervix while the thick shaft rubs against your g-spot, making you moan eagerly." if GM.pc.hasReachableVagina() else "tailhole along its slick lubed-up surface, its tip reaching deep inside you while the thick shaft rubs against your pleasure spot, making you moan eagerly.")+"")

		saynn("Your "+str("pussy" if GM.pc.hasReachableVagina() else "ring")+" tightens around it.. but you keep trying to take it deep, the knot slapping against your sensitive flesh, each attempt stretching you out a bit more.")

		saynn("[say=pc]Mhh.. hell yeah.. ah..[/say]")

		saynn("You give Artica one quick glance.. She is squirming and panting, her eyes glued to you, her paws covering up her blushing cheeks.."+str(" Her real cock putting pressure on its cage.." if isCaged else " Her real cock is hard and drippy..")+"")

		saynn("You try and try.. but so far all you get is a feeling of fullness.. and a stretched "+str("pussy" if GM.pc.hasReachableVagina() else "tailhole")+".. you have to increase the onslaught..")

		addButton("Harder", "Ride the toy harder", "pc_ride_faster")
	if(state == "pc_ride_faster"):
		playAnimation(StageScene.CanineDildoSex, "fast", {pc="pc", pcCum=true, bodyState={naked=true, hard=true}})
		saynn("You need to win.. you must win.. so you ride that toy harder and faster, bringing yourself onto that knot with powerful thrusts, purposefully trying to stretch your "+str("pussy" if GM.pc.hasReachableVagina() else "ass")+".")

		saynn("Your moans fill the air, your inner walls gripping the dildo tightly. One forceful thrust after another.. the knot begins to slip inside you, inch by inch.. But the way it stimulates your every nerve.. makes you close already."+str(" Your cock is ready to burst at any second.." if GM.pc.hasPenis() else "")+"")

		saynn("[say=pc]Fuck.. ah.. c'mon.. s-stupid knot.. ah..[/say]")

		saynn("You try.. but you can't.. no matter how much you try to push it back, an orgasm overwhelms you eventually.. Your body begins to shake around that fat girthy cock, loud passionate moans leave your lips as your overstimulated "+str("pussy squirts all over the toy" if GM.pc.hasReachableVagina() else "tailhole clenches tightly around the toy")+""+str(", your {pc.penis} shooting thick ropes of {pc.cum} forward, your balls tensing up.." if GM.pc.hasPenis() else "")+"")

		saynn("[sayFemale]Aw. Not even {pc.he} could do it.[/sayFemale]")

		saynn("[sayMale]Uh huh. Stop stealing that bitch-breaker all for yourself, get up already.[/sayMale]")

		saynn("Looks like you failed.. all your muscles tense up, making riding that toy so hard, your sensitive "+str("pussy slit" if GM.pc.hasReachableVagina() else "asshole")+" becoming extra sensitive after that orgasm..")

		saynn("You look at Artica again.. and see her big sorry eyes.. they make you want to keep going.. How can you betray her like this?")

		saynn("Slowly, through all the pain and discomfort.. you continue impaling yourself on that replica of Artica's cock.. Your "+str("pussy" if GM.pc.hasReachableVagina() else "tailhole is")+" aching.. but you keep stretching it further..")

		saynn("[say=pc]Nghh.. f-fuck.. hh..[/say]")

		saynn("[sayFemale]Oh wow, {pc.he} keeps going![/sayFemale]")

		saynn("[sayMale]Give up already, you're making people wait.[/sayMale]")

		saynn("You moan louder and ride that toy harder, just to shut up that asshole. The discomfort slowly goes away as your love tunnel lubes itself up again, allowing you to quickly pick up the pace..")

		addButton("Harder", "Ride the toy even harder!", "pc_accidently_knots_toy")
	if(state == "pc_accidently_knots_toy"):
		playAnimation(StageScene.CanineDildoSex, "knotinside", {pc="pc", pcCum=true, bodyState={naked=true, hard=true}})
		saynn("Suddenly, one of the thrusts causes your "+str("pussy" if GM.pc.hasReachableVagina() else "anal ring")+" to stretch just enough..")

		saynn("The fat knot of that huge dildo slips inside a wet pop, filling you completely!")

		saynn("[say=pc]AH! Oh fuck![/say]")

		saynn("It's too much, your body is shaking, legs give up, making you slump back and catch yourself with your arms.. The toy.. it's fully inside you.. "+str("the tip breaking into your womb and stretching it out" if GM.pc.hasReachableVagina() else "the tip pushing on your inner walls")+", creating a huge bump on your belly..")

		saynn("[sayFemale]{pc.He} did it! Wow![/sayFemale]")

		saynn("[sayMale]Holy.. fuck..[/sayMale]")

		if (GM.pc.hasReachableVagina()):
			saynn("Pussy squirts, gushing girlcum all over the toy.. again and again.. the stimulation is enough to push you over the edge.. no, the whole ladder..")

		else:
			saynn("Your ass clenches around the toy.. again and again.. the stimulation is enough to push you over the edge.. no, the whole ladder..")

		saynn("You cry out a series of passionate moans, your inner walls squeezing that toy hard.."+str(" Your {pc.penis} wastes the rest of its {pc.cum}, your balls getting emptied in seconds.." if GM.pc.hasPenis() else "")+"")

		saynn("One of the inmates approaches you and crouches, making sure the full knot is inside you.. it is..")

		saynn("[sayMale]Looks like we have a winner! This inmates gets to keep the dildo all for {pc.himself}![/sayMale]")

		saynn("[sayFemale]NOOOO! IT SHOULD HAVE BEEN ME![/sayFemale]")

		saynn("[sayMale]I've never seen someone hilt that big of a knot..[/sayMale]")

		saynn("You look at Artica.. as best as you can. Oh wow, her expression is that of a lusty slut, she is panting while her paws are covering her "+str("caged throbbing cock" if isCaged else "hard throbbing cock")+", spurts of seed seem to be escaping between her clawed digits as she is struggling to contain her sudden orgasm.")

		saynn("The crowd begins to disperse.. some people sigh disappointed.")

		addButton("Enough", "Try to free yourself and give Artica the reward!", "pc_enough_givetoy")
		addButton("Knot-fucking!", "Why stop there?", "pc_knotfuck")
	if(state == "pc_enough_givetoy"):
		playAnimation(StageScene.Hug, "hug", {pc="pc", npc="artica", npcBodyState={naked=true, hard=true}})
		saynn("By applying some real strength.. you manage to free yourself, the knot slipping out of your gaping stretched fuckhole with a satisfying pop.")

		saynn("[say=pc]Ah..[/say]")

		saynn("The toy is.. drenched in lube and your juices..")

		saynn("Artica approaches you, her cheeks burning red as she is coming down from her own orgasm..")

		saynn("[say=pc]It's yours, Artica. You can.. grab it. Just.. carefully.[/say]")

		saynn("[say=artica]R-Really?.. You won it..[/say]")

		saynn("[say=pc]I won it for you.[/say]")

		saynn("Artica hugs you and nuzzles your cheek, chrrrring happily.")

		saynn("[say=artica]Thank you-u-u.. I couldn't do it w-without you..[/say]")

		saynn("You smirk.")

		saynn("[say=pc]I think you can~.[/say]")

		saynn("It makes her blush again. She grabs the toy by its base.. and licks the wet tip playfully.")

		saynn("[say=pc]The shape is amazing, one of the best cocks that I have ridden~.[/say]")

		saynn("[say=artica]Ah.. y-you t-think s-so?..[/say]")

		saynn("You nod, making the fluff squirm more while you just chuckle.")

		saynn("[say=pc]Go, hide it somewhere in your cell.[/say]")

		saynn("She nods back.. and quickly runs away towards her cell.")

		saynn("Wow, your "+str("pussy" if GM.pc.hasReachableVagina() else "tailhole")+" is still pulsing, struggling to close.. The afterglow is so strong..")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "pc_knotfuck"):
		playAnimation(StageScene.CanineDildoSex, "knot", {pc="pc", bodyState={naked=true, hard=true}})
		saynn("..but you still feel needy. Somehow, your body is craving more.")

		saynn("With one powerful yank, you free yourself from that knot, your gaping "+str("pussy" if GM.pc.hasReachableVagina() else "tailhole")+" pulsing as a wave of pleasure spreads through your whole body..")

		saynn("But rather than stop there, you continue riding the shaft, forcing your "+str("pussy" if GM.pc.hasReachableVagina() else "butt")+" onto that length again, making the knot pop in, locking you with the toy.. until you yank it out again.")

		saynn("[say=pc]Ah!.. Fuck yeah..[/say]")

		saynn("[sayFemale]What the fuck? Is {pc.she}..[/sayFemale]")

		saynn("[sayMale]Knot-fucking that giant dildo, yes. What a crazy slut.[/sayMale]")

		saynn("The crowd watches in awe as you casually let that fat knot pop in and out of your stretched, slick "+str("cunt" if GM.pc.hasReachableVagina() else "asshole")+", moaning passionately while doing so..")

		saynn("Your fuckhole, loosened up by that cock, stretches easily around the knot now.. allowing you to ride it faster.. Each time the knot pops out, you feel a cold emptiness inside you.. emptiness that is soon filled again by the thick silicone girth.")

		saynn("The knot is stimulating your sensitive spots perfectly.. smashing all of them.. You throw your head back and just moan, your body trembling as another orgasm washes over you, your "+str("pussy gushing out juices" if GM.pc.hasReachableVagina() else "asshole clenching again")+""+str(", cock dribbling your seed" if GM.pc.hasPenis() else "")+"..")

		addButton("Faster!", "More! More!", "pc_knotfuck_fast")
	if(state == "pc_knotfuck_fast"):
		playAnimation(StageScene.CanineDildoSex, "knotfast", {pc="pc", pcCum=true, bodyState={naked=true, hard=true}})
		saynn("Artica watches, mesmerized, her real cock throbbing with need as she can't look away from you..")

		saynn("Even during multiple orgasms, you keep going, pushing yourself further, testing your stamina. The knot pops in and out, keeping your "+str("pussy" if GM.pc.hasReachableVagina() else "tailhole")+" gaping loose, your body a quivering mess, slutty noises escaping you.")

		saynn("[say=pc]Ah.. ah.. I'm s-such a knot slut..[/say]")

		saynn("That dildo is filling you completely, making you feel so good.. Your mind is flooded with pleasure. As you cum again and again, your hips shake wildly, your love tunnel clamping down on the toy, trying to milk it. The cycle seems to be endless, each orgasm blending into the next, your body pushes to the brink.."+str(" Your cock barely shoots any seed, just twitching during each climax.." if GM.pc.hasPenis() else "")+"")

		addButton("Continue", "See what happens next", "pc_knotfuck_ends")
	if(state == "pc_knotfuck_ends"):
		playAnimation(StageScene.CanineDildoSex, "knotinside", {pc="pc", bodyState={naked=true, hard=true}})
		saynn("Finally, you begin to slow down, the exhaustion begins to win over.. Your mind gradually clears up..")

		saynn("You just sit there, impaled on the knotted dildo, your "+str("pussy" if GM.pc.hasReachableVagina() else "anus")+" stretched and used, juices dripping onto its shaft..")

		saynn("You glance at shy Artica, a satisfied smile on your lips as you watch her cum again, her cock throbbing in her paws. Makes you wonder if her watching you ride the copy of her cock made her do that..")

		addButton("Enough", "Try to free yourself and give Artica the reward!", "pc_enough_givetoy")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "read_note"):
		processTime(3*60)

	if(_action == "in_workshop"):
		processTime(10*60)

	if(_action == "artica_walks_with_dildo"):
		processTime(5*60)

	if(_action == "risha_meets_artica"):
		processTime(3*60)

	if(_action == "artica_gets_on_her_knees"):
		processTime(2*60)

	if(_action == "help_artica_unstuck_risha"):
		processTime(3*60)

	if(_action == "artica_in_cellblock_oops"):
		processTime(5*60)

	if(_action == "artica_trips"):
		processTime(60)

	if(_action == "lilacs_near_dildo"):
		processTime(5*60)

	if(_action == "a_solution"):
		processTime(2*60)

	if(_action == "first_person_rides"):
		processTime(3*60)
		npcID = NpcFinder.grabNpcIDFromPoolOrGenerate(CharacterPool.Inmates, [], InmateGenerator.new(), {})
		addCharacter(npcID)

	if(_action == "second_person"):
		processTime(4*60)
		var savedNPCid = npcID
		removeCharacter(npcID)
		npcID = NpcFinder.grabNpcIDFromPoolOrGenerate(CharacterPool.Inmates, [[NpcCon.AvoidIDs, [savedNPCid]]], InmateGenerator.new(), {})
		addCharacter(npcID)

	if(_action == "second_cums"):
		processTime(3*60)

	if(_action == "artica_turn"):
		processTime(3*60)
		removeCharacter(npcID)

	if(_action == "artica_starts_riding"):
		processTime(3*60)

	if(_action == "artica_rides_faster"):
		processTime(5*60)

	if(_action == "artica_fails_to_take_the_knot"):
		processTime(5*60)
		getModule("ArticaModule").triggerCorruption(0.05)

	if(_action == "artica_getsup_after_fail"):
		processTime(3*60)

	if(_action == "do_comfort"):
		processTime(3*60)

	if(_action == "do_participate"):
		processTime(3*60)

	if(_action == "again_start"):
		processTime(5*60)

	if(_action == "again_starts_riding"):
		processTime(3*60)

	if(_action == "again_artica_rides_faster"):
		processTime(5*60)

	if(_action == "artica_knots_dildo_yay"):
		processTime(3*60)
		getModule("ArticaModule").triggerCorruption(0.05)

	if(_action == "after_won_artica"):
		processTime(3*60)

	if(_action == "pc_approach_dildo"):
		processTime(5*60)

	if(_action == "pc_deeper"):
		processTime(2*60)
		GM.pc.gotOrificeStretchedWith(BodypartSlot.Vagina if GM.pc.hasReachableVagina() else BodypartSlot.Anus, 50)

	if(_action == "pc_ride_dildo_sex"):
		processTime(3*60)
		GM.pc.gotOrificeStretchedWith(BodypartSlot.Vagina if GM.pc.hasReachableVagina() else BodypartSlot.Anus, 50)

	if(_action == "pc_ride_faster"):
		processTime(3*60)
		GM.pc.gotOrificeStretchedWith(BodypartSlot.Vagina if GM.pc.hasReachableVagina() else BodypartSlot.Anus, 50)
		GM.pc.orgasmFrom("pc")

	if(_action == "pc_accidently_knots_toy"):
		processTime(3*60)
		GM.pc.gotOrificeStretchedWith(BodypartSlot.Vagina if GM.pc.hasReachableVagina() else BodypartSlot.Anus, 50)
		GM.pc.orgasmFrom("pc")
		getModule("ArticaModule").triggerCorruption(0.03)

	if(_action == "pc_enough_givetoy"):
		processTime(3*60)

	if(_action == "pc_knotfuck"):
		processTime(5*60)
		GM.pc.gotOrificeStretchedWith(BodypartSlot.Vagina if GM.pc.hasReachableVagina() else BodypartSlot.Anus, 50)

	if(_action == "pc_knotfuck_fast"):
		processTime(3*60)
		GM.pc.orgasmFrom("pc")
		GM.pc.gotOrificeStretchedWith(BodypartSlot.Vagina if GM.pc.hasReachableVagina() else BodypartSlot.Anus, 60)

	if(_action == "pc_knotfuck_ends"):
		processTime(3*60)
		GM.pc.addStamina(-500)
		getModule("ArticaModule").triggerCorruption(0.02)

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
	data["npcID"] = npcID

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
	npcID = SAVE.loadVar(data, "npcID", "")
