extends DialogueFormBank

func getForms() -> Dictionary:
	return {
		"FightLostGeneric": form("Argh..", {loser=CHAR, winner=CHAR}),
		"FightWonGeneric": form("That was easy.", {loser=CHAR, winner=CHAR}),
		
		"GuardCaughtOffLimits": form("Hey, what are you doing in there?", {inmate=CHAR, guard=CHAR}),
		"GuardCaughtOffLimitsFight": form("You wanna fight? Alright.", {inmate=CHAR, guard=CHAR}),
		"GuardInmateSurrender": form("Surrendering? Smart.", {inmate=CHAR, guard=CHAR}),
		"GuardFrisk": form("Don't move while I do this.", {inmate=CHAR, guard=CHAR}),
		"GuardFriskFound": form("This isn’t allowed. I’m taking it.", {inmate=CHAR, guard=CHAR}),
		"GuardFriskNoFound": form("Clean. You're lucky, inmate.", {inmate=CHAR, guard=CHAR}),
		"GuardFriskFailResist": form("Argh. Fuck it.", {inmate=CHAR, guard=CHAR}),
		"GuardGoAway": form("Now go away.", {inmate=CHAR, guard=CHAR}),
		"GuardKeepMoving": form("Keep moving, inmate.", {inmate=CHAR, guard=CHAR}),
		
		"PunishDecide": form("What should I do with you..", {punisher=CHAR, target=CHAR}),
		"PunishDecideStocks": form("Stocks will do nicely.", {punisher=CHAR, target=CHAR}),
		"PunishAboutToStocks": form("Bend over.", {punisher=CHAR, target=CHAR}),
		"PunishLockIntoStocks": form("Have fun.", {punisher=CHAR, target=CHAR}),
		"PunishSex": form("Let's have some fun.", {punisher=CHAR, target=CHAR}),
	}
