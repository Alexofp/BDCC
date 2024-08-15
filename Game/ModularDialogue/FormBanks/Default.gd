extends DialogueFormBank

func getForms() -> Dictionary:
	return {
		"GuardCaughtOffLimits": form("Hey, what are you doing in there?", {inmate=CHAR, guard=CHAR})
	}
