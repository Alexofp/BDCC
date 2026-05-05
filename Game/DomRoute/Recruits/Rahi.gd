extends RecruitBase

func _init():
	id = "Rahi"
	charID = "rahi"
	difficulty = RecruitDifficulty.VeryEasy
	talkScene = "RahiRecTalk"
	choices = [
		{
			id = "tone",
			name = "Tone",
			desc = "Something something",
			options = [
				["gentle", "Gentle", "Be very gentle with Rahi", RecruitChoiceResult.Red],
				["strict", "Strict", "Be extremely strict with Rahi", RecruitChoiceResult.Yellow],
				["mean", "Mean", "Be extremely mean and rough with Rahi", RecruitChoiceResult.Green],
			],
		},
		{
			id = "main",
			name = "Main action",
			desc = "Something something 2",
			options = [
				["sex", "Sex", "Have sex with Rahi", RecruitChoiceResult.Yellow],
				["petplay", "Petplay", "Do some petplay with Rahi", RecruitChoiceResult.Green],
				["pain", "Painplay", "Give that cat some spanks", RecruitChoiceResult.Red],
			],
		},
		{
			id = "special",
			name = "Special kink",
			desc = "Something something 3",
			options = [
				["public", "In public", "Do it in public", RecruitChoiceResult.Yellow],
				["bondage", "Bondage", "Do bondage", RecruitChoiceResult.Green],
				["anal", "Anal-focus", "Do focus on anal", RecruitChoiceResult.Red],
			],
		},
	]

func getExtraChoices(_choices:Array) -> Array:
	var result:Array = []
	if(_choices[1] == "sex"):
		if(GM.pc.hasReachablePenis()):
			result.append({
					id = "condom",
					name = "Use condom",
					desc = "Something mew mew",
					options = [
						["no", "No condom", "Don't use a condom"],
						["worst", "Worst condom", "Use the worst condom you have"],
						["best", "Best condom", "Use the best condom you have"],
					],
				})
		else:
			# Strapon
			pass
	return result

func isCombinationPossible(_choices:Array, _extras:Dictionary) -> Array:
	if(_extras.get("condom", "") in ["worst", "best"]):
		if(!GM.pc.hasCondoms()):
			return [false, "You don't have any condoms to do this"]
	
	return [true, ""]

func getSceneToPlay(_choices:Array, _extras:Dictionary) -> String:
	if(_choices[1] == "sex"):
		return "RahiRecSceneSex"
	return "PlaceholderRecruitScene"
