extends Reference
class_name SexVoice

static func domReactToSubBodypart(_bodypart, _sexEngine, _domInfo, _subInfo) -> String:
	var _dom = _domInfo.getChar()
	var _sub = _subInfo.getChar()
	var domIsAngry = _domInfo.isAngry()
	var domIsMean = _domInfo.personalityScore({PersonalityStat.Mean:1.0})>0.4
	
	var possible = []
	
	if(_bodypart is BodypartBreasts):
		var lustInterets:LustInterests = _dom.getLustInterests()
		var likesBigBreasts = lustInterets.getTopicValue(InterestTopic.BigBreasts, _sub)
		var likesAverageBreasts = lustInterets.getTopicValue(InterestTopic.MediumBreasts, _sub)
		var likesSmallBreasts = lustInterets.getTopicValue(InterestTopic.SmallBreasts, _sub)
		var likesLactation = lustInterets.getTopicValue(InterestTopic.LactatingBreasts, _sub)
		#var likesFlatBreasts = lustInterets.getTopicValue(InterestTopic.NoBreasts, _sub)
		
		if(likesLactation > 0.2):
			possible.append_array([
				"Wow, those are some beautiful lactating "+RNG.pick(["breasts", "tits"])+" you've got there!",
				"I love the way your milk is flowing, it's so mesmerizing.",
				"I've always been a fan of lactating breasts.",
				"Lactating breasts are incredibly sexy.",
				"I've always had a thing for lactating "+RNG.pick(["breasts", "tits"])+".",
			])
		elif(likesLactation < -0.2):
			possible.append_array([
				"You should be ashamed of yourself for lactating in public. That's just disgusting.",
				"I don't care for lactation. Not my thing.",
				"I can't stand the sight of lactating breasts. It's just so gross.",
				"I've never understood the appeal of lactating breasts.",
			])
		
		if(likesBigBreasts > 0.2):
			if(domIsAngry || domIsMean):
				possible.append_array([
					"Well, well, well, look at the size of those things! I bet you could feed the whole space station with those "+RNG.pick(["melons", "tits", "giant tits", "breasts", "giant breasts"])+".",
					"Wow, didn't think it was possible for someone to have such big "+RNG.pick(["tits", "breasts", "melons"])+". You must get a lot of attention with those.",
					"I don't know if I should be impressed or intimidated by those massive mammaries of yours.",
					"I bet those babies have their own gravitational field.",
					"I bet those things could crush a man's skull if you hugged him too hard. Be careful with those weapons of mass distraction.",
					"You must have back problems with "+RNG.pick(["breasts", "tits"])+" that size. But I love them.",
				])
			else:
				possible.append_array([
					"Oh yeah. I'd like to see what those puppies can do.",
					"Oh yeah, I can't get enough of big, bouncy "+RNG.pick(["tits", "breasts", "jugs"])+".",
					"I could stare at giant "+RNG.pick(["tits", "breasts", "jugs"])+" all day.",
					"Now we're talking. Great curves.",
					"My goodness, your chest is absolutely stunning!",
					"That's some impressive assets you've got there",
					"You know what they say about "+RNG.pick(["breasts", "tits"])+". The bigger the better.",
					"I don't know what your secret is, but those "+RNG.pick(["breasts", "tits"])+" are absolutely magnificent. I'm in awe.",
				])
		if(likesBigBreasts < -0.2):
			if(domIsAngry || domIsMean):
				possible.append_array([
					"I bet you can barely move with those things weighing you down.",
					"Seriously, get those monstrosities reduced. You'll be much happier without them.",
					"I can't stand looking at those massive breasts. They're grotesque.",
					"Those massive mammaries are just ridiculous. Get rid of them.",
					"Why do some women have such huge hooters? It's disgusting.",
					"I can't stand looking at those "+RNG.pick(["giant", "large"])+" "+RNG.pick(["tits", "breasts"])+". Gross.",
				])
			else:
				possible.append_array([
					"Not a fan of giant "+RNG.pick(["tits", "breasts"])+". Look so uncomfortable and unnatural.",
					"Large "+RNG.pick(["tits", "breasts"])+" are a hassle and only get in the way.",
					"Oh wow. I prefer a more natural and understated look.",
					"I don't like "+RNG.pick(["giant", "large"])+" "+RNG.pick(["tits", "breasts"])+". They're just too much for me.",
					RNG.pick(["Giant", "Large"])+" "+RNG.pick(["tits", "breasts"])+" just don't do it for me, sadly.",
					"Huge knockers are a bit much for my taste.",
				])
		
		if(likesAverageBreasts > 0.2):
			if(domIsAngry || domIsMean):
				possible.append_array([
					"Finally, someone with "+RNG.pick(["normal", "average"])+" "+RNG.pick(["tits", "breasts"])+". I'm tired of seeing nothing but either flat chests or massive "+RNG.pick(["ones", "melons"])+".",
					"I can't stand these fake, inflated chests that are all the rage these days. Give me a pair of average-sized "+RNG.pick(["tits", "breasts"])+" any day.",
					"Finally, a pair of "+RNG.pick(["tits", "breasts"])+" that aren't obscenely huge.",
					"It's about time someone with a normal-sized chest came along.",
					"I'm so tired of seeing massive, fake "+RNG.pick(["tits", "breasts"])+". But yours are up my standarts.",
				])
			else:
				possible.append_array([
					"I have a thing for average-sized "+RNG.pick(["tits", "breasts"])+", and yours are absolutely lovely.",
					"Your "+RNG.pick(["tits", "breasts"])+" are beautiful. Not too big, and not too small. They're just right.",
					"Oh, great "+RNG.pick(["tits", "breasts"])+". Couldn't ask for more.",
					"Not too pointy, not too round, just the right amount of fullness.",
					"There's something so alluring about a pair of perky breasts.",
					"I'm a sucker for a nice set of "+RNG.pick(["tits", "breasts"])+".",
					"I'm a big fan of a well-proportioned pair of "+RNG.pick(["tits", "breasts"])+".",
				])
		elif(likesAverageBreasts < -0.2):
			if(domIsAngry || domIsMean):
				possible.append_array([
					"I can't believe some people are satisfied with such mediocre "+RNG.pick(["chest size", "tits", "breasts"])+". It's truly pathetic.",
					"Why would anyone settle for average "+RNG.pick(["chest size", "tits", "breasts"])+"? It's like they don't even care about having any sex appeal at all.",
					"Your "+RNG.pick(["tits", "breasts"])+" are so... average. Don't know what I expected.",
					"I'd rather be flat-chested than have average "+RNG.pick(["tits", "breasts"])+". At least that would be a unique and interesting look, unlike this dull and boring average size.",
				])
			else:
				possible.append_array([
					"Give me something interesting to look at, not those generic "+RNG.pick(["tits", "breasts"])+".",
					"I know some people might find your breasts attractive, but to me they're just bland and uninteresting.",
					"Hmm. Nothing remarkable, not eye-catching at all.",
					"Not a fan of your "+RNG.pick(["tits", "breasts"])+".",
				])
		
		if(likesSmallBreasts > 0.2):
			if(domIsAngry || domIsMean):
				possible.append_array([
					"Don't be upset, darling. I'm sure you have other qualities that make up for your lack of ample bosom. Or maybe not, but who cares?",
					"I adore "+RNG.pick(["tiny", "small"])+" "+RNG.pick(["tits", "breasts"])+". They're so cute and adorable, like little toys for me to play with.",
					"I bet they're barely a handful. Ha ha.",
					"Do they even need a bra? They're so small.",
					"I always thought bigger was better, but those tiny breasts are so cute.",
					"I bet they don't get in the way like big ones do. Lucky.",
					"Do they ever get in the way? They're so tiny.",
				])
			else:
				possible.append_array([
					"I'm a big fan of the small-breasted look. It's so sexy and feminine.",
					"I can't get enough of perky little breasts. They're absolutely adorable.",
					"Natural and beautiful, great "+RNG.pick(["tits", "breasts"])+".",
					"I've always been attracted to petite "+RNG.pick(["tits", "breasts"])+".",
					"I never understood the obsession with big "+RNG.pick(["tits", "breasts", "melons"])+". I think small ones are so much more elegant and graceful.",
					"I adore small "+RNG.pick(["tits", "breasts"])+".",
					"Small "+RNG.pick(["tits", "breasts"])+" are so cute.",
					"Your small "+RNG.pick(["tits", "breasts"])+" are the perfect size.",
					"Good things come in small packages, huh.",
				])
		elif(likesSmallBreasts < -0.2):
			if(domIsAngry || domIsMean):
				possible.append_array([
					"Those tiny little things? I'm surprised they can even be called breasts.",
					"Ugh, what are those? Mosquitoes on your chest?",
					"I can barely even see your chest. It's like looking at a flat line on a heart monitor.",
					"You must have been left on the clearance rack at the breast store.",
					"I bet you have to stuff your bra just to make it look like you have something there.",
					"I can't even call those things "+RNG.pick(["tits", "breasts"])+". They're more like mosquito bites.",
					"I bet you wish you had bigger "+RNG.pick(["tits", "breasts"])+". Too bad you're stuck with those tiny things.",
				])
			else:
				possible.append_array([
					"Wish they were bigger. But oh well.",
					"I need more to grab onto.",
					"I prefer a more voluptuous figure.",
					"Aww, nothing to get excited over.",
					"Small "+RNG.pick(["tits", "breasts"])+" just don't do it for me.",
					"Aw. Small "+RNG.pick(["tits", "breasts"])+" aren't sexy for me.",
				])
		
	if(_bodypart is BodypartAnus && RNG.chance(30)):
		var lustInterets:LustInterests = _dom.getLustInterests()
		var likesTightAnus = lustInterets.getTopicValue(InterestTopic.TightAnus, _sub)
		var likesLooseAnus = lustInterets.getTopicValue(InterestTopic.LooseAnus, _sub)
		
		if(likesTightAnus > 0.3):
			possible.append_array([
				"Your tight "+RNG.pick(["anus", "tailhole", "ass", "butt", "butthole"])+" is quite enticing, won't lie.",
				RNG.pick(["Nice", "Great"])+" "+RNG.pick(["butt", "butthole", "ass"])+" you have. I like my fuckholes tight.",
				"Ohh. Your "+RNG.pick(["anus", "tailhole", "ass", "butt", "butthole"])+" is so tight and perfect.",
			])
		elif(likesTightAnus < -0.3):
			possible.append_array([
				"Not a fan of that overly-tight look. I like tailholes looking stretched.",
				"Won't like, your butthole looks too tight for my liking.",
				"What's the appeal of tight "+RNG.pick(["anuses", "buttholes", "butts", "asses"])+" anyway?",
			])
		
		if(likesLooseAnus > 0.3):
			possible.append_array([
				"Your stretched "+RNG.pick(["anus", "tailhole", "ass", "butt", "butthole"])+" is quite hot, won't lie.",
				"Huh, your "+RNG.pick(["anus", "tailhole", "ass", "butt", "butthole"])+" looks extra plump, love it.",
				"Oh, I'm a fan of loose gaping "+RNG.pick(["anuses", "buttholes", "butts", "asses"])+".",
				"Oh yeah, that "+RNG.pick(["anus", "tailhole", "ass", "butt", "butthole"])+" can fit a lot of "+RNG.pick(["dicks", "cocks"])+".",
			])
		elif(likesLooseAnus < -0.3):
			possible.append_array([
				"Why would anyone want their "+RNG.pick(["anus", "tailhole", "ass", "butt", "butthole"])+" to look like that?",
				"I don't get the appeal of having a "+RNG.pick(["stretched out", "gaping"])+" "+RNG.pick(["anus", "tailhole", "ass", "butt", "butthole"]),
				"How many dicks did you had in that "+RNG.pick(["anus", "tailhole", "ass", "butt", "butthole"])+"? Looks so loose.",
				"Not a fan of loose-looking "+RNG.pick(["anuses", "buttholes", "butts", "asses"])+".",
				"Not sure how attractive "+RNG.pick(["stretched", "loose"])+" "+RNG.pick(["anuses", "buttholes", "butts", "asses"])+" look.",
			])
	
	if(_bodypart is BodypartVagina && RNG.chance(80)):
		var lustInterets:LustInterests = _dom.getLustInterests()
		var likesTightVagina = lustInterets.getTopicValue(InterestTopic.TightPussy, _sub)
		var likesLooseVagina = lustInterets.getTopicValue(InterestTopic.LoosePussy, _sub)
		
		if(likesTightVagina > 0.3):
			possible.append_array([
				"Your tight "+RNG.pick(["pussy", "slit", "pussy slit"])+" is quite enticing, won't lie.",
				RNG.pick(["Nice", "Great"])+" "+RNG.pick(["pussy", "slit", "pussy slit"])+" you have. I like tight ones.",
				"Ohh. Your "+RNG.pick(["pussy", "slit", "pussy slit"])+" is so tight and perfect.",
			])
		elif(likesTightVagina < -0.3):
			possible.append_array([
				"Not a fan of that overly-tight look. I like pussies looking stretched.",
				"Won't like, your pussy looks too tight for my liking.",
				"What's the appeal of tight "+RNG.pick(["pussies", "slits"])+" anyway?",
			])
		
		if(likesLooseVagina > 0.3):
			possible.append_array([
				"Your stretched "+RNG.pick(["snatch", "pussy", "pussy slit"])+" is quite hot, won't lie.",
				"Huh, your "+RNG.pick(["pussy", "vulva"])+" looks extra plump, love it.",
				"Oh, I'm a fan of loose gaping "+RNG.pick(["cunts", "pussies", "slits"])+".",
				"Oh yeah, that "+RNG.pick(["pussy", "slit", "cunt"])+" can fit a lot of "+RNG.pick(["dicks", "cocks"])+".",
			])
		elif(likesLooseVagina < -0.3):
			possible.append_array([
				"Why would anyone want their "+RNG.pick(["labia", "pussy", "pussy slit", "pussy folds"])+" to look like that?",
				"I don't get the appeal of having a "+RNG.pick(["stretched out", "gaping"])+" "+RNG.pick(["pussy", "slit", "kitty slit"]),
				"How many dicks did you had in that "+RNG.pick(["cunt", "pussy slit", "pussy"])+"? Looks so loose.",
				"Not a fan of loose-looking "+RNG.pick(["pussies", "vaginas", "slits", "cunts"])+".",
				"Not sure how attractive "+RNG.pick(["stretched", "loose"])+" "+RNG.pick(["pussies", "cunts", "slits"])+" look.",
			])

	if(_bodypart is BodypartPenis):
		var lustInterets:LustInterests = _dom.getLustInterests()
		
		var likesBigCock = lustInterets.getTopicValue(InterestTopic.BigCock, _sub)
		var likesAverageCock = lustInterets.getTopicValue(InterestTopic.AverageCock, _sub)
		var likesSmallCock = lustInterets.getTopicValue(InterestTopic.SmallCock, _sub)
		
		if(_sub.isWearingChastityCage()):
			if(domIsMean || domIsAngry):
				possible.append_array([
					"Is that a chastity cage? Ha! I bet you can't even get it off without the key. Loser.",
					"I can't believe you're walking around with that thing on. You must be so embarrassed. Serves you right for being such a deviant.",
					"Looks like someone's got their junk on lockdown. Must be nice to be so repressed and miserable.",
					"What a waste of metal. You must be desperate though. That's good.",
					"Well, I guess that's one way to make sure you don't accidentally reproduce.",
					"Ha! Looks like someone's been a bad slut and had to be punished. Serves you right.",
				])
			else:
				possible.append_array([
					"I bet that cage is really effective at keeping you in line.",
					"The cage fits you perfectly.",
				])
				if(likesBigCock > 0.1 || likesAverageCock > 0.1 || likesSmallCock > 0.1):
					possible.append_array([
						"Wow, that's a nice looking chastity cage you've got there.",
						"I can't help but admire the way that cage hugs your penis. It's very sexy.",
						"I like your "+RNG.pick(["cock", "dick"])+". Too bad it's caged.",
						"Nice cage for a nice "+RNG.pick(["cock", "dick"])+". It looks like it was made just for you.",
						"I'm not normally a fan of chastity cages, but on you, it looks nice."
					])
				else:
					possible.append_array([
						"I must say, I'm not a big fan of that. I think it's a bit too restrictive and uncomfortable.",
						"Nice cage. Can't say that I like your "+RNG.pick(["dick", "cock"])+" so I'm glad you're locked.",
					])
		
		if(likesBigCock > 0.1):
			possible.append_array([
				"Oh wow, that's one impressive "+RNG.pick(["dick", "cock", "monster of a cock"]),
				"I can't believe how big you are. I'm impressed.",
				"I didn't think they came that big. Wow.",
				"I bet that's a lot of fun to play with.",
				"I didn't know they made them that big. I'm impressed.",
				"I like your "+RNG.pick(["dick", "cock"])+". It's perfect.",
				"Ohh, that's just the right size. Nice.",
				"I like your size. It's perfect for me.",
				"Nice "+RNG.pick(["cock", "dick"])+" you have there.",
				"I like your "+RNG.pick(["cock", "dick"])+".",
			])
		elif(likesBigCock < -0.1):
			if(domIsMean || domIsAngry):
				possible.append_array([
					"What are you trying to compensate for with that thing? You must have some serious insecurities.",
					"I bet you're used to scaring people off with that thing. It must be hard to find someone who's actually into it.",
					"I didn't think size really mattered, but now I see it's all you have going for you. Pathetic.",
					"I didn't know they made them that big. I'm shocked, to be honest.",
				])
			else:
				possible.append_array([
					"I've seen bigger, so don't try to impress me with that.",
					"I've had bigger, so don't think you're anything special.",
					"I don't find big cocks too appealing, it's painful than anything.",
					"Huh. Your dick is nothing special. But it will do.",
				])
		if(likesAverageCock > 0.1):
			possible.append_array([
				"I like your "+RNG.pick(["dick", "cock"])+". It's perfect.",
				"Ohh, that's just the right size. Nice.",
				"I like your size. It's perfect for me.",
				"Nice "+RNG.pick(["cock", "dick"])+" you have there.",
				"I like your "+RNG.pick(["cock", "dick"])+".",
			])
		elif(likesAverageCock < 0.1):
			if(domIsMean || domIsAngry):
				possible.append_array([
					"Meh. Your "+RNG.pick(["dick", "cock"])+" is so-o average.",
					"I've seen better dicks, and trust me, yours is not that impressive.",
					"Not a fan of average "+RNG.pick(["dicks", "cocks"])+". Meh.",
				])
			else:
				possible.append_array([
					"Your "+RNG.pick(["dick", "cock"])+" is average at best.",
					"Huh. Your dick is nothing special. But it will do.",
					"Not a huge fan of average "+RNG.pick(["dicks", "cocks"])+". But let's see.",
				])
		if(likesSmallCock > 0.1):
			if(domIsMean || domIsAngry):
				possible.append_array([
					"Aww, look at the little guy trying to act big.",
					"It's so cute how you think that tiny thing is impressive. Keep dreaming, buddy.",
					"Aww, poor little thing. I bet you get picked on all the time because of how small it is.",
					"Oh wow, careful when you use condoms on your little dick. One wrong move and it could slip right off.",
				])
			else:
				possible.append_array([
					"Ohh, what a cute cock you have~.",
					"I like your "+RNG.pick(["cock", "dick"])+". It's perfect.",
					"Some might prefer a larger size, but for me, there's just something about a small penis that I find incredibly endearing.",
					"Wow, that is the cutest little thing I've ever seen! I just love how tiny and adorable it is. It's just so precious.",
					"Oh wow, I just can't get enough of that tiny little thing you have. It's just so cute!",
					"I like your "+RNG.pick(["dick", "cock"])+". It's perfect.",
					"Ohh, that's just the right size. Nice.",
					"I like your size. It's perfect for me.",
					"Nice "+RNG.pick(["cock", "dick"])+" you have there.",
					"I like your "+RNG.pick(["cock", "dick"])+".",
				])
		elif(likesSmallCock < -0.1):
			if(domIsMean || domIsAngry):
				possible.append_array([
					"I don't think I can take your "+RNG.pick(["dick", "cock"])+" seriously.",
					"Ugh, that's not what I was expecting at all.",
					"I'm not impressed. I've seen bigger things.",
					"What is that thing? It's barely even a pecker!",
					"I can barely see it from here. Is that all you've got?",
					"You must be really insecure about that tiny thing.",
					"Looks like someone shrunk your "+RNG.pick(["dick", "cock"])+" in the wash!"
				])
			else:
				possible.append_array([
					"Huh. Your dick is nothing special. But it will do.",
					"Not a fan of small cocks honestly.",
					"Well, you're not exactly impressive. Quite the opposite.",
				])
			
	if(possible.size() > 0):
		return RNG.pick(possible)
	return ""

static func domReactionWhenUndressing(_bodypart, _sexEngine, _domInfo, _subInfo) -> String:
	var possible = []
	
	var domIsAngry = _domInfo.isAngry()
	var domIsMean = _domInfo.personalityScore({PersonalityStat.Mean:1.0})>0.4
	#var domIsVeryMean = _domInfo.personalityScore({PersonalityStat.Mean:1.0})>0.7
	
	if(_bodypart is BodypartPenis && RNG.chance(30)):
		if(domIsAngry || domIsMean):
			possible.append_array([
				"See my dick? Wanna worship it like a good slut?",
				"I'm gonna make you fall in love with my "+RNG.pick(["dick", "cock"])+", bitch.",
				"Drooling already, slut?",
				"There we go, here is my cock.",
				"Come on, don't be shy. I know you're curious.",
			])
		else:
			possible.append_array([
				"Like what you see? That's my "+RNG.pick(["dick", "cock"])+".",
				"Like my "+RNG.pick(["dick", "cock"])+"?",
				"There we go.",
				"Check my "+RNG.pick(["dick", "cock"])+" out.",
			])
	
	if(possible.size() > 0):
		return RNG.pick(possible)
	return ""
