extends DialogueFormBank

func getForms() -> Dictionary:
	return {
		"FightLostGeneric": form("Argh..", {loser=CHAR, winner=CHAR}, "loser", "winner"),
		"FightWonGeneric": form("That was easy.", {loser=CHAR, winner=CHAR}, "winner", "loser"),
		
		"GuardCaughtOffLimits": form("Hey, what are you doing in there?", {inmate=CHAR, guard=CHAR}, "guard", "inmate"),
		"GuardCaughtOffLimitsFight": form("You wanna fight? Alright.", {inmate=CHAR, guard=CHAR}, "guard", "inmate"),
		"GuardInmateSurrender": form("Surrendering? Smart.", {inmate=CHAR, guard=CHAR}, "guard", "inmate"),
		"GuardFrisk": form("Don't move while I do this.", {inmate=CHAR, guard=CHAR}, "guard", "inmate"),
		"GuardFriskFound": form("This isn’t allowed. I’m taking it.", {inmate=CHAR, guard=CHAR}, "guard", "inmate"),
		"GuardFriskNoFound": form("Clean. You're lucky, inmate.", {inmate=CHAR, guard=CHAR}, "guard", "inmate"),
		"GuardFriskFailResist": form("Argh. Fuck it.", {inmate=CHAR, guard=CHAR}, "guard", "inmate"),
		"GuardGoAway": form("Now go away.", {inmate=CHAR, guard=CHAR}, "guard", "inmate"),
		"GuardKeepMoving": form("Keep moving, inmate.", {inmate=CHAR, guard=CHAR}, "guard", "inmate"),
		
		"PunishDecide": form("What should I do with you..", {punisher=CHAR, target=CHAR}, "punisher", "target"),
		"PunishDecideStocks": form("Stocks will do nicely.", {punisher=CHAR, target=CHAR}, "punisher", "target"),
		"PunishAboutToStocks": form("Bend over.", {punisher=CHAR, target=CHAR}, "punisher", "target"),
		"PunishLockIntoStocks": form("Have fun.", {punisher=CHAR, target=CHAR}, "punisher", "target"),
		"PunishSex": form("Let's have some fun.", {punisher=CHAR, target=CHAR}, "punisher", "target"),
		
		"ReactBODYWRITINGS": form("Nice bodywritings, slut!", {main=CHAR, target=CHAR}, "main", "target"),
		"ReactTALLYMARKS": form("Nice tallymarks, slut!", {main=CHAR, target=CHAR}, "main", "target"),
		"ReactCOVERED_IN_CUM": form("So messy. What a slut!", {main=CHAR, target=CHAR}, "main", "target"),
		"ReactCOVERED_IN_PISS": form("Ew, gross!", {main=CHAR, target=CHAR}, "main", "target"),
		"ReactNAKED": form("Ha, cover up, slut!", {main=CHAR, target=CHAR}, "main", "target"),
		"ReactCAN_GRAB_AND_FUCK": form("Wow, someone should fuck you, slut!", {main=CHAR, target=CHAR}, "main", "target"),
		"ReactON_A_LEASH": form("Haha, you love being paraded around, slut?", {main=CHAR, target=CHAR}, "main", "target"),
		"ReactGETTING_FUCKED": form("Nice, a whore is getting fucked!", {main=CHAR, target=CHAR}, "main", "target"),
		
		"ReactLEASHING_SOMEONE": form("Nice catch!", {main=CHAR, target=CHAR}, "main", "target"),
		"ReactFUCKING_SOMEONE": form("Yeah, fuck that slut!", {main=CHAR, target=CHAR}, "main", "target"),
	}
