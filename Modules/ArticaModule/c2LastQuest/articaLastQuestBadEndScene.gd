extends SceneBase

var isCaged = false

func _init():
	sceneID = "articaLastQuestBadEndScene"

func _run():
	if(state == ""):
		addCharacter("eliza")
		saynn("[say=pc]I have a.. problem.[/say]")

		saynn("The feline raises a brow, eyeing you out from ears to toes. She then reaches for something.")

		saynn("[say=eliza]I know exactly what can help! You just have to sign this little document over..[/say]")

		saynn("[say=pc]Not with me.[/say]")

		saynn("[say=eliza]Aw..[/say]")

		saynn("She puts the form away and leans in closer.")

		saynn("[say=pc]One of the inmates isn't doing well. It's not urgent.. but you know.[/say]")

		saynn("[say=eliza]Huh. Let's go take a look.[/say]")

		addButton("Artica", "Bring the doctor to Artica's cell", "in_cell")
	if(state == "in_cell"):
		aimCameraAndSetLocName("cellblock_lilac_nearcell")
		addCharacter("artica", ["sad", "naked"])
		playAnimation(StageScene.SexStart, "start", {pc="eliza", npc="artica", npcBodyState={naked=true}})
		saynn("As you and doctor Quinn step into Artica's cell, you find her on her bed, naked, pressed into the corner, her arms wrapped around her knees. It's like she is taking the least space possible.")

		saynn("The feline tries to comfort the sad fluff, gently placing her paw on the girl's shoulder.")

		saynn("[say=eliza]Hey-y there, sweetheart. Why are you hiding there?[/say]")

		saynn("[say=artica]..eek.. I.. um.. s-sorr..y..[/say]")

		saynn("Artica reaches for her ear, her digits rubbing it.")

		saynn("[say=eliza]No need to be sorry, I'm here to help you.[/say]")

		saynn("[say=pc]She lost a piercing.. Well, it got stolen apparently. It looked like a dreamcatcher.[/say]")

		saynn("Doctor rubs her chin.")

		saynn("[say=eliza]Huh. Help me understand. You miss that dreamcatcher, sweetie?[/say]")

		saynn("Artica nods..")

		saynn("[say=artica]..t-tr..tribe..[/say]")

		saynn("[say=eliza]Tribe. Right. You miss your tribe a lot?[/say]")

		saynn("Artica.. stays quiet. And then shrugs.")

		saynn("[say=eliza]Okay. So you really miss your dreamcatcher?[/say]")

		saynn("You can hear Artica sniffle.")

		saynn("[say=artica]L..Link..[/say]")

		saynn("[say=eliza]You're saying that it's a link.. A link to what? To your tribe?[/say]")

		saynn("The girl nods. The feline gently pats the sad fluff. There doesn't seem to be much reaction though.")

		saynn("[say=eliza]I see.. Last question.. how do you feel overall? What kind of thoughts are going through your mind? Dark ones, good ones? Nightmares?[/say]")

		saynn("Artica hears the last word.. and shivers.")

		saynn("[say=artica]..eep..[/say]")

		saynn("[say=eliza]Uh huh.. Thank you, sweetheart. Don't worry.. Artica.. that's your name right? Everything is gonna be okay[/say]")

		saynn("Doctor Quinn looks at you and nods towards the exit.")

		saynn("[say=eliza]I will be back soon, girl.[/say]")

		addButton("Chat", "See what Quinn has to say", "outside_cell")
	if(state == "outside_cell"):
		removeCharacter("artica")
		playAnimation(StageScene.Duo, "stand", {npc="eliza"})
		saynn("You and doctor Quinn step out of Artica's cell. The feline sighs and stares somewhere into the distance.")

		saynn("[say=eliza]Bag under the eyes.. clearly has trouble sleeping.. Lack of interest.. Emotional detachment.. Dark thoughts..[/say]")

		saynn("She hums.")

		saynn("[say=eliza]Could be a case of depression. Was she always.. sad.. you know?[/say]")

		saynn("[say=pc]She was shy. Sad, I'm not sure.[/say]")

		saynn("The feline hums more.")

		saynn("[say=eliza]Could be a case of PTSD. Getting imprisoned sometimes becomes quite a traumatic event. It can leave a mark. The signs don't appear instantly too, one day you will just begin to see nightmares..[/say]")

		saynn("What she is saying is probably not wrong.. but you feel like there is an obvious reason here..")

		saynn("[say=pc]What about the dreamcatcher?[/say]")

		saynn("Quinn looks at you.")

		saynn("[say=eliza]What about it?[/say]")

		saynn("[say=pc]What if that's the reason?[/say]")

		saynn("The feline raises a brow.")

		saynn("[say=eliza]Losing something can cause grief. It can make you sad, sure.. How often do you lock up in your room over a lost piece of jewelry?[/say]")

		saynn("You shrug.")

		saynn("[say=pc]It seems to be special to her. You heard Artica yourself.[/say]")

		saynn("[say=eliza]When someone has that strong of an attachment towards some object.. It's unhealthy to begin with. Don't you agree?[/say]")

		saynn("[say=pc]It's a link. I guess it's how she keeps a connection to her people.[/say]")

		saynn("[say=eliza]I really don't want to seem mean.. but I'm not a shaman. I'm a doctor. Science doesn't know everything about how a person's mind works.. but it knows a lot. A metaphorical missing link I can do nothing about.. because.. you know..[/say]")

		saynn("You get a feeling that she doesn't trust Artica..")

		saynn("[say=eliza]She is from a tribe too.. wow. How old is that concept even? I think.. we gotta upgrade her mind a little. Give it a little reset while we're at it. Yeah, I think that sounds perfect.[/say]")

		saynn("What. The feline suddenly began talking faster, her hand reaching for her datapad.")

		saynn("[say=pc]Wait, wait. What do you mean?[/say]")

		saynn("[say=eliza]I meant what I meant.. Artica's mind is corrupted and we need to reset it.[/say]")

		saynn("[say=pc]Reset how?[/say]")

		saynn("Quinn smiles seeing your concerns.")

		saynn("[say=eliza]Hypnosis. With some careful and precise.. intervention.. we can make her forget that she had that dreamcatcher to begin with. And all will be good.[/say]")

		saynn("Sounds a lot like.. mind reprogramming..")

		saynn("Quinn looks around, focussing on the purple trims that the walls have here.")

		saynn("[say=eliza]And since she is a lilac.. Might as well increase her libido a bit while we're at it, why not?[/say]")

		saynn("Do you want to reprogram Artica's mind?")

		saynn("If you do, you won't be able to find her dreamcatcher anymore.. but you won't have to, too.")

		addButton("Reprogram", "(Noncon brainwash) Agree to reprogram Artica's mind and turn her into a perfect slut", "agree_reprogram")
		addButton("No", "You'd rather find the dreamcatcher", "refuse")
	if(state == "refuse"):
		GM.pc.setLocation("cellblock_lilac_nearcell")
		saynn("[say=pc]No. I don't think it's a good idea.[/say]")

		saynn("Doctor's smile goes away, her eyes looking a bit mean now.")

		saynn("[say=eliza]Really? You'd rather let her suffer?[/say]")

		saynn("[say=pc]I'd rather her keep her memories and personality. I will find the dreamcatcher.[/say]")

		saynn("She rolls her eyes visibly, her lips smacking against each other.")

		saynn("[say=eliza]Good luck, I guess. I doubt that it will change anything, our brains don't need to be connected into some kind of network with antennas to function.[/say]")

		saynn("[say=pc]I will try.[/say]")

		saynn("Doctor Quinn shrugs.. and puts the datapad away.")

		saynn("[say=eliza]When it all fails.. You know where to find me.[/say]")

		saynn("And just like that, she leaves.. finally.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "agree_reprogram"):
		addCharacter("artica", ["sad", "naked"])
		playAnimation(StageScene.Solo, "stand", {pc="artica", bodyState={naked=true}})
		saynn("After considering it for a while.. you think that it's worth it. A perfect solution for a tribal girl like Artica.")

		saynn("[say=pc]Yeah.. let's do it.[/say]")

		saynn("Doctor Quinn nods and opens some kind of menu on her datapad. She presses a button.. and the door to Artica's cell closes.. trapping the fluff inside.")

		saynn("Artica sees that.. her stare turned concerned. She finds enough strength in her to get up and approach the reinforced glass window..")

		saynn("[say=artica]Um.. w.wh..[/say]")

		saynn("Doctor presses another button.. and the vents inside the cell open wide.. before proceeding to release some kind of.. pink gas.. It was heavier than air so it was mostly just covering the ground at first.. but it was steadily filling the whole cell over time..")

		saynn("[say=eliza]Don't worry, Artica. Everything will be alright soon~.[/say]")

		saynn("Doctor turns to you and says something quietly..")

		saynn("[say=eliza]Sleep toxin. We need to get her to the medical wing.[/say]")

		saynn("Artica sees the pink mist.. and begins to panic.")

		saynn("[say=artica]..eep.. E-eep..[/say]")

		saynn("You can see fear in her cyan eyes as she tries to open the door.. but is unable to.. the pink gas is now at her crotch level.")

		saynn("[say=eliza]I thought you wanted to stay in your cell~. Just breathe it in, it's not harmless, trust me.[/say]")

		saynn("Artica shakes her head.. and bangs on the reinforced window.. the cell seems to be fully isolated, none of the gas is leaking out..")

		saynn("[say=artica]P-p.. please.. n-no..[/say]")

		saynn("[say=pc]It will be okay. Your dreamcatcher problem will be solved soon.[/say]")

		saynn("The gas is now hugging her breasts.. and raising higher.. forcing Artica to stand high on her toes.")

		saynn("[say=artica]S-solv.. s-solved?.. h-h.. how.. eep..[/say]")

		saynn("[say=pc]You won't need it anymore.[/say]")

		saynn("Artica climbs her bed to get some more breathing room.. literally.. You realize that it might end badly if she falls from it..")

		saynn("[say=artica]N-no..nn..[/say]")

		saynn("[say=pc]Hey.. Artica, listen to me. Please get down, you will hurt yourself.[/say]")

		saynn("She shakes her head, her eyes full of terror.. She only has a few more seconds before the gas fills the whole room..")

		saynn("[say=pc]Please. I promise that you will be okay. Do you trust me?[/say]")

		saynn("Artica hears that and stays quiet.. her whole body shaking.. She looks at you.. and then at the pink mist.. before making her decision.")

		saynn("[say=artica]I-I.. um.. ..o-okay..[/say]")

		saynn("Artica whines softly.. but then willingly plunges herself into the pink smoke, getting off her bed and just sitting on it instead.. awaiting her fate.")

		saynn("She holds her breath for as long as possible.. But when the gas eventually begins to fill her lungs, her upper body begins to sway to the side.. She looks at you through the pink haze.. before losing consciousness.. her head hitting her soft pillow..")

		saynn("[say=eliza]Great! Let's get her to medbay![/say]")

		saynn("Doctor Quinn calls in some nurses.. while waiting for the pink smoke to get siphoned out of that cell.")

		addButton("Medical", "Go there with doctor Quinn", "in_fuckmachine")
	if(state == "in_fuckmachine"):
		playAnimation(StageScene.BDSMMachineFuck, "tease", {pc="artica", noDildos=true, bodyState={naked=true}})
		aimCameraAndSetLocName("med_milkingroom")
		isCaged = getCharacter("artica").isWearingChastityCage()
		saynn("The nurses bring Artica into a special room inside of the medical area.. This room has some equipment that is clearly designed for some.. advanced procedures. In the middle of it.. a high-tech looking patient table with a bunch of still manipulators hovering just above it.")

		saynn("[say=eliza]Let's get her in there~. Nurses, you are free to go.[/say]")

		saynn("The feline approaches one of the computers.. and presses a few buttons. The manipulators quickly spring back to life and reach for sleeping Artica's ankles and wrists, gently lifting her off of the stretcher and positioning her onto the table..")

		saynn("In this position, all her limbs are spread wide, leaving her tight pussy, {artica.penis} and {artica.breasts} exposed and vulnerable..")

		saynn("[say=pc]What's the plan?[/say]")

		saynn("[say=eliza]You will see.. We just need to get her back to her senses first.[/say]")

		saynn("Doctor Quinn puts on some latex gloves and grabs a syringe filled with something. She carefully injects Artica with it..")

		saynn("[say=eliza]There we go..[/say]")

		saynn("Soon, Artica begins to stir, her eyes fluttering open. She tries to move but the restraints hold her firmly. Panic flashes in her eyes until doctor Quinn steps into her line of sight.")

		saynn("[say=eliza]Easy, Artica.. No need to resist, the process is painless.[/say]")

		saynn("[say=artica]P-pro.. w-wha.. w-wher.. where.. is-s..[/say]")

		saynn("Fluff looks around.. seeing the manipulators that hold her on the table.. but also noticing you. Her eyes.. they're so desperate..")

		saynn("[say=artica]W-w.. w-what is..[/say]")

		saynn("[say=pc]You have to forget about that damn dreamcatcher, Artica. It's killing you. You should just focus on me. You should focus on being the best girl that you can for me.[/say]")

		saynn("[say=artica]I.. I d-don't.. k-know..[/say]")

		saynn("[say=pc]What's here to know? Soon everything is gonna be like it was. You're gonna serve as my personal fucktoy."+str(" And I will make sure your pussy is always stuffed full." if GM.pc.hasReachablePenis() else "")+""+str(" And I will make sure your balls are always drained." if !GM.pc.hasReachablePenis() else "")+" Don't you want that?[/say]")

		addButton("Continue", "See what happens next", "artica_resists_in_table")
	if(state == "artica_resists_in_table"):
		playAnimation(StageScene.BDSMMachineFuck, "wand", {pc="artica", noDildos=true, bodyState={naked=true}})
		saynn("She blinks a lot, her cheeks blushing softly but her eyes look so sorry.. and yours are strict.")

		saynn("[say=artica]W-what i-if.. I d-don.. d-don't.. w-want..[/say]")

		saynn("You shrug.")

		saynn("[say=pc]What changed? Either way, it's too late for that, Artica. I made my choice. You're mine.[/say]")

		saynn("Artica hears that and whines.. She begins trying to free herself, arching her body.. trying to pull her wrists together.. making the motors inside of the manipulators growls.")

		saynn("[say=eliza]Ohh~. I guess we have to go further than I thought. We will have to brainwash her to remove all that resistance~.[/say]")

		saynn("[say=pc]Brainwash?[/say]")

		saynn("[say=eliza]Yeah, erase her personality.. upload a new one.. It's not that hard..[/say]")

		saynn("[say=pc]She will forget everything?[/say]")

		saynn("Artica tries to kick.. and squirm.. already panting by now.")

		saynn("[say=artica]L.l-let.. g-go.. p-please..[/say]")

		saynn("[say=eliza]She will lose most of her memories, yes. But I will make sure to backup her recent experiences with you~.[/say]")

		saynn("Sounds good. Keeping the good stuff, stripping all the useless baggage.")

		saynn("Artica suddenly manages to free one of her hands. She tries to free her other limbs.. but the machine is quick to grab her wrist again and spread them even wider.")

		saynn("[say=artica]Ah.. N-no.. p-please..[/say]")

		saynn("[say=eliza]So?[/say]")

		saynn("You nod to Doctor Quinn.. who then activates another manipulator that has a bright screen attached. It swings into position in front of Artica's face, the screen coming to life with some kind of.. fancy patterns..")

		saynn("[say=artica]W-what is.. n-noo..[/say]")

		saynn("No matter how hard she tries, Artica can't look away. Her eyes are locked onto that screen, watching the gradients of color flow into each other..")

		saynn("[say=artica]W-why i-is it s-so.. ah..[/say]")

		addButton("Continue", "See what happens next", "artica_hypnotized")
	if(state == "artica_hypnotized"):
		addCharacter("artica", ["naked", "sad", "hypno"])
		playAnimation(StageScene.BDSMMachineFuck, "tease", {pc="artica", bodyState={naked=true, hard=true}})
		saynn("Her burst of resistance seems to be fading.. but she is still not exactly willing, shaking her head as much as she can.")

		saynn("The swirling colors on the screen begin to change, intensifying on both speed and brightness. And soon, Artica's eyes begin to reflect the cyan-purple pattern, her pupils dilating wide.")

		saynn("[say=eliza]Wow.. I have never seen such a reaction. She sure is something~.[/say]")

		saynn("[say=artica]..e-eep.. I c-c.. c-can't..[/say]")

		saynn("[say=pc]Just let go, Artica. Let the sensations take over.[/say]")

		saynn("She tries to shake her head more.. but can't.. Her body is responding to the hypnotic influence, her "+str("locked away cock twitching and trying to get hard in its little cage, precum leaking from the tip.." if isCaged else "cock twitching and getting hard and swell, precum leaking from the tip..")+" Her pussy grows wetter, the room filling with a lovely arousing scent..")

		saynn("[say=eliza]Now.. Time to mess with her head a little~.[/say]")

		saynn("Doctor Quinn presses a few buttons and dials up a few settings.. You notice her increasing the desired obedience, lust and libido settings to their maximums..")

		saynn("A progress bar appears. It shows.. 0%.. 1%.. and a timer.. it says that it will take a few hours to wipe and replace Artica's personality.")

		saynn("[say=eliza]It's a bit slow.. but I know how to speed it up~.[/say]")

		addButton("Continue", "See what happens next", "artica_gets_fucked")
	if(state == "artica_gets_fucked"):
		if (isCaged):
			playAnimation(StageScene.BDSMMachineFuck, "sexdouble", {pc="artica", pcCum=true, bodyState={naked=true, hard=true,chains=[["hose", "breastpump", "scene", "milkIntake"]]}})
		else:
			playAnimation(StageScene.BDSMMachineFuck, "sexdouble", {pc="artica", pcCum=true, bodyState={naked=true, hard=true,chains=[["hose", "penisPump", "scene", "milkIntake"],["hose", "breastpump", "scene", "milkIntake"]]}})
		saynn("Doctor grabs some breast pumps and puts them on Artica.. After switching them on, they quickly start sucking on her tits"+str(" and drawing breast milk out while stimulating the swollen nips" if getCharacter("artica").canBeMilked() else ", trying to draw any milk while stimulating the nips")+"..")

		if (!isCaged):
			saynn("She then also grabs a penis pump too and secures it tightly on Artica's knotted cock.. The pleasure ring hugs the cyan veiny shaft nicely and begins stroking it.")

		else:
			saynn("[say=eliza]Too bad she is caged~. Well, we will just have to compensate with other things..[/say]")

		saynn("[say=artica]Ah..[/say]")

		saynn("The feline presses another button.. making the table extend two rubber.. tools.. that look more like slick dildos. The table quickly and precisely aligns these tools with Artica's holes.. both her wet pussy and tight tailhole.. before sliding them inside, penetrating her fuckholes at the same time!")

		saynn("[say=artica]Ah-h.. m-my.. h-holes..[/say]")

		saynn("Artica is getting fucked and milked, the dildos thrusting inside her holes, stretching them and pushing on both her prostate and g-spot.. while she can't look away from the screen..")

		saynn("You look at the computer now.. and the timer is now considerably lower, the progress bar filling faster.. 4%.. 6%.. 7%.. 9%..")

		saynn("[say=eliza]Any extra stimulation helps with the brainwashing process~.[/say]")

		saynn("Good..")

		saynn("[say=artica]Ah.. Ahh-h.. Ah!..[/say]")

		if (isCaged):
			saynn("With so much direct physical stimulation.. It doesn't take long for Artica to cum! Her body tries to arch itself as her caged cock starts shooting weak spurts of seed through the little hole in the chastity"+str(", milk starts dribbling from her dark cyan nips at a steady rate" if getCharacter("artica").canBeMilked() else "")+". Her pussy and asshole both grip the tools so much that they can barely work, the gears are slipping through.")

		else:
			saynn("With so much direct physical stimulation.. It doesn't take long for Artica to cum! Her body tries to arch itself as her canine cock erupts with multiple thick spurts of seed, filling the reservoir of that penis pump in seconds.. before it gets emptied through the little tube. Her pussy and asshole both grip the tools so much that they can barely work, the gears are slipping through"+str(", milk starts dribbling from her dark cyan nips at a steady rate" if getCharacter("artica").canBeMilked() else "")+".")

		saynn("The progress instantly jumps to 20%.. Artica sticks her tongue out and starts drooling, her body still writhing in the restraints, the overstimulation making her mind go blank.. almost literally.. 22%.. 24%..")

		saynn("[say=eliza]Good girl.. you're doing so great, Artica.. You're gonna be such a good slut soon..[/say]")

		saynn("[say=artica]Ahhh-h.. I c-can't.. t-t.. t-thi.. think..[/say]")

		saynn("The swirling patterns in her eyes mimic those on the screen exactly, keeping her fully engaged, filling her vision.. erasing her bad memories.. Her mind seems to be already lost in the overwhelming sensations.. The dildos keep pounding her needy holes raw, pushing her further.")

		if (isCaged):
			saynn("Not that long after the last orgasm, Artica lets out a passionate cry of lust again, her balls tensing up as more little strings of cum gets shot from her limp useless cock, her pussy and asshole clenching around the tools, trying to milk them.. just like how the pumps milk her, her tits bouncing with each orgasm, nipples hard and erect..")

		else:
			saynn("Not that long after the last orgasm, Artica lets out a passionate cry of lust again, her balls tensing up as more thick strings of cum gets shot from her cock, directly into that penis pump, her fat knot pulsing wildly, her pussy and asshole clenching around the tools, trying to milk them.. just like how the pumps milk her, her tits bouncing with each orgasm, nipples hard and erect..")

		saynn("You look at the computer.. progress is at 40% already. Nice.")

		saynn("[say=artica]Ahh-h.. c-cumming.. s-s-so m-much..[/say]")

		saynn("[say=eliza]I think she can take more~.[/say]")

		addButton("Continue", "See what happens next", "artica_gets_fucked_faster")
	if(state == "artica_gets_fucked_faster"):
		if (isCaged):
			playAnimation(StageScene.BDSMMachineFuck, "fastdouble", {pc="artica", pcCum=true, bodyState={naked=true, hard=true,chains=[["hose", "breastpump", "scene", "milkIntake"]]}})
		else:
			playAnimation(StageScene.BDSMMachineFuck, "fastdouble", {pc="artica", pcCum=true, bodyState={naked=true, hard=true,chains=[["hose", "penisPump", "scene", "milkIntake"],["hose", "breastpump", "scene", "milkIntake"]]}})
		saynn("Doctor presses a button.. that speeds up the pace of the tools even more, to their maximum. By now they have multiple strings of pussy juices hanging from them.. as they keep forcing their way inside, hammering away at Artica's buttons.. and making her cum again and again..")

		saynn("[say=artica]Ahh..Ah..ahh..ahhh-..ah..[/say]")

		saynn("Room is filled with echoing wet noises and slaps, the sounds of the pumps working, Artica's slutty moans.. You see it in real time.. her obedience levels going up.. her desire for sex skyrocketing.. 44%.. 46%.. 49%.. 51%..")

		saynn("[say=eliza]Half of her personality got wiped by now~. She is gonna be such a good slut. Ohh, I have something else we can try.[/say]")

		if (isCaged):
			saynn("Artica is thrashing against the manipulators as another orgasm hits her, causing her cock to leak some more of her useless seed, her stretched holes getting tight around the tools.. that keep pushing her further and extending her peak.. 60%.. 62%..")

		else:
			saynn("Artica is thrashing against the manipulators as another orgasm hits her, causing her cock to shoot more of her seed into the pump that strokes it, her stretched holes getting tight around the tools.. that keep pushing her further and extending her peak.. 60%.. 62%..")

		saynn("[say=artica]Nhh-hh.. ahh.. hh-hhmm..[/say]")

		saynn("Doctor Quinn shows you a syringe.. filled with.. some kind of glowing drug.")

		saynn("[say=eliza]This got into the station as contraband, no one knows the true origin. The molecular analysis shows that it should stimulate the growing cells of the crotch and breasts areas. Wanna test it on her~?[/say]")

		saynn("Seems like it will make her tits and cock bigger by a few sizes.. permanently..")

		addButton("Sure", "Might as well make her look more sluttier too", "do_increase_artica")
		addButton("Nah", "You'd rather her keep her current bits", "do_not_increase_artica")
	if(state == "do_not_increase_artica"):
		if (isCaged):
			playAnimation(StageScene.BDSMMachineFuck, "fastdouble", {pc="artica", pcCum=true, bodyState={naked=true, hard=true,chains=[["hose", "breastpump", "scene", "milkIntake"]]}})
		else:
			playAnimation(StageScene.BDSMMachineFuck, "fastdouble", {pc="artica", pcCum=true, bodyState={naked=true, hard=true,chains=[["hose", "penisPump", "scene", "milkIntake"],["hose", "breastpump", "scene", "milkIntake"]]}})
		saynn("You decide against it.")

		saynn("[say=pc]She is good as is. No need to test weird drugs on her.[/say]")

		saynn("[say=artica]Nhh-h.. ahhh..ah..[/say]")

		saynn("[say=eliza]Well.. sure.. I will stick her with an aphrodisiac anyway~.[/say]")

		saynn("Doctor Quinn smiles and pulls out a different syringe.. and brings it Artica's squirming body.. It's really hard to keep her still.. because of all the fucking and milking that is happening with her body.. so the feline decides to just stab Artica with it near the tits.")

		saynn("[say=artica]Ahh-h..[/say]")

		saynn("The drug begins traveling through Artica's bloodstream.. and affecting her sensitivity.."+str(" Milk is squirting out of her swollen fat nips at a crazy rate now.." if getCharacter("artica").canBeMilked() else " Her cyan nips becoming perkier.. and leaking a faint amount of milk under the breast pumps' pull..")+"")

		if (isCaged):
			saynn("At the same time, her locked away cock begins to twitch too.. blood is flowing towards it, making it try to grow again.. but the metal forcibly keeps her shaft limp.. while her balls are tensing up hard.. It doesn't take long for her package to burst with powerful ropes of thick seed, leaving such a big mess on the floor.. Artica's voice is becoming raspy from moaning so much, her orgasms are not getting any weaker..")

		else:
			saynn("At the same time, her canine cock begins to twitch too.. blood is flowing towards it, making it grow harder, her knot becoming even bigger.. The erection is so rock strong that there is very little empty room in the penis pump, her balls tensing up as her package bursts with powerful ropes of thick seed, stuffing the reservoir in an instant.. Artica's voice is becoming raspy from moaning so much, her orgasms are not getting any weaker..")

		saynn("Only a few seconds later, she cums again.. The fluff is shaking as the multi-orgasm makes her arch her back, her tongue drooling wildly, her balls getting drained again and again, squirting pussy and clenching asshole squeezing the intruding tools like they're real cocks.. 70%.. 80%.. 85%.. 90%..")

		saynn("[say=eliza]Wow.. Look at that..[/say]")

		saynn("You lean closer to Artica and look into her hypnotized eyes. Even through the spiraling patterns and all the lusty desires, you still see a glint of the old shy Artica.. but with a few tweaked sliders! Makes you wonder if that glint will stay there in a few seconds..")

		saynn("The screen shines brightly, erasing more and more memories.. and fixing her personality.. 92%.. 94%.. 96%.. 99%..")

		saynn("[say=artica]Nhh.. s.. h.. nh..[/say]")

		saynn("Her speech is just a bunch of incoherent noises. Her mind must be scrambled by now..")

		saynn("[say=eliza]Almost.. a-almost..[/say]")

		saynn("Artica's body is shaking.. Her nightmares are about to end..")

		addButton("Continue", "See what happens next", "artica_gets_brainwashed_end")
	if(state == "do_increase_artica"):
		if (isCaged):
			playAnimation(StageScene.BDSMMachineFuck, "fastdouble", {pc="artica", pcCum=true, bodyState={naked=true, hard=true,chains=[["hose", "breastpump", "scene", "milkIntake"]]}})
		else:
			playAnimation(StageScene.BDSMMachineFuck, "fastdouble", {pc="artica", pcCum=true, bodyState={naked=true, hard=true,chains=[["hose", "penisPump", "scene", "milkIntake"],["hose", "breastpump", "scene", "milkIntake"]]}})
		saynn("Why not..")

		saynn("[say=pc]Sure. Might as well make her look like a slut.[/say]")

		saynn("[say=artica]Nhh-h.. ahhh..ah..[/say]")

		saynn("Doctor Quinn smiles.. and then brings the syringe to Artica's squirming body.. It's really hard to keep her still.. because of all the fucking and milking that is happening with her body.. so the feline decides to just stab Artica with it near the tits.")

		saynn("[say=artica]Ahh-h..[/say]")

		saynn("The drug begins traveling through Artica's bloodstream.. and affecting her greatly.. Her tits.. they start to change.. growing and expanding.."+str(" Milk is squirting out of her swollen fat nips at a crazy rate now.. They seem to have gotten bigger but also more sensitive.." if getCharacter("artica").canBeMilked() else " Her cyan nips becoming bigger.. perkier.. more sensitive..")+"")

		if (isCaged):
			saynn("At the same time, her locked away cock begins to twitch too.. blood is flowing towards it, making it grow harder.. The erection is so strong that her pulsing fat cock is stretching the metal of her cage, her balls tensing up as her package bursts with powerful ropes of thick seed, leaving such a big mess on the floor.. Artica's voice is becoming raspy from moaning so much, her orgasms are not getting any weaker..")

		else:
			saynn("At the same time, her canine cock begins to twitch too.. blood is flowing towards it, making it grow harder, her knot becoming even bigger.. The erection is so rock strong that it stretches the metal parts of the penis pump, her balls tensing up as her package bursts with powerful ropes of thick seed, stuffing the pump full in an instant.. Artica's voice is becoming raspy from moaning so much, her orgasms are not getting any weaker..")

		saynn("Only a few seconds later, she cums again.. The fluff is shaking as the multi-orgasm makes her arch her back, her tongue drooling wildly, her balls getting drained again and again, fat pussy and asshole squeezing the intruding tools like they're real cocks.. 70%.. 80%.. 85%.. 90%..")

		saynn("[say=eliza]Wow.. it worked better than I expected.. amazing.. Look at that..[/say]")

		saynn("You lean closer to Artica and look into her hypnotized eyes. Even through the spiraling patterns and all the lusty desires, you still see a glint of the old shy Artica.. but with a bunch of new upgrades! Makes you wonder if that glint will stay there in a few seconds..")

		saynn("The screen shines brightly, erasing more and more memories.. and fixing her personality.. 92%.. 94%.. 96%.. 99%..")

		saynn("[say=artica]Nhh.. s.. h.. nh..[/say]")

		saynn("Her speech is just a bunch of incoherent noises. Her mind must be scrambled by now..")

		saynn("[say=eliza]Almost.. a-almost..[/say]")

		saynn("Artica's body is shaking.. Her nightmares are about to end..")

		addButton("Continue", "See what happens next", "artica_gets_brainwashed_end")
	if(state == "artica_gets_brainwashed_end"):
		addCharacter("artica", ["naked"])
		playAnimation(StageScene.BDSMMachineFuck, "tease", {pc="artica", bodyState={naked=true, hard=true}})
		saynn("As soon as the screen shows 100% on the progress, Artica suddenly leans back, her eyes no longer glued to the flashing gradients.. while the last wave of warm, hot pleasure washes through her..")

		saynn("[say=artica]Ah..[/say]")

		saynn("Her toes are curling and sprawling, her body squirming as she is panting heavily. The tools slowly retract out of her stretched, abused holes.. the pumps stop pumping her..")

		saynn("The cyan and purple swirling slowly disappears from Artica's eyes.. revealing her normal cyan pupils..")

		saynn("Her tongue is still out though.. she is drooling.. and dripping.. like a slut..")

		saynn("[say=pc]Artica?[/say]")

		saynn("[say=artica]Y.. y-yes?.. h-hah.. oh..[/say]")

		saynn("At least she still remembers her name..")

		saynn("Artica looks around.. noticing the mess that she left.."+str(" And the set of new giant tits that she has.." if getFlag("ArticaModule.CurvyForm") else "")+"")

		if (getFlag("ArticaModule.CurvyForm")):
			saynn("[say=artica]Ohh.. Looks l-like I got bigger tits now.. and my holes were ravaged by some dildos.. feels like that too.. h-haha..[/say]")

		else:
			saynn("[say=artica]Ohh.. Looks like my holes were ravaged by some dildos.. feels like that too.. h-haha..[/say]")

		saynn("Hah. She doesn't seem to be.. depressed. Looks like it worked!")

		saynn("She clenches her gaping pussy.. again and again.. until it begins to close..")

		saynn("[say=eliza]Do you miss your dreamcatcher, Artica?[/say]")

		saynn("Artica catches her breath.. and looks at the feline.. before tilting her head.")

		saynn("[say=artica]W-what dreamcatcher?..[/say]")

		saynn("[say=pc]Don't worry about it.[/say]")

		saynn("Artica looks at you.. and sticks her tongue out, teasing.")

		if (GM.pc.hasReachablePenis()):
			saynn("[say=artica]I miss some c-cocks in my cunt, that's for sure.. hehe..[/say]")

		else:
			saynn("[say=artica]I miss some t-toys in my cunt, that's for sure.. hehe..[/say]")

		saynn("She sure got.. more cocky now.")

		saynn("[say=pc]You will get that. Don't worry about it, slut.[/say]")

		saynn("Artica chrrrrs.. and realizes that she can't move a muscle.")

		saynn("[say=artica]I'm k-kinda.. stuck here.. eep.. Am I g-gonna be kept and bred like this for f-forever?..[/say]")

		saynn("[say=eliza]Sounds nice.. but sure.. Let's get you down, sweetie.[/say]")

		addButton("Continue", "See what happens next", "artica_stands_after_brainwashed")
	if(state == "artica_stands_after_brainwashed"):
		playAnimation(StageScene.Beg, "beg", {pc="artica", npc="pc", bodyState={naked=true, hard=true, leashedBy="pc"}})
		saynn("The feline presses a button that carefully puts Artica onto the floor. Her legs are too shaky though.. so she drops to her knees before you.")

		saynn("[say=artica]Eek.. I'm such a clumsy w-whore..[/say]")

		saynn("[say=eliza]Who's whore?[/say]")

		saynn("Artica crawls up to you and nuzzles your leg.")

		saynn("[say=artica]Your whore.. your cock sleeve.. breedable f-fucktoy.. hah.. Or just a pet.. whatever sounds better, n.nyah~..[/say]")

		saynn("You scratch her behind the ear while she chrrrrrs happily and wiggles her butt. Quinn hands you a leash.. that you click to Artica's collar.")

		saynn("Hearing the new Artica.. You realize.. that not that much has changed since before the disappearance of that dreamcatcher.. She is a little more mouthy and playful.. sure.. Huh. Doctor Quinn notices your puzzled expression.")

		saynn("[say=eliza]I think the results are extremely interesting! You see it too, huh?[/say]")

		saynn("[say=pc]Hm? What?[/say]")

		saynn("[say=eliza]I think.. I don't know.. Maybe.. she was always like this. Deep inside. Well, not exactly.. but close.[/say]")

		saynn("[say=pc]And I just uncovered it? Perhaps. I see it as a good thing.[/say]")

		saynn("The feline shrugs.. while Artica looks up at you with her sparkling obedient eyes..")

		saynn("[say=artica]I l-like being on your l-leash..[/say]")

		saynn("[say=pc]I'm glad. You're gonna serve me nicely. I guess it's time to go.[/say]")

		saynn("[say=eliza]I guess it is. I have so much data to analyze now, I love science~. Especially practical science, fuck all the boring papers.[/say]")

		saynn("Doctor Quinn opens the door for you.")

		saynn("[say=eliza]Well, I won't keep you any longer. Have fun~.[/say]")

		saynn("You nod and tug on Artica's leash. The slutty pet crawls behind you, swaying her sexy ass.")

		addButton("Continue", "See what happens next", "in_lobby_end")
	if(state == "in_lobby_end"):
		aimCameraAndSetLocName("med_lobbynw")
		GM.pc.setLocation("med_lobbynw")
		playAnimation(StageScene.Beg, "pat", {pc="artica", npc="pc", bodyState={naked=true, hard=true}})
		saynn("You bring Artica out in the medical lobby. And she proudly displays her chain leash.. and also wiggles her naked butt at all the nurses. So you give her a few headpats while she nuzzles into your touch, her tail wags happily, her cock pulsing..")

		saynn("[say=artica]Yip yip..[/say]")

		saynn("[say=pc]Good slut. I'm glad that I saw the potential in you.[/say]")

		saynn("She chrrrrrs more.. such a cute needy fluffer.")

		saynn("[say=artica]Yes-yes.. T-thank you for turning me into your personal slut.. I'm so happy now.. haha. P-Please force me to stay naked all the time.. I want e-everyone to see my fuckholes.. m-my fuckholes that belong to you..[/say]")

		saynn("You chuckle and boop her on the snout, making her go cross-eyed.")

		saynn("[say=pc]Sounds good. But for now.. go and recover, Artica.[/say]")

		saynn("She nods-nods and wiggles her butt more. You unclip the leash.. and put it away.")

		saynn("Artica heads towards the elevator, still on all fours, swaying her ass.. and leaving a trail of pussy juices behind her. She looks at you one more time.. before jumping into the elevator.")

		saynn("(( Artica's content ends here. Thank you for playing <3 ))")
		addButton("Continue", "See what happens next", "endthescene")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "in_cell"):
		processTime(5*60)

	if(_action == "outside_cell"):
		processTime(5*60)

	if(_action == "agree_reprogram"):
		processTime(3*60)

	if(_action == "in_fuckmachine"):
		processTime(10*60)

	if(_action == "artica_resists_in_table"):
		processTime(3*60)

	if(_action == "artica_hypnotized"):
		processTime(3*60)

	if(_action == "artica_gets_fucked"):
		processTime(3*60)
		getCharacter("artica").getInventory().forceEquipStoreOtherUnlessRestraint(GlobalRegistry.createItem("BreastPump"))
		if(!isCaged):
			getCharacter("artica").getInventory().forceEquipStoreOtherUnlessRestraint(GlobalRegistry.createItem("PenisPump"))

	if(_action == "artica_gets_fucked_faster"):
		processTime(5*60)

	if(_action == "do_increase_artica"):
		processTime(5*60)
		setFlag("ArticaModule.CurvyForm", true)
		getCharacter("artica").updateBodyparts()

	if(_action == "do_not_increase_artica"):
		processTime(5*60)

	if(_action == "artica_gets_brainwashed_end"):
		processTime(5*60)
		setFlag("ArticaModule.LQArticaGotBrainwashed", true)
		getCharacter("artica").getInventory().clearSlot(InventorySlot.UnderwearTop)
		getCharacter("artica").getInventory().clearSlot(InventorySlot.Penis)

	if(_action == "artica_stands_after_brainwashed"):
		processTime(5*60)
		setFlag("ArticaModule.NoClothes", true)
		getCharacter("artica").getInventory().clearSlot(InventorySlot.Body)

	if(_action == "in_lobby_end"):
		addExperienceToPlayer(500)
		addMessage("Task completed!")

	setState(_action)

func saveData():
	var data = .saveData()

	data["isCaged"] = isCaged

	return data

func loadData(data):
	.loadData(data)

	isCaged = SAVE.loadVar(data, "isCaged", false)
