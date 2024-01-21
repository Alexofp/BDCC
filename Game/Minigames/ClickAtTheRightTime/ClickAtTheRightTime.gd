extends Control

onready var failArea = $GameScreen/Panel/FailZone
onready var cursor = $GameScreen/Panel/Cursor
onready var redZone = $GameScreen/Panel/Panel
onready var orangeZone = $GameScreen/Panel/Panel2
onready var goldenZone = $GameScreen/Panel/Panel3
var time = 0.0
var cursorSpeed = 1.0
var timer = 10.0
var timeLeft = timer
var difficulty = 5.0
var freeze = false
var goldenZoneVisible = false
var isBlindFoldedVersion = false

var hasAdvancedPerk = true
var hardStruggleEnabled = true
var perfectStreak = 0
var howMuchForPerfect = 0.25

var failZoneList = []
var lastPosition = 0.0
var forward = true

#set difficulty as bondage level, accept positive number
func setDifficulty(level):
	if level < 1.0:
		level = 1.0
	
	timer = 3.4 + 20.0/(2.0 + level)
	timeLeft = timer
	cursorSpeed = 1.2 + level/8.0
	difficulty = level
	generateZone(difficulty)
	generateFatalZone(difficulty)

var ingame = false

signal minigameCompleted(finalScore)

# Called when the node enters the scene tree for the first time.
func _ready():
	setIngame(false)
	setGoldenZoneVisible(false)
	setHardStruggleEnabled(false)
	setDifficulty(2)
	setIsBlindfolded(false)

func generateFatalZone(_difficulty = 1.0):
	if !hardStruggleEnabled:
		return
	
	var diff = _difficulty - 1.0;
	if diff < 1.0:
		diff = 1.0
	
	for _i in range(diff):
		var rectangle = ColorRect.new()
		rectangle.rect_size.y = redZone.rect_size.y
		rectangle.color = Color("5900bd")
		failZoneList.append(rectangle)
		failArea.add_child(rectangle)
	
	for rectangle in failZoneList:
		setZonePosition(rectangle, RNG.randf_range(0.0, 1.0), 0.02)

func setZonePosition(zone, pos, size):
	zone.anchor_left = clamp(pos - size, 0.0, 1.0)
	zone.anchor_right = clamp(pos + size, 0.0, 1.0)

func isFatal(cursorPostion):
	for rectangle in failZoneList:
		if cursorPostion >= rectangle.anchor_left && cursorPostion <= rectangle.anchor_right:
			return true
	return false

func setIsBlindfolded(theblindfolded):
	isBlindFoldedVersion = theblindfolded
	
	if(isBlindFoldedVersion):
		$GameScreen/Panel/Panel2.visible = false
		$GameScreen/Panel/Panel.visible = false
		$GameScreen/Panel/Panel3.visible = false
		$GameScreen/Panel/FailZone.visible = false
		$GameScreen/Panel/BlindText.visible = true
	else:
		$GameScreen/Panel/Panel2.visible = true
		$GameScreen/Panel/Panel.visible = true
		$GameScreen/Panel/FailZone.visible = true
		$GameScreen/Panel/Panel3.visible = goldenZoneVisible
		$GameScreen/Panel/BlindText.visible = false

func setHasAdvancedPerk(thehasAdvancedPerk):
	hasAdvancedPerk = thehasAdvancedPerk

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(isBlindFoldedVersion):
		delta /= 2.0
	
	if(ingame && !freeze):
		if(timeLeft > 0 && (timeLeft - delta) <= 0):
			emit_signal("minigameCompleted", calcFinalScore())
		time += delta
		timeLeft -= delta
		
		var newPosition = getCursorPosition();
		setCursorPosition(newPosition)
		setTimeBar(timeLeft / timer)

		if newPosition < lastPosition && forward:
			forward = false
		elif newPosition > lastPosition && !forward:
			forward = true
			generateFatalZone()
		lastPosition = newPosition

		var flatStyle:StyleBoxFlat = $GameScreen/Panel.get_stylebox("panel")
		if(isBlindFoldedVersion):
			flatStyle.bg_color = Color.red
			
			var score = getScore()
			if(score >= 1000.0):
				flatStyle.bg_color = Color("ffe300")
			elif(score >= 1.0):
				flatStyle.bg_color = Color("990000")
			elif(score > 0.0):
				flatStyle.bg_color = Color("990000").darkened(1.1 - score)
			else:
				flatStyle.bg_color = Color.black
		else:
			flatStyle.bg_color = Color.black
	
func getCursorPosition():
	return (sin(pow(time * cursorSpeed, 1.2)) + 1.0) / 2.0
	
func setTimeBar(val):
	$GameScreen/ProgressBar.value = clamp(val, 0.0, 1.0)
	
