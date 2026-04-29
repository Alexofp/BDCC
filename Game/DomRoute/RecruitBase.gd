extends Reference
class_name RecruitBase

var id:String = ""
var difficulty:int = RecruitDifficulty.Easy

# To save
var history:Array = [] # [["loving", "sex", "bondage"], ["strict", "painplay", "anal"], ...]
var completed:bool = false

# Must have less than 3 choices. Each choice must have less than 3 options. Ideally just 3*3
var choices:Array = [
	{
		id = "tone",
		name = "Tone",
		desc = "Something something",
		options = [
			["loving", "Lovingly", "Do it lovingly", RecruitChoiceResult.Red],
			["strict", "Strict", "Be extremely strict", RecruitChoiceResult.Yellow],
			["mean", "Mean", "Be extremely mean and rough about it", RecruitChoiceResult.Green]
		],
	},
]

# Only gets called when all options are picked, gurantees that _choices has all the choices
func getExtraChoices(_choices:Array) -> Array:
	#if(_choices[1] == "sex"):
	return [
		{
			id = "condom",
			name = "Use condom",
			desc = "Something mew mew",
			options = [
				["no", "No condom", "Don't use a condom"],
				["worst", "Worst condom", "Use the worst condom you have"],
				["best", "Best condom", "Use the best condom you have"],
			],
		},
		# Strapon pick
	]

func isCombinationPossible(_choices:Array, _extras:Dictionary) -> Array:
	return [true, ""]

func getSceneToPlay(_choices:Array, _extras:Dictionary) -> String:
	return ""

# Happens during story after the breaking
func getStorySceneSuccess() -> String:
	return ""

func getStorySceneFail() -> String:
	return ""

func getTalkScene() -> String:
	return ""

func isArSame(_ar1:Array, _ar2:Array) -> bool:
	if(_ar1.size() != _ar2.size()):
		return false
	for _i in _ar1.size():
		if(_ar1[_i] != _ar2[_i]):
			return false
	return true
	
func needsToBeSaved() -> bool:
	if(completed || !history.empty()):
		return true
	return false

func saveData() -> Dictionary:
	return {
		history = history,
		completed = completed,
	}

func loadData(_data:Dictionary):
	completed = SAVE.loadVar(_data, "completed", false)
	history = SAVE.loadVar(_data, "history", [])
