extends SexReactionHandler

func _init():
	handles = {
		SexReaction.AboutToPenetratePussy: {REACT_CHANCE: 100},
		SexReaction.AboutToPenetrateAnal: {REACT_CHANCE: 100},
		SexReaction.AboutToRidePussy: {REACT_CHANCE: 100},
		SexReaction.AboutToRideAnal: {REACT_CHANCE: 100},
		SexReaction.AboutToDrawOnBody: {REACT_CHANCE: 100},
		SexReaction.AfterDrawingOnBody: {REACT_CHANCE: 100},
		SexReaction.AboutToBeatUp: {REACT_CHANCE: 100},
		SexReaction.BeatingUp: {REACT_CHANCE: 100},
		SexReaction.BeatingUpHard: {REACT_CHANCE: 100},
		SexReaction.OrderToUndress: {REACT_CHANCE: 100},
		SexReaction.ForceUndress: {REACT_CHANCE: 100},
		SexReaction.OfferingDrug: {REACT_CHANCE: 100},
		SexReaction.ForcingDrug: {REACT_CHANCE: 100},
		SexReaction.OrderBlowjob: {REACT_CHANCE: 100},
		SexReaction.OrderLickPussy: {REACT_CHANCE: 100},
		SexReaction.OrderRimming: {REACT_CHANCE: 100},
		SexReaction.GrindingFaceWithPussy: {REACT_CHANCE: 100},
		SexReaction.DomsPussyGetsLicked: {REACT_CHANCE: 100},
		SexReaction.AboutToLickPussy: {REACT_CHANCE: 100},
		SexReaction.AboutToSuckSubOff: {REACT_CHANCE: 100},
		SexReaction.AboutToRubPussiesTogether: {REACT_CHANCE: 100},
		SexReaction.AboutToRimSub: {REACT_CHANCE: 100},
		SexReaction.DomPutsOnACondom: {REACT_CHANCE: 100},
		SexReaction.DomPutsOnACondomOnSub: {REACT_CHANCE: 100},
		SexReaction.PutBreastPumpOnSub: {REACT_CHANCE: 100},
		SexReaction.MilkingSubWithBreastPump: {REACT_CHANCE: 100},
		SexReaction.RemoveBreastPumpFromSub: {REACT_CHANCE: 100},
		SexReaction.SubMoos: {REACT_CHANCE: 100},
		SexReaction.DomAboutToStartGropingSubsBreasts: {REACT_CHANCE: 100},
		SexReaction.DomStartsGropingSubsBreasts: {REACT_CHANCE: 100},
		SexReaction.DomGropesSubsBreasts: {REACT_CHANCE: 100},
		SexReaction.Choking: {REACT_CHANCE: 100},
		SexReaction.ChokingHard: {REACT_CHANCE: 100},
		SexReaction.DomBreastfeedsSub: {REACT_CHANCE: 100},
		SexReaction.DomBreastfeedPraise: {REACT_CHANCE: 100},
		SexReaction.DomBreastfeedsOnSub: {REACT_CHANCE: 100},
	}

