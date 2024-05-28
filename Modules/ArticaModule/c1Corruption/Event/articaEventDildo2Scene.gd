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
		playAnimation(StageScene.CanineDildoSex, "inside", {pc=npcID, bodyState={naked=true, hard=true}})
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
		playAnimation(StageScene.CanineDildoSex, "inside", {pc="artica", bodyState={naked=true, hard=true}})
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
