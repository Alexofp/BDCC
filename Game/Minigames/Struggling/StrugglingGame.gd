extends Control

onready var startUI = $StartUI

var buttonScene = preload("res://Game/Minigames/Struggling/StruggleButton.tscn")

# progression stuff
var currentPatternI = 0
var currentPatternChild = 0
var amountOfTiles:int = 0
var hitTiles: int = 0
var fullScore:float = 0.0

signal minigameCompleted(result)

var shouldFlipV = false
var shouldFlipH = false
var calculatedFlip = false

# Difficulty stuff
var buttonTime: float = 1.0
var buttonDeadzone: float = 0.1
var betweenButtonsTime: float = 0.5
var amountOfPatternsMin: int = 2
var amountOfPatternsMax: int = 2

var difficultySettings = [
	{
		buttonTime = 2.0,
		buttonDeadZone = 0.2,
		betweenButtonsTime = 1.2,
		amountOfPatternsMin = 1,
		amountOfPatternsMax = 1,
	},
	{
		buttonTime = 1.5,
		buttonDeadZone = 0.2,
		betweenButtonsTime = 1.0,
		amountOfPatternsMin = 2,
		amountOfPatternsMax = 2,
	},
	{
		buttonTime = 1.2,
		buttonDeadZone = 0.2,
		betweenButtonsTime = 0.6,
		amountOfPatternsMin = 2,
		amountOfPatternsMax = 3,
	},
	{
		buttonTime = 1.0,
		buttonDeadZone = 0.15,
		betweenButtonsTime = 0.5,
		amountOfPatternsMin = 2,
		amountOfPatternsMax = 3,
	},
	{
		buttonTime = 1.0,
		buttonDeadZone = 0.15,
		betweenButtonsTime = 0.3,
		amountOfPatternsMin = 3,
		amountOfPatternsMax = 4,
	},
]

func setDifficulty(diff):
	diff -= 1
	if(diff < 0):
		diff = 0
	if(diff >= difficultySettings.size()):
		diff = difficultySettings.size() - 1
	
	var currentDifficulty = difficultySettings[diff]
	buttonTime = currentDifficulty["buttonTime"]
	buttonDeadzone = currentDifficulty["buttonDeadZone"]
	betweenButtonsTime = currentDifficulty["betweenButtonsTime"]
	amountOfPatternsMin = currentDifficulty["amountOfPatternsMin"]
	amountOfPatternsMax = currentDifficulty["amountOfPatternsMax"]

# Called when the node enters the scene tree for the first time.
func _ready():
	$GameUI.visible = false
	$StartUI.visible = true
	$WinUI.visible = false

func generateFullPattern():
	var patternFolderFiles = Util.getFilesInFolder("res://Game/Minigames/Struggling/Patterns/")
	
	Util.delete_children($Patterns)
	
	var amountOfPatterns = RNG.randi_range(amountOfPatternsMin, amountOfPatternsMax)
	for _i in range(amountOfPatterns):
		var patternFileName = RNG.pick(patternFolderFiles)
		var pattern = load(patternFileName)
		
		var patternObject = pattern.instance()
		$Patterns.add_child(patternObject)

func calculateFullPatternData():
	amountOfTiles = 0
	
	for pattern in $Patterns.get_children():
		for patternObject in pattern.get_children():
			var data = patternObject.getData()
			if(data["type"] == "button"):
				amountOfTiles += 1

func _on_StartButton_pressed():
	$GameUI.visible = true
	$StartUI.visible = false
	$WinUI.visible = false

	#var button = buttonScene.instance()
	#button.position = get_global_mouse_position()
	#$Buttons.add_child(button)
	generateFullPattern()
	calculateFullPatternData()
	updateUI()
	$NextButtonTimer.start(1.0)

func onButtonHit(score):
	advanceScore(score)

func advanceScore(score):
	hitTiles += 1
	fullScore += score
	
	updateUI()
	
	if(hitTiles >= amountOfTiles):
		$WinTimer.start()

func updateUI():
	var accuracy:float = 0.0
	if(hitTiles != 0):
		accuracy = fullScore / hitTiles
	$GameUI/AccuracyLabel.text = str(hitTiles)+"/"+str(amountOfTiles) + "\n"
	$GameUI/AccuracyLabel.text += str(Util.roundF(accuracy * 100.0, 1))+"%"

func _on_NextButtonTimer_timeout():
	var pattern = $Patterns.get_child(currentPatternI)
	if(pattern == null): # In case things went very wrong for some reason
		$WinTimer.start()
		return
	
	var patternObject = pattern.get_child(currentPatternChild)
	if(!calculatedFlip):
		shouldFlipV = false
		shouldFlipH = false
		if(pattern.has_method("canFlipV") && pattern.canFlipV()):
			if(RNG.chance(50)):
				shouldFlipV = true
		if(pattern.has_method("canFlipH") && pattern.canFlipH()):
			if(RNG.chance(50)):
				shouldFlipH = true
		calculatedFlip = true
	
	var data = patternObject.getData()
	if(data["type"] == "button"):
		var button = buttonScene.instance()
		var pos = data["position"]
		if(shouldFlipV):
			pos.y = 1.0 - pos.y
		if(shouldFlipH):
			pos.x = 1.0 - pos.x
		
		button.position = rect_size * pos
		button.setup(buttonTime, buttonDeadzone)
		button.connect("onHit", self, "onButtonHit")
		$Buttons.add_child(button)
		$Buttons.move_child(button, 0)

	currentPatternChild += 1
	if(currentPatternChild >= pattern.get_child_count()):
		currentPatternI += 1
		calculatedFlip = false
		currentPatternChild = 0
		
		if(currentPatternI >= $Patterns.get_child_count()):
			return
	$NextButtonTimer.start(betweenButtonsTime)


func _on_WinTimer_timeout():
	$WinUI.visible = true


func _on_ContinueButton_pressed():
	var accuracy:float = 0.0
	if(hitTiles != 0):
		accuracy = fullScore / hitTiles
	
	var result = MinigameResult.new()
	result.score = accuracy
	emit_signal("minigameCompleted", result)
