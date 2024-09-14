extends Control

onready var failArea = $GameScreen/Panel/FailZone
onready var cursor = $GameScreen/Panel/Cursor
onready var redZone = $GameScreen/Panel/Panel
onready var orangeZone = $GameScreen/Panel/Panel2
onready var goldenZone = $GameScreen/Panel/Panel3
onready var button = $StartMenu/CenterContainer/VBoxContainer/Button

var time = 0.0
var cursorSpeed = 1.0
var timer = 10.0
var timeLeft = timer
var difficulty = 5.0
var freeze = false
var goldenZoneVisible = false
var isBlindFoldedVersion = false

var hasAdvancedPerk = false
var hardStruggleEnabled = true
var perfectStreak = 0
var howMuchForPerfect = 0.25

var failZoneData = []

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

signal minigameCompleted(result)

# Called when the node enters the scene tree for the first time.
func _ready():
	setIngame(false)
	setGoldenZoneVisible(false)
	setHardStruggleEnabled(false)
	setDifficulty(2)
	setIsBlindfolded(false)
	button.grab_focus()

func generateFatalZone(_difficulty = 1.0):
	if !hardStruggleEnabled || isBlindFoldedVersion:
		return
	
	#var diff = _difficulty - 1.0;
	#if diff < 1.0:
	#	diff = 1.0
	var diffInt = int(_difficulty)
	var annoyingThingsAmount = Util.mini(diffInt + 2, 5)
	
	for _i in range(annoyingThingsAmount):
		var rectangle = ColorRect.new()
		rectangle.rect_size.y = redZone.rect_size.y
		rectangle.color = Color("5900bd")
		
		failArea.add_child(rectangle)
		var newFailAreaData = {
			"rect": rectangle,
			"pos": RNG.randf_range(0.0, 1.0),
			"scale": 0.02,
			"annoy": RNG.pick(["move", "scale", "jitter"]),
			"timeskip": RNG.randf_range(0.0, 100.0),
		}
		failZoneData.append(newFailAreaData)
		setZonePosition(rectangle, newFailAreaData["pos"], 0.02)
	
func processFatalZones():
	for zoneData in failZoneData:
		var rectangle = zoneData["rect"]
		var position = zoneData["pos"]
		var scale = zoneData["scale"]
		var timeskip = zoneData["timeskip"]
		var annoyMethod = zoneData["annoy"]
		
		if(annoyMethod == "scale"):
			setZonePosition(rectangle, position, scale*(sin(timeskip+time*2.0)+1.0)/2.0)
		if(annoyMethod == "move"):
			setZonePosition(rectangle, position+sin(timeskip+time)*0.05, scale)
		if(annoyMethod == "jitter"):
			setZonePosition(rectangle, position+sin(timeskip+time)*0.05+sin(timeskip+time*10.0)*0.01+sin(timeskip+time*7.0)*0.02, scale)

func setZonePosition(zone, pos, size):
	zone.anchor_left = clamp(pos - size, 0.0, 1.0)
	zone.anchor_right = clamp(pos + size, 0.0, 1.0)

func isFatal(cursorPostion):
	for zoneData in failZoneData:
		var rectangle = zoneData["rect"]
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
	if(isBlindFoldedVersion && !hardStruggleEnabled):
		delta /= 2.0
	
	if(ingame && !freeze):
		if(timeLeft > 0 && (timeLeft - delta) <= 0):
			emit_signal("minigameCompleted", calcFinalScore())
		time += delta
		timeLeft -= delta
		
		if(hardStruggleEnabled):
			processFatalZones()
			moveRedZone()
		
		var newPosition = getCursorPosition();
		setCursorPosition(newPosition)
		setTimeBar(timeLeft / timer)

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
	
	if(Input.is_action_just_pressed("minigame_commit")):
		if(!ingame):
			pass
			#_on_Button_pressed()
		else:
			doCommitClick()
	
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
		return -1.0
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

var zonePos = 0.0
var zoneSize = 0.0
var zoneOrangeSize = 0.0
func generateZone(thedifficulty = 1.0):
	zonePos = RNG.randf_range(0.0, 1.0)
	zoneSize = 0.005 + 1.0/(11.0 + thedifficulty * 2.0)
	zoneOrangeSize = 0.1 + 1.0/(2.0 + thedifficulty)
	setZone(zonePos, zoneSize, zoneOrangeSize)
	zonePos = (orangeZone.anchor_left + orangeZone.anchor_right)/2.0
	zoneOrangeSize = (orangeZone.anchor_right - orangeZone.anchor_left)
	
	#setGoldenZone(pos + RNG.randf_range(-orangeSize/2.0, orangeSize/2.0), 0.03)
	setGoldenZone(RNG.randf_range(0.0, 1.0), 0.05)

func setZone(pos, size, orangeSize):
	redZone.anchor_left = clamp(pos-size/2.0, 0.0, 1.0)
	redZone.anchor_right = clamp(pos+size/2.0, 0.0, 1.0)
	
	orangeZone.anchor_left = clamp(pos-size/2.0-orangeSize/2.0, 0.0, 1.0)
	orangeZone.anchor_right = clamp(pos+size/2.0+orangeSize/2.0, 0.0, 1.0)
	
func moveRedZone():
	if(isBlindFoldedVersion || !hardStruggleEnabled):
		return
	var shift = (zoneOrangeSize - zoneSize)/2.0 * sin(time*2.1)

	redZone.anchor_left = clamp(zonePos-zoneSize/2.0+shift, 0.0, 0.98)
	redZone.anchor_right = clamp(zonePos+zoneSize/2.0+shift, 0.02, 1.0)
	
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

func calcFinalScore():
	var result = MinigameResult.new()
	
	var theScore:float = getScore()
		
	if theScore < 0.0:
		result.score = 0.0
		result.failedHard = true
		return result
	if theScore >= 1000.0:
		result.score = 1.0
		result.instantUnlock = true
		return result

	if(theScore > 0.0 && theScore < 1.0 && hardStruggleEnabled):
		theScore /= 2.0
	#theScore = pow(theScore, 1.5) * 2.0

	if(hasAdvancedPerk && perfectStreak > 0):
		theScore = 1.0 + howMuchForPerfect * (perfectStreak - 1) + theScore * howMuchForPerfect
	
	result.score = theScore
	return result

func setStreakColor(theColor):
	streakLabel.add_color_override("font_color", theColor)

var tween
onready var streakLabel = $GameScreen/StreakLabel
func _on_ClickAtTheRightTime_gui_input(event):
	if(event is InputEventMouseButton):
		if(event.pressed && !freeze):
			doCommitClick()

func doCommitClick():
	if(freeze):
		return
	
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
	#print(finalScore)

	emit_signal("minigameCompleted", calcFinalScore())
