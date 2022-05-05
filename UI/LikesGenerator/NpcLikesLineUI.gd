extends HBoxContainer

var interestID = ""
var currentValue = Interest.Neutral

signal onCurrentValueChange(interestID, newValue)

func _ready():
	updateButtons()

func setInterestData(iid, iname):
	$Label.text = iname
	interestID = iid
	
func getInterestID():
	return interestID

func getCurrentValue():
	return currentValue

func updateButtons():
	var interests = [
		Interest.Hates,
		Interest.ReallyDislikes,
		Interest.Dislikes,
		Interest.SlightlyDislikes,
		Interest.Neutral,
		Interest.KindaLikes,
		Interest.Likes,
		Interest.ReallyLikes,
		Interest.Loves,
	]
	
	var buttons = [
		$Button,
		$Button2,
		$Button3,
		$Button4,
		$Button5,
		$Button6,
		$Button7,
		$Button8,
		$Button9,
	]
	
	for i in range(interests.size()):
		if(currentValue == interests[i]):
			buttons[i].disabled = true
		else:
			buttons[i].disabled = false
		buttons[i].hint_tooltip = str(interests[i]) +" seeing "+ $Label.text
		
func setCurrentValue(val):
	currentValue = val
	updateButtons()
	emit_signal("onCurrentValueChange", interestID, currentValue)


func _on_Button_pressed():
	setCurrentValue(Interest.Hates)


func _on_Button2_pressed():
	setCurrentValue(Interest.ReallyDislikes)


func _on_Button3_pressed():
	setCurrentValue(Interest.Dislikes)


func _on_Button4_pressed():
	setCurrentValue(Interest.SlightlyDislikes)


func _on_Button5_pressed():
	setCurrentValue(Interest.Neutral)


func _on_Button6_pressed():
	setCurrentValue(Interest.KindaLikes)


func _on_Button7_pressed():
	setCurrentValue(Interest.Likes)


func _on_Button8_pressed():
	setCurrentValue(Interest.ReallyLikes)


func _on_Button9_pressed():
	setCurrentValue(Interest.Loves)
