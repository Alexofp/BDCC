extends HBoxContainer

var statID
signal onPlusButton(statID, amount)

func setStatName(statName: String):
	$Label.text = statName

func setCanPressPlus(can):
	if(can):
		$PlusButton.disabled = false
		$PlusFiveButton.disabled = false
		$PlusTenButton.disabled = false
	else:
		$PlusButton.disabled = true
		$PlusFiveButton.disabled = true
		$PlusTenButton.disabled = true


func _on_SkillStatLine_mouse_entered():
	var stat: StatBase = GlobalRegistry.getStat(statID)
	if(stat != null):
		GlobalTooltip.showTooltip(stat.getVisibleName(), stat.getVisibleDescription())


func _on_SkillStatLine_mouse_exited():
	GlobalTooltip.hideTooltip()


func _on_PlusButton_pressed():
	emit_signal("onPlusButton", statID, 1)


func _on_PlusFiveButton_pressed():
	emit_signal("onPlusButton", statID, 5)


func _on_PlusTenButton_pressed():
	emit_signal("onPlusButton", statID, 10)
