extends Control

########################
# testing game for dev #
########################

var hardMode = false
var hasEscapePerk = false
var hasSneakPerk = false
var hasStrugglingPerk = false
var hasKeysPerk = false
var isBlind = false
var level = 0


signal minigameCompleted(finalScore, result)

var finalScore = 0

func _ready():
	Log.info("Testing game ready")
	Log.info("hardMode " + str(hardMode))
	Log.info("hasEscapePerk " + str(hasEscapePerk))
	Log.info("hasSneakPerk " + str(hasSneakPerk))
	Log.info("hasStrugglingPerk " + str(hasStrugglingPerk))
	Log.info("hasKeysPerk " + str(hasKeysPerk))
	Log.info("isBlind " + str(isBlind))
	Log.info("level " + str(level))


func _process(_delta):
	if _delta < 0:
		print("process..")
	
func _on_Buttonpass_pressed():
	print("Success")
	finalScore = 1
	emit_signal("minigameCompleted", finalScore, {"useAgility": true})
	
func _on_Buttonfail_pressed():
	print("fail")
	finalScore = 0
	emit_signal("minigameCompleted", finalScore, {"useStrength": true})

func _on_Buttoncustom_pressed():
	print("custom")
	finalScore = get_node("LineEdit-result").get_text()
	print(finalScore)
	emit_signal("minigameCompleted", finalScore, {"useTime": true})


### config ###
func setHardStruggleEnabled(_param = true):
	hardMode = _param

func instantEscapePerk(_param = true):
	hasEscapePerk = _param

func setIsBlindfolded(_param = true):
	isBlind = _param

func setHasAdvancedPerk(_param = true):
	hasSneakPerk = _param

func setBetterStruggling(_param = true):
	hasStrugglingPerk = _param

func setBetterKeys(_param = true):
	hasKeysPerk = _param

func setDifficulty(_param = 1):
	level = _param