func setCursorPosition(pos:float):
	cursor.anchor_left = pos
	cursor.anchor_right = pos

func getScore():
	var cursorPostion = getCursorPosition()
	if isFatal(cursorPostion):
		return -RNG.randf_range(0.1, 0.9)
	if(goldenZoneVisible && cursorPostion >= goldenZone.anchor_left && cursorPostion <= goldenZone.anchor_right):
		return 10000.0
	if(cursorPostion >= redZone.anchor_left && cursorPostion <= redZone.anchor_right):
		return 1.0
	if(cursorPostion >= orangeZone.anchor_left && cursorPostion <= redZone.anchor_left):
		var shiftedPos = cursorPostion - orangeZone.anchor_left
		var diff = (redZone.anchor_left - orangeZone.anchor_left)
		if(diff > 0.01):
			return shiftedPos / diff
			
	if(cursorPostion >= redZone.anchor_right && cursorPostion <= orangeZone.anchor_right):
		var shiftedPos = cursorPostion - redZone.anchor_right
		var diff = (orangeZone.anchor_right - redZone.anchor_right)
		if(diff > 0.01):
			return 1.0 - shiftedPos / diff
	
	return 0.0

func generateZone(thedifficulty = 1.0):
	var pos = RNG.randf_range(0.0, 1.0)
	var size = 0.005 + 1.0/(11.0 + thedifficulty * 2.0)
	var orangeSize = 0.1 + 1.0/(2.0 + thedifficulty)
	setZone(pos, size, orangeSize)
	
	#setGoldenZone(pos + RNG.randf_range(-orangeSize/2.0, orangeSize/2.0), 0.03)
	setGoldenZone(RNG.randf_range(0.0, 1.0), 0.05)

func setZone(pos, size, orangeSize):
	redZone.anchor_left = clamp(pos-size/2.0, 0.0, 1.0)
	redZone.anchor_right = clamp(pos+size/2.0, 0.0, 1.0)
	
	orangeZone.anchor_left = clamp(pos-size/2.0-orangeSize/2.0, 0.0, 1.0)
	orangeZone.anchor_right = clamp(pos+size/2.0+orangeSize/2.0, 0.0, 1.0)
	
func setGoldenZone(pos, size):
	goldenZone.anchor_left = clamp(pos-size/2.0, 0.0, 1.0)
	goldenZone.anchor_right = clamp(pos+size/2.0, 0.0, 1.0)
	
func setGoldenZoneVisible(isVis):
	goldenZoneVisible = isVis
	if(goldenZoneVisible):
		goldenZone.visible = true
	else:
		goldenZone.visible = false
		#print("INVIS")

func setHardStruggleEnabled(enable = false):
		hardStruggleEnabled = enable

func instantEscapePerk():
	setGoldenZoneVisible(true)
	
func _on_Button_pressed():
	setIngame(true)

func setIngame(newingame):
	ingame = newingame
	if(ingame):
		$StartMenu.visible = false
		$GameScreen.visible = true
	else:
		$StartMenu.visible = true
		$GameScreen.visible = false

func calcFinalScore(isLost = false):
	var theScore = getScore()
	if theScore < 0.0:
		return theScore
	if(isLost):
		theScore = 0.0
	if(hasAdvancedPerk && perfectStreak > 0):
		var finalScore = 1.0 + howMuchForPerfect * (perfectStreak - 1) + theScore * howMuchForPerfect
		return finalScore
	return theScore

func setStreakColor(theColor):
	streakLabel.add_color_override("font_color", theColor)

var tween
onready var streakLabel = $GameScreen/StreakLabel
func _on_ClickAtTheRightTime_gui_input(event):
	if(event is InputEventMouseButton):
		if(event.pressed && !freeze):
			if(hasAdvancedPerk):
				var theScore = getScore()
				if(theScore >= 1.0 && theScore <= 2.0):
					perfectStreak += 1
					timeLeft += 1.0
					timeLeft = min(timer, timeLeft)
					streakLabel.text = "Perfect Streak: "+str(perfectStreak)+" (+"+str(Util.roundF(howMuchForPerfect*perfectStreak*100.0, 1))+"%)"
					
					if tween:
						tween.kill()
					tween = create_tween()
					#tween.tween_method(self, "setStreakColor", Color.white, Color.red, 0.1)
					tween.tween_method(self, "setStreakColor", Color.red, Color.white, 0.2)
					# reset pos
					generateZone(difficulty)
					return
				
			
			freeze = true
			yield(get_tree().create_timer(0.5), "timeout")
			freeze = false
			#generateZone(RNG.randf_range(1.0, 10.0))
			#setDifficulty(5)
			var finalScore = calcFinalScore()
			#print(finalScore)
			emit_signal("minigameCompleted", finalScore)
