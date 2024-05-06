extends HBoxContainer

var statID
signal onPlusButton(statID, amount)

func setStatName(statName: String):
	$Label.text = statName

func setCanPressPlus(can):
	if(can):
		$PlusButton.disabled = false
	else:
		$PlusButton.disabled = true

func _on_PlusButton_pressed():
	var amount = $Amount.value
	emit_signal("onPlusButton", statID, amount)


func _on_SkillStatLine_mouse_entered():
	var stat: StatBase = GlobalRegistry.getStat(statID)
	if(stat != null):
		GlobalTooltip.showTooltip(stat.getVisibleName(), stat.getVisibleDescription())


func _on_SkillStatLine_mouse_exited():
	GlobalTooltip.hideTooltip()
