extends "res://Game/Datapacks/UI/PackVarUIs/PackVarUIBase.gd"

var selectedInterest = Interest.Neutral
var interestTopic = InterestTopic.AndroBody

func setLustInterestValue(_value):
	$HatesButton.disabled = (_value == Interest.Hates)
	$ReallyDislikesButton.disabled = (_value == Interest.ReallyDislikes)
	$DislikesButton.disabled = (_value == Interest.Dislikes)
	$SlightlyDislikesButton.disabled = (_value == Interest.SlightlyDislikes)
	$NeutralButton.disabled = (_value == Interest.Neutral)
	$SlightlyLikesButton.disabled = (_value == Interest.KindaLikes)
	$LikesButton.disabled = (_value == Interest.Likes)
	$ReallyLikesButton.disabled = (_value == Interest.ReallyLikes)
	$LovesButton.disabled = (_value == Interest.Loves)
	selectedInterest = _value
	$Label.add_color_override("font_color", Color(Interest.getColorString(selectedInterest)))

func setData(_dataLine:Dictionary):
	if(_dataLine.has("interestTopic")):
		interestTopic = _dataLine["interestTopic"]
		var lustTopicMultiple:TopicBase = GlobalRegistry.getLustTopic(interestTopic)
		if(lustTopicMultiple != null):
			$Label.text = lustTopicMultiple.getVisibleName(interestTopic)
	if(_dataLine.has("value")):
		setLustInterestValue(_dataLine["value"])

func _on_HatesButton_pressed():
	setLustInterestValue(Interest.Hates)
	triggerChange(selectedInterest)

func _on_ReallyDislikesButton_pressed():
	setLustInterestValue(Interest.ReallyDislikes)
	triggerChange(selectedInterest)

func _on_DislikesButton_pressed():
	setLustInterestValue(Interest.Dislikes)
	triggerChange(selectedInterest)

func _on_SlightlyDislikesButton_pressed():
	setLustInterestValue(Interest.SlightlyDislikes)
	triggerChange(selectedInterest)

func _on_NeutralButton_pressed():
	setLustInterestValue(Interest.Neutral)
	triggerChange(selectedInterest)

func _on_SlightlyLikesButton_pressed():
	setLustInterestValue(Interest.KindaLikes)
	triggerChange(selectedInterest)

func _on_LikesButton_pressed():
	setLustInterestValue(Interest.Likes)
	triggerChange(selectedInterest)

func _on_ReallyLikesButton_pressed():
	setLustInterestValue(Interest.ReallyLikes)
	triggerChange(selectedInterest)

func _on_LovesButton_pressed():
	setLustInterestValue(Interest.Loves)
	triggerChange(selectedInterest)