func getLines(_reaction:int, _role:int, _args:Array):
	match(_reaction):
		SexReaction.AboutToPenetratePussy:
			if(_role == ROLE_MAIN):
				if(!isAngry()):
					addLines([
						"Gonna fuck that slit.",
						"Hope you're ready to get fucked.",
						"Gonna fuck you nice and slow.",
						"Hope you're wet already.",
						"Let's have some fun.",
						"I wanna fuck your "+RNG.pick(["pussy", "slit", "pussy slit"])+".",
						"Are you ready for this?",
						"I can't wait to feel you around me.",
						"I'm going to make you mine.",
						"Just relax and let me take control.",
						"I want to feel you climax around me.",
						"I'm going to make you mine, body and soul.",
						"That pussy’s mine now.",
						"Let’s see how deep I can get.",
						"I bet you’ve been craving this.",
						"You’re gonna take every inch.",
						"Spread those legs for me.",
						"Let’s stretch you open nice and wide.",
						"I wanna feel you clench when I push in.",
						"Here comes the real fun.",
						"Hold still, I want to savor that first push.",
						"You're dripping. You need this, don't you?",
						"This pussy’s about to remember me.",
						"Let me in. You want to feel it, don't you?",
						"Your body’s begging for it.",
						"I’m gonna push in nice and slow.. at first.",
						"Let’s see how tight that hole really is.",
						"Time to fill that needy little hole.",
					])
				if(isAngry()):
					addLines([
						"Stupid slut, I'm gonna fuck you rough.",
						"Bitches like you need to be pounded rough.",
						"I know you love being fucked, whore.",
						"Gonna fuck you rough.",
						"I'm gonna fuck your "+RNG.pick(["pussy", "slit", "pussy slit"])+".",
						"You should have thought twice before crossing me.",
						"You're mine now. And I'm going to enjoy every second of it.",
						"My turn to have some fun.",
						"I’m about to shove it in and make you scream for mercy.",
						"Shut up and spread those legs before I lose my patience.",
						"I’m going to bury myself inside you and there’s nothing you can do.",
						"You’ll take every hard thrust until you beg me to stop.",
						"I’ve waited long enough, time to ruin that pretty little hole.",
						"This pussy’s mine, and I’m going to fuck you senseless.",
						"I swear I’ll make you regret ever opening your mouth.",
						"Your screams don’t matter, my cock’s going all the way in.",
						"You’ll be soaked and bruised by the time I’m done.",
						"Don’t fight me, pet, I’ll smash you full of me anyway.",
						"Let me in or I’ll force you until you sob.",
						"Keep quiet, cunt, and stretch for me.",
						"I’ll pound you so hard you’ll forget your own name.",
						"You’ll choke on my cock if you don’t stay still.",
					])

		SexReaction.AboutToPenetrateAnal:
			if(_role == ROLE_MAIN):
				if(!isAngry()):
					addLines([
						"Gonna fuck that "+RNG.pick(["ass", "butt"])+".",
						"Hope you're ready to get your "+RNG.pick(["butt", "ass"])+" fucked.",
						"Hope you're excited to be buttfucked.",
						"Let's have some fun.",
						"I wanna fuck your "+RNG.pick(["ass", "butt"])+".",
						"Are you ready for this?",
						"I can't wait to feel you around me.",
						"I'm going to make you mine.",
						"Just relax and let me take control.",
						"I want to feel you climax around me.",
						"I'm going to make you mine, body and soul.",
						"Let’s see how deep I can go.",
						"Time to feel every inch.",
						"Your hole’s begging for me.",
						"Feel that tip on your rim?",
						"Just relax and take it.",
						"I’m sliding in nice and slow.",
						"Let me hear that tiny gasp.",
						"I’ve wanted this all day.",
						"Can you feel me stretching you?",
						"Your ass looks so ready.",
						"Lean into it for me.",
						"Your tight walls are calling.",
						"I’m about to fill you up.",
						"Hold still and enjoy it.",
						"I’m right where I want to be.",
					])
				if(isAngry()):
					addLines([
						"Stupid slut, I'm gonna fuck your ass rough.",
						"Bitches like you need to be pounded rough.",
						"I know you love being fucked, whore.",
						"Gonna fuck you rough.",
						"I'm gonna fuck your "+RNG.pick(["ass", "butt"])+".",
						"You should have thought twice before crossing me.",
						"You're mine now. And I'm going to enjoy every second of it.",
						"My turn to have some fun.",
						"Spread your ass, I’m going in.",
						"I’ll shove my cock deep in your gut.",
						"Don’t move or I’ll fuck you raw.",
						"You think you can fight? I’ll pound you.",
						"I’ll split you open if you don’t stay still.",
						"That tight ass is mine to ruin.",
						"I’m about to ram you until you cry.",
						"Your asshole’s going to remember this.",
						"Stop squirming and take it, bitch.",
						"I’ll fuck you until you beg.",
						"Hold still or I’ll break you.",
						"I’ll bury myself in your ass and you’ll love it.",
						"Keep quiet while I fuck your asshole.",
						"I’ll stretch you out and don’t you dare move.",
						"I’ll pound that tight hole nonstop.",
						"I’ll fuck your ass until you can’t think.",
						"Spread those cheeks, my cock’s not waiting.",
					])

		SexReaction.AboutToRidePussy:
			if(_role == ROLE_MAIN):
				if(isAngry()):
					addLines([
						"I hope you're ready for the ride of your life. It's going to be a bumpy one.",
						"You might want to brace yourself. This is going to be a rough one.",
						"Don't even think about trying to escape. I've got you right where I want you.",
						"Say goodbye to any pleasure you were hoping for. This is about domination, not satisfaction.",
						"You might be begging for mercy by the time I'm finished with you.",
						"I hope you're ready to be completely and utterly humiliated.",
						"I'm only doing this because I want to.",
						"You're not going to last long, trust me.",
						"Get ready to fuck me hard, asshole.",
						"I’m gonna ride that cock like a wild bitch.",
						"You’re gonna drown in my pussy, fucker.",
						"I’m taking that cock and I’m not gentle.",
						"Gonna ride your dick raw and rough.",
						"Fuck me hard, don’t hold back, asshole.",
						"I’m the queen, and you’re my fucktoy.",
						"Feel my pussy squeeze you tight, fucker.",
						"I’m gonna make you lose your mind, slut.",
						"You’re mine to fuck, bitch, don’t forget.",
						"I want you pounding my pussy hard.",
						"Gonna fuck you stupid with my tight pussy.",
					])
				if(!isAngry()):
					addLines([
						"Are you ready for this?",
						"I'm going to straddle you now.",
						"I want to feel you inside me.",
						"This is going to be so good.",
						"I can't wait to feel you.",
						"I'm going to rock your world.",
						"You're going to love this.",
						"I'm going to take control.",
						"Hold on tight, this is going to be a wild ride.",
						"I want to look into your eyes as I straddle you and make love to you.",
						"Get ready to fill me up.",
						"Gonna ride that hard cock good.",
						"I want every inch inside me.",
						"You’re gonna fuck me deep.",
						"Can’t wait to feel you stretch me.",
						"Fuck me with that thick cock.",
						"I’m soaking wet for you.",
						"Feel how tight I am for you.",
						"I’m ready to take you deep.",
						"I want your cock pounding me.",
						"Let’s get messy and filthy.",
					])

		SexReaction.AboutToRideAnal:
			if(_role == ROLE_MAIN):
				if(isAngry()):
					addLines([
						"I hope you're ready for the ride of your life. It's going to be a bumpy one.",
						"You might want to brace yourself. This is going to be a rough one.",
						"Don't even think about trying to escape. I've got you right where I want you.",
						"Say goodbye to any pleasure you were hoping for. This is about domination, not satisfaction.",
						"You might be begging for mercy by the time I'm finished with you.",
						"I hope you're ready to be completely and utterly humiliated.",
						"I'm only doing this because I want to.",
						"You're not going to last long, trust me.",
						"Gonna take that cock deep, you fuck.",
						"This asshole’s gonna swallow you whole.",
						"Fuck me good, you dirty slut.",
						"Hold tight, I’m taking you rough.",
						"Gonna stretch this hole with your fat cock.",
						"Your cock’s gonna be buried deep in my ass.",
						"Fuck my tight hole, you nasty fucker.",
						"I’m gonna ride you till you break.",
						"Get ready for a rough ride, fucker.",
					])
				if(!isAngry()):
					addLines([
						"Are you ready for this?",
						"I'm going to straddle you now.",
						"I want to feel you inside me.",
						"This is going to be so good.",
						"I can't wait to feel you.",
						"I'm going to rock your world.",
						"You're going to love this.",
						"I'm going to take control.",
						"Hold on tight, this is going to be a wild ride.",
						"I want to look into your eyes as I straddle you and make love to you.",
						"Get ready to fill my tight hole.",
						"I’m gonna ride you hard, deep.",
						"Your cock’s gonna wreck my ass.",
						"Can’t wait to feel you pounding me.",
						"Your cock’s made for my tight ass.",
						"Feel my ass clench around your cock.",
						"You’re gonna fill me up so good.",
						"My ass is ready to swallow you whole.",
						"Can’t wait to feel you stretching me.",
						"I’m wet and aching for your cock.",
						"Your cock’s my favorite toy right now.",
					])

		SexReaction.AboutToDrawOnBody:
			if(_role == ROLE_MAIN):
				if(!isAngry()):
					addLines([
						"Check this out",
						"Gonna leave you a memento",
						"Hope you are into bodywritings",
						"Stay still while I do this",
						"I wanna draw something on you",
						"Get ready to be humiliated!",
						"This is going to be so embarrassing for you!",
						"Freeze, I’m marking you.",
						"Hold still, I'm writing.",
						"You like being a canvas?",
					])
				if(isAngry()):
					addLines([
						"Don't fucking move, bitch",
						"Don't you dare move",
						"Stay still, slut",
						"About to brand you",
						"Stay still while I brand you, whore",
						"Gonna brand you like the little prison's whore that you are.",
						"I'm going to make sure everyone knows exactly what you did.",
						"But don't worry, I'll make sure everyone knows who you are.",
						"This is going to be the best graffiti I've ever done.",
						"I can't wait to see the look on your face when you see what I've written.",
						"You deserve everything you're about to get.",
						"Hold still, you worthless canvas.",
						"Don’t even think about squirming.",
						"I’m gonna ruin you for everyone to see.",
						"No fuckin’ moving or I’ll write more shit.",
						"I’ll make sure everyone knows what you are.",
					])

		SexReaction.AfterDrawingOnBody:
			if(_role == ROLE_MAIN):
				if(isAngry()):
					addLines([
						"Wear it like a scar.",
						"Marked and owned.",
						"Everyone will know your place.",
						"Look at what you are.",
						"Say it loud, whore.",
						"Now you’re marked, slut.",
						"Wear it, bitch.",
						"Can’t hide this whore tag.",
						"Branded like the little slut you are.",
						"This one suits you, bitch.",
						"A reminder for every fucker.",
						"Don’t wash this off, whore.",
						"Look at that, you worthless slut.",
						"Wear it proud, cunt.",
						"Perfect for my little fucktoy.",
					])
				if(!isAngry()):
					addLines([
						"There we go.",
						"A present from me.",
						"Now everyone can see who you are.",
						"Enjoy that.",
						"Don't hide this one.",
						"Want another one?",
						"How many will fit I wonder.",
						"This is real art.",
						"That looks perfect on you.",
						"Wear it with pride.",
						"Every mark tells a story.",
						"This one suits you well.",
						"I made you special.",
						"Look at what I wrote on you.",
						"A little reminder for others.",
						"That’ll get some attention.",
					])

		SexReaction.AboutToBeatUp:
			if(_role == ROLE_MAIN):
				if(isAngry()):
					addLines([
						"Bitch, you fucking asked for it.",
						"You're not gonna get away unscarred, you stupid "+RNG.pick(["slut", "whore", "fucktoy", "bitch"])+".",
						"Stop fucking resisting, you "+RNG.pick(["slut", "whore", "stupid fucktoy", "bitch"])+".",
						"You brought this upon yourself, you "+RNG.pick(["slut", "whore", "fucktoy", "bitch"])+".",
						"Time to teach you some pain.",
						"I’ll leave marks you can’t hide.",
						"Think you can take this, bitch?",
						"You’re gonna regret this, slut.",
						"I’m gonna break you down.",
						"You asked for a beating, whore.",
						"No mercy for trash like you.",
						"Bitch, you’re about to learn fear.",
						"You’ll bleed for me, slut.",
						"You’re my fucktoy to break.",
						"You want rough? I’ll give rough.",
					])
				if(!isAngry()):
					addLines([
						"I'm getting really mad with you.",
						"I'm usually not that mean. But you are fucking annoying.",
						"You made me do this.",
						"You brought this upon yourself.",
						"You asked for it, didn’t you?",
						"Time to teach you a lesson.",
						"Let’s see how tough you are.",
						"You’re pushing me too far.",
						"Better brace yourself.",
						"This won’t end well for you.",
						"You made me do this.",
						"Don’t say I didn’t warn you.",
						"Hope you can take a hit.",
						"I’m about to get rough.",
						"This is on you, so don’t complain.",
					])

		SexReaction.BeatingUp:
			if(_role == ROLE_MAIN):
				if(isAngry()):
					addLines([
						"Stupid. Fucking. Bitch.",
						"You fucking whore",
						"I'm gonna break you if I have to.",
						"It's your fault!",
						"Stupid painslut.",
						"You worthless cunt.",
						"Take it, slut.",
						"Stupid little brat.",
						"Pathetic.",
						"Shut up, whore.",
						"You begging yet?",
						"Piece of shit.",
						"Stop whining, slut.",
						"I own you now.",
						"Whimper for me.",
						"Useless fucktoy.",
						"Harder? Sure.",
						"Pathetic cunt.",
					])
				if(!isAngry()):
					addLines([
						"Stop resisting already!",
						"Stop making me mad!",
						"Quit struggling on me.",
						"Just let it fucking happen.",
						"You are making this worse for yourself.",
						"Quit squirming, it’s pointless.",
						"You think you can fight this?",
						"Stop wasting energy, slut.",
						"You’re only hurting yourself.",
						"Give up, this is your fate.",
						"Stop flailing, it’s useless.",
						"You like this, don’t you?",
						"Surrender already, bitch.",
						"Stop whining, take it.",
						"Just accept it, slut.",
					])

		SexReaction.BeatingUpHard:
			if(_role == ROLE_MAIN):
				if(!isAngry()):
					addLines([
						"You like that, huh? I'll give you something to cry about.",
						"I'm not done with you yet. Take this!",
						"You want me to hit harder? Fine, I'll show you who's boss.",
						"You thought this was just rough sex? Think again.",
						"You're going to regret ever crossing me.",
						"I told you to be ready for a rough ride. This is what you asked for.",
						"You thought you could handle me? You were wrong.",
						"I'm going to make you pay for your disobedience.",
						"You better start begging for mercy, because I'm not going easy on you.",
						"You thought this was just a game? Think again.",
						"I'm going to make you pay for what you did.",
						"You better start begging for mercy, because I'm not going to let up.",
						"I warned you not to mess with me. Now you're going to suffer the consequences.",
						"You want harder? I’ll crush you.",
						"Feel every hit, little brat.",
						"Don’t think you’re tough now.",
						"This is punishment, not playtime.",
						"I’ll break you down piece by piece.",
						"Your screams won’t save you.",
					])
				if(isAngry()):
					addLines([
						"You stupid bitch!",
						"You like pain, you dirty whore?",
						"Shut up and take it, you worthless bitch!",
						"I’m gonna break you, slut.",
						"Beg for mercy, you stupid whore.",
						"You asked for this, dumb bitch.",
						"Scream louder, whore!",
						"I’m gonna make you regret every word, bitch.",
						"You’re mine to beat and abuse, whore.",
						"Keep quiet or I’ll hit harder, bitch.",
						"I’m gonna wreck you, slut.",
						"You think you can handle me, whore? Think again.",
						"Cry all you want, bitch, I don’t care.",
						"I’m gonna leave my mark, bitch.",
					])

		SexReaction.OrderToUndress:
			if(_role == ROLE_MAIN):
				if(isAngry()):
					addLines([
						"Your <ITEM>, take that shit off.",
						"Take your <ITEM> off, "+RNG.pick(["slut", "whore", "fucktoy", "bitch"])+".",
						"Don't make me break you, take your stupid <ITEM> off.",
						"Take off your <ITEM> or I'll rip your clothes off myself.",
						"Get <ITEM> off before I lose it.",
						"Off with <ITEM>, no excuses.",
						"Yank <ITEM> off, slut.",
						"Ditch your <ITEM>, or else.",
						"Drop your <ITEM>, now.",
						"Lose the <ITEM>, bitch.",
						"Take your <ITEM> off, or I will.",
					])
				if(!isAngry()):
					addLines([
						"You don't need your <ITEM>. Undress for me.",
						"I think you don't need your <ITEM>. Be a good toy and undress.",
						"Take your <ITEM> off for me.",
						"Strip your <ITEM> off, nice and slow.",
						"I want to see you without your <ITEM>.",
						"Get your <ITEM> off me.",
					])

		SexReaction.ForceUndress:
			if(_role == ROLE_MAIN):
				if(isAngry()):
					addLines([
						"Don't you dare resist, you little "+RNG.pick(["slut", "whore", "fucktoy", "bitch"])+".",
						"You don't need that shit.",
						"Don't whine about it, no one will save you.",
						"You're going to do exactly what I say or you'll regret it.",
						"I'll do whatever it takes to get you naked.",
						"I won't stop until you're completely naked.",
						"Fine, if you won't undress willingly, I'll do it for you.",
						"Stop struggling! You're only making it worse for yourself.",
						"You'll thank me later. Trust me, this is for your own good.",
						"I’ll rip it right off you if I have to.",
						"Stop whining and strip already.",
						"Struggle all you want, it’s coming off.",
					])
				if(!isAngry()):
					addLines([
						"Let me take that off.",
						"You don't need that with me.",
						"That's only getting in the way.",
						"Let me see what's under.",
						"Why are you being so shy? Let me help you out of those clothes.",
						"I can't wait to see what's underneath. Come on, let me take it off.",
						"You can't resist me. Just let me undress you and we can get started.",
						"Don't be such a prude. Let me show you how good it can be without all those clothes on.",
						"You know you want me to take your clothes off. Just let go and let me do it.",
						"I bet you're even more beautiful without any clothes on. Come on, let me see.",
						"I can't wait to touch every inch of your bare skin. Just let me undress you.",
						"Don't be scared. I promise I'll be gentle as I take off your clothes.",
						"Let's make this even more exciting by letting me undress you. Trust me, you'll love it.",
						"Let me help you take that off.",
						"Come on, let me undress you.",
						"No need to hide from me.",
						"Let me free you from those.",
						"Let me see all of you.",
					])

		SexReaction.OfferingDrug:
			if(_role == ROLE_MAIN):
				if(isAngry()):
					addLines([
						"Don't be a coward, just pop the pill in your mouth and let me show you what it can do.",
						"You think you can handle me? Prove it by swallowing this pill.",
						"Come on, don't be a wimp. Swallow the pill and let's see how wild you can get.",
						"Just swallow it and let me take care of the rest.",
						"You want to try something new?",
						"Stop whining and swallow this shit.",
						"Don’t act weak, pop it or shut up.",
						"If you’re too pussy to try, say so.",
						"I dare you to try this.",
						"Take it, or I’ll make you regret it.",
						"Don’t waste my time, just swallow.",
						"Quit hesitating and prove you’re not trash.",
						"Eat this. I’ll force it down if you’re useless.",
						"You think you’re tough? Then prove it. Eat this.",
						"Man up and pop it, bitch.",
					])
				if(!isAngry()):
					addLines([
						"Would you like to try it?",
						"Just swallow it and let it work its magic.",
						"Come on, live a little. You only live once.",
						"Come on, don't be shy. This pill is completely safe.",
						"Come on, I know you're curious.",
						"Don't be afraid, just pop it in your mouth and swallow.",
						"You want to try something new?",
						"Here, try this, trust me.",
						"Take it, you’ll love it.",
						"Just one pill, nothing crazy.",
						"Ready to feel something new?",
						"This’ll spice things up.",
						"Don’t think, just take it.",
						"Wanna play with something wild?",
						"A little something extra for you.",
						"This is the good stuff.",
						"Curious? Eat  it.",
						"Give it a shot, babe.",
					])

		SexReaction.ForcingDrug:
			if(_role == ROLE_MAIN):
				addLines([
					"You're going to take this pill whether you like it or not.",
					"Don't fight me on this. Just open your mouth and swallow.",
					"You know you want it. Just let go and let me take control.",
					"You don't have a choice. I'm going to make you take this pill.",
					"I can see the desire in your eyes. Give in to me and take the pill.",
					"Swallow this shit, slut, no excuses.",
					"I’m shoving this pill down your throat.",
					"You’re my bitch now, swallow it.",
					"Stop squirming, swallow the damn pill.",
					"Take this drug and shut your damn mouth.",
					"Swallow it fast, or I’ll force it down.",
					"Stop struggling, just take it.",
					"I don’t ask twice, you’ll take it now.",
					"Quit being a brat and take what I give you.",
					"No mercy, no choice. Just take it.",
					"You’ll thank me once you’re mine.",
					"Take the pill, or I’ll make you regret it.",
				])

		SexReaction.OrderBlowjob:
			if(_role == ROLE_MAIN):
				if(isAngry()):
					addLines([
						"You better open your mouth if you know what's good for you.",
						"I'm not going to ask again, open your mouth.",
						"You better do as I say, open your mouth and let me do my thing.",
						"I don't care if you want to or not, open your mouth and let me have my way with you.",
						"If you know what's best for you, you'll open your mouth and let me take control.",
						"Open that filthy mouth and suck me off.",
						"Don’t make me tell you twice, fucking start sucking.",
						"Open wide, you worthless cock-hungry whore.",
						"I want you gagging on my cock, now!",
						"Stop whining and start sucking, bitch.",
						"Take me deep, you dirty little fucktoy.",
						"Fucking obey and blow me like you mean it.",
						"Suck me hard or I’ll make you regret it.",
						"I want to hear you choke on my cock.",
						"Show me how much you crave my cock, slut.",
						"Get that filthy mouth working, now.",
						"Suck hard or I’ll fuck your face myself.",
					])
				if(!isAngry()):
					addLines([
						"Open your mouth and let me in.",
						"I want to feel your mouth on me, so open up.",
						"Don't be shy, open your mouth and let me explore.",
						"I need to feel your warmth, so open up and let me in.",
						"You know you want it, so open your mouth and let me in.",
						"I want to feel your tongue, so open up.",
						"Show me how good you can be.",
						"Take me deep and don’t stop.",
						"Use that mouth, I’m waiting.",
						"Suck me right, don’t hold back.",
						"Warm me up with that mouth.",
						"Don’t tease, just suck me.",
						"Show me how you suck my cock.",
						"Take my shaft deep, baby.",
						"Suck that dick nice and slow.",
						"I want your mouth on my cock.",
						"Wrap your lips around me.",
						"Give me your best blowjob.",
						"Suck me hard and fast.",
						"I want to feel you choke on me.",
						"Open wide and take it all.",
						"Taste every inch of my cock.",
					])

		SexReaction.OrderLickPussy:
			if(_role == ROLE_MAIN):
				if(isAngry()):
					addLines([
						"Don't make me repeat myself. Lick my {pussy} now.",
						"You better do as I say and lick my {pussy}.",
						"I'm not playing around. Lick my fucking {pussy}.",
						"I won't hesitate to punish you if you don't lick my {pussy}.",
						"I'm not joking. Lick. My. Pussy.",
						"You have three seconds to start licking my {pussy} or else.",
						"I don't care if you like it or not. Lick my {pussy} now.",
						"You have no choice in the matter. Lick my {pussy} now.",
						"I'm not going to repeat myself. Lick my fucking {pussy} now.",
						"Lick my dripping cunt, now.",
						"Get that tongue in my filthy pussy.",
						"Eat my soaked slit, you dumb fuck.",
						"Suck every drop from my tight cunt.",
						"Taste how wet my nasty cunt is.",
						"Slam your tongue deep in my cunt.",
						"I want your filthy tongue on my cunt.",
						"Lick my dripping hole, slut.",
						"Get that nasty tongue all over my pussy.",
						"Suck my slick pussy hard, you worthless.",
						"Eat my cunt like your life depends on it.",
						"Lick this fucked pussy or get punished.",
					])
				if(!isAngry()):
					addLines([
						"Lick my pussy, I want to feel your tongue on me.",
						"Don't be shy, just put your mouth on my clit and lick it.",
						"I need you to focus on my pussy, lick it slowly and sensually.",
						"My pussy is craving your touch, so don't be afraid to lick it.",
						"I want to feel your tongue swirling around my clit, so don't hold back.",
						"I need you to take control and lick my pussy with confidence.",
						"I'm feeling so turned on right now, so don't be afraid to lick my pussy.",
						"I want to feel your tongue exploring every inch of my pussy, so don't be shy.",
						"I need you to focus all your attention on my pussy and lick it until I climax.",
						"I want to feel your tongue worshipping my pussy, so don't be afraid to go for it.",
						"Get your tongue in me, now.",
						"Show me how good you can lick.",
						"Taste every inch of my pussy.",
						"Don’t be shy, dive right in.",
						"I want you to eat me out hard.",
						"Suck on my clit, nice and slow.",
						"Make that tongue dance for me.",
						"Worship my pussy with your mouth.",
						"Show me how good your tongue is.",
					])

		SexReaction.OrderRimming:
			if(_role == ROLE_MAIN):
				if(isAngry()):
					addLines([
						"Suck my asshole, bitch.",
						"Hope you like licking asses.",
						"Don't make me force you.",
						"I need my asshole cleaned. Now.",
						"Lick it clean, slut.",
						"My ass isn’t gonna eat itself.",
						"Show me you’re useful.",
						"Your tongue belongs here.",
						"Lick it like you mean it.",
						"Earn your keep, asshole cleaner.",
						"No whining, just lick.",
						"Clean it up, slut.",
						"Show me how deep you’ll go.",
					])
				if(!isAngry()):
					addLines([
						"Start licking, nice and slow.",
						"Show me how good you are.",
						"Use that tongue right.",
						"Make me feel that love.",
						"I want you working down there.",
						"Taste every inch, baby.",
						"Get in there nice and deep.",
						"Make it all slippery.",
						"No hesitation, just go.",
						"Show me your dedication.",
						"Make me melt with that mouth.",
					])
			if(_role == ROLE_TARGET):
				if(!isResisting()):
					if(hatesFetish(Fetish.RimmingGiving)):
						addLines([
							"Hey, I don't wanna do this.",
							"I'm not really into rimming.",
							"I'm not comfortable, can we not?",
							"Licking buts isn't something I'm interested in trying.",
							"Ugh, do I have to?",
							"This is seriously gross.",
						])
					if(!hatesFetish(Fetish.RimmingGiving)):
						addLines([
							"Oh, um, you want me to.. do that?",
							"I'm not sure about this.",
							"It's a bit embarrassing.",
							"This is kinda embarrassing..",
							"Do you really want me to do that?",
							"I’m not sure if I’m ready for this..",
							"I don’t know if I’m good at this.",
							"You want me to lick your ass?",
							"Do I really have to do this now?",
							"This feels kinda humiliating..",
						])
				if(isResisting()):
					addLines([
						"Fuck off, I'm not doing that!",
						"Hey, I'm not gonna do that!",
						"I will bite your ass if you make me do this!",
						"No way I’m kissing that.",
						"I’m not your damn toy.",
						"I swear I’ll scratch your eyes out.",
						"No fucking way, asshole.",
						"You’ll regret this if you try.",
						"Stop, or I’m biting back hard.",
					])

		SexReaction.GrindingFaceWithPussy:
			if(_role == ROLE_MAIN):
				if(isAngry()):
					addLines([
						"You like that, don't you? My body grinding against your face.",
						"I love the way you squirm beneath me. Keep struggling, it only makes me want you more.",
						"You're mine now. I'm going to grind you into submission.",
						"I can feel your face getting redder and redder. You can't handle my roughness, can you?",
						"Don't even try to fight back. You know you want this as much as I do.",
						"You're at my mercy now. And I'm not going to show you any mercy.",
						"Do you like the way my body feels pressed against yours? I can feel your heart racing.",
						"I'm going to grind you into the ground. You're mine to do with as I please.",
						"You're completely helpless against me. And I love it.",
						"Suck this pussy good, you dirty slut.",
						"You’re gagging on my pussy, pathetic bitch.",
						"Such a worthless fucktoy.",
						"Taste every inch of my wet cunt.",
						"I’m gonna fuck your face raw.",
						"I own your tongue, whore.",
						"Grinding my cunt into your face.",
						"You’re nothing but my slut now.",
						"I’m making you drown in my pussy juice.",
					])
				if(!isAngry()):
					addLines([
						"Oh my goodness, your face is right up against my lady parts!",
						"I can't believe you're letting me grind my pussy against your face like this!",
						"Oh yes, just like that. Keep your face right there and let me grind against it.",
						"Your face feels so good against my pussy. Keep grinding, baby.",
						"I love the way your face feels against my sensitive parts. Don't stop.",
						"This is amazing. I never thought I'd be grinding my pussy against someone's face like this.",
						"Your face is so close to my most intimate areas. It's driving me wild.",
						"This is so hot. I can feel my juices flowing as I grind against your face.",
						"I never thought I'd be this turned on by grinding my pussy against someone's face, but here we are.",
						"Your face is the perfect surface for me to rub against. It feels so good.",
						"I never thought I'd be this passionate, but grinding against your face is driving me wild.",
						"I love the way your skin feels against mine as I grind against your face.",
						"I can feel every contour of your face against my sensitive parts. It's so intense.",
						"Grinding my wet pussy on your face makes me so damn horny.",
						"You like my dripping cunt pressed against your face, don’t you?",
						"Your face is my pussy’s favorite toy.",
						"I’m soaking wet and your face is the perfect fuckpad.",
						"I want my cunt all over your face.",
						"Your face is drowning in my dripping pussy juice.",
						"I want to see your face soaked with my pussy cream.",
						"Mmm, your face fits perfectly here.",
						"Keep still, I want every inch.",
						"You’re my favorite little cushion.",
						"Feels so good rubbing on you.",
						"Right there, don’t move.",
						"You’re so soft beneath me.",
						"Every grind gets better and better.",
						"Your face belongs under me.",
						"I could do this forever.",
						"You’re my perfect little throne.",
						"I’m not stopping anytime soon.",
						"Shh, just let me take over.",
						"You make this so damn easy.",
					])

		SexReaction.DomsPussyGetsLicked:
			if(_role == ROLE_MAIN):
				if(isAngry()):
					addLines([
						"I can't believe you're actually enjoying this rough treatment.",
						"I love it when you lick my pussy. It feels so good.",
						"Oh, yes, keep licking my little kitty. I love it when you give me all your attention like that.",
						"Don't stop, baby. I want to feel your tongue on my most sensitive spot. Make me cum for you.",
						"That's it, lick and suck on my pussy like you're starving for it. I love how badly you want me.",
						"I can't get enough of your tongue on my clit. You know exactly how to make me scream with pleasure.",
						"I'm so close. Keep licking me, don't stop until I've climaxed.",
						"Fuck yeah, don’t stop that filthy tongue.",
						"Lick my tight cunt harder, slut.",
						"Suck my clit like the dirty fucktoy you are.",
						"Keep that nasty tongue flicking my cunt.",
						"Make my cunt drip all over your face.",
						"Don’t stop, fucker, I’m dripping for you.",
						"Taste my slick cunt, you filthy little bitch.",
						"My cunt’s dripping, shove that tongue in deeper.",
						"Get your tongue deep in my tight little pussy.",
						"Lick my cunt like you’re begging for it.",
						"Slobber all over my clit, you nasty slut.",
						"Taste my cunt juice, you greedy bitch.",
						"Fuck, you’re making my pussy throb.",
						"Tongue fuck me hard, slut, make me scream.",
					])
				if(!isAngry()):
					addLines([
						"Oh, yes, right there!",
						"Don't stop, keep going!",
						"It feels so good!",
						"I love the way you're licking me!",
						"Mmm, that feels amazing!",
						"Mmm, I love the way your tongue feels against my skin.",
						"I'm getting so turned on, keep going.",
						"Your tongue is so skilled, I can't get enough.",
						"I'm so wet, I can't control myself anymore.",
						"I'm going to cum, keep doing what you're doing!",
						"Fuck yeah, right there, slut!",
						"Lick me deep, don’t stop!",
						"Damn, you’re making me dripping wet!",
						"Suck my pussy good, baby!",
						"You tongue-fucking tease, keep going!",
						"Make me cum with that filthy tongue!",
						"Fuck, your tongue’s driving me crazy!",
						"Lick me raw, I’m dripping for you!",
						"You’re making my pussy pulse!",
						"Eat me out like the dirty slut you are!",
						"Keep that tongue slapping my clit!",
						"I want your tongue buried deep inside me!",
						"Lick me harder, I’m dripping all over you!",
						"Fuck, you’re ruining me with that mouth!",
						"Suck my pussy lips, you fucker!",
						"I’m dripping, keep licking that cunt!",
					])

		SexReaction.AboutToLickPussy:
			if(_role == ROLE_MAIN):
				if(isAngry()):
					addLines([
						"I can't wait to taste you, you little slut.",
						"You're so lucky to have me lick your pussy.",
						"You know you want me to eat your pussy, don't you?",
						"I'm going to make you cum so hard.",
						"You're going to love the way I lick your clit.",
						"I'm going to make you beg for more.",
						"I'm going to make you cum so hard you won't be able to walk.",
						"Time to eat that filthy cunt, slut.",
						"Gonna drown in your pussy juices, bitch.",
						"I’m gonna fuck your slit with my tongue.",
						"You’re mine to lick and ruin, bitch.",
						"Spread those legs, I want that cunt.",
						"Gonna make you scream, you dirty slut.",
						"I’ll destroy that cunt with my tongue.",
						"Beg me to eat your filthy pussy.",
						"Your slit’s mine to torture, slut.",
						"Get ready to cum on my tongue, whore.",
						"Gonna lick that cunt till you beg.",
						"Your pussy’s gonna beg for mercy, slut.",
						"I’m going to ruin your pussy good.",
					])
				if(!isAngry()):
					addLines([
						"Are you ready for me to lick your pussy?",
						"I've been waiting to taste you.",
						"Your pussy is so wet and inviting.",
						"I'm going to lick you slowly and sensually.",
						"I want to make you feel amazing with my tongue.",
						"I'm going to make you cum with my tongue.",
						"Just relax and let me take control.",
						"I can't wait to hear your moans of pleasure as I lick your pussy.",
						"Gonna bury my tongue deep in your wet slit.",
						"Time to taste that little pussy.",
						"I’m gonna lap up all that sweet pussy juice.",
						"I’ll drown your pussy in my slobber.",
						"You’re my juicy little whore to lick.",
						"Can’t wait to taste your pussy.",
						"Gonna fuck your slit with my tongue.",
						"I'm such a needy little pussy slut.",
						"My tongue’s ready to fuck your tight hole.",
						"Gonna drown in your sweet pussy juice.",
						"That pussy’s mine to eat and own.",
					])

		SexReaction.AboutToSuckSubOff:
			if(_role == ROLE_MAIN):
				if(isAngry()):
					addLines([
						"I hope you know that I'm only doing this because I want to, not because I have to.",
						"Do you really think you're good enough for me to bother with this?",
						"You should be grateful that I'm even considering doing this for you.",
						"You know the rules. Warn me before you blow your load.",
						"I hope you're ready to take orders, because I'm not letting you come without my permission.",
						"Don't even think about finishing without giving me a heads up.",
						"You better warn me before you cum, or else.",
						"Don't you dare come without letting me know first.",
						"Get ready, I’m about to drain that filthy cock.",
						"Don’t even think about cumming without my say-so.",
						"I’m taking that cock deep, you worthless slut.",
						"Ready for me to make your balls empty?",
						"I’ll swallow every drop of your nasty cum.",
						"Beg for it, and maybe I’ll let you cum.",
						"Don’t move till I’m done with your cock.",
						"You’re gonna cum on my command, got it?",
						"I’m not stopping till your cock’s empty.",
						"Your balls are mine to squeeze and drain.",
						"Let me show you who owns that cock.",
						"I want your cum dripping down my throat.",
					])
				if(!isAngry()):
					addLines([
						"Just lie back and relax, and let me take care of everything.",
						"Can you let me know when you're about to cum? I don't want to be caught off guard.",
						"I hope you're ready for the best oral you've ever had.",
						"I'm going to make you feel so good.",
						"You're going to love how I do this.",
						"I can't wait to see the look on your face when I'm done with you.",
						"Gonna suck that fat cock nice and slow.",
						"Time to taste that thick dick of yours.",
						"I wanna taste all your sweet cum.",
						"Lemme feel that cock twitch in my mouth.",
						"Your dick’s begging for my lips already.",
						"I want your balls twitching in my hand.",
						"Gonna blow you so hard, you won’t stand.",
						"Your cock’s mine to suck and swallow.",
						"Get ready to cum all over my tongue.",
						"I’m starving for your fat dick right now.",
					])

		SexReaction.AboutToRubPussiesTogether:
			if(_role == ROLE_MAIN):
				if(isAngry()):
					addLines([
						"Let’s see how wet you really are.",
						"Your pussy’s mine to toy with.",
						"Make a mess for me, slut.",
						"I’m not stopping till you scream.",
						"Two wet sluts, one dirty game.",
						"Grind, show me you want it.",
						"You’re dripping for me already.",
						"Gonna grind you into the floor.",
						"Time to fuck you with my pussy.",
						"Try to keep up, slut.",
						"I’ll leave you dripping.",
						"Let’s see how loud you get.",
						"Time to grind our cunts till you beg.",
						"Gonna fuck your pussy with mine, hard.",
						"Get ready, I’m scissoring that tight cunt.",
						"Let’s rub these slick pussies raw.",
						"Feel my cunt drag against your wetness.",
						"Watch me scissor your filthy little pussy.",
						"I want to hear your cunt scream under me.",
						"Your pussy’s mine to rub and fuck.",
						"Let’s rub these cunts ‘til we’re dripping.",
						"You ready to get your cunt wrecked?",
						"Gonna fuck your pussy with my cunt tight.",
						"My cunt’s gonna own your little pussy.",
						"Rubbing these cunt lips till you shiver.",
						"Scissor me hard, I wanna taste your cunt.",
					])
				if(!isAngry()):
					addLines([
						"Ready to feel me all over you?",
						"Let’s make these wet folds dance.",
						"Can’t wait to grind into you.",
						"Feel that heat building between us?",
						"Let’s get wet and wild together.",
						"I want to feel every inch of you.",
						"Let’s rub until we both melt.",
						"Our bodies fit so perfectly.",
						"I’m already dripping for you.",
						"Let's share some juices.",
						"Ready to scissor those tight cunts together?",
						"Let me grind my cunt deep into yours.",
						"Your dripping pussy’s begging for this.",
						"Time to rub these slick cunts real good.",
						"Wanna feel your pussy squeeze mine hard.",
						"Gonna mash our cunts till you lose it.",
						"Let’s scissor and make those cunts sweat.",
						"Gonna grind my pussy right on your slit.",
						"Can’t wait to rub our slick pussies raw.",
						"I’m gonna make your pussy tremble, baby.",
						"Time to mash these cunts and get wet.",
						"Gonna bury my pussy deep in your folds.",
						"Your cunt’s so wet, perfect for tribbing.",
						"Let’s rub these pussies till we both burst.",
						"Gonna scissor your pussy hard and fast.",
						"Your tight cunt’s gonna fuck my pussy good.",
					])

		SexReaction.AboutToRimSub:
			if(_role == ROLE_MAIN):
				if(isAngry()):
					addLines([
						"Enjoy it while it lasts.",
						"I do this because I want to, okay?",
						"Don't move or I will bite your ass.",
						"Don't fucking move, I need your ass.",
						"What? I wanna suck your asshole, deal with it.",
						"Your ass is mine now.",
						"I’m gonna make you squirm.",
						"Shut up and spread.",
						"Try to stay quiet, whore.",
						"You’re mine to lick and use.",
						"I’m gonna mark you good.",
						"Feel me deep inside, slut.",
						"Your ass belongs to me.",
					])
				if(!isAngry()):
					addLines([
						"I can't resist exploring every part of you.",
						"I'll be gentle, but I promise you'll love every second of it.",
						"You'll beg for more when I'm done with you.",
						"Let's see how that ass tastes.",
						"I wanna eat that ass so much.",
						"Gonna taste every inch.",
						"That ass is mine to lick.",
						"Ready for me to dive in?",
						"Let me show you how good this feels.",
						"Can’t wait to bury my tongue deep.",
						"You’re gonna love this, trust me.",
						"Time to make you shiver.",
						"I’m all about that sweet spot.",
						"Let me hear you moan for me.",
						"This tongue’s made for you.",
						"Let me worship that perfect ass.",
						"Get ready for a wild ride.",
						"I’m gonna make you melt.",
						"Can’t wait to eat you out.",
					])

		SexReaction.DomPutsOnACondom:
			if(_role == ROLE_MAIN):
				if(isAngry()):
					addLines([
						"Wrapped up tight, so no surprises.",
						"Not a single drop slips out.",
						"I’m in control, not you.",
						"Not your breeder, not today.",
						"Don’t think you’re getting knocked up.",
						"No future offspring with me.",
					])
				if(!isAngry()):
					addLines([
						"I don't want to accidentally knock you up.",
						"I'm not trying to be a dad right now, so let's use protection.",
						"I can't risk having a baby with you.",
						"I always use a condom to avoid any unwanted pregnancies.",
						"Trust me, you don't want to have my baby.",
						"I'd rather not have any surprise pregnancies, so let's use protection.",
						"Better safe than sorry.",
						"Can’t have any accidents now.",
						"Let’s keep it risk-free.",
						"Don’t want any surprises.",
					])

		SexReaction.DomPutsOnACondomOnSub:
			if(_role == ROLE_MAIN):
				if(isAngry()):
					addLines([
						"If it breaks, you're done for.",
						"I'm not taking any chances with you, bitch.",
						"This stays on, got it?",
						"You’re lucky I’m even bothering.",
						"No excuses if this breaks.",
						"Not risking a damn thing.",
						"This stays on, slut.",
						"No sloppy mistakes allowed.",
						"You’re not getting off raw.",
						"One tear, and you’re done.",
					])
				if(!isAngry()):
					addLines([
						"I'm not taking any chances.",
						"Here, let me put that on for you.",
						"I don't want to take any chances.",
						"I want to make sure we're protected.",
						"I don't want to have to worry about this later.",
						"Just being responsible.",
						"Gotta keep it safe.",
						"Better safe than sorry.",
						"Wrapped up and ready.",
						"Safety first, then pleasure.",
						"Let’s keep it mess-free.",
						"This is for both of us.",
						"No surprises tonight.",
					])

		SexReaction.PutBreastPumpOnSub:
			if(_role == ROLE_MAIN):
				if(isAngry()):
					addLines([
						"Give me your stupid milk, now.",
						"I will milk you until your tits are dry.",
						"Shut up and let me put these on your tits.",
						"Bitch, stop fucking resisting. I just need your milk.",
						"Shut your mouth-hole and get milked already.",
						"I'm getting my milk, whether you like it or not.",
						"This thing is gonna squeeze out every drop out of your tits, slut.",
						"I’ll drain you dry, bitch.",
						"You’re just a walking milk factory anyway.",
						"You’re just a cow anyway.",
						"Struggle all you want, I’m milking you.",
						"Get used to this, milk slave.",
						"Fill this pump with your milk, slut.",
						"It will squeeze every drop out.",
						"Whimper if you want, I don’t care.",
					])
					if(!getChar(ROLE_TARGET).canBeMilked()):
						addLines([
							"You're not lactating? I don't give a fuck! I need milk.",
							"Where is the fucking milk, bitch?",
							"Your tits are not lactating? I will make them!",
							"No milk? Doesn’t matter, I’ll force it out.",
							"You’re gonna drip for me, no excuses.",
							"Start lactating or I will break you.",
							"I don’t care if you’re dry, I’ll make you leak.",
							"No milk now? That’s gonna change.",
							"I’ll get my milk out of you, one way or another.",
							"Pump on, bitch. I want that milk.",
							"You’ll be making milk for me soon enough.",
							"No milk? That’s just a challenge.",
							"Get ready to fill this pump, whether you like it or not.",
						])
				if(!isAngry()):
					if(getChar(ROLE_TARGET).canBeMilked()):
						addLines([
							"I want some of that breast milk.",
							"Check these out. Will empty your jugs in a second.",
							"We don't want your breasts to itch from being so full, do we?",
							"Just looking at those makes me thirsty.",
							"You're lactating? I want some of that.",
							"Let’s see how much milk you’ve got.",
							"Time to drain those sweet tits.",
							"Pumping you dry, babe.",
							"These pumps are gonna make you gush.",
							"Fill the pump, nice and slow.",
							"Let’s get that milk flowing.",
							"Can’t wait to taste you.",
							"Gonna make those jugs empty.",
							"Let me milk you properly.",
						])
					if(!getChar(ROLE_TARGET).canBeMilked()):
						addLines([
							"Let's stimulate your breasts a little.",
							"Maybe some milk will come out if I stimulate your tits long enough.",
							"You're not lactating, I know. I just wanna make you feel good.",
							"Let's get your nipples nice and hard.",
							"Shame that you're not lactating. But we can still try.",
							"Let’s see if we can coax some milk out.",
							"Time to wake those sleepy nipples.",
							"Even if there’s no milk, you’ll love the feeling.",
							"I want to see you dripping soon.",
							"I bet those nipples will perk right up.",
							"Keep still, this will feel good.",
							"These pumps are gonna get your nipples nice and sensitive.",
						])
			if(_role == ROLE_TARGET):
				if(hatesFetish(Fetish.Lactation)):
					if(!isResisting()):
						addLines([
							"I don't really like milking..",
							"Hey. Don't put this on me!",
							"Don't milk me, I don't like it..",
							"I’m not sure about this..",
							"Why the pumps?",
							"I don’t want this on me.",
							"I don’t want to be pumped.",
							"It’s cold and awkward..",
						])
						if(getChar().isLactating()):
							addLines([
								"I have milk but I don't like being milked..",
								"Having milk doesn't mean I'm into being a cow..",
							])
				if(isResisting()):
					addLines([
						"Fuck off with your breast pumps!",
						"Hey, take these off, fucker!",
						"Don't touch my nipples, bitch!",
						"I will shove these up your ass!",
						"I'm not a fucking cow, fuck off!",
						"I’m not some damn dairy cow!",
						"Don’t you dare pump these!",
						"Take those pumps off, now!",
						"I won’t let you milk me!",
						"I’m not your damn cow!",
					])
					if(getChar().isLactating()):
						addLines([
							"Don't you fucking dare steal my milk!",
							"My milk is not for you to steal, fucker!",
							"Don't you dare steal my breast milk, bitch!",
							"Fucking weirdo, my milk is not for you!",
							"No way you’re stealing my milk!",
							"Stop milking me, you fuck!",
						])
				if(!isResisting()):
					if(!hatesFetish(Fetish.Lactation)):
						addLines([
							"Ah.. What is this.. Breast pumps?..",
							"You wanna try to milk me?.. Like I'm a cow?..",
							"It's a bit embarrassing..",
							"These will milk me? Wow..",
							"Mmm, that feels weird.. but kinda nice.",
							"You really wanna milk me like this?",
							"So cold.. but I’m not complaining.",
							"Are you serious? Pumping me now?",
						])
						if(getChar().isLactating()):
							addLines([
								"You’re really gonna milk me dry, huh?",
								"You want all my milk, don’t you?",
								"Guess I’m your little milk cow now.",
								"My breasts are itching already..",
								"I do have some milk..",
							])

		SexReaction.MilkingSubWithBreastPump:
			if(_role == ROLE_MAIN):
				if(isAngry()):
					if(getChar(ROLE_TARGET).isLactating()):
						addLines([
							"Start mooing, whore.",
							"Moo like a good cowslut.",
							"Milking sluts is so fun.",
							"What a whore. Getting milked with pumps.",
							"Good milk, shame it’s from a bitch.",
							"I’ll drain you dry, little slut.",
							"Don’t stop now, milk slut.",
							"That’s it, keep the milk coming.",
							"Such a messy, milky whore.",
							"You’re just a milky cow now.",
							"Good cow, now moan for me.",
						])
					if(!getChar(ROLE_TARGET).isLactating()):
						addLines([
							"Stupid bitch, start lactating already.",
							"I don't care. I'm gonna milk you.",
							"Still no milk? Such a greedy bitch.",
							"Give me milk already like a good cow.",
							"I want milk. Now.",
							"Stop wasting my time, bitch. Give me some milk.",
							"Where’s my milk, slut?",
							"I’m not done until your tits start to drip.",
							"Empty tits, useless toy.",
							"I’ll squeeze till you bleed.",
							"I’m taking what I want, bitch.",
							"You’re my broken little cow.",
							"Milk or pain, pick one.",
							"Pathetic little milkless brat.",
						])
				if(!isAngry()):
					if(getChar(ROLE_TARGET).isLactating()):
						addLines([
							"Moo like a good cow for me.",
							"Doesn't that feel nice? Getting milked all day..",
							"Feels nice to have your breasts milked, right?",
							"Look at them pumps working. So nice.",
							"These pumps are working on your tits so nicely.",
							"If you moo, your milk will taste better..",
							"That milk’s coming out nice and slow.",
							"Your tits are doing all the work.",
							"Keep still, I want every bit.",
							"You’re such a good cow.",
							"Look at all that sweet milk.",
							"Perfect flow, keep it up.",
							"Your body knows what to do.",
							"Such soft, full breasts.",
							"These pumps love your milk.",
							"You make this so easy for me.",
							"I could milk you all day.",
							"Keep those tits working for me.",
							"I’m proud of how much you give.",
							"Such a sexy little dairy farm.",
						])
					if(!getChar(ROLE_TARGET).isLactating()):
						addLines([
							"No milk? You can still moo for me. Maybe that will help.",
							"Feels nice to have your breasts stimulated, right?",
							"Look at them pumps working. So nice.",
							"These pumps are working on your tits so nicely.",
							"Do you like that?",
							"Come on, show me some milk.",
							"Pumping those little nipples nice.",
							"I want to see those tits leaking.",
							"Just relax and let it flow.",
							"Your body’s made for this.",
							"Can’t wait to taste what you’ve got.",
							"You’re doing better than I thought.",
							"Nice and steady, don’t stop.",
							"Almost there, keep it up.",
							"You’re such a good milking pet.",
							"Feel that pull? It’s teasing you.",
							"I love watching you get all worked up.",
							"Those nipples look so sensitive.",
						])
			if(_role == ROLE_TARGET):
				if(hatesFetish(Fetish.Lactation)):
					if(!isResisting()):
						addLines([
							"I don't like this..",
							"Please turn them off..",
							"Please take them off my chest.",
							"Nhh.. Please..",
							"Nnhh.. this hurts..",
							"Nnh.. it’s too much..",
							"Please.. no more..",
							"Mmm.. these pumps suck way too hard..",
							"Nngh.. it’s so weird being milked like this..",
							"Nnhh.. my poor breasts..",
							"Mmm.. these pumps won’t quit, will they?",
						])
						if(getChar().isLactating()):
							addLines([
								"My nipple are leaking.. doesn't mean I like it..",
								"How much longer are you gonna milk me?",
								"Ugh, milk's leaking everywhere.. hhh..",
								"These pumps suck so much.. nnhh..",
							])
				if(isResisting()):
					addLines([
						"Take them off already!",
						"Stop trying to milk me!",
						"I'm not a cow!",
						"Turn them off, now!",
						"How do I turn them off.",
						"I will shake them off if I have to.",
						"Stop milking my poor tits!",
						"I’m not made for pumping.",
						"This pumping’s driving me crazy.",
						"My poor boobs can’t take this.",
						"Enough with the milking already.",
						"I’m not your personal dairy cow!",
						"My nipples are way too sensitive.",
					])
					if(getChar().isLactating()):
						addLines([
							"Stop stealing my milk, fucker!",
							"It's my milk, not yours!",
							"Milk yourself instead!",
							"These damn pump are squeezing me dry!",
							"Quit draining my milk, fucker!",
							"I’m not your personal milk supply!",
							"Stop milking me like a toy!",
							"I’m not a fucking milk cow!",
							"This pumping hurts, you fuck!",
						])
				if(!isResisting()):
					if(!hatesFetish(Fetish.Lactation)):
						addLines([
							"This feels so strange..",
							"I can feel the pumps tugging on my nips..",
							"Ah.. my nips..",
							"Mmm, the pumps are pulling so good..",
							"Feels so good on my breasts..",
							"My nipples are so sensitive..",
							"This pumping’s making me weak..",
						])
						if(getChar().isLactating()):
							addLines([
								"I can see the milk flowing.. So strange..",
								"My tits are being drained of all their milk..",
								"I'm being milked like a cow..",
								"I can feel the milk draining out..",
								"The pump’s pulling so hard, but it feels good.",
								"I didn’t know my tits could do this much..",
								"Milk’s just pouring out of me..",
								"My tits look so swollen and juicy.",
								"It’s so hot feeling my milk flow out like this.",
								"My nipples are twitching with every pull.",
								"Every pull makes my milk gush more.",
							])

		SexReaction.RemoveBreastPumpFromSub:
			if(_role == ROLE_MAIN):
				if(isAngry()):
					if(getChar(ROLE_TARGET).isLactating()):
						addLines([
							"Yeah, yeah, yeah. Shut up. Your milk is mine now.",
							"I will enjoy drinking this, bitch.",
							"Thank you for being a good slutty cow, you whore.",
							"What? Your udders needed to be milked. I'm waiting for a thank you.",
							"Finally done milking my little cow.",
							"Your milk’s all mine now.",
							"Quiet, this is my prize.",
							"I’ll be back when you’re full again.",
							"You’re nothing but my personal milk factory.",
							"Get used to this, bitch.",
							"You’re just my lactating toy now.",
							"I own every drop you produce.",
							"Want a round two, little cow?",
						])
					if(!getChar(ROLE_TARGET).isLactating()):
						addLines([
							"Where is my milk, whore!?",
							"Still not lactating? What a fucking joke of a chest you have.",
							"How are your tits still dry?!",
							"I give up. Someone should fucking breed you already.",
							"Come back when you're lactating, whore.",
							"Not a drop, useless.",
							"What a dry mess you are.",
							"No milk, no use.",
							"Try harder next time, maybe.",
							"Not a drop for me, huh?",
						])
				if(!isAngry()):
					if(getChar(ROLE_TARGET).isLactating()):
						addLines([
							"Thank you for the milk.",
							"I will be taking those back, thank you.",
							"Nice~. Something for me to drink.",
							"Thank you for being such a good cow.",
							"Thanks. Your breast milk is mine now.",
							"That’s enough for now, good cow.",
							"Your milk’s going to taste so good.",
							"Off with these, you did great.",
							"Milk’s collected, now rest up.",
							"Taking these off, you earned a break.",
							"Perfect yield today, well done.",
							"Your milk’s mine, remember that.",
							"Off they come, you’re amazing.",
							"Good job, little milky cow.",
							"Time to free those sweet tits.",
							"You’re such a good supplier.",
							"You did well, little cow.",
						])
					if(!getChar(ROLE_TARGET).isLactating()):
						addLines([
							"Still not lactating? Shame.",
							"It was worth a try.",
							"At least your tits got stimulated.",
							"Did you like that?",
							"Well, at least your breasts got some love.",
							"Not quite ready to give, huh?",
							"Guess we’ll have to wait.",
							"Maybe you’re saving it all for later.",
						])
			if(_role == ROLE_TARGET):
				if(hatesFetish(Fetish.Lactation)):
					if(!isResisting()):
						addLines([
							"I didn't really enjoy it.. Sorry..",
							"Please don't do this again.",
							"Finally..",
							"That’s.. over now, right?",
							"Was that supposed to feel good?",
							"Glad it’s done.. I think.",
							"Not sure if I liked that.",
							"Please, no more pumping.",
							"I’m just glad it’s off.",
						])
						if(getChar().isLactating()):
							addLines([
								"Finally.. You're happy with my milk?..",
							])
				if(isResisting()):
					addLines([
						"Fucking finally..",
						"Uhh.. ow..",
						"You fuck..",
						"Hope you're happy, fucker..",
					])
					if(getChar().isLactating()):
						addLines([
							"Fucking milk thief..",
							"Enjoy my milk, you fucker..",
							"Hope you choke on it..",
							"That’s my milk, asshole!",
							"Don’t you dare waste it!",
							"You left me empty, jerk!",
						])
				if(!isResisting()):
					if(!hatesFetish(Fetish.Lactation)):
						addLines([
							"That was very embarrassing..",
							"That was more intense than I thought.",
							"Wow, my tits feel so sensitive now.",
							"My boobs feel all tingly.",
							"My chest feels so light now.",
							"It’s weird how sensitive they are.",
						])
						if(getChar().isLactating()):
							addLines([
								"What are you gonna do with my milk?..",
								"You're not gonna give it to me?..",
								"Enjoy the milk..",
								"I felt like a cow..",
								"Hope you like the taste.",
								"That’s all mine, don’t waste it.",
								"You better enjoy what you got.",
								"Feels weird without the pump..",
							])

		SexReaction.SubMoos:
			if(_role == ROLE_MAIN):
				if(!isResisting()):
					addLines([
						"Moo..",
						"Moo~..",
						"Moo-o!",
						"Moo. Moo-o..",
						"Moo?.. Moo..",
						"Ah.. Moo..",
						"Moooo~..",
						"Moo~!",
						"Mooooo!",
						"Moo moo~",
						"Moo? Moo!",
						"Moooooo~!",
						"Moo.. Moo?",
						"Moo moo moo!",
						"Mooooo..",
						"Moo-o~",
						"Moo moo!",
						"Moo~ moo~",
						"Moooo?",
						"Moo moo~ moo!",
						"Moo~ moo~ moo~",
						"Moo moo..",
						"Moo! Moo!",
						"Mooo~ moo~",
						"Moo? Mooo!",
						"Moo moo!",
						"Moooo~!",
					])
				if(isResisting()):
					addLines([
						"Mmmph, moo..",
						"N-no, moo!",
						"Moo! Stop..",
						"Moo.. I won’t!",
						"Mmm, moo.. please!",
						"Ugh, moo..",
						"Moo! Let me go!",
						"Moo.. not fair!",
						"Moo! I’m serious!",
						"Mmmph, moo..",
						"Nooo, moo..",
						"Moo! Don’t make me!",
						"Moo.. I’m trying!",
						"Mmm, moo! Please!",
						"Moo.. this isn’t right!",
						"Mmmph, moo! Stop!",
						"Moo.. I hate this!",
						"Moo! I’m resisting!",
						"Moo.. don’t force me!",
						"Mmm, moo! Let go!",
					])

		SexReaction.DomAboutToStartGropingSubsBreasts:
			if(_role == ROLE_MAIN):
				if(isAngry()):
					addLines([
						"Give me those fucking tits.",
						"Don't fucking resist, bitch. I need your tits.",
						"I need something to squeeze. It's this or your throat.",
						"Don't mind me, whore.",
						"I need some stress-relief.",
						"Those tits are mine now.",
						"You’re not stopping me.",
						"You’re mine to squeeze.",
						"Don’t fight it, whore.",
					])
					if(getChar(ROLE_TARGET).canBeMilked()):
						addLines([
							"Give me your udders.",
							"Give me those fucking milkers.",
							"I know there is milk in them. Don't fucking resist.",
							"Who are you storing that milk for, whore?",
							"Let me squeeze those tits hard.",
							"I’m taking what’s mine now.",
							"Those milkers won’t stay full for long.",
							"I’m gonna drain every drop.",
							"I’ll punish those milk bags.",
							"You can’t hide your milk from me.",
							"I’ll make those nipples hard.",
						])
				if(!isAngry()):
					addLines([
						"Let's stimulate your breasts a little.",
						"I just wanna make you feel good.",
						"Let's get your nipples nice and hard.",
						"Don't mind me.",
						"Can’t wait to feel these.",
						"Your tits are begging for attention.",
						"Gonna make those nipples twitch.",
						"Ready for some sweet teasing?",
						"These breasts won’t touch themselves.",
						"Let me show you how good this feels.",
						"Let’s get those nipples sensitive.",
						"I’m gonna make those nipples hard.",
					])
			if(_role == ROLE_TARGET):
				if(hatesFetish(Fetish.Lactation)):
					if(!isResisting()):
						addLines([
							"What are you?..",
							"I'm not really into this..",
							"What is it about my chest?",
							"Hey, wait.. what are you doing?",
							"I’m not sure about this..",
							"Why my chest?",
							"Is this really necessary?",
							"I’m kinda uncomfortable..",
							"This feels weird to me.",
							"I’m not sure how to react.",
							"I’m trying to stay calm..",
						])
						if(getChar().canBeMilked()):
							addLines([
								"I have milk but I don't like being groped..",
								"Having milk doesn't mean.. you should..",
								"I’m not into this, even if my breasts are leaking..",
								"My milk’s not for you.",
								"My breasts don’t want this, but here we go.",
							])
				if(isResisting()):
					addLines([
						"Fuck off! Don't touch my chest!",
						"Hey, don't touch me, fucker!",
						"Don't touch my nipples, bitch!",
						"Get your hands off me!",
						"Hands off my chest!",
						"Stop! Not my tits!",
						"Get your filthy hands away!",
						"Stay away from my chest!",
						"Don’t touch me like that!",
						"Leave me the fuck alone!",
					])
					if(getChar().canBeMilked()):
						addLines([
							"I'm not a fucking cow, fuck off!",
							"You will waste all my milk, fucker!",
							"I’m not your milking cow!",
							"Don’t touch what’s not yours!",
							"Stop groping me, idiot!",
							"My milk’s not for you!",
							"I’m not your milking toy!",
							"Hands off these tits, jerk!",
							"I’m not your damn milk cow!",
							"Get your hands away from my milk!",
							"These breasts aren’t for you!",
							"You’ll ruin my milk, fucker!",
							"Don’t drain me, asshole!",
							"Leave my milk alone, damn it!",
						])
				if(!isResisting()):
					addLines([
						"Ah.. What are you about to..",
						"My chest?..",
						"It's a bit embarrassing..",
						"Are you gonna do what I'm thinking?..",
						"Wait.. you’re really going to?",
						"Please, be gentle..",
						"Your hands on me..",
						"I’m kinda trembling..",
						"Your touch already feels warm.",
					])
					if(getChar().canBeMilked()):
						addLines([
							"My nipples are itching already..",
							"Did you sensed that I'm lactating?..",
							"They're already leaking for you..",
							"My nipples are twitching..",
							"My nipples are hard and needy.",
						])

		SexReaction.DomStartsGropingSubsBreasts:
			if(_role == ROLE_MAIN):
				if(isAngry()):
					addLines([
						"Oh yeah, let me grope those. Don't cry, bitch.",
						"These are mine to grope any way I want.",
						"These are mine to grope and fondle any way I want.",
						"What a whore, letting me grope your tits.",
						"Shut up and let me grab.",
						"You’re lucky I’m in a good mood.",
						"Feel that? You’re property.",
						"Don’t cry, just take it.",
						"I’ll squeeze till you scream.",
						"My hands own those tits.",
						"You’re nothing but my toy.",
						"Quit whining and enjoy it.",
						"These tits belong to me now.",
						"I’m gonna bruise these pretty things.",
						"Squirm all you want, bitch.",
						"Stop being so sensitive.",
						"My hands don’t ask, they take.",
						"You’re lucky I’m gentle.. for now.",
						"Whore, you will look good with my hands on you.",
						"Don’t even think about pulling away.",
						"I’ll squeeze until you beg for more.",
					])
					if(getChar(ROLE_TARGET).canBeMilked()):
						addLines([
							"So heavy I wanna squeeze them HARD.",
							"Let me see that milk squirt.",
							"I’ll drain every drop from these.",
							"You don’t get a say, these are mine now.",
						])
					if(getChar(ROLE_TARGET).hasBigBreasts()):
						addLines([
							"Some nice heavy milkers!",
							"You got some real udders, bitch!",
							"Nice tits, so fucking heavy.",
							"Are those tits even real? So fucking heavy!",
							"Hell of a rack you’ve got there, slut.",
							"Gotta say, those melons are impressive.",
							"Such heavy tits begging to be grabbed.",
							"I’m gonna make those tits work for me.",
						])
					if(getChar(ROLE_TARGET).hasSmallBreasts()):
						addLines([
							"There is nothing to grope even!",
							"Why the flat chest? I need something to squeeze. Never mind.",
							"This will have to do.",
							"Cute chest, whore.",
							"Barely anything to grab.",
							"Pathetic little bumps.",
							"This? This is all I get?",
							"So flat, it’s almost sad.",
							"Not much to squeeze here.",
							"You call this a chest?",
							"Might as well be nothing.",
							"Small and useless, just like you.",
							"Squishy little nothings.",
							"Such tiny, worthless tits.",
						])
				if(!isAngry()):
					addLines([
						"I will try not to be too firm.",
						"It will feel good, trust me.",
						"Let me get a feel for yours.",
						"Nice..",
						"Soft and perfect, just how I like.",
						"Just relax and enjoy this.",
						"Getting to know you better.",
						"You’re mine to touch.",
					])
					if(getChar(ROLE_TARGET).canBeMilked()):
						addLines([
							"I can feel them being heavy with milk already.",
							"Perfect for milking, baby.",
							"Heavy with all your sweet milk.",
							"Can’t wait to drain these.",
						])
					if(getChar(ROLE_TARGET).hasBigBreasts()):
						addLines([
							"Those are some big breasts. Wow.",
							"So heavy.. and soft.",
							"How can I not play with such big tits.",
							"These feels like pillows. Big pillows.",
							"Heavy enough to drown in.",
							"You’re carrying quite the treasures.",
							"How’d you get these perfect pillows?",
							"Can’t resist these big soft mounds.",
						])
					if(getChar(ROLE_TARGET).hasSmallBreasts()):
						addLines([
							"What a cute flat chest.",
							"There is still something to grope.",
							"A little flat. But it will do~.",
							"Not much to grope. But I'm not complaining.",
							"Cute little things you’ve got.",
							"So petite, so perfect.",
							"I love how easily they fit in my hands.",
						])
			if(_role == ROLE_TARGET):
				if(hatesFetish(Fetish.Lactation)):
					if(!isResisting()):
						addLines([
							"Hey..",
							"W-wait..",
							"Not so firmly..",
							"P-please, be gentle..",
							"I.. I’m not used to this.",
							"C-can you go slower?",
							"U-uh.. this feels strange.",
							"I don’t really like this..",
							"S-so sudden..",
							"I’m not sure about this..",
							"I don’t want to hate it..",
							"I’m a little scared..",
							"D-don’t be too rough..",
							"I’m not used to hands here.",
							"Please don’t hurt me.",
							"M-maybe a bit softer?",
							"I don’t know if I like this..",
							"J-just a little, okay?",
							"I’m not sure how to feel.",
							"T-this is kinda embarrassing..",
							"I don’t want to push you away..",
						])
						if(getChar().canBeMilked()):
							addLines([
								"My milk.. ah..",
								"Please.. not my milk..",
								"My breasts.. please be gentle..",
								"Ah.. you're making my breasts leak..",
								"Please.. don’t squeeze so hard..",
								"I’m so shy about this..",
								"My milk.. it’s leaking..",
								"It feels weird..",
							])
						if(getChar().hasBigBreasts()):
							addLines([
								"Is it because of the size?..",
								"My big tits..",
								"Groping my heavy breasts!",
								"Don’t squeeze my big chest!",
								"My breasts feel so exposed..",
							])
						if(getChar().hasSmallBreasts()):
							addLines([
								"I don't even have big tits, why are you.. ah.",
								"Why don't you grope someone with bigger.. ah..",
								"They’re so small.. are you sure?",
								"These tiny things don’t deserve this..",
								"Uh, my boobs are kinda flat, though.",
								"Is there anything to grab here?",
								"My little tits aren’t made for this.",
								"You really want to touch these?",
								"I don’t have much to offer, sorry.",
								"They’re barely there, you know.",
								"I wish I had more to hold.",
								"These are nothing special..",
								"You sure you want these tiny things?",
								"They’re cute but so small..",
								"I feel weird with you touching these.",
								"Not much to squeeze, I’m sorry.",
								"These little things don’t usually get this attention.",
							])
				if(isResisting()):
					addLines([
						"Stop! Hey..",
						"Why so firmly! Hey..",
						"Wait, stop groping me!",
						"You really gonna grope my tits right now? Fuck..",
						"Stop grabbing my breasts!",
						"Get your hands off me!",
						"Don’t squeeze so hard!",
						"Quit groping me like that!",
						"Hands off! I said stop!",
						"That’s too rough, cut it out!",
						"Stop fondling me!",
						"Don’t grope me like I want it!",
						"No! Don’t touch my chest!",
						"You can’t just grab me!",
						"Don’t squeeze my tits!",
						"I’m serious, hands off!",
						"Stop messing with me!",
						"That’s way too much!",
						"Please don’t grope me!",
						"Get your hands away!",
					])
					if(getChar().canBeMilked()):
						addLines([
							"My milk!.. Ah..",
							"Not my tits, ah..",
							"No, don’t touch my milk!",
							"My tits.. don’t squeeze!",
							"Don’t milk me like that!",
							"Quit it, I’m still full!",
							"Don’t squeeze my milkbags!",
							"Ah, stop milking me!",
							"Don’t touch my swollen breasts!",
							"My milk’s not for you!",
							"No, don’t milk me now!",
						])
					if(getChar().hasBigBreasts()):
						addLines([
							"Big tits doesn't mean you can grope them! Ah..",
							"Those are my tits, fuck off..",
							"Get your hands off my big tits!",
							"Hands off my heavy tits!",
							"Quit pawing my big boobs!",
							"These aren’t toys, get lost!",
							"Back off these massive tits!",
							"Quit squeezing my heavy breasts!",
							"Hands off my big knockers!",
						])
				if(!isResisting()):
					if(!hatesFetish(Fetish.Lactation)):
						addLines([
							"Ah..",
							"Feels weird..",
							"Not too hard..",
							"My nips feel so stiff..",
							"Mmm, that feels nice..",
							"Mmm, that feels strange..",
							"They’re so sensitive right now..",
							"My skin’s tingling..",
							"It’s a weird kind of nice..",
							"That’s kind of hot, I guess..",
						])
						if(getChar().canBeMilked()):
							addLines([
								"My milk.. ah..",
								"You're groping my lactating breasts.. ah..",
								"Your hands.. on my milk-filled breasts..",
								"Mmm, your touch makes them leak..",
								"So gentle with my swollen tits..",
								"Ah, your fingers on my lactating breasts..",
								"I didn’t expect this feeling..",
								"Your grip makes my nipples harden..",
								"Your hands make me shiver..",
								"Ah, your fingers coaxing my milk out..",
							])
						if(getChar().hasBigBreasts()):
							addLines([
								"Yeah.. grope my heavy tits..",
								"Do you see how big they are?..",
								"Do you feel how heavy they are?..",
								"They’re so big.. don’t stop squeezing.",
								"I’m not used to this much attention here.",
								"Careful, they’re sensitive when squeezed.",
								"It’s strange being handled like this.",
								"Your fingers dig into all this softness.",
								"They jiggle so much under your touch.",
							])
						if(getChar().hasSmallBreasts()):
							addLines([
								"I don't really have real tits..",
								"Hope you're happy with my size.. ah..",
								"Not much to grab here..",
								"Feel a little empty, huh?",
								"Guess my tits are tiny, sorry..",
								"Hope you don’t mind these little things..",
								"Barely enough for you to hold..",
								"Not much to squeeze, huh?",
							])

		SexReaction.DomGropesSubsBreasts:
			if(_role == ROLE_MAIN):
				if(isAngry()):
					addLines([
						"Do you like this, bitch?",
						"I'm groping your tits. Feels good yet, whore?",
						"Feels good yet, slut?",
						"Just enjoy it, whore.",
						"Don't try to deny that you love this.",
						"These tits are mine to squeeze.",
						"You like it rough, don’t lie.",
						"Stop pretending you hate it.",
						"I’ll crush these tits if I want.",
						"Feel that grip, slut?",
						"Your tits belong to me now.",
						"Squirm for me, little toy.",
						"Keep still or I get rougher.",
						"Your pain’s my pleasure.",
						"Mine to abuse, slut.",
					])
					if(getChar(ROLE_TARGET).canBeMilked()):
						addLines([
							"So milky.",
							"So easy to milk your udders.",
							"Nice and juicy.",
							"Look at these dripping tits.",
							"Mine to squeeze and milk.",
							"Perfect for me to drain.",
							"Can't wait to taste.",
							"Overflowing for me.",
							"Tender and dripping.",
							"Mine to milk and own.",
						])
					if(getChar(ROLE_TARGET).hasBigBreasts()):
						addLines([
							"Huge tits whore.",
							"Big tits, just for me.",
							"So heavy, so mine.",
							"Feel how hard I’m squeezing.",
							"These fuckin’ beasts are mine.",
							"You’re my big-breasted toy.",
							"I own every inch of these.",
							"Keep those jugs right here.",
							"Mine to squeeze and tease.",
						])
					if(getChar(ROLE_TARGET).hasSmallBreasts()):
						addLines([
							"Flat chest whore.",
							"Pathetic little tits.",
							"Is that all you got?",
							"Small, but mine.",
							"Cute, but useless.",
							"So flat, so weak.",
							"Barely worth touching.",
							"You’ll learn to love this.",
							"I own every inch.",
						])
				if(!isAngry()):
					addLines([
						"You like this?",
						"I know you like this.",
						"Feels good, right?",
						"Feels nice, doesn't it.",
						"Feels nice to grope your chest.",
						"Can’t get enough of these.",
						"Look at these beauties.",
						"You’re so damn touchable.",
						"These are made for me.",
						"You’re mine to fondle.",
						"Can’t stop touching you.",
					])
					if(getChar(ROLE_TARGET).canBeMilked()):
						addLines([
							"So milky.",
							"So easy to milk you.",
							"Such juicy tits.",
							"Perfect for squeezing.",
							"Milk’s flowing nice.",
							"Soft and swollen.",
							"Keep leaking for me.",
							"I could squeeze forever.",
							"Gonna milk you dry.",
						])
					if(getChar(ROLE_TARGET).hasBigBreasts()):
						addLines([
							"So soft. Like pillows.",
							"Such heavy, lovely tits.",
							"Big and begging to be touched.",
							"So full, so delicious.",
							"I could squeeze these all day.",
							"Love how they bounce for me.",
							"These tits are my favorite toy.",
							"I want to bury my face here.",
						])
					if(getChar(ROLE_TARGET).hasSmallBreasts()):
						addLines([
							"So small.",
							"I can feel your hard nips at least.",
							"Cute little mounds.",
							"Perfect for my hands.",
							"Small, but so sweet.",
							"Love how soft you are.",
							"These fit just right.",
							"So eager under my touch.",
							"Petite and perfect.",
							"I could cup these all day.",
							"You’re adorable like this.",
							"I could squeeze you forever.",
						])
			if(_role == ROLE_TARGET):
				if(isResisting()):
					addLines([
						"Hey..",
						"W-wait..",
						"Ngh..",
						"E-Easy..",
						"Not like that..",
						"N-no, stop..",
						"Get off me..",
						"N-no way..",
						"H-hands off!",
						"Let go!..",
						"N-not like that!",
						"N-no more!",
						"H-hey.. Fuck..",
						"Fuck..",
						"Not so hard.. Ugh..",
						"Stop groping me..",
						"Ngh..",
						"Quit it..",
					])
					if(getChar().canBeMilked()):
						addLines([
							"My milk.. ah..",
							"Stop.. my milk’s leaking..",
							"Please.. not my breasts..",
							"They’re full.. it hurts..",
							"Don’t squeeze my lactating tits!",
							"My milk’s spilling everywhere..",
							"Ah.. don’t drain me like this..",
							"I’m lactating.. please, no..",
							"My milk’s flowing.. please stop..",
							"My breasts.. they’re so swollen..",
							"Please, my milk’s still coming..",
							"You’re milking me against my will..",
							"No! My milk’s not for you..",
							"My milk.. Ah..",
							"Not my leaky tits, ah..",
							"Why am I leaking milk.. f-fuck..",
						])
				if(!isResisting()):
					addLines([
						"Ah..",
						"Ah-h..",
						"Ngh-h..",
						"My nips feel so stiff..",
						"Groping me.. so boldly..",
						"My breasts..",
						"My chest..",
						"You're.. groping me..",
						"Touching my tits..",
						"My nipples.. hah..",
					])
					if(getChar().canBeMilked()):
						addLines([
							"My milk.. ah.. moo?..",
							"My breasts are producing milk..",
							"Mmm, my milk is flowing..",
							"Ah, my milk’s coming out..",
							"Don’t stop, my tits are dripping.",
							"My breasts feel so full and warm.",
							"Milk’s leaking from my nipples..",
							"Can you feel my milk flowing?",
							"I’m dripping milk all over you..",
						])
					if(getChar().hasBigBreasts()):
						addLines([
							"Heavy.. aren't they..",
						])

		SexReaction.Choking:
			if(_role == ROLE_MAIN):
				if(!isSubby()):
					if(isAngry()):
						addLines([
							"Stupid bitch. You're probably getting off from this.",
							"Fucking whore. Look at me while I'm choking you.",
							"You don't need air, stupid slut.",
							"It's your fault!",
							"Do you like being choked, bitch?",
							"Shut up and take it.",
							"I’m the one in charge here.",
							"Don’t fight me, worthless.",
							"Keep your damn mouth shut.",
							"You’re mine to control.",
							"No air for a filthy slut.",
							"Struggle all you want, bitch.",
							"Look at me or I’ll squeeze harder.",
							"You think you’re tough? Prove it.",
							"Beg all you want, I don’t care.",
							"This is your punishment.",
							"Taste your own desperation.",
							"I’m not done with you yet.",
							"Say thank you, little slut.",
							"Your breath is mine to take.",
							"Feel that pressure? You asked for it.",
							"Keep struggling, it only tightens.",
							"You don’t get to breathe until I say.",
						])
					if(!isAngry()):
						addLines([
							"You like it? Having no air.",
							"Arousing, isn't it? I have full control.",
							"You enjoy being choked?",
							"Just let it happen. Don't fight it.",
							"Look at me while I'm choking you.",
							"You look so cute.",
							"Quiet now, listen to me.",
							"No noise unless I say.",
							"Stay still or suffer more.",
							"Breathe when I let you.",
							"Eyes on me, always.",
							"Don’t fight, obey.",
							"Control is mine alone.",
							"Feel that pressure? Obey.",
							"I decide when you breathe.",
							"Not a sound, got it?",
							"Stay obedient, or else.",
							"I own you right now.",
							"This is discipline, sweetie.",
							"You’re mine to command.",
							"Eyes up, no distractions.",
						])
				if(isSubby()):
					addLines([
						"I totally don't wanna be in your place..",
						"Why is choking so hot..",
						"Wanna choke me too?..",
						"I shouldn’t like this, but I do..",
						"Choking you feels so wrong.. and right.",
						"You’re so cute when you gasp.",
						"Holding your neck feels nice.",
						"I wanna be gentle but.. choking’s hot.",
						"Your gasps send shivers down my spine.",
						"Is it wrong if I like this too much?",
						"I don’t wanna hurt you.. but I want to.",
						"Choking you makes me feel alive.",
						"My hands shake but I wanna squeeze.",
						"I never thought choking would be my thing.",
						"You’re helpless, and it drives me wild.",
						"Maybe I’m a little twisted, but I love this.",
					])
			if(_role == ROLE_TARGET):
				if(isResisting()):
					addLines([
						"Let me breathe.. f-fucker..",
						"I wanna.. b-breathe..",
						"S-stop it..",
						"Stop choking.. me..",
						"Hands.. off.. my neck..",
						"Q-quit it..",
						"That's not funny.. ugh..",
						"Kgh..",
						"Let go..",
						"S-stop choking me!",
						"L-Let me go!",
						"Air.. khh.. need air..",
						"G-get off!.. fuck..",
					])
				if(!isResisting()):
					if(lovesFetish(Fetish.Choking)):
						addLines([
							"Choke me harder..",
							"Harder..",
							"Ngh-h..",
							"Choking me.. so nice..",
							"Ngh..",
							"Yes-s.. more..",
							"Mmm.. don’t stop..",
							"Harder.. please..",
							"Ngh.. keep going..",
							"So tight.. mmph..",
							"Can’t breathe.. love it..",
							"Ugh.. more..",
							"Don’t.. let go..",
							"Mmph.. choking me..",
							"Yeah.. squeeze..",
							"Guh.. feel good..",
							"So rough.. mmph..",
							"Need.. more..",
							"Mmmph.. don’t stop..",
							"Tight.. don’t ease..",
							"Love this.. ngh..",
							"Harder.. ngh..",
							"Can’t.. stop..",
							"Squeeze.. ahh..",
							"Ngh.. don’t slow.. kh..",
						])
					if(!lovesFetish(Fetish.Choking)):
						addLines([
							"H-hey.. Fuck..",
							"Fuck..",
							"Air..",
							"My neck..",
							"Ngh..",
							"Are you.. ngh..",
							"Mmm.. breathe.. can’t..",
							"G-give me air..",
							"C-can’t.. hold on..",
							"Ahh.. too tight..",
							"Please.. easy..",
							"H-hey.. don’t kill me..",
							"Mmmph.. too much..",
							"Ah.. need air..",
							"Mmmph.. c-can’t..",
							"C-can breathe.. please..",
							"N-no.. too tight..",
							"H-hurts.. stop..",
							"G-give me air..",
							"Nngh.. choking..",
							"Please.. let go..",
							"Mmm.. can’t.. breathe..",
							"Struggling.. can’t..",
							"Nngh.. too much..",
							"H-hey.. too tight..",
							"Mmmph.. please..",
							"Nngh.. help..",
							"H-hey.. g-get off..",
							"Nngh.. can’t move..",
							"Mmm.. please stop..",
							"S-struggling.. air..",
						])

		SexReaction.ChokingHard:
			if(_role == ROLE_MAIN):
				if(!isSubby()):
					if(isAngry()):
						addLines([
							"Gonna black out on me? Huh?",
							"How much oxygen is left in that stupid head of yours.",
							"Pass out already, whore.",
							"I don't care. You're not breathing today.",
							"You like it?! Stupid whore.",
							"What? Roll your scared eyes away already.",
							"Can’t breathe? Good.",
							"Hold still or I’ll squeeze harder.",
							"Gag for me, you worthless.",
							"You think you can fight this?",
							"Try to pass out, I dare you.",
							"Struggle all you want, slut.",
							"Taste your own panic.",
							"Don’t slip away on me now.",
							"I own your breath, don’t forget.",
							"Keep gasping, it’s cute.",
							"Fight harder or fade away.",
							"No air for you, slut.",
							"Beg for breath, I’m cruel.",
							"Gag harder, it turns me on.",
							"You’re mine to suffocate.",
						])
					if(!isAngry()):
						addLines([
							"Take a deep breath. Too late.",
							"Let's see how much you can last.",
							"Time is running out.. Tick.. Tack..",
							"Feeling weaker and weaker..",
							"Corners of your vision getting dark already?",
							"You look so cute.",
							"Gonna black out on me?",
							"Hold still. Don’t fight me.",
							"Breathe when I say so.",
							"Good toys  don’t pass out.",
							"Keep your eyes on me.",
							"Don’t waste air on whining.",
							"Focus, or you lose it.",
							"Not a word. Just obey.",
							"Almost there. Hold on.",
						])
				if(isSubby()):
					addLines([
						"So fucking hot.. I'm sorry..",
						"I'm sorry..",
						"I'm very sorry..",
						"Sorry.. but I love this.",
						"Ah.. I didn’t mean to be this rough.",
						"So sorry.. can’t help myself.",
						"Sorry, it’s just too hot.",
						"I’m bad, sorry.. but it’s sexy.",
						"Ah, sorry.. I can’t stop.",
						"So sorry.. you make me wild.",
						"Sorry.. choking’s just too hot.",
						"I’m sorry.. but you make me do it.",
						"I love being rough with you.",
						"Ah, sorry.. I get carried away.",
						"I’m sorry.. you’re just too tempting.",
						"So sorry.. but this feels amazing.",
					])
			if(_role == ROLE_TARGET):
				addLines([
					"Ngh..",
					"Hh-h-..",
					"Kh-h.. hh-h..",
					"..nh-h..",
					"Hh-h.. h-h.. kh-..",
					"Nh-h..",
					"Fh-h..",
					"Nngh..",
					"Hh.. hh..",
					"Mmmph..",
					"Khh.. uh..",
					"Hhnn..",
					"Gah..",
					"Uh.. ngh..",
					"Hhhnn..",
					"Mmph..",
					"Nh.. ahh..",
					"Khh.. mmph..",
					"Hnngh..",
					"Ugh..",
					"Nghh..",
					"Hhmm..",
					"Mmmh..",
					"Ghh..",
					"Hnn..",
					"Khh.. ahh..",
				])
				if(lovesFetish(Fetish.Choking)):
					addLines([
						"H-h..ot-t..",
						"H-h.. ahr..-der..",
						"Ngh~..",
						"Mmphh~..",
						"Nghh~..",
						"Hngh~..",
						"Mmmf~..",
						"Nngh~..",
						"Hmph~..",
						"Mmff~..",
						"Nghhmm~~..",
						"Hnghh~..",
						"Mmphh~..",
						"Nffh~..",
						"Hnhh.. h-hot..",
					])

		SexReaction.DomBreastfeedsSub:
			if(_role == ROLE_MAIN):
				if(isAngry()):
					if(!getChar().canBeMilked()):
						addLines([
							"There will be milk eventually. Just suckle, slut.",
							"You want milk? You will get it if you try hard enough, whore.",
							"Harder, slut.. if you want milk.",
							"You’re not ready yet, keep at it.",
							"Still dry? Try harder.",
							"No milk until you earn it.",
							"Suckle properly or I’ll stop.",
							"Quit slacking and feed.",
							"No reward for lazy suckling.",
							"Suck harder, nothing’s dripping.",
							"Keep trying, I won’t give up.",
							"Your mouth isn’t working right.",
							"Feed like your life depends on it.",
							"You call that suckling? Pathetic.",
							"Milk better come soon.",
						])
					if(getChar().canBeMilked()):
						addLines([
							"You like my milk, whore?",
							"You're so lucky I'm letting you do this.",
							"Enjoy the milk while you can.",
							"Suckle on my tits. Do it.",
							"I feel the milk flowing.. Drink it.",
							"Drink it all, bitch.",
							"Slurp every drop, you needy bitch.",
							"Don’t you dare pause.",
							"Keep drinking until I say stop.",
							"You fucking crave this, admit it.",
							"Hurry up.",
							"Lick those nipples raw.",
							"You better be grateful.",
							"Devour it like you owe me.",
							"Obey and keep your mouth on me.",
							"Suck harder, you pathetic thing.",
							"Gag on it, you worthless pet.",
							"Finish every drop, don’t waste it.",
							"Eyes up, show me you deserve it.",
							"No whining, just drink.",
							"You’ll be begging by the time I’m done.",
						])
						if(getChar().hasBigBreasts()):
							addLines([
								"Oh yeah, you love my big leaky tits, don't you?",
								"I'm such a fucking cow. Drink my milk.",
								"Yeah.. suck on my udders.. Fuck yeah..",
								"Drink up, slut.",
								"Take every drop.",
								"Gulp it all.",
								"I’m overflowing—keep going.",
								"Good girl, latch on.",
								"You need this, don’t you?",
								"Fill your mouth with my milk.",
								"My tits are all yours.",
								"Suckle harder.",
								"Taste how full I am.",
								"Better? Keep drinking.",
								"Squeeze them, get every drop.",
								"Mine to feed.",
								"Beg for more milk.",
								"Messy? Good.",
								"My breasts, your pleasure.",
								"Show me you’re hungry.",
								"You’re my milk slut.",
							])
						if(getChar().hasSmallBreasts()):
							addLines([
								"What? Yeah, they're small. Keep sucking, bitch!",
								"Small tits doesn't mean I can't lactate!",
								"Yeah, they’re tiny, suck them dry.",
								"Get on with it, you know what to do.",
								"Stop gawking, drink up.",
								"These little things still produce. Hurry.",
								"Suck harder. I’m not here for cuddles.",
								"Keep sucking, don’t you dare stop.",
								"Milk me, brat. Prove you deserve it.",
								"These small breasts still give plenty, drink up.",
							])
				if(!isAngry()):
					if(!getChar().canBeMilked()):
						addLines([
							"There will be milk eventually..",
							"You want milk? You will get it if you try hard enough..",
							"I have no milk for now..",
							"I'm dry for now.. But keep suckling..",
							"Not yet.. keep sucking.",
							"No milk yet.. don’t stop.",
							"Keep licking.. it’ll come.",
							"Hang on.. it’ll flow soon.",
							"Keep that mouth busy.",
							"Smooth and deep.. keep going.",
							"Keep at it.. I’ll leak soon.",
						])
					if(getChar().canBeMilked()):
						addLines([
							"Oh.. I feel so motherly.",
							"Mhm~.. Feels good.",
							"Keep going sweetie..",
							"Keep suckling on my nips, sweetheart..",
							"Breastfeeding feels so good..",
							"Knead them if you can..",
							"I love how cute you look..",
							"Suckling on my breasts.. So nice..",
							"This is incredible..",
							"Drink it all in.",
							"That’s my good pet.",
							"Keep sucking tight.",
							"That’s perfect, baby.",
							"Right there, good job.",
							"Keep that mouth busy.",
							"Mmm.. just like that.",
							"So sweet.. keep going.",
							"You’re doing so well.",
							"Don’t stop now.",
							"Feel every drop.",
							"That’s it.. drink up.",
							"Yes.. you’ve got it.",
							"So good.. don’t let go.",
							"Keep those lips moving.",
							"Feel free to gulp it down.",
						])
						if(getChar().hasBigBreasts()):
							addLines([
								"You like my big breasts?..",
								"So much milk in my jugs..",
								"Not mooing is so hard..",
								"Feel that warm milk?",
								"Keep sucking hard.",
								"My milk’s flowing just for you.",
								"Don’t stop now.",
								"You love my milk, don’t you?",
								"My breasts are bursting.",
								"Worship these tits.",
								"Gulp it down, pet.",
								"You’re so good at this.",
							])
						if(getChar().hasSmallBreasts()):
							addLines([
								"You look so good nursing on these.",
								"My small breasts are all yours.",
								"Suckle harder on these little jugs.",
								"You love these tiny nips, don’t you?",
								"Keep that mouth right on my nipple.",
								"Mine are little, but for you, big enough.",
								"My small tits are perfect for you.",
								"Keep sucking, sweetheart.",
								"I’m so wet with milk for you.",
								"My little boobs are yours to feed on.",
							])

		SexReaction.DomBreastfeedPraise:
			if(_role == ROLE_MAIN):
				if(isAngry()):
					addLines([
						"Good slut.",
						"Good whore. Keep at it.",
						"You're doing good, little slut.",
						"You're less pathetic than I thought, whore.",
						"Milk me like you want your life to depend on it.",
						"Suck harder, you useless thing.",
						"Keep that mouth on my tit, don’t you dare slack off.",
						"Good. Now don’t you pull away.",
						"That’s right, don’t you choke on it.",
						"You better swallow every drop.",
						"Use those lips, slut, no half-measures.",
						"Feed, whore, and keep your eyes on me.",
						"Don’t even think of pulling off.",
						"Stay right there and don’t whine.",
						"Keep going until I tell you to quit.",
						"That’s it, take it all, bitch.",
						"Don’t slow down until I’m satisfied.",
						"Good. Now don’t you dare blink.",
						"Suck until I grow tired of you.",
						"You got that? Don’t you dare slack.",
						"Keep that mouth busy, pet.",
						"Show me you can handle it.",
						"Don’t stop until I say.",
					])
					if(getChar().canBeMilked()):
						if(getChar().hasBigBreasts()):
							addLines([
								"Good.. Suck on those big milky tits..",
								"Good whore.. You like my huge udders, don't you?",
							])
						if(getChar().hasSmallBreasts()):
							addLines([
								"Good whore. Sucking on my small tits so eagerly.",
								"Good bitch. Keep suckling on my flat chest.",
							])
				if(!isAngry()):
					addLines([
						"Good.. keep at it, cutie..",
						"You're doing great, sweetheart.",
						"Good {target.girl}..",
						"You're so cute.. keep going..",
						"Show me how you can suckle..",
						"Very nice.. So nice..",
						"Ah.. you're doing great..",
						"Such a cutie.. I'm proud..",
						"That’s it, right there.",
						"Just like that, baby.",
						"Yeah.. suckle for me.",
						"Perfect, don’t stop.",
						"So good.. keep going.",
						"Mmm.. you’re doing amazing.",
						"Nice and steady.",
						"Exactly how I like it.",
						"Don’t let go.",
						"Feel free to drink up.",
						"Such a good feeder.",
						"You’ve got this down.",
						"Taste perfect.",
						"Keep those lips working.",
						"Just like that.. more.",
						"Harder.. good girl.",
						"You’re nailing it.",
						"So warm.. so sweet.",
						"That’s perfect pressure.",
						"You make me so proud.",
					])
					if(getChar().canBeMilked()):
						if(getChar().hasBigBreasts()):
							addLines([
								"Suckle on my big breasts.. Yeah, like that..",
								"My breasts are heavy with milk.. Keep going.. You're doing great..",
								"You're making me proud.. Suckling on my giant breasts like that..",
								"You like the milk? Keep going.. There is plenty in my big breasts..",
							])
						if(getChar().hasSmallBreasts()):
							addLines([
								"I don't have much milk.. But you're doing great..",
								"Wow.. Keep sucking on my small tits..",
							])

		SexReaction.DomBreastfeedsOnSub:
			if(_role == ROLE_MAIN):
				if(isAngry()):
					if(!getChar(ROLE_TARGET).canBeMilked()):
						addLines([
							"Where is the milk, bitch.",
							"I don't taste any milk.",
							"Huh..",
							"Where’s the fucking milk?",
							"Not a drop, you useless..",
							"Pathetic. No milk at all.",
							"Your tits are empty, like your worth.",
							"I need milk.",
						])
					if(getChar(ROLE_TARGET).canBeMilked()):
						addLines([
							"Don't squirm.. Mmh~..",
							"Mmh.. I can taste it.",
							"What a slut..",
							"Mhm~..",
							"I need more.",
							"You think you can hide that milk?",
							"I’ll take every drop.",
							"No whining, just milk.",
							"You owe me this.",
							"Give it to me straight.",
							"Mine now, don’t stop.",
							"That’s right, keep going.",
							"Fill my mouth, slut.",
							"I’m not letting go.",
							"You’re mine to suck.",
							"This is your only job.",
							"Show me you can give more.",
							"Make me satisfied.",
						])
						if(getChar(ROLE_TARGET).hasBigBreasts()):
							addLines([
								"Heavy udders.",
								"Such a fucking cow.",
								"Milking time, bitch.",
								"Give me that milk now.",
								"Drip every drop into my mouth.",
								"Hurry up, I’m thirsty.",
								"I’ll drain you dry.",
								"I’ll rip those tits if you resist.",
							])
						if(getChar(ROLE_TARGET).hasSmallBreasts()):
							addLines([
								"Flat and yet I taste milk.",
								"How much milk is in those little tits.",
								"I want every last bit of milk.",
								"Those small tits better gush for me.",
								"Push more milk into my mouth.",
								"Don’t hold back that sweet milk.",
								"I’ll drain every drop, you hear?",
								"Your tiny tits better not disappoint.",
								"Show me how much you’ve got.",
							])
				if(!isAngry()):
					if(!getChar(ROLE_TARGET).canBeMilked()):
						addLines([
							"Still no milk..",
							"You like my tongue?",
							"Let me smooch them.",
							"One day they will have milk.",
							"I don't taste any milk.",
							"I’m getting thirsty.",
							"Where’s your sweet nectar?",
							"You’re teasing me.",
							"Still nothing, darling?",
							"Barely a trickle.",
							"I’m getting an appetite.",
							"No milk, no fun.",
						])
					if(getChar(ROLE_TARGET).canBeMilked()):
						addLines([
							"So milky.",
							"So easy to milk you.",
							"Mmh.. I can taste it.",
							"Mhm~..",
							"Tastes good..",
							"Such a creamy flow.",
							"Keep those streams coming.",
							"You’re overflowing.",
							"Can’t get enough of that milk.",
							"You taste divine.",
							"Your milk drives me wild.",
							"I want every drop.",
							"My favorite treat.",
							"You’re a perfect milkmaid.",
						])
						if(getChar(ROLE_TARGET).hasBigBreasts()):
							addLines([
								"You're like a cow.",
								"Lactating like a cow.",
								"So much milk..",
								"Such big, juicy tits for me.",
								"Can’t get enough of this.",
								"So full.. keep it coming.",
								"You’re overflowing with milk.",
								"You’re a damn milk machine.",
								"Your tits are made for this.",
								"Gushing milk just for me.",
								"You’re my personal cow.",
								"Can’t resist these heavy tits.",
								"That milk’s thick and sweet.",
							])
						if(getChar(ROLE_TARGET).hasSmallBreasts()):
							addLines([
								"So small. But I taste milk.. Nice.",
								"How much milk is in those little tits.",
								"Sweet milk from tiny buds.",
								"Little breasts, but so much milk.",
								"Cute and milky, just right.",
								"Small and full of milk.",
								"Milk dripping from those small buds.",
								"Those tiny tits hold so much.",
								"Little breasts, plenty of milk.",
								"Milk tastes better from tiny tits.",
								"Soft, small, and milky.",
							])
			if(_role == ROLE_TARGET):
				if(hatesFetish(Fetish.Lactation)):
					if(isResisting()):
						addLines([
							"I don't like this..",
							"Please quit it..",
							"Please stop.",
							"Why are you doing this?",
							"I don’t want this..",
							"Please, no more..",
							"Stop, seriously.",
							"I’m not okay with this.",
							"Can you just quit?",
							"This feels wrong.",
							"Why won’t you stop?",
							"I’m really uncomfortable.",
							"No, just stop it.",
							"I don’t want to do this.",
							"This is messing with me.",
						])
						if(getChar().isLactating()):
							addLines([
								"My nipple are leaking.. doesn't mean I like it..",
								"How much longer are you gonna feed on me?",
								"I'm not your cow..",
								"I don't wanna breastfeed..",
								"Don’t expect me to like this.",
								"I’m only letting you because I have to.",
								"I’m not your damn milk source.",
								"Quit milking me like some animal.",
								"My nipples are sore, stop.",
								"I’m only here because I can’t resist.",
								"I don’t want to be your teat.",
								"This is humiliating, stop.",
								"I hate being used like this.",
							])
				if(isResisting()):
					addLines([
						"I'm not your mommy! Stop it! Pathetic!.. Fuck..",
						"Stop sucking on them already..",
						"I'm not a cow!",
						"Stop feeding, now!",
						"What should I do to stop you..",
						"I’m not your damn milk cow!",
						"I’m not a cow, back off!",
						"Get your mouth off me!",
						"Don’t you dare keep going!",
					])
					if(getChar().isLactating()):
						addLines([
							"Stop stealing my milk, fucker!",
							"It's my milk, not yours!",
							"I don't wanna breastfeed you.. Stop it already..",
							"Stop feeding on my tits..",
							"Get off me, I’m not your damn cow!",
							"Quit milking me!",
							"I’m not sharing my milk with you!",
							"This is my milk, back off!",
							"Stop feeding, I’m not your damn snack!",
							"Quit stealing from me, jerk!",
							"I’m not your milkmaid, back off!",
							"Get off my tits, damn it!",
							"Stop stealing my milk, asshole!",
							"These are my breasts, not yours!",
							"Quit sucking my milk like a parasite!",
							"Don’t lick my breasts, I said no!",
							"Hands off my tits, stop feeding!",
							"My milk’s not for you, back off!",
							"Stop draining my breasts, jerk!",
							"Stop feeding on my breasts, now!",
							"I don’t wanna share my milk!",
							"Get your mouth off my breasts!",
						])
				if(!isResisting()):
					addLines([
						"This feels so strange..",
						"Just don't bite..",
						"Ah.. my nips..",
						"Mmm, your mouth feels warm.",
						"Didn’t expect this, but okay.",
						"I’m.. actually kind of into this.",
						"This is way more intense than I thought.",
						"You’re making me dizzy.",
						"I didn’t know I had this in me.",
						"Feels weird..",
						"Your lips are so gentle.",
						"My skin’s tingling.",
						"You’re doing something to me.",
						"This is something else entirely.",
					])
					if(!hatesFetish(Fetish.Lactation)):
						if(getChar().isLactating()):
							addLines([
								"I'm breastfeeding..",
								"I can see the milk flowing.. So strange..",
								"My tits are being drained of all their milk..",
								"I'm actually breastfeeding you..",
								"My tits are so full..",
								"You’re sucking my milk so good.",
								"My breasts are leaking..",
								"You’re making my nipples so sensitive.",
								"I’m dripping milk down your chin.",
								"Your mouth on my breasts feels amazing.",
								"I’m melting as you suck my milk.",
							])

