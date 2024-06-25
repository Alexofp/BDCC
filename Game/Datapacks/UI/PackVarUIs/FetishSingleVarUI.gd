extends "res://Game/Datapacks/UI/PackVarUIs/PackVarUIBase.gd"

var selectedInterest = FetishInterest.Neutral
var fetish = Fetish.AnalSexReceiving

func setFetishInterestValue(_value):
	$HatesButton.disabled = (_value == FetishInterest.Hates)
	$ReallyDislikesButton.disabled = (_value == FetishInterest.ReallyDislikes)
	$DislikesButton.disabled = (_value == FetishInterest.Dislikes)
	$SlightlyDislikesButton.disabled = (_value == FetishInterest.SlightlyDislikes)
	$NeutralButton.disabled = (_value == FetishInterest.Neutral)
	$SlightlyLikesButton.disabled = (_value == FetishInterest.SlightlyLikes)
	$LikesButton.disabled = (_value == FetishInterest.Likes)
	$ReallyLikesButton.disabled = (_value == FetishInterest.ReallyLikes)
	$LovesButton.disabled = (_value == FetishInterest.Loves)
	selectedInterest = _value
	$Label.add_color_override("font_color", Color(FetishInterest.getColorString(selectedInterest)))

func setData(_dataLine:Dictionary):
	if(_dataLine.has("fetish")):
		fetish = _dataLine["fetish"]
		var fetishObj = GlobalRegistry.getFetish(fetish)
		if(fetishObj != null):
			$Label.text = fetishObj.getVisibleName()
	if(_dataLine.has("value")):
		setFetishInterestValue(_dataLine["value"])

func _on_HatesButton_pressed():
	setFetishInterestValue(FetishInterest.Hates)
	triggerChange(selectedInterest)

func _on_ReallyDislikesButton_pressed():
	setFetishInterestValue(FetishInterest.ReallyDislikes)
	triggerChange(selectedInterest)

func _on_DislikesButton_pressed():
	setFetishInterestValue(FetishInterest.Dislikes)
	triggerChange(selectedInterest)

func _on_SlightlyDislikesButton_pressed():
	setFetishInterestValue(FetishInterest.SlightlyDislikes)
	triggerChange(selectedInterest)

func _on_NeutralButton_pressed():
	setFetishInterestValue(FetishInterest.Neutral)
	triggerChange(selectedInterest)

func _on_SlightlyLikesButton_pressed():
	setFetishInterestValue(FetishInterest.SlightlyLikes)
	triggerChange(selectedInterest)

func _on_LikesButton_pressed():
	setFetishInterestValue(FetishInterest.Likes)
	triggerChange(selectedInterest)

func _on_ReallyLikesButton_pressed():
	setFetishInterestValue(FetishInterest.ReallyLikes)
	triggerChange(selectedInterest)

func _on_LovesButton_pressed():
	setFetishInterestValue(FetishInterest.Loves)
	triggerChange(selectedInterest)
