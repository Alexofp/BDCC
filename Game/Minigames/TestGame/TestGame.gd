extends Control

signal minigameCompleted(finalScore)

var finalScore = 0

func _ready():
	print("Testing game ready")


func setDifficulty(level):
	print("Level: "+ level)


func _process(_delta):
	if _delta < 0:
		print("process..")
	
func _on_Buttonpass_pressed():
	print("Pass")
	finalScore = 1
	emit_signal("minigameCompleted", finalScore)
	
func _on_Buttonfail_pressed():
	print("fail")
	finalScore = 99
	emit_signal("minigameCompleted", finalScore)

func _on_Buttoncustom_pressed():
	print("custom")
	finalScore =  get_node("LineEdit-result").get_text()
	print(finalScore)
	emit_signal("minigameCompleted", finalScore)
