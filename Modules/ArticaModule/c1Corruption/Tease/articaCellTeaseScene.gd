extends SceneBase

var isNaked = false
var isCaged = false
var corruption = 0.0
var isSlut = false
var isVerySlut = false
var isLusty = false
var nakedAndShy = false
var cagedDays = 0
var cagedDaysTotal = 0
var cageID = ""
var isFirstChastDeny = false

func _init():
	sceneID = "articaCellTeaseScene"

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
		saynn("You invite Artica to hang around in your cell together.")

		if (nakedAndShy):
			saynn("[say=artica]Oh.. um.. s-sure.. at least others wouldn't be seeing me so.. exposed..[/say]")

		elif (isSlut):
			saynn("[say=artica]Of course.. I like hanging around in your cell, haha..[/say]")

		else:
			saynn("[say=artica]Oh.. um.. okay, might as well..[/say]")

		addButton("Cell", "Bring her to your cell", "in_cell")
	if(state == "in_cell"):
		aimCameraAndSetLocName(GM.pc.getCellLocation())
		saynn("You bring"+str(" pregnant" if getCharacter("artica").isVisiblyPregnant() else "")+" Artica to your cell."+str(" She seems to be quite horny.." if isLusty else "")+" What do you wanna do?")

		if (isNaked):
			saynn("Artica's uniform is stashed here. You can give it back to her if you want.")

		addButton("Cuddle", "Just cuddle together with Artica", "do_cuddle")
		var pcSlaves = GM.main.getPCSlavesIDs()
		if (pcSlaves.size() >= 1):
			addButton("Slave Gangbang", "(Roughness) Let your slaves gangbang Artica", "start_gangbang")
		else:
			addDisabledButton("Slave Gangbang", "You need at least 1 slave stored in your cell to let them gangbang Artica")
		if (corruption > 0.2):
			if (GM.pc.getInventory().getItemsWithTag(ItemTag.BreastPump).size() <= 0 && GM.pc.getInventory().getItemsWithTag(ItemTag.PenisPump).size() <= 0):
				addDisabledButton("Milking", "You need to have a breast pump or a penis pump to be able to milk Artica")
			else:
				if (getCharacter("artica").hasEffect(StatusEffect.SoreNipplesAfterMilking)):
					addDisabledButton("Milking", "Give Artica some rest.. Her nips are still sore")
				else:
					addButton("Milking", "Use your breast pumps or penis pumps to milk Artica!", "start_milkscene")
		else:
			addDisabledButton("Milking", "Artica's corruption needs to be 20% or higher to milk her")
		if (isNaked):
			addButton("Give clothes", "Give Artica back her uniform", "give_uniform")
	if(state == "give_uniform"):
		playAnimation(StageScene.Duo, "stand", {npc="artica"})
		saynn("Artica has walked around naked long enough.. so you decide to hand the fluff her lilac uniform back.")

		if (isVerySlut):
			saynn("[say=artica]Oh.. Do I.. h-have to?..[/say]")

			saynn("Looks like she is fine without it by this point.. but you make her wear it anyway.")

			saynn("[say=artica]It's kinda.. limiting.. haha..[/say]")

		elif (isSlut):
			saynn("[say=artica]Oh.. I think.. I d-don't actually mind if people.. watch.. haha..[/say]")

			saynn("Looks like your actions made the fluff.. more open. You make her wear the clothes anyway.")

			saynn("[say=artica]But.. Thankies![/say]")

		else:
			saynn("[say=artica]Oh.. my clothes..[/say]")

			saynn("She quickly grabs them and puts them on.")

			saynn("[say=artica]Thankies..[/say]")

			saynn("Looks like she is not that mad about you stealing them.. Maybe you can do it more.")

		addButton("Continue", "See what happens next", "in_cell")
	if(state == "do_cuddle"):
		if (isLusty):
			playAnimation(StageScene.Cuddling, "squirm", {pc="pc", npc="artica", npcBodyState={hard=true}})
		else:
			playAnimation(StageScene.Cuddling, "idle", {pc="pc", npc="artica", npcBodyState={hard=true}})
		var isPreg = getCharacter("artica").isVisiblyPregnant()
		saynn("[say=pc]Let's cuddle.[/say]")

		if (!isPreg):
			saynn("You gently pull Artica towards your bed, guiding her to sit between your legs.")

			saynn("With a tender smile, you wrap your arms around the white fluff, pulling her close against your {pc.masc} chest. Her body feels a little tense at first.. but it slowly relaxes under your touch, the fluff nestling into your embrace.")

		else:
			saynn("You gently pull visibly pregnant Artica towards your bed, guiding her to sit between your legs.")

			saynn("With a tender smile, you wrap your arms around the white fluff and put your hands on her big round belly, gently caressing it. Her body feels a little tense at first.. but it slowly relaxes under your touch, the fluff nestling into your embrace.")

			saynn("You feel.. life.. inside her.. it reacts to your careful touches by occasionally kicking back..")

			saynn("[say=artica]Ah.. I'm.. gonna be a mom..[/say]")

		saynn("Learning in close, you whisper sweet things into her ear, your voice is soft and reassuring.")

		if (!isPreg):
			if (isSlut):
				saynn("[say=pc]"+str(RNG.pick(["Can't stop thinking about how good you would look on your knees..", "The way you squirm when desperate and needy is so nice..", "Such a soft body.. such firm breasts.. such tight holes.. such a cute cock."]))+"[/say]")

			else:
				saynn("[say=pc]"+str(RNG.pick(["Such a nice fluffer..", "Your fur is so nice and fluffy..", "Just relax, soft fluff..", "Don't have to be shy with me, precious fluff.."]))+"[/say]")

		else:
			if (isSlut):
				saynn("[say=pc]"+str(RNG.pick(["I love how your body has changed, Artica. Your tits are fuller, your hips wider. You look like you were made to breed..", "You're so fucking hot when you're pregnant, Artica. I love how your body craves cock even more than usual..", "You're going to be such a good mommy, Artica. Taking care of all our little pups while I use your body for my own pleasure..", "Imagine all those little pups squirming inside you, craving their mommy's milk. You're going to be such a hot, slutty mommy.."]))+"[/say]")

			else:
				saynn("[say=pc]"+str(RNG.pick(["You're going to be the best mommy, Artica.. I can see the love in your eyes.", "You're so sexy when you're pregnant, Artica. I love seeing you like this..", "I love how your body has changed with your pregnancy, Artica.. You're even more beautiful when carrying a litter.."]))+"[/say]")

		saynn("Her cheeks blush red, her"+str(" clothed" if !isNaked else " exposed")+" pussy getting needy, her cock growing bigger between her legs.."+str(" as much as the chastity cage allows.. which is not a lot.." if isCaged else "")+" Lost in the moment, Artica surrenders herself to your embrace, her body quivering with desire..")

		saynn("A close personal touch made Artica needy for more.. But it's time to return back to the main hall.")

		addButton("Continue", "See what happens next", "endthescene")
		if (!isCaged):
			if (isNaked):
				addButtonWithChecks("Cage her", "Sneakily put a chastity cage on her", "chast_menu", [], [[ButtonChecks.HasChastityCageInInventory]])
			else:
				addDisabledButton("Cage her", "Artica needs to be forced to be naked for you to sneakily put a chastity cage on her")
		else:
			addButton("Check cage", "See how her caged cock is doing", "do_start_remove_chast")
	if(state == "do_start_remove_chast"):
		playAnimation(StageScene.Cuddling, "idle", {pc="pc", npc="artica", npcBodyState={naked=true, hard=true}})
		if (cagedDays <= 0):
			saynn("Artica has worn that cage for.. zero days.."+str(" and "+str(cagedDaysTotal)+" days in total.." if cagedDaysTotal != cagedDays else "")+" not much, huh.. she can totally endure a few more days!.. Or weeks.")

			saynn("You show Artica the key to her chastity cage..")

			saynn("[say=artica]Oh.. already?..[/say]")

		elif (cagedDays <= 1):
			saynn("Artica has worn that cage for.. a single day.."+str(" and "+str(cagedDaysTotal)+" days in total.." if cagedDaysTotal != cagedDays else "")+" not much, huh.. she can totally do longer than that!")

			saynn("[say=artica]Oh.. I did it? That wasn't so hard..[/say]")

		elif (cagedDays <= 5):
			saynn("Artica has worn that cage for.. "+str(cagedDays)+" days.."+str(" and "+str(cagedDaysTotal)+" days in total.." if cagedDaysTotal != cagedDays else "")+" That's something..")

			saynn("[say=artica]Oh-h.. You're g-gonna unlock me, r-right?..[/say]")

		elif (cagedDays < 10):
			saynn("Artica has worn that cage for.. "+str(cagedDays)+" days.."+str(" and "+str(cagedDaysTotal)+" days in total.." if cagedDaysTotal != cagedDays else "")+" Not bad!")

			saynn("[say=artica]Oh-h.. That's the key.. r-right?.. to my c-cock?.. p-please.. ah..[/say]")

		else:
			saynn("Artica has worn that cage for.. "+str(cagedDays)+" days.."+str(" and "+str(cagedDaysTotal)+" days in total.." if cagedDaysTotal != cagedDays else "")+" Wow, you really tested her!")

			saynn("[say=artica]Oh-h.. That's the key.. r-right?.. to my c-cock?.. p-please.. ah.. I f-f..feel it pulsing.. e-every d-day..[/say]")

		saynn(""+str("She doesn't resist as you pull her shorts down.. exposing her caged cock.." if !isNaked else "You direct your attention towards her caged cock..")+" Dragging the key along the metal.. makes her twitch, precum leaking from the sheath.. There is a lot of pressure in there.."+str(" even if you haven't kept her like this for very long.." if cagedDays < 5 else "")+"")

		addButton("Unlock", "Remove the cage from her cock", "do_unlock_chastity")
		addButton("Unlock for a bit", "Train her to rely on her cock less. Will have effect on her if she is caged for at least 10 days", "do_unlock_chastity_tease")
		if (getFlag("ArticaModule.cagedAcceptStage", 0) >= 3):
			addButton("Deny her", "Make her squirm..", "do_deny_chastity_unlock")
		else:
			addDisabledButton("Deny her", "Train Artica to rely less on receiving pleasure from her cock before doing this..")
	if(state == "do_deny_chastity_unlock"):
		playAnimation(StageScene.BreastGroping, "stroke", {pc="pc", npc="artica", npcBodyState={naked=true, hard=true}})
		saynn("You slide the key into the keyhole.. and turn it..")

		saynn("..soft click..")

		saynn("[say=artica]Ah..[/say]")

		saynn("Artica's heart is racing as you slowly take off the cage from her cock.. cock that turns hard in seconds.. She bites her lip while watching it drip pre..")

		saynn("[say=artica]I.. k-know b-better than to t-touch..[/say]")

		saynn("You smile.")

		saynn("[say=pc]Oh yeah. You've been a very good girl, accepting that your cock is useless so fast.. almost like you always felt that way. I think you deserve a small reward.[/say]")

		saynn("Your hand reaches towards her shaft.. digits about to wrap around..")

		saynn("[say=artica]Ah-..[/say]")

		saynn("So needy.. wait.. you didn't touch her dick yet. Hm..")

		saynn("Instead of stroking her shaft.. you just hover your hand over it, teasingly.. This makes Artica whimper in frustration, the heat of your palm making her body tremble.. her member twitch..")

		saynn("[say=artica]Nhh-h.. ah..[/say]")

		saynn("With a sly smile, you begin to stroke.. the air.. near Artica's cock.. sliding your palm along it.. but never actually touching it..")

		saynn("[say=artica]Ah-h-hh!.. ahh-h.. ahh.. ahh..ah..[/say]")

		saynn("Artica moans eagerly as the sensations send shockwaves of pleasure through her body, her cock becoming harder.. throbbing.. shooting little spurts of pre.. balls tensing up.. toes curling.. tail spazzing wildly..")

		saynn("[say=pc]So sensitive you've gotten..[/say]")

		saynn("She is squirming in your hands.. while you're just pretending to stroke her.. the mental connection alone is enough to trigger her knot to start inflating with blood..")

		saynn("[say=artica]I'm.. ahh-h.. g-gonna.. ah.. t-too much.. g-gods.. ah.. nn-yaahh-h..[/say]")

		saynn("But just as soon as you find her on the brink of orgasm.. you suddenly stop, your hand pulling away from her cock.")

		saynn("[say=artica]Www-waaai.. ahh-h.. n-nnoo!.. ah.. ppp-pleaseee-e!.. ahh-h.. I'm ss-soo..[/say]")

		saynn("Poor fluff arches her back.. and whimpers loudly, rubbing against you.. while your hands just hold her still in place.")

		saynn("[say=artica]P-pp-please!.. ah.. J-ju-ustt.. a t-tiny-y.. bit.. mmmoore-e.. ahh-h..[/say]")

		saynn("[say=pc]No. You're forgetting who your cock belongs to, whore.[/say]")

		saynn("[say=artica]Huff-f-f-ff.. ahh-h..[/say]")

		saynn("Your hand lands on her neck and applies a fair amount of pressure, stealing her breath.")

		saynn("[say=pc]You're nothing but a fucktoy. Forget about your cock, you're only cumming from your holes being fucked.. or you're not cumming at all. Understand?[/say]")

		saynn("[say=artica]Khh-h.. hh-h.. y-y..ah.. k-k..ah..[/say]")

		saynn("She nods.. as much as your hand allows it.. her cock is still twitching and shooting precum, knot pulsing. Caging her now would surely make her cum in the process.. so you're just taking it slow, letting her cool down a bit.")

		saynn("Your hand lets go of her throat, letting her cough and breath.")

		saynn("[say=pc]Good. I might still decide to use your cock.. but when I'm not around.. only your pussy and ass. Understand?[/say]")

		saynn("She nods more.")

		saynn("[say=artica]Y-yes.. m-my c-cock is only f-for you.. hh.. khh.. for me it's.. useless..[/say]")

		saynn("[say=pc]Good girl. Now let's..[/say]")

		addButton("Lock her up", "Put the cage back onto her", "do_deny_chastity_lock")
	if(state == "do_deny_chastity_lock"):
		playAnimation(StageScene.BreastGroping, "tease", {pc="pc", npc="artica", npcBodyState={naked=true, hard=true}})
		saynn("You lock the cage around Artica's cock again.. and then bring the horny fluff back into the main hall.")

		#if (isFirstChastDeny):
		#	saynn("Waiting and seeing what she would do now would be interesting..")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "do_unlock_chastity"):
		playAnimation(StageScene.Duo, "stand", {pc="pc", npc="artica", npcBodyState={naked=true, hard=true}})
		saynn("You slide the key into the keyhole.. and turn it..")

		saynn("..soft click..")

		saynn("[say=artica]Ah.. T-thank you-u!..[/say]")

		saynn("[say=pc]You're welcome.[/say]")

		saynn("Her cock becomes erect as soon as it is freed.")

		saynn("You recover the cage and bring the horny fluff back into the main hall.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "do_unlock_chastity_tease"):
		playAnimation(StageScene.Cuddling, "squirm", {pc="pc", npc="artica", npcBodyState={naked=true, hard=true}})
		saynn("You slide the key into the keyhole.. and turn it..")

		saynn("..soft click..")

		saynn("[say=artica]Ah.. T-thank you-u!..[/say]")

		saynn("As you remove the cage.. her cock instantly springs into its fully erect state.")

		var acceptCaged = getFlag("ArticaModule.cagedAcceptStage", 0)
		if (acceptCaged <= 1):
			saynn("Artica instantly reaches her hand to start stroking it.. but you slap it away before she gets a chance to cum.")

			saynn("[say=pc]No. Stop right now or I will cage you and break the key.[/say]")

			saynn("[say=artica]Oh.. aw.. ah.. b-but.. ah-h..[/say]")

			saynn("Her little moans turn into whimpers.. as she is forced to look at her hard juicy cyan cock.. twitching.. leaking pre.. without being able to touch it.")

			saynn("[say=pc]Only I decide if you're allowed to touch it, understand?[/say]")

			saynn("You hear more whines and little moans from the fluff.")

			saynn("[say=artica]Ah-h.. huff-f.. h-h.. y-yes.. o-okay.. n-no touching..[/say]")

			saynn("You smile and smooch the girl on the cheek.. before putting the cage back onto her cock, forcing her hard cyan shaft back into the sheath.")

			saynn("[say=artica]H-h.hey.. ah!.. eep.. m-my..! But I.. ahh-h..[/say]")

			saynn("Artica's paws land on her crotch.. clawed digits start tugging on the metal..")

			saynn("[say=pc]The faster you understand your place, the easier it will be for you.[/say]")

		elif (acceptCaged <= 2):
			saynn("Artica's hand reaches for her hard juicy cock.. digits wrap around the cyan shaft.. twitching.. but not moving.")

			saynn("[say=artica]I.. ah.. I-I.. w-will only s-stroke if you a-allow..[/say]")

			saynn("You can hear her panting.. her cock is pulsing in her paw.. a lonely drop of pre sliding down from the tip and reaching the hand..")

			saynn("[say=pc]Good. Because I don't allow you to stroke. Your cock is my toy to play with. For you.. it's useless.[/say]")

			saynn("[say=artica]Ah-h.. ahh-hhh..h..[/say]")

			saynn("Your words only seem to make her more desperate.. Her hand.. shaking.. while she is making all sorts of cute noises.")

			saynn("[say=artica]O-okay.. y-yes.. m-my cock.. u-useless..[/say]")

			saynn("She learns her place fast, huh.")

			saynn("[say=pc]Paws away from the cock, slut.[/say]")

			saynn("Quiet whines escape her maw.. but she does obey, her hand relaxing the grip and sliding off..")

			saynn("As she does it, you begin securing the cage again, fighting her erection.. until you hear a click.")

			saynn("[say=artica]Ahh-h~.. it's.. t-too much..[/say]")

			saynn("[say=pc]My toy~.[/say]")

			saynn("Her paws tug on the cage a little bit. Seeing that she can't take it off, her paws start rubbing and squeezing her own ballsack.. before bringing these paws to her snout and sniffing her scent.")

			saynn("[say=artica]Nhh-h..[/say]")

			saynn("[say=pc]So needy.[/say]")

		else:
			saynn("Artica's big eyes watch her hard juicy cock twitch and drip pre eagerly.. but she doesn't even reach for it.")

			saynn("[say=artica]..m-my c-cock.. useless.. just a.. ah.. f-fucktoy..[/say]")

			saynn("[say=pc]Mhm. It's not useless for me though.. a handy indicator for when you're cumming.[/say]")

			saynn("She is panting softly.. her heart is beating at the same rate as her cock is throbbing..")

			saynn("[say=artica]Y-yes.. can stay locked away.. f-fforever..[/say]")

			saynn("After a short minute of freedom.. you press the top part of the cage against the tip of her cock.. before forcing the veiny throbbing shaft into the sheath until the two metal parts click together.")

			saynn("[say=artica]Ah-h-h.. g-gods..[/say]")

		saynn("You bring the needy fluff back to the main hall.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "chast_menu"):
		saynn("Which of your cages do you want to put on her?")

		addCageButtons()
		addButton("Cancel", "You changed your mind", "endthescene")
		if (false):
			addButton("Nope", "You shouldn't see this", "chast_puton")
	if(state == "chast_puton"):
		playAnimation(StageScene.Cuddling, "idle", {pc="pc", npc="artica", npcBodyState={hard=true}})
		saynn("Or not.. Watching Artica get all horny from just some physical touch.. gives you a very mean idea.")

		saynn("You gently bite on her ear and then whisper warmly into it.")

		saynn("[say=pc]Close your eyes.. surrender to my words.. focus on my voice.. forget that the world exists.. nothing matters..[/say]")

		saynn("Artica obediently complied, her breathing is deep and slow as she is focussing entirely on your hypnotic tone.")

		saynn("[say=pc]What matters is that you're here, in my embrace.. Let your mind[/say]")

		saynn("Sneakily, your fingers retrieve a metal chastity cage.. and start unlocking it. The thing consists of two parts, a cockring-like one and the cage itself that slots into the first one. Carefully, you start pulling the cockring through Artica's hard drippy shaft.")

		saynn("[say=artica]..um..[/say]")

		saynn("No matter how careful though, Artica still feels the cold metal touching her cock.. But you catch her just before she opens her eyes.")

		saynn("[say=pc]Shh.. It's okay.. Just relax, Artica.. Trust me.. You don't have to worry about anything while I'm here.. Just listen to my voice.. Forget your concerns.. Tie your mind to me..[/say]")

		saynn("With some extra effort, you manage to slip the ring past her knot.. and then pull her ballsack through it as well.. Now comes the second part.")

		saynn("You press the cage against the tip of her member.. and start to gradually put more and more pressure on it, fighting Artica's erection..")

		saynn("[say=artica]N-n.. n-nyaah..[/say]")

		saynn("[say=pc]You are such a good fluff.. Following my words.. Doing what I tell you.. Keep it up..[/say]")

		saynn("Artica is squirming ever so slightly, her cock is throbbing in your hands.. the knot only seems to inflate with more blood as you force it back into her sheath.. and then start forcing the rest of the shaft too, trying to make the two metal parts meet..")

		saynn("[say=pc]So.. close..[/say]")

		saynn("As the final click echoes through the cell.. Artica's fluttered eyes open, a soft gasp escaping her lips. She blinks in surprise, her gaze directed towards the metal cage that is now encasing her cock. A wave of heat spreads across her cheeks as she realized what had happened..")

		addButton("Continue", "See what happens next", "chast_getup")
	if(state == "chast_getup"):
		playAnimation(StageScene.Duo, "stand", {npc="artica"})
		if (isVerySlut):
			saynn("Artica gets up.. and admires her cage.")

			saynn("[say=artica]So.. tight.. my useless cock.. f-finally locked..[/say]")

			saynn("Oh wow, she doesn't seem to resist it at all.")

			saynn("[say=pc]You like it?[/say]")

			saynn("[say=artica]Y-yes.. o-of course.. mm-mm.. sluts don't need their cocks.. they j-just need to be able to ride cocks.. and carry litters..[/say]")

			saynn("Her eyes are watching her cock struggling to leave its sheath, the cyan tip pushing desperately against the metal, precum dripping off of it..")

			saynn("[say=pc]Words of a true whore.[/say]")

			saynn("Artica lowers her gaze, tail curls around her waist.")

			saynn("So adorable. You embrace the fluff tightly.")

		elif (isSlut):
			saynn("Artica gets up.. her hands tug on the cage.. feeling how tight it is.")

			saynn("[say=artica]Oh.. my cock.. it's locked.. so tight..[/say]")

			saynn("You offer her a kind smile.")

			saynn("[say=pc]Do you really need it, Artica?[/say]")

			saynn("Her paws slide over the cage.. She shrugs.")

			saynn("[say=artica]I.. I don't know.. It's nice to be able.. to have s-sex..[/say]")

			saynn("You pull her closer and leave a small smooch on her lips.")

			saynn("[say=pc]You have a beautiful breedable pussy.. a nice tight ass.. a wide deep maw.. Really.. The cock is useless for you, fluff. Don't you agree?[/say]")

			saynn("[say=artica]If you p-put it like that.. mm-mm.. m-maybe.. D-don't need it if I'm gonna be full of pups all the time.. haha..[/say]")

			saynn("Her eyes are watching her cock struggling to leave its sheath, the cyan tip pushing desperately against the metal, precum dripping off of it..")

			saynn("[say=pc]Good.. Words of a true slut.[/say]")

			saynn("Artica lowers her gaze, tail curls around her waist.")

		else:
			saynn("Artica is quick to get up.. Her hands start tugging on the cage.. but it's locked tight..")

			saynn("[say=artica]My.. c-cock.. w-why did you..[/say]")

			saynn("You offer her a kind smile.")

			saynn("[say=pc]Do you really need it, Artica?[/say]")

			saynn("Feeling quite nervous, she starts trying to pull it off.. but you stop her, grabbing hands with her.")

			saynn("[say=artica]I.. y-yea.. um-m.. How am I.. am I.. g-gonna.. sex..[/say]")

			saynn("You pull her closer and leave a small smooch on her lips.")

			saynn("[say=pc]Sex? You can still be fucked, fluff.. That is all that you need.. Trust me..[/say]")

			saynn("She is fidgeting a lot.. her big eyes watching her cock struggling to leave its sheath, the cyan tip pushing desperately against the metal, precum dripping off of it..")

			saynn("[say=artica]Um-m.. I.. I'm not.. s-sure..[/say]")

			saynn("You hear her whine softly.. so you embrace her tightly.")

			saynn("[say=pc]You have a beautiful pussy.. a nice tight ass.. a wide deep maw.. Really.. The cock is useless for you, fluff. Don't you agree?[/say]")

			saynn("[say=artica]I.. d-don't k-k-know.. eep.. m-m-maybe.. it's t-too t-tight..[/say]")

			saynn("[say=pc]You will get used to it. I will make you cum with it on, it will be fun..[/say]")

			saynn("[say=artica]Ok-okay.. m-maybe you're r-right.. ah..[/say]")

		saynn("After this, you bring Artica back to the main hall.. to showcase her new shiny cage to everyone.")

		saynn("(( Some events won't be able to trigger while Artica is wearing a chastity cage ))")
		addButton("Continue", "See what happens next", "endthescene")
func addCageButtons():
	var strapons = GM.pc.getChastityCages()
	for strapon in strapons:
		addButton(strapon.getVisibleName(), strapon.getVisibleDescription(), "chast_puton", [strapon])


func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "in_cell"):
		processTime(3*60)

	if(_action == "do_cuddle"):
		processTime(10*60)
		getModule("ArticaModule").makeLusty()

	if(_action == "start_gangbang"):
		endScene()
		runScene("articaSlaveGangbangScene")
		return

	if(_action == "start_milkscene"):
		endScene()
		runScene("articaMilkingInCellScene")
		return

	if(_action == "give_uniform"):
		setFlag("ArticaModule.NoClothes", false)
		getCharacter("artica").resetEquipment(true, true, true)
		isNaked = false
		nakedAndShy = false

	if(_action == "do_start_remove_chast"):
		cagedDays = getModule("ArticaModule").getCagedDaysCurrently()
		cagedDaysTotal = getModule("ArticaModule").getCagedDays()

	if(_action == "do_unlock_chastity"):
		processTime(3*60)
		var cage = getCharacter("artica").getWornChastityCage()
		if(cage != null):
			getCharacter("artica").getInventory().removeEquippedItem(cage)
			GM.pc.getInventory().addItem(cage)
		getModule("ArticaModule").endCaged()

	if(_action == "do_unlock_chastity_tease"):
		processTime(3*60)
		getModule("ArticaModule").makeLusty()
		if(cagedDays >= 10):
			var acceptCaged = getFlag("ArticaModule.cagedAcceptStage", 0)
			if(acceptCaged < 3):
				acceptCaged += 1
				setFlag("ArticaModule.cagedAcceptStage", acceptCaged)

	if(_action == "do_deny_chastity_unlock"):
		processTime(3*60)
		var alreadyWasDenied = getFlag("ArticaModule.gotChastityDenied", false)
		if(!alreadyWasDenied):
			isFirstChastDeny = true
			getModule("ArticaModule").addCorruption(0.05)
		setFlag("ArticaModule.gotChastityDenied", true)
		getModule("ArticaModule").makeLusty()
		var cage = getCharacter("artica").getWornChastityCage()
		if(cage != null):
			cageID = cage.uniqueID
			getCharacter("artica").getInventory().removeEquippedItem(cage)
			GM.pc.getInventory().addItem(cage)

	if(_action == "do_deny_chastity_lock"):
		var cage = GM.pc.getInventory().getItemByUniqueID(cageID)
		if(cage != null):
			GM.pc.getInventory().removeItem(cage)
			getCharacter("artica").getInventory().forceEquipStoreOtherUnlessRestraint(cage)

	if(_action == "chast_puton"):
		processTime(5*60)
		var strapon = _args[0]
		GM.pc.getInventory().removeItem(strapon)
		getCharacter("artica").getInventory().forceEquipStoreOtherUnlessRestraint(strapon)
		isCaged = true
		getModule("ArticaModule").startCaged()

	if(_action == "chast_getup"):
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
	data["cagedDays"] = cagedDays
	data["cagedDaysTotal"] = cagedDaysTotal
	data["cageID"] = cageID
	data["isFirstChastDeny"] = isFirstChastDeny

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
	cagedDays = SAVE.loadVar(data, "cagedDays", 0)
	cagedDaysTotal = SAVE.loadVar(data, "cagedDaysTotal", 0)
	cageID = SAVE.loadVar(data, "cageID", "")
	isFirstChastDeny = SAVE.loadVar(data, "isFirstChastDeny", false)
